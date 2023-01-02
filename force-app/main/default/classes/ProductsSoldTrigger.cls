public class ProductsSoldTrigger {
    public static void IncreamentOperation(List<Opportunity> oppList){
        try{
            List<Opportunity> newOppList=new List<Opportunity>();
            newOppList=[SELECT Id,StageName, (SELECT Id from OpportunityLineItems) 
                        FROM Opportunity WHERE Id in:oppList LIMIT 50000];
            List<OpportunityLineItem> oppLineItemList=new List<OpportunityLineItem>();
            oppLineItemList=[SELECT Id,OpportunityId,Product2Id,Quantity,Product2.No_of_Products_sold__c 
                             FROM OpportunityLineItem WHERE OpportunityId in:oppList LIMIT 50000];
            Map<Id,integer> mapIda=new Map<Id,Integer>();
            List<Product2> prodList=new List<Product2>();
            if(oppList.size()>0){
                for(Opportunity each:newoppList){
                     integer a=0;
                    if(oppLineItemList.size()>0){
                        for(OpportunityLineItem each1: oppLineItemList){
                            if(each.Id==each1.OpportunityId){
                                if(each.StageName=='Closed Won'){
                                    a+=integer.valueof(each1.Quantity);
                                }
                            }
                             
                        }
                        
                    }
                    mapIda.put(each.Id,a);
                }
            }
            if(oppLineItemList.size()>0){
                for(OpportunityLineItem each:oppLineItemList){
                    each.product2.No_of_products_sold__c=mapIda.get(each.OpportunityId);
                    prodList.add(each.product2);
                }
            }
            if(prodList.size()>0){
                Upsert prodList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }


}