@isTest
public class FetchOppContactRoleTest {
    @istest public static void TestOperation(){
        Account acc =new account();
        acc.name='akm';
        insert acc;
        List<Contact> conList=new list<Contact>();
        for(integer i=0;i<3;i++){
            Contact con=new Contact();
            con.LastName='akms'+i;
            con.AccountId=acc.id;
            conList.add(con);
        }
        insert conList;
        opportunity temp=new opportunity();
        temp.Name='wht';
        temp.StageName='Qualification';
        temp.CloseDate=system.today();
        insert temp;
        
        opportunityContactRole ocr=new OpportunityContactRole();
        ocr.OpportunityId=temp.id;
        ocr.ContactId=conList.get(0).id;
        insert ocr;
        
        test.startTest();
        FetchOppContactRole.FetchingOperation();
        test.stopTest();
    }

}