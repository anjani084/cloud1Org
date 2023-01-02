trigger BeforeInsertTrigger on Opportunity (before insert) {
    if(trigger.isInsert){
        NotPastCloseDateTrigger.FutureClosedDate(trigger.new);
    }

}