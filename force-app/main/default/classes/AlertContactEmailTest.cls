@isTest
public class AlertContactEmailTest {
    @isTest public static void TestOperation(){
        List<Contact> conList=new List<Contact>();
        Contact con=new contact();
        con.LastName='Akm';
        con.Phone='234567891';
        con.email='123@gmail.com';
        conList.add(con);
        insert conList;
        Test.startTest();
        AlertContactEmail.AlertMessageEmailOperation(conList);
        test.stopTest();
    }

}