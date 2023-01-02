@istest
public class DefaultContactToAccountTest {
    @isTest public static void TestOperation(){
        List<account>accList=new List<account>();
        
        Account acc=new account();
        acc.name='akm';
        acc.NumberOfEmployees=2;
        accList.add(acc);
        insert accList;
        test.startTest();
        DefaultContactToAccount.AddContactByDefault(accList);
        test.stopTest();
    }

}