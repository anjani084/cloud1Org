trigger CampaignCompletedTrigger on Campaign (after update) {
    if(trigger.isUpdate){
        CloseOpportunitiesCampaignCompleted.ClosingAssociateOpportunities(trigger.new);
    }

}