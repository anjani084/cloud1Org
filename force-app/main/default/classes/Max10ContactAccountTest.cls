@isTest
public class Max10ContactAccountTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.name='akm';
        insert acc;
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<12;i++){
            Contact temp=new Contact();
            temp.LastName='what'+i;
            temp.AccountId=acc.id;
            conList.add(temp);
        }
        insert conList;
        test.startTest();
        Max10ContactAccount.SizeOperation();
        test.stopTest();
    }

}