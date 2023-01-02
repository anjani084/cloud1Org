@isTest
public class AddContactstoOpportunityContactRoleTest {
    @isTest public static void TestOperation(){
        Account acc=new account();
        acc.name='akm';
        insert acc;
        
        List<contact> conList=new List<Contact>();
        for(integer i=0;i<2;i++){
            contact temp=new Contact();
            temp.LastName='akm'+i;
            temp.AccountId=acc.Id;
            conList.add(temp);
        }
        insert conList;
        
        Opportunity opp=new Opportunity();
        opp.name='what';
        opp.CloseDate=system.today();
        opp.StageName='Qualification';
        opp.AccountId=acc.id;
        insert opp;
        test.startTest();
        AddContactstoOpportunityContactRole.AddContactsOperation();
        test.stopTest();
        
    }
}