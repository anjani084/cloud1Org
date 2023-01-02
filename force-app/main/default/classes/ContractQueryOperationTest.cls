@isTest
public class ContractQueryOperationTest {
    @isTest public static void TestOperation(){
        Account acc=new account();
        acc.name='last one';
        insert acc;
        
        contact con=new Contact();
        con.LastName='akm';
        con.AccountId=acc.Id;
        insert con;
        
        contract contr=new contract();
        contr.AccountId=acc.Id;
        contr.Status='Draft';
        contr.startDate=system.today();
        contr.ContractTerm=4;
        contr.CustomerSignedId=con.Id;
        insert contr;
        test.startTest();
        ContractQueryOperation.ContractOperation();
        test.stopTest();
        
        
    }

}