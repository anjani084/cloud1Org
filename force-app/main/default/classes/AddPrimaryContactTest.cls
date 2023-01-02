@isTest
public class AddPrimaryContactTest {
    static testmethod void testList(){
        List<Account>Test1=new List<Account>();
        for(integer i=0;i<50;i++){
            test1.add(new Account(BillingState='CA',Name='Test'+i));
        }
        for(integer j=0;j<50;j++){
            test1.add(new Account(BillingState='NY',name='Test'+j));
        }
        if(test1.size()>0){
            insert test1;
        }
        Contact con=new Contact();
        con.FirstName='akm';
        con.LastName='mean';
        insert con;
        String state='CA';
        AddPrimaryContact aPC=new AddPrimaryContact(con,State);
        Test.startTest();
        system.enqueueJob(apc);
        Test.stopTest();
    } 

}