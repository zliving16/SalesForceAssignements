trigger blankContactTrig on Contact (before update,before insert) {
    contactTrigHandler.handleContacts(trigger.new,trigger.operationType);  


	
   
}