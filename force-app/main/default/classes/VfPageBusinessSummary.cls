public class VfPageBusinessSummary {
    public List<Account>accList{get;set;}
    public VfPageBusinessSummary(){
        accList=this.acclist;
        accList=[SELECT Id,Name,Number_of_Contact__c,
                 Number_Of_Opportunities__c,Number_of_LineItems__c,
                 (SELECT Id FROM Contacts),(SELECT Id FROM Opportunities)
                 FROM Account LIMIT 10];
        Set<Id> idSet=new set<Id>();
        for(Account each:accList){
            idSet.add(each.Id);
        }
        List<Opportunity>oppList=new List<Opportunity>();
        oppList=[SELECT Id,AccountId,(SELECT Id FROM OpportunityLineItems) FROM Opportunity WHERE 
                 AccountId in:idSet LIMIT 50000];
        
        for(Account each:accList){
            each.Number_of_Contact__c=each.contacts.size();
            each.Number_Of_Opportunities__c=each.opportunities.size();
            integer s=0;
            for(Opportunity each1:oppList){
                if(each.Id==each1.AccountId){
                    s+=each1.OpportunityLineItems.size();
                }
            }
            each.Number_of_LineItems__c=s;
        }
    }

}