@isTest
public class BatchNewOpportunitiesTest {
    @isTest public static void TestOperation(){
        Opportunity opp=new Opportunity();
        opp.Name='what';
        opp.CloseDate=system.today();
        OPP.StageName='Qualification';
        insert opp;
        test.startTest();
        BatchNewOpportunities abc=new BatchNewOpportunities();
        database.executeBatch(abc);
        test.stopTest();
    }

}