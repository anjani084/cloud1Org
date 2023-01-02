public class DeleteScheduleJob {
    public static void DeleteOperation(){
        String c='0 0 12 ? * * *';
        /*Id jobId=System.schedule('Delete account every 12',c, SBD);
            system.abortJob(jobId);*/
        CronTrigger ct = [SELECT CronExpression,Id FROM CronTrigger WHERE CronExpression=: c LIMIT 1];
        system.abortJob(ct.Id);
    }
    public static void DeletedOperation(){
         string c1='0 0 0,6,12,18 ? * * *';
         CronTrigger ct1 = [SELECT CronExpression,Id FROM CronTrigger WHERE CronExpression=: c1 LIMIT 1];
        system.abortJob(ct1.Id);

    }
    public static void DeletenOperation(){
        Set<Id> idSet=new Set<Id>();
        for(integer i=0;i<=55;i=i+5){
            String CRON_EXP= '0 '+i+' * * * ?';
            CronTrigger jobId=[SELECT CronExpression,Id FROM CronTrigger WHERE CronExpression=: CRON_EXP];
            system.abortJob(jobId.Id);
    }
    }
}