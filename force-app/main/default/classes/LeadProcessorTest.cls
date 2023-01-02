@isTest
public class LeadProcessorTest {
    static testmethod void testLeadProcessor(){
        List<Lead> leadList=new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead temp=new Lead();
            temp.FirstName='Anjani'+i;
            temp.LastName='Mishr'+i;
            temp.Company='Cloud'+i;
            temp.Status='Working';
            leadList.add(temp);
        }
        if(leadList.size()>0){
            insert leadList;
        }
        Test.startTest();
        LeadProcessor obj=new LeadProcessor();
        Database.executeBatch(obj);
        Test.stopTest();
        
    }

}