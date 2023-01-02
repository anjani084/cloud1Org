trigger AccountFieldFillTrigger on OpportunityLineItem (after insert) {
    if(trigger.isInsert){
        AccountFieldNumberOfLineItems.FieldFillingOperation(trigger.new);
    }

}