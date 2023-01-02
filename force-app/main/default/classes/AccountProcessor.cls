public class AccountProcessor {
    @Future
    Public static void countContacts(Set<Id> idset){
        List<Account> accList=new List<Account>();
        accList=[SELECT id,Number_Of_Contacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id in:idset LIMIT 50000];
        List<Account> newAccList=new List<Account>();
        for(Account each:accList){
            each.Number_Of_Contacts__c=each.Contacts.size();
            newAccList.add(each);
        }
        if(newAccList.size()>0){
            Update newAccList;
        }
    }
}