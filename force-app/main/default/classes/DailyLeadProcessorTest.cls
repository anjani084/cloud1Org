@isTest
public class DailyLeadProcessorTest {
    static testmethod void testList(){
        List<Lead> lList=new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead temp=new Lead();
            temp.FirstName='Anjani'+i;
            temp.LastName='Mishr'+i;
            temp.Company='Cloud'+i;
            temp.Status='Working';
            lList.add(temp);
        }
        if(lList.size()>0){
            insert lList;
        }
        Test.startTest();
        DailyLeadProcessor obj=new DailyLeadProcessor();
        system.schedule('obj', '20 30 8 10 2 ?', new DailyLeadProcessor());
        Test.stopTest();
    }

}