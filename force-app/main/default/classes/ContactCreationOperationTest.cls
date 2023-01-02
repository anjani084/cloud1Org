@isTest
public class ContactCreationOperationTest {
    @isTest public static void TestOperation(){
        Contact con=new Contact();
        con.LastName='aakm';
        insert con;
        test.startTest();
        ContactCreationOperation.insertContact();
        Contactdeletion.AContactDeletion();
        test.stopTest();
    }

}