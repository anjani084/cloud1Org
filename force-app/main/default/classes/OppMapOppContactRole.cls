public class OppMapOppContactRole {
    public static void MappingOperation(){
        try{
            Map<Id,List<OpportunityContactRole>> oppConMap=new Map<Id,List<OpportunityContactRole>>();
            List<OpportunityContactRole> oppConlist=new List<OpportunityContactRole>();
            oppConList=[SELECT OpportunityId,Id FROM OpportunityContactRole WHERE OpportunityId!=null LIMIT 50000];
            List<OpportunityContactRole> tempList=new List<OpportunityContactRole>();
            if (oppConList!=null && oppConList.size()>0){
                for(OpportunityContactRole each:oppConList){
                    if(oppConMap.containskey(each.OpportunityId)){
                        tempList=oppConMap.get(each.OpportunityId);
                        tempList.add(each);
                        oppConMap.put(each.OpportunityId,tempList);
                    }
                    else{
                        tempList.add(each);
                        oppConMap.put(each.OpportunityId,tempList);
                    }
                }
            }
            system.debug(oppConMap);
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}