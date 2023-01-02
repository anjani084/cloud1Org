@isTest
public class ActiveCampaignTest {
    @isTest Public static void TestOperation(){
        Lead ld=new Lead();
        ld.Company='what';
        ld.LastName='yeh';
        insert ld;
        
        Campaign cam=new campaign();
        cam.name='yes';
        cam.StartDate=system.today();
        cam.isActive=True;
        insert cam;
        
        CampaignMember CM=new CampaignMember();
        CM.CampaignId=cam.Id;
        CM.LeadId=ld.Id;
        insert CM;
        
        test.startTest();
        ActiveCampaign.ShowActiveCampaign();
        CampaignLeadMapping.MappingOperation();
        NumberOfCampMember.CountOperation();
        test.stopTest();        
    }

}