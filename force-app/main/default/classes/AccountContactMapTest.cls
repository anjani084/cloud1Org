@isTest
public class AccountContactMapTest {
    @isTest public static void TestOperation(){
        account acc=new Account();
        acc.Name='akm';
        insert acc;
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<10;i++){
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