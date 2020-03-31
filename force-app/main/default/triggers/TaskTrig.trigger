trigger TaskTrig on Task (after insert) {	
    if(trigger.isInsert){
        task tsk=trigger.new[0];
        id y=tsk.AccountId;
        system.debug(y);
        list<account> accts=[select id,name from account where id=:y limit 1];
        if(accts.size()>0){
            account acct=accts[0];
            integer x=[select id from task where accountId=:y ].size();
            acct.Number_Of_Tasks__c=x;
            update acct;
        }
        
    }
    
}