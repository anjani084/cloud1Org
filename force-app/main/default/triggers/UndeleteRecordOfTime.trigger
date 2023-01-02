trigger UndeleteRecordOfTime on Time__c (after delete) {
    Set<Id>idSet=new Set<Id>();
    for(Time__c each:trigger.old){
        idSet.add(each.Id);
    }
    if(trigger.isdelete){
        UndeleteRecordsOfTimes.UndeleteOperation(idSet);
    }

}