trigger FillProductSoldField on Opportunity (after insert, after Update) {
    if(trigger.isInsert || trigger.isUpdate){
        ProductsSoldTrigger.IncreamentOperation(trigger.new);
    }

}