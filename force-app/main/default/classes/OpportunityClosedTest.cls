@isTest
public class OpportunityClosedTest {
    @isTest public static void TestOperation(){
        List<Opportunity>oppList=new List<Opportunity>();
        opportunity opp=new Opportunity();
        opp.CloseDate=system.today();
        opp.StageName='Closed Won';
        opp.Name='akm';
        insert opp;
        oppList.adD(opp);
        test.startTest();
        OpportunityClosed.OpportunityClosedWithNoOppLineItem(oppList);
        OpportunityCloneOperation.CloneOpportunity();
        test.stopTest();
    }

}