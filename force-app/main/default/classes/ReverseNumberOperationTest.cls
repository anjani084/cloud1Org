@isTest
public class ReverseNumberOperationTest {
    @isTest public static void TestOperation(){
        integer i=23456;
        test.startTest();
        ReverseNumberOperation.ReverseOperation();
        system.assertEquals(i, 23456);
        test.stopTest();
    }
}