@isTest
public class NotPastCloseDateTest {
    @isTest public static void TestOperation(){
        List<opportunity> oppList=new List<Opportunity>();
        
        Opportunity opp=new Opportunity();
        opp.CloseDate=system.today().addDays(1);
        opp.StageName='Qualification';
        opp.Name='akm';
        oppList.adD(opp);
        insert oppList;
        test.startTest();
        NotPastCloseDateTrigger.FutureClosedDate(oppList);
        test.stopTest();
        
    }

}