@IsTest
public class RecordsInsertToTimesTest {
    @isTest public static void TestOperation(){
          Time__c temp=new Time__c();
          temp.Name='ANJ';
          temp.Start_Time__c=system.today();
          temp.End_Time__c=system.today().addDays(1);
        insert temp;
        test.startTest();
        RecordsInsertToTimes.InsertionOperation();
        test.stopTest();
    }

}