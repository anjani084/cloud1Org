@isTest
public class ContactAccountRelationTest {
    @isTest public static void TestOperation(){
        List<Account> accList=new List<Account>();
        for(integer i=0;i<10;i++){
        account acc=new account();
            acc.Name='akm'+i;
            accList.add(acc);
        }
        insert accList;
        list<Contact> conList=new List<Contact>();
        for(integer i=0;i<10;i++){
            Contact temp=new Contact();
            temp.LastName=accList.get(i).name;
            temp.AccountId=accList.get(i).Id;
            conList.add(temp);
        }
        insert conList;
        test.startTest();
        ContactAccountRelationshipOperation.RelationshipOperation();
        test.stopTest();
    }

}