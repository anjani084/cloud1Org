trigger NoOppLineItemTrigger on Opportunity (After Update) {
    if(trigger.isUpdate){
        OpportunityClosed.OpportunityClosedWithNoOppLineItem(trigger.new);
    }

}