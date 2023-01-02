public class CloseOpportunitiesCampaignCompleted {
    public static void ClosingAssociateOpportunities(List<Campaign> campList){
        try{
            Set<Id> idSet=new Set<Id>();
            if(campList.size()>0){
                for(Campaign each:campList){
                    idSet.add(each.Id);
                }
            }
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id,Name,StageName,CampaignId,campaign.Status,campaign.Email__c,(SELECT Id FROM OpportunityLineItems) FROM Opportunity
                     WHERE CampaignId in:idSet LIMIT 50000];
            if(oppList!=null && oppList.size()>0){
                for(Opportunity each:oppList){
                    if(each.campaign.status=='Completed'){
                        if(each.OpportunityLineItems.size()>0){
                            each.StageName='Closed Won';
                          //  EmailManager.sendMail(each.campaignId, each.Name+': Closed' ,
                             //                     each.Name+' is Closed Won');
                        }
                        else{
                            each.StageName='Closed Lost';
                          //  EmailManager.sendMail(each.CampaignId, each.Name+': Closed',
                            //                      each.Name+' is Closed Lost');
                        }
                    }
                }
            }
            if(oppList.size()>0){
                Upsert oppList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}