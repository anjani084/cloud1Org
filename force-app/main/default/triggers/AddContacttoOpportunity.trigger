trigger AddContacttoOpportunity on Opportunity (after insert) {
    if(trigger.isinsert){
        AddContactToOpportunityWithSameAccount.AddContactsToOpportunityOperation(trigger.new);
    }

}