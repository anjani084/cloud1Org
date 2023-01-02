@isTest
public class UndeleteRecordsOfTimesTest {
    @istest public static void TestOperation(){
        // newTimeList=[SELECT Id,OwnerId,Name,Start_Time__c,End_Time__c FROM Time__c WHERE Id in:idSet
         //                 AND Name LIKE 'a%' LIMIT 50000 ALL ROWS];
         Time__c ti=new Time__c();
        ti.Name='ayusp';
        ti.Start_Time__c=system.today().addMonths(-1);
        ti.End_Time__c=system.today().addMonths(-1);
        insert ti;
        set<id> idSet=new Set<Id>();
        idSet.add(ti.id);
        test.startTest();
        UndeleteRecordsOfTimes.UndeleteOperation(idSet);
        test.stopTest();
    }

}