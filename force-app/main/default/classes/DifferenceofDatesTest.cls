@isTest
public class DifferenceofDatesTest {
    @isTest public static void TestOperation(){
       Datetime startDate=Datetime.newInstance(2016, 1, 2, 6, 7, 55);
       Datetime endDate=Datetime.newInstance(2016, 2, 5, 7, 8, 55);
        test.startTest();
        DifferenceOfDates.DifferenceOperation();
        test.stopTest();
    }

}