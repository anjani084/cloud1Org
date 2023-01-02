@isTest
public class OpportunityContactRoleOperationTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.name='aks';
        insert acc;
        
        Opportunity opp=new Opportunity();
        opp.StageName='Closed Won';
        opp.CloseDate=system.today();
        opp.name='akm';
        opp.AccountId=acc.Id;
        insert opp;
       
        Contact con=new Contact();
        con.AccountId=acc.Id;
        con.LastName='aksd';
        insert con;
        
        opportunityContactRole ocr=new OpportunityContactRole();
        ocr.OpportunityId=opp.Id;
        ocr.ContactId=con.id;
        insert ocr;
        test.startTest();
        OpportunityContactRoleOperation.GetOpportunityOperation();
        OpportunityOperation.InsertOperation();
        test.stopTest();
    }

}