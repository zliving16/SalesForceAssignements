trigger blankContactTrig on Contact (before update,before insert) {
    contact ct=trigger.new[0];

    if(trigger.isUpdate){
        id acctId=ct.AccountId;
        account acct=[select id,name,ownerId,phone,email__c from account where id=:acctId];
        user acctowner=[select id,name,email from user where id=:acct.OwnerId];
        user ctmodBy=[select id,name,email from user where id=:ct.LastModifiedById];
        if(ct.Phone==acct.Phone){
            ct.Same_as_Account_Phone__c=true;
        }
        else{
            ct.Same_as_Account_Phone__c=false;
        }
            if(ct.email==acct.email__c){
            ct.Same_as_Account_Email__c=true;
        }
        else{
            ct.Same_as_Account_Email__c=false;
        }
        if(ctmodby.Id!=acctowner.Id){
            system.debug('entered if check');
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            list<string> ToAdress=new list<string>();
            string recipient=acctowner.Email;
            ToAdress.add(recipient);
            mail.setToAddresses(ToAdress);
            mail.setSubject('Account Upadated');
            string body=ct.FirstName+' '+ct.LastName+' was just updated for '+acct.name+' by '+ctmodby.Name;
            mail.setPlainTextBody(body);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
        if(trigger.isInsert){
        account acct=[select id, phone from account where id=:ct.AccountId];
        if(ct.Phone==acct.Phone){
            ct.Same_as_Account_Phone__c=true;
        }
            else{
                ct.Same_as_Account_Phone__c=false;
            }
            if(ct.email==acct.email__c){
            ct.Same_as_account_email__c=true;
        }
            else{
                ct.Same_as_Account_Email__c=false;
            }
    }

    }