@isTest public class MaintenanceTest {
    @isTest public static void TestOperation(){
        Contact con=new Contact();
        con.LastName='akm';
        insert con;
        List<maintenance__c> mainList=new List<Maintenance__c>();
        for(integer i=0;i<4;i++){
            Maintenance__c temp=new maintenance__c();
            temp.name='aks'+i;
            temp.Contact__c=con.Id;
            temp.Rating__c='4';
            mainList.adD(temp);
        }
        insert mainList;
        test.startTest();
        MaintenanceObject.AverageRatingOperation();
        test.stopTest();
    }

}