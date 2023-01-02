global class BatchFetchLeads implements database.Batchable<sObject>{
    global database.QueryLocator start(database.BatchableContext bsa){
        return database.getQueryLocator([SELECT Id,Name,createdDate FROM Lead WHERE Phone=null AND 
                                         createdDate=:system.today().adddays(-1)]);
    }
    global void execute(database.BatchableContext bsa,List<Lead> leadList){
            User ak=[SELECT Email FROM User WHERE Profile.Name = 'System Administrator' LIMIT 1];
            EmailManager.sendMail(ak.email, 'Leads', leadList.toString());
            
    }
    global void finish(database.BatchableContext bsa){}
    

}