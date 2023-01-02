@isTest
public class DeleteLastNameFromAccountTest {
    @isTest public static void TestOperation(){
        List<Account> accList=new List<Account>();
        List<Contact> conList=new List<Contact>();
        Account acc=new Account();
        acc.name='akm';
        accList.add(acc);
        insert accList;
        
        Contact con=new Contact();
        con.LastName='Mish';
        con.AccountId=acc.id;
        conList.add(con);
        insert conList;
        test.startTest();
        DeleteLastNameFromAccount.DeletionOperation(conList);
        test.stopTest();
        
    }

}