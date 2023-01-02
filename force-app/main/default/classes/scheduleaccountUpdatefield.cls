global class scheduleaccountUpdatefield implements schedulable {
    global void execute(SchedulableContext sc1){
        BatchAccountCount new1=new BatchAccountCount();
        database.executeBatch(new1);
    }
    global static void runThisScript(){
        for(integer i=0;i<=55;i=i+5){
            String CRON_EXP= '0 '+i+' * * * ?';
            scheduleaccountUpdatefield obg= new scheduleaccountUpdatefield();
            system.schedule('Count field update account'+string.valueOf(i), CRON_EXP, obg);
        }

    }
}