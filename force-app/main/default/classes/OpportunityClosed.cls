public class OpportunityClosed {
    public static void OpportunityClosedWithNoOppLineItem(List<Opportunity> oppList){
        try{
            if(oppList.size()>0){
                for(Opportunity each:oppList){
                    if((each.StageName=='Closed Won'|| each.StageName=='Closed Lost') && each.HasOpportunityLineItem==False){
                        each.addError('No OpportunityLineItem');
                    }
                }
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' At Line: '+e.getLineNumber());
        }
    }

}