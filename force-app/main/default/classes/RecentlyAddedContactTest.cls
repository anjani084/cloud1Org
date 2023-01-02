@isTest
public class RecentlyAddedContactTest {
    @isTest public static void TestOperation(){
        Account acc=new account();
        acc.Name='akm';
        insert acc;
        Contact con=new Contact();
        con.LastName='yes';
        con.AccountId=acc.id;
        insert con;
        Test.startTest();
        RecentlyAddedContact.RecentlyAddOperation();
        Test.stopTest();
    }
    

}