global class ScheduleFetchLeads implements schedulable{
    global void execute(SchedulableContext sct){
        BatchFetchLeads BFL=new BatchFetchLeads();
        Database.executeBatch(BFL);
    }
    global static void runMyScript(){
        string cn='0 0 0 ? * * *';
        ScheduleFetchLeads whatt=new ScheduleFetchLeads();
        system.schedule('Fetch Leads', cn, whatt);

    }

}