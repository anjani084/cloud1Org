@isTest
public class DailyStatusTimeTest {
    @isTest public static void TestOperation(){
        Contact con=new Contact();
        con.LastName='akms';
        insert con;
        
        List<daily_status__c> dsList=new List<daily_status__c>();
        datetime myDateTime = Datetime.newInstance(1960, 2, 17);
        for(integer i=0;i<3;i++){
        Daily_Status__c ds=new Daily_Status__c();
        ds.Name='akm'+i;
        ds.Login_Time__c= myDateTime.addHours(i);
            ds.Logout_Time__c=myDateTime.addDays(1);
        ds.Employee__c=con.Id;
            dsList.add(ds);
        }
        insert dsList;
        test.startTest();
        DailyStatusTime.TimeIntervalOperation();
        test.stopTest();
        
    }

}