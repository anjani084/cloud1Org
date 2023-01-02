public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx){
        List<Lead> leadList=new List<Lead>();
        leadList=[SELECT Id,LeadSource FROM Lead WHERE LeadSource=null];
        if(leadList.size()>0){
            for(Lead each:leadList){
                each.LeadSource='Dreamforce';
            }
        }
        if(leadList.size()>0){
            Update leadList;
        }
    }

}