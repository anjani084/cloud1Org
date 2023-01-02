global class BatchDeleteAccount implements Database.Batchable<sobject>{
    
    global Database.QueryLocator Start(database.BatchableContext a){
        try{
        return Database.getQueryLocator([SELECT Id,CreatedDate,(SELECT Id from Cases),
                                         (SELECT Id FROM Opportunities) 
                                         FROM Account WHERE CreatedDate=:system.today()]);
        }catch(Exception e){
            system.debug(' at Line:'+e.getLineNumber()+' error:'+e.getMessage());
            return null;
        }
    }
    global void execute (database.BatchableContext a,List<Account> accList){
        try{ 
            system.debug('List of account: '+accList);
        List<Account> tempList=new List<Account>();
        for(Account each:accList){
            if(each.opportunities.size()<0 && each.cases.size()<0){
                tempList.add(each);
            }
            }
        if(tempList.size()>0){
           // Delete tempList;
        }
           }catch(Exception e){
               system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
           }
    }
    global void finish(database.BatchableContext a){}

}