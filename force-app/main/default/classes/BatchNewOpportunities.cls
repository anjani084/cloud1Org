global class BatchNewOpportunities implements Database.Batchable<sObject> {
        global Database.QueryLocator Start(database.BatchableContext Bc){
        return Database.getQueryLocator([SELECT Id,Name FROM Opportunity LIMIT 1]);
    }
    global void execute (database.BatchableContext Bc,List<Opportunity> oppList){
        List<Opportunity> newList=new List<Opportunity>();
        for(integer i=0;i<5;i++){
            Opportunity temp=new Opportunity();
            temp.Name='Test'+i;
            temp.CloseDate=system.today();
            temp.StageName='Prospecting';
            newList.add(temp);
        }
        if(newList.size()>0){
            insert newList;
        }
        
    }
    global void finish(database.BatchableContext Bc){}

}