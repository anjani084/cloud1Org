@isTest
public class OpportunityUpdateOperationTest {
    @isTest public static void TestOperation(){
        Opportunity opp=new Opportunity();
        opp.Name='akm';
        opp.StageName='Closed Lost';
        opp.CloseDate=system.today().adddays(2);
        insert opp;
        test.startTest();
        OpportunityUpdateOperation.UpdateOpp();
        test.stopTest();
    }

}