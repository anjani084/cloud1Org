global class LeadProcessor implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext a)
    {
        return Database.getQueryLocator([SELECT LeadSource FROM Lead]);
    }
    global void execute(Database.BatchableContext a,List<Lead> scope)
    {
        for(Lead each:scope){
            each.LeadSource='DreamForce';
            
        }
        update Scope;
    }
    global void finish(Database.BatchableContext a){}    
}