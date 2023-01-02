@isTest
public class UndeleteContactTriggerTest {
    @Istest public static void TestOperation(){
        List<Contact> conList=new List<Contact>();
        Contact con=new Contact();
        con.LastName='akm';
        conList.add(con);
        insert conList;
        test.startTest();
        UndeleteContactTrigger.ConcatenationOperation(conList);
        test.stopTest();
        
    }

}