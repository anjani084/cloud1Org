@isTest
public class CountContactOpTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.name='akm';
        insert acc;
        
        Opportunity opp=new Opportunity();
        opp.AccountId=acc.id;
        opp.name='aks';
        opp.CloseDate=system.today();
        opp.StageName='Qualification';
        insert opp;
        
        Contact con=new Contact();
        con.LastName='aks';
        con.AccountId=acc.Id;
        insert con;
        
        Test.startTest();
        CountContactOperation.CoutOpeartion();
        Test.stopTest();
    }

}