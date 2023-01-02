trigger PolicyUpdateTrigger on Policy__c (before update) {
    if(trigger.isupdate){
        CustomObjectPolicyUpdate.UpdateOperation(trigger.new);
    }

}