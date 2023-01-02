public class CampaignLeadMapping {
    public static void MappingOperation(){
        try{
            Map<id,List<Campaign>> leadCamMap=new Map<id,List<Campaign>>();
            List<CampaignMember> camMemList=new List<CampaignMember>();
            List<Campaign> camList=new List<Campaign>();
            camList=[SELECT Id,name FROM Campaign WHERE isActive=True LIMIT 50000];
            camMemList=[SELECT LeadId,CampaignId FROM CampaignMember WHERE LeadId!=null LIMIT 50000];
            List<CampaignMember> activeCamMemList=new List<CampaignMember>();
            if(camMemList!=null && camMemList.size()>0){
                for(CampaignMember each:camMemList){
                    
                }
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}