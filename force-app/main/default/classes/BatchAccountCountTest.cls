@isTest
public class BatchAccountCountTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.Name='akm';
        insert acc;
        
        List<Contact> conList=new List<Contact>();
        For(integer i=0;i<10;i++){
            Contact temp=new Contact();
            temp.LastName='akm'+i;
            temp.AccountId=acc.id;
            conList.add(temp);
        }
        insert conList;
        test.startTest();
        BatchAccountCount obj=new BatchAccountCount();
        Database.executeBatch(obj);
        test.stopTest();
    }

}