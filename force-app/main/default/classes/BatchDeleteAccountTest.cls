@isTest
public class BatchDeleteAccountTest {
    @isTest public static void TestOperation(){
        
       List<account> accList=new List<account>(); 
        account acc1=new Account();
        acc1.name='what';
        insert acc1;
        accList.add(acc1);
        
        Opportunity opp=new Opportunity();
        opp.name='yupp';
        opp.CloseDate=system.today();
        opp.stagename='Qualification';
        opp.AccountId=acc1.id;
        insert opp;
        
        case cs=new case();
        cs.AccountId=acc1.Id;
        cs.Origin='phone';
        cs.status='new';
        insert cs;
            
        test.startTest();
        BatchDeleteAccount abs=new BatchDeleteAccount();
        database.executeBatch(abs);
        test.stopTest();
    }

}