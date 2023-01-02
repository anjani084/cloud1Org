public class OddNumberLineItems {
    public static void FetchOpportunityOperation(){
        try{
            List<OpportunityLineItem> oppLineList=new List<OpportunityLineItem>();
            oppLineList=[SELECT OpportunityId,Id FROM OpportunityLineItem LIMIT 50000];
            Map<Id,List<OpportunityLineItem>>oppLineMap=new Map<Id,List<OpportunityLineItem>>();
            
            If(!oppLineList.isempty()){
                for(OpportunityLineItem each:oppLineList){
                    if(oppLineMap.containsKey(each.OpportunityId)){
                        List<OpportunityLineItem> tempList=new List<OpportunityLineItem>();
                        tempList=oppLineMap.get(each.OpportunityId);
                        tempList.add(each);
                        oppLineMap.put(each.OpportunityId,tempList);
                    }
                    else{
                        List<OpportunityLineItem>tempList=new List<OpportunityLineItem>();
                        tempList.add(each);
                        oppLineMap.put(each.OpportunityId,tempList);
                    }
                }
            }
            if(!oppLineList.isempty()){
                for(OpportunityLineItem each:oppLineList){
                    if(Math.mod(oppLineMap.get(each.OpportunityId).size(),2)!=0){
                        system.debug(each.OpportunityId);
                    }
                }
            }
            
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' At Line: '+e.getLineNumber());
        }
    }

}