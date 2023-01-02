trigger ConcatenateName on Contact (after undelete) {
    if(trigger.isUndelete){
       /* UndeleteContactTrigger.ConcatenationOperation(trigger.new);*/
        BulkiFyConcatenationName.ConcatenationOperation(trigger.new);
    }

}