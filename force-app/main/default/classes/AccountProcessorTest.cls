@isTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest(){
        Account a= new Account();
        a.Name='anj';
        insert a;
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<6;i++){
            Contact temp=new Contact();
            temp.LastName='abc'+i;
            temp.AccountId=A.Id;
            conList.add(temp);
            
        }
        if(conList.size()>0){
            insert conList;
        }
        Set<Id> idSet=new Set<Id>();
        idSet.add(a.Id);
        Test.startTest();
        AccountProcessor.countContacts(idSet);
        AccountOperation.insertAccount();
        Test.stopTest();
    }
}