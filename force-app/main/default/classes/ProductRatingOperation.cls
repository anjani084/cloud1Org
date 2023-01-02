public class ProductRatingOperation {
    public static void FetchInfoOperation(){
        try{
            List<OpportunityLineItem> oppLineList=new List<OpportunityLineItem>();
            oppLineList=[SELECT OpportunityId,product_rating__c,Product2Id FROM OpportunityLineItem WHERE Product2Id!=null and OpportunityId!=null LIMIT 50000];
            List<Product2> proList=new List<Product2>();
            proList=[SELECT Product_rating__c,Id FROM Product2 LIMIT 50000];
            
            if(oppLineList!=null && oppLineList.size()>0){
                for(OpportunityLineItem each:oppLineList){
                    if(proList!=null &&  proList.size()>0){
                        for(Product2 each1:proList){
                            if(each.Product2Id==each1.Id && integer.valueOf(each.product_rating__c)<3 && integer.valueOf(each1.product_rating__c)==5){
                                system.debug(each.OpportunityId);
                            }
                        }
                    }
                }
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}