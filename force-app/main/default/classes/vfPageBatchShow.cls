public class vfPageBatchShow {
    Public List<CronTrigger > getMyMethod(){
        List<CronTrigger > aaj=new List<CronTrigger >();
        aaj=[SELECT Id, CronJobDetail.Name,CronExpression FROM CronTrigger  LIMIT 50000];
        return aaj;
    }
   
    public static void deleteOperation(){
         String accId  = ApexPages.CurrentPage().getParameters().get('accID');
        for(CronTrigger each:[SELECT Id From CronTrigger where Id = :accId]){
            system.abortjob(each.Id);
       }
    }

}