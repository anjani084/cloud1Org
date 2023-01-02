@isTest
public class CloseOpportunitiescampaignTest {
    @isTest public static void TestOperation(){
        campaign camp=new Campaign();
        camp.Name='what';
        camp.Status='Completed';
        insert camp;
        
        Opportunity opp=new Opportunity();
        opp.name='akmishra';
        opp.StageName='Qualification';
        opp.CloseDate=system.today();
        opp.CampaignId=camp.Id;
        insert opp;
        List<Campaign> campList=new List<campaign>();
        campList.add(camp);
        test.startTest();
        CloseOpportunitiesCampaignCompleted.ClosingAssociateOpportunities(campList);
        test.stopTest();
       
    }

}