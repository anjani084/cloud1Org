global class SchedulenewOpportunities implements Schedulable{
    global void execute(SchedulableContext Sc){
        BatchNewOpportunities okay=new BatchNewOpportunities();
        Database.executeBatch(okay);
    }
    global static void runmyScript(){
        String c='0 0 0,6,12,18 ? * * *';
        SchedulenewOpportunities what=new SchedulenewOpportunities();
        system.schedule('add new Opportunities', c, what);    }

}