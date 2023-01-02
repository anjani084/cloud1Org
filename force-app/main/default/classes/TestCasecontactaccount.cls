@isTest
public class TestCasecontactaccount {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.name='akm';
        insert acc;
        Contact con=new Contact();
        con.LastName='aks';
        insert con;
         Case addCase= new Case();
          addCase.Description='3 february';
          addCase.Status='Working';
          addCase.Origin='Phone';
        insert addCase;
        test.startTest();
        CaseRecordCreation.Casecreation();
        test.stopTest();
        
    }

}