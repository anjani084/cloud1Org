public class FirstAndLatestCloseDate {
    public static void CloseDateOperation(){
        try{
            List<Opportunity> oppList=[SELECT Id,CloseDate,Name,Account.First_Close_Date__c,Account.Latest_Close_Date__c,AccountId FROM Opportunity WHERE AccountId!=null LIMIT 50000];
            if(!oppList.isempty()){
                for(Opportunity each:oppList){
                    each.Account.First_Close_Date__c=each.CloseDate;
                    each.Account.Latest_Close_Date__c=each.CloseDate;
            }
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}