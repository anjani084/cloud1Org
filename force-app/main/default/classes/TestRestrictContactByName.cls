@isTest
public class TestRestrictContactByName {
    @isTest public static void TestOperation(){
        Contact con=new Contact();
        con.LastName='INVALIDNAME';
        insert con;
}

}