@isTest
public class ContactRoleDeletionTest {
    @isTest public static void TestOperation(){
        account acc=new Account();
        acc.name='akm';
        insert acc;
        
        Contact con=new Contact();
        con.LastName='mish';
        con.AccountId=acc.Id;
        insert con;
        
        Opportunity opp=new Opportunity();
        opp.name='yes';
        opp.StageName='Closed Won';
        opp.CloseDate=system.today();
        opp.AccountId=acc.Id;
        insert opp;
        test.startTest();
        ContactRoleDeletion.DeletionOperation();
        test.stopTest();
        
    }

}