@isTest
public class TestVerifyDate {
    @isTest public static void testOperation(){
            Date k=Date.newInstance(1960, 3, 17);
            Date d=Date.newInstance(1960, 2, 25);
            Date l=Date.newInstance(1960, 1, 25);
            Test.startTest();
            VerifyDate.CheckDates(l,k);
            VerifyDate.CheckDates(d, k);
            Test.stopTest();
    }

}