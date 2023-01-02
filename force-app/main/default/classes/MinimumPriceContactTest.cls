@isTest
public class MinimumPriceContactTest {
    @isTest Public static void TestOperation(){
        Account acc=new Account();
        acc.name='akm';
        insert acc;
        List<Contact> conList=new list<Contact>();
        for(integer i=0;i<5;i++){
            Contact temp=new Contact();
            temp.LastName='aksd'+i;
            temp.Price__c=i;
            temp.AccountId=acc.Id;
            Conlist.add(temp);
            
        }
        insert conList;
        test.startTest();
        MinimumPriceContact.MinimumOperation();
        test.stopTest();
    }
}