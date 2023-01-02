@isTest
public class MatchBillingAddressTest {
    @isTest public static void TestOperation(){
        List<account>accList=new List<Account>();
        Account acc=new Account();
        acc.name='what';
        acc.Match_Billing_Address__c=True;
        acc.billingPostalCode='209726';
        accList.add(acc);
        insert accList;
        test.startTest();
        MatchBillingAddress.copyAddressCode(accList);
        test.stopTest();
    }

}