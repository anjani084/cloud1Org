trigger DefaultPriceTrigger on Product2 (after insert) {
    if(trigger.isinsert){
        ProductDefaultPricebook.PricebookUpdate(trigger.new);
    }

}