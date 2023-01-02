@isTest
public class ParsegetnameTest {
    @istest public static void TestOperation(){
        account acc=new account();
        acc.name='akm';
        insert acc;
        test.startTest();
        parsgetname.getname();
        test.stopTest();
    }

}