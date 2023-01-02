public class OpportunityUpdateOperation {
    public static void UpdateOpp(){
        try{
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Name,CloseDate FROM Opportunity WHERE CloseDate>TODAY LIMIT 50000];
            if(oppList.size()>0){
            for(opportunity opp:oppList){
                opp.Name=opp.Name+'Updated';
            }
            }
            if (oppList!=null && oppList.size()>0){
            Update oppList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+'at line: '+e.getLineNumber());
        }
    }

}