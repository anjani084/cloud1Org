@isTest
public class ReverseAccountNameOperationTest {
    @isTest public static void TestOperation(){
        Account acc=New Account();
        acc.name='anjani';
        insert acc;
        test.startTest();
        ReverseAccountNameOperation.ReverseOperation();
        system.assertEquals(acc.name, 'anjani');
        test.stopTest();
    }

}