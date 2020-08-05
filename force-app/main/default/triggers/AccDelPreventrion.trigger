trigger AccDelPreventrion on Account (before delete, after update) {
    AccounttrigHandler.AccountHandler(trigger.new,trigger.old, trigger.operationType);
}

/* 
    Whenever an account’s email or phone is changed populate all related contacts email and phone numbers with the account’s if the contact’s email and phone number is blank

*/