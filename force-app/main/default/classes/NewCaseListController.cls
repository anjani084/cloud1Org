public class NewCaseListController {
   
    public static List<Case> getNewCases(){
         list<case> newcase = new list<case>();
        newcase=[SELECT Id,caseNumber FROM Case WHERE Status='New' LIMIT 50000];
        return newcase;
    }

}