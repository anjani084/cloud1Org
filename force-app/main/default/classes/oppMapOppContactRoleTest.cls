@isTest
public class oppMapOppContactRoleTest {
    @isTest public static void TestOperation(){
        Opportunity opp=new Opportunity();
        opp.Name='akm';
        opp.CloseDate=system.today();
        opp.StageName='Qualification';
        insert opp;
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<3;i++){
            Contact con=new Contact();
            con.LastName='aks'+i;
            conList.adD(con);
        }
        insert conList;
        List<opportunityContactRole> ocrList=new List<opportunityContactRole>();
        for(Contact each:conList){
            opportunityContactRole ocr=new opportunityContactRole();
            ocr.OpportunityId=opp.Id;
            ocr.ContactId=each.Id;
            ocrList.adD(ocr);
            
        }
        insert ocrList;
        test.startTest();
        OppMapOppContactRole.MappingOperation();
        test.stopTest();
    }

}