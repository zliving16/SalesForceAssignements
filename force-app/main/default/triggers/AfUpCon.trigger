trigger AfUpCon on Contact (before insert,before update) {
    contact ctNew=trigger.new[0];
    if(trigger.isUpdate){
        
        account newAcct=[select id, phone from account where id=:ctNew.AccountId];
        if(ctNew.Phone==newacct.Phone){
            ctNew.Same_as_Account_Phone__c=true;
        }
        
    }
    if(trigger.isInsert){
            account newAcct=[select id, phone from account where id=:ctNew.AccountId];
        if(ctNew.Phone==newacct.Phone){
            ctNew.Same_as_Account_Phone__c=true;
        }
    }
    
}