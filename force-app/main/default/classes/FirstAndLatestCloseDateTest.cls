@isTest
public class FirstAndLatestCloseDateTest {
    @isTest public static void TestOperation(){
        Account acc=new account();
        acc.name='akm';
        insert acc;
        List<opportunity> oppList=new List<Opportunity>();
        for(integer i=0;i<5;i++){
            Opportunity opp=new Opportunity();
            opp.name='akm'+i;
            opp.closedate=system.today().addDays(i);
            opp.stageName='Qualification';
            opp.AccountId=acc.Id;
            oppList.add(opp);
        }
        insert oppList;
        test.startTest();
        FirstAndLatestCloseDate.CloseDateOperation();
        test.stopTest();
    }

}