public class NoOfProductSoldTrigger {
    public static void IncreamentOperation(List<Opportunity> oppList){
        try{
            Set<Id> idSet=new Set<Id>();
            if(oppList.size()>0){
                for(Opportunity each:oppList){
                    idSet.add(each.Id);
                }
            }
            List<OpportunityLineItem> oppLineItemList=new List<OpportunityLineItem>();
            oppLineItemList=[SELECT Id,OpportunityId,Product2.No_of_Products_sold__c FROM OpportunityLineItem WHERE OpportunityId in:idSet LIMIT 50000];
            
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}