public class OpportunityPriceField {
    public static void PriceFillOperation(){
                    List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id,Highest_Price__c,Lowest_Price__c FROM Opportunity WHERE PriceBook2Id!=null LIMIT 50000];
            List<OpportunityLineItem> oppLineList=new List<OpportunityLineItem>();
            oppLineList=[SELECT OpportunityId, UnitPrice FROM OpportunityLineItem WHERE OpportunityId in:oppList LIMIT 50000];
            if(oppList!=null && oppList.size()>0){
                for(Opportunity each:oppList){
                    integer s=0;
                    if(oppLineList!=null && oppLineList.size()>0){
                        for(OpportunityLineItem each1:oppLineList){
                            if(each.id==each1.OpportunityId){
                                if(s==0){
                                    each.Highest_Price__c=integer.valueof(each1.UnitPrice);
                                    each.Lowest_Price__c=integer.valueof(each1.UnitPrice);
                                    s=1;
                                }
                                else{
                                    if(each.Highest_Price__c<each1.UnitPrice){
                                        each.Highest_Price__c=each1.UnitPrice;
                                    }if(each.Lowest_Price__c>each1.UnitPrice){
                                        each.Lowest_Price__c=each1.UnitPrice;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if(oppList!=null && oppList.size()>0){
                Upsert oppList;
            }
            
       
    }

}