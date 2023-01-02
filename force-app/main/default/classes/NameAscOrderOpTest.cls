@isTest
public class NameAscOrderOpTest {
    @isTest public static void TestOperation(){
        List<account> accList=new List<Account>();
        for(integer i=0;i<5;i++){
            Account acc=new Account();
            acc.name='akn'+i;
            accList.add(acc);
        }
        insert accList;
        test.startTest();
        NameAscOrderOperation.AccountNameOrder();
        test.stopTest();
    }

}