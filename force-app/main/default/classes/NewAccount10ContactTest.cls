@isTest
public class NewAccount10ContactTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.name='akm';
        insert acc;
        
        List<Contact> conList=new List<Contact>();
        
        for(integer i=0;i<12;i++){
            Contact con=new Contact();
            con.LastName='aks'+i;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        insert conList;
        test.startTest();
        NewAccount10Contact.NewAccountCreation();
        test.stopTest();
    }

}