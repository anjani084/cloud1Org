@isTest
public class SalesRepresentativeonAccountTest {
    @isTest public static void TestOperation(){
        List<Account> accList=new List<Account>();
        account acc=new account();
        acc.name='akm';
        acclist.add(acc);
        insert accList;
        test.startTest();
        SalesRepresentativeOnAccount.FieldFillingOperation(accList);
        test.stopTest();
    }

}