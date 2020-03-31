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
        if( acct.Phone != oldAcct.phone )
        {
            list<contact> cts=[select id,phone from contact where accountid=:acct.Id];
            for(contact ct : cts){
                if(ct.Phone==null){
                    ct.phone=acct.Phone;
                }
            }
            update cts;
            
        }
                
    }

}
