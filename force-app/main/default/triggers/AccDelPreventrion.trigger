trigger AccDelPreventrion on Account (before delete, after update) {
    if(trigger.isDelete){
        for(account acct:[SELECT Id,(select id, stageName from opportunities) FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]){
            for(opportunity oppty : acct.opportunities){
                if(oppty.StageName!='Closed Won' && oppty.StageName !='Closed Lost'){
                    trigger.oldmap.get(acct.Id).addError('Cannot delete account with open opportunities.');
                    break;
                }          
            }         
        }
    }
    if(trigger.isUpdate){
        account acct=trigger.new[0];
        account oldAcct=trigger.old[0];
        if( acct.Phone != oldAcct.phone || acct.Email__c!=oldAcct.Email__c )
        {
            list<contact> cts=[select id,phone,email,Same_as_account_phone__c,Same_as_account_email__c from contact where accountid=:acct.Id];
            for(contact ct:cts){
                if(ct.Phone==null){
                    ct.phone=acct.Phone;
                    
                    ct.Same_as_account_phone__c=true;
                }
                if(ct.email==null){
                    ct.email=acct.email__c;
                    
                    ct.Same_as_account_email__c=true;
                }
            }
            update cts;   
        }       
    }

}

/* 
    Whenever an account’s email or phone is changed populate all related contacts email and phone numbers with the account’s if the contact’s email and phone number is blank

*/