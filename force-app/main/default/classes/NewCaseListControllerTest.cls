@isTest
public class NewCaseListControllerTest {
    @isTest public static void TestOperation(){
        Case cs=new case();
        cs.Status='new';
        cs.Origin='Phone';
            insert cs;
        
        test.startTest();
        NewCaseListController.getNewCases();
        test.stopTest();
    }

}