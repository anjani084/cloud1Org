public class UpdatedMonthOpportunity {
    public static void LastUpdatedMonthOperation(){
        try{
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id,Last_Updated_Month__c,LastModifiedDate FROM Opportunity LIMIT 50000];
            if(oppList!=null && oppList.size()>0){
                for(Opportunity each:oppList){
                    each.Last_Updated_Month__c=each.LastModifiedDate.Month();
                }
            }
            if(oppList!=null && oppList.size()>0){
                Upsert oppList;
            }
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}