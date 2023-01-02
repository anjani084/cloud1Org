@isTest
public class AccountMaxAndMinAmountTest {
    @istest public static void TestOperation(){
        Account acc=new account();
        acc.name='akm';
        insert acc;
        Opportunity opp=new Opportunity();
        opp.name='me';
        opp.StageName='Qualification';
        opp.AccountId=acc.Id;
        opp.CloseDate=system.today();
        opp.amount=15;
        insert opp;
        
        test.startTest();
        AccountMaxAndMinAmount.MaxAndMinAmountOperation();
        test.stopTest();
    }
        
    }