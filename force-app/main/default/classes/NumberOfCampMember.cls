public class NumberOfCampMember {
    public static void CountOperation(){
        try{
            List<Campaign> campList=new List<Campaign>();
            campList=[SELECT Id,No_Of_Campaign_Member__c,NumberOfContacts,NumberOfLeads FROM Campaign LIMIT 50000];
            if(campList!=null && campList.size()>0){
                for(Campaign each:campList){
                    each.No_Of_Campaign_Member__c=each.NumberOfContacts+each.NumberOfLeads;
                }
            }
            if(campList!=null && campList.size()>0){
                Upsert CampList;
            }
            
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+'at Line: '+e.getLineNumber());
        }
    }

}