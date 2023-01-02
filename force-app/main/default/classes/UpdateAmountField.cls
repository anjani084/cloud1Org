global class UpdateAmountField implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bac){
        return Database.getQueryLocator([SELECT Id,Amount, Extended_Price__c FROM Opportunity where Extended_Price__c!=null]);
    }
    global void execute(database.BatchableContext bac,List<Opportunity> oppList){
        List<Opportunity> newOppList=new List<Opportunity>();
        if(oppList.size()>0){
        for(Opportunity each:oppList){
            each.Amount=each.Extended_Price__c;
            newOppList.add(each);
        }
        }
        if(newOppList.size()>0){
            Update newOppList;
        }
    }
    global void finish(database.BatchableContext bac){}
}