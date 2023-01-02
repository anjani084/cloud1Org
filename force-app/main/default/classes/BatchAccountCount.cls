global class BatchAccountCount implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bac){
        return Database.getQueryLocator([SELECT Id,count__c,(SELECT Id from Contacts) FROM Account]);
    }
    global void execute(database.BatchableContext bac,List<account> accList){
        List<Account> tempList=new List<Account>();
        if(accList.size()>0){
        for(Account each:accList){
            each.Count__c=each.Contacts.size();
            tempList.add(each);
        }
        }
        if(tempList.size()>0){
            Update tempList;
        }
    }
    global void finish(database.BatchableContext bac){}
}