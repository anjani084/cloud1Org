@isTest
public class ContactOpportunityTest {
    @isTest public static void TestOperation(){
        account acc=new account();
        acc.name='akm';
        insert acc;
        List<Contact>conList=new List<Contact>();
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(integer i=0;i<5;i++){
            contact con=new contact();
            Opportunity each=new opportunity();
            con.Lastname='akm'+i;
            each.name='akm'+i;
            each.StageName='Qualification';
            each.AccountId=acc.Id;
            con.AccountId=acc.Id;
            each.CloseDate=system.today();
            conList.add(con);
            oppList.add(each);
        }
        insert conList;
        insert oppList;
    }

}