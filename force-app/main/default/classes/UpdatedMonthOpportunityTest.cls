@isTest
public class UpdatedMonthOpportunityTest {
    @isTest public static void TestOperation(){
       Opportunity opp=new Opportunity();
        opp.name='akm';
        opp.StageName='Qualification';
        opp.CloseDate=system.today();
        insert opp;
        test.starttest();
        UpdatedMonthOpportunity.LastUpdatedMonthOperation();
        test.stopTest();
    }

}