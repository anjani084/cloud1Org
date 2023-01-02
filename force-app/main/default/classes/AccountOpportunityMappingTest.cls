@isTest
public class AccountOpportunityMappingTest {
    @isTest Public static void TestOperation(){
        Account acc=new Account();
        acc.Name='Last';
        insert acc;
        
        List<Opportunity> oppList=new List<Opportunity>();
        for(integer i=0;i<2;i++){
            Opportunity each=new Opportunity();
            each.Name='AKm'+i;
            each.CloseDate=system.today().addDays(10);
            each.StageName='Qualification';
            each.AccountId=acc.Id;
            oppList.add(each);
        }
        insert oppList;
        Test.startTest();
        AccountOpportunityMapping.MappingOperation();
        test.stopTest();
   }

}