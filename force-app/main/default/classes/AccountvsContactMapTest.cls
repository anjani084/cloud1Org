@isTest
public class AccountvsContactMapTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.name='Akm';
        insert acc;
        List<Contact>conList=new List<Contact>();
        for(integer i=0;i<3;i++){
            Contact temp=new Contact();
            temp.LastName='akm'+i;
            temp.AccountId=acc.Id;
            conList.add(temp);
        }
        insert conList;
        test.startTest();
        AccountvsContactMap.mappingOperation();
        test.stopTest();
    }

}