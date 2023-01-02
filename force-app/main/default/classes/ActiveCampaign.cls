public class ActiveCampaign {
    public static void ShowActiveCampaign(){
        try{
            List<Campaign> campList=new List<Campaign>();
            campList=[SELECT Id,Name,Startdate FROM Campaign WHERE isActive=True and NumberofLeads!=null LIMIT 50000];
            if(campList!=null && campList.size()>0){
                for(Campaign each:campList){
                    system.debug('Id is: '+each.id+' and Name: '+each.Name+' and start date: '+each.StartDate);
                }
            }
            
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' at line: '+e.getLineNumber());
        }
    }

}