public class NumberOfOpportunityLI {
    public static void FetchLineItems(){
        List<Opportunity> oppList=new List<Opportunity>();
        oppList=[SELECT Id,AccountId,(SELECT Id FROM OpportunityLineItems) FROM Opportunity LIMIT 50000];
        List<Account> accList=new List<Account>();
        accList=[SELECT Id,Number_of_LineItems__c,(SELECT Id FROM Opportunities) FROM Account LIMIT 50000];
        for(Account each:accList){
            Integer i=0;
            for(Opportunity each1:oppList){
                if(each.Id==each1.AccountId){
                    i=each1.OpportunityLineItems.size();
                }
                system.debug('i>>>>>>>'+i);
            each.Number_of_LineItems__c+=i;
            }
            
        }
        if(accList.size()>0){
            update accList;
        }
        
    }
}