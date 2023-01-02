@isTest
public class BusinessEntityCountTest {
    @isTest public static void TestOperation(){
        List<Contact> conList=new List<Contact>();
        List<Opportunity> oppList=new List<Opportunity>();
        for(integer i=0;i<5;i++){
            Contact con=new Contact();
            Opportunity opp=new Opportunity();
            opp.Name='akm'+i;
            opp.CloseDate=system.today();
            opp.StageName='Qualification';
            con.LastName='akm'+i;
            con.BusinessEntity__c=True;
            oppList.add(opp);
            conList.add(con);
            insert conList;
            insert oppList;
            test.startTest();
            BusinessEntityCount.EntityOperation();
            test.stopTest();
        }
        
    }

}