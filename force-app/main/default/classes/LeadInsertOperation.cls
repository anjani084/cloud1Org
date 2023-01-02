public class LeadInsertOperation {
     public static void StatusXUsersSendLead(List<Lead> newLeadlist,String checkRule){
        try{
            List<UserAssignRuleObject__c> availableUser=new List<UserAssignRuleObject__c>();
            availableUser=[SELECT Id, Name, UserId__c, checkpoint__c, AvailabilityCheck__c from UserAssignRuleObject__c WHERE checkpoint__c=:checkRule  LIMIT 50000];
            
        }catch(exception e){
            system.debug('error: '+e.getMessage());
        }
        
    }
    public static void StatusYUsersSendLead(List<Lead> newLeadlist,String checkRule){
        try{
             List<UserAssignRuleObject__c> availableUser=new List<UserAssignRuleObject__c>();
            availableUser=[SELECT Id, Name, UserId__c, checkpoint__c, AvailabilityCheck__c from UserAssignRuleObject__c WHERE checkpoint__c=:checkRule  LIMIT 50000];
            
        }catch(exception e){
            system.debug('error: '+e.getMessage());
        }
        
    }
    public static void StatusZUsersSendLead(List<Lead> newLeadlist, String checkRule){
        try{
             List<UserAssignRuleObject__c> availableUser=new List<UserAssignRuleObject__c>();
            availableUser=[SELECT Id, Name, UserId__c, checkpoint__c, AvailabilityCheck__c from UserAssignRuleObject__c WHERE checkpoint__c=:checkRule  LIMIT 50000];
            
        }catch(exception e){
            system.debug('error: '+e.getMessage());
        }
    }

}