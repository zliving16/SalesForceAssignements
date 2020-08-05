trigger TaskTrig on Task (after insert) {
    taskHandler.taskTrigHandler(trigger.new,trigger.operationType);
    
    
}