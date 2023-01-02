@isTest
public class PaymentRecordCreationTest {
    @isTest public static void TestOperation(){
          Agreement__c temp = new agreement__c();
                temp.name='abc';
                temp.duration__c=string.valueof(3);
                insert temp;
         Payment__c pay=new Payment__c();
                        pay.name='abc';
                        pay.Start_Date__c=system.today();
                        pay.End_Date__c=System.Today().addMonths(1);
                       insert pay;
        test.startTest();
        PaymentRecordCreation.CreationOperation();
        test.stopTest();
        
    }

}