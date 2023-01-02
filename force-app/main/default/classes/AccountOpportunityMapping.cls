public class AccountOpportunityMapping {
    public static void MappingOperation(){
        try{
            Map<Id,List<Opportunity>> accountOppMap=new Map<Id,List<Opportunity>>();
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Name,AccountId FROM Opportunity WHERE accountId!=null LIMIT 50000];
            List<Opportunity> tempList=new List<Opportunity>();
            if(oppList!=null && oppList.size()>0){
                for(Opportunity each:oppList){
                    if(accountOppMap.containskey(each.accountId)){
                        tempList=accountOppMap.get(each.AccountId);
                        tempList.add(each);
                        accountOppMap.put(each.AccountId,tempList);
                    }
                    else{
                        tempList.add(each);
                        accountOppMap.put(each.AccountId,tempList);
                    }
                }
            }
            system.debug(accountOppMap);
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}