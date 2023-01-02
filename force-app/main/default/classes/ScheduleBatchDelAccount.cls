global class ScheduleBatchDelAccount implements Schedulable{
    global void execute(SchedulableContext sc){
        BatchDeleteAccount each= new BatchDeleteAccount();
        Database.executeBatch(each);
    }
    global static void runmyScript(){
        String c='0 0 12 ? * * *';
        ScheduleBatchDelAccount akm=new ScheduleBatchDelAccount();
        system.schedule('Delete account every 12', c, akm);    }
    
}