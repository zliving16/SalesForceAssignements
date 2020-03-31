trigger ContactTrig on Contact (after update) {
    if(trigger.isUpdate){
        contact ct=trigger.old[0];
        id acctId=ct.AccountId;
        account acct=[select id,name,ownerId from account where id=:acctId];
        user acctowner=[select id,name,email from user where id=:acct.OwnerId];
        user ctmodBy=[select id,name,email from user where id=:ct.LastModifiedById];
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

}

