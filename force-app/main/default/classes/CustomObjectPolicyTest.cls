@isTest
public class CustomObjectPolicyTest {
    @isTest public static void TestOperation(){
        Opportunity opp=new Opportunity();
        opp.name='akm';
        opp.StageName='Qualification';
        opp.CloseDate=system.today();
        opp.Policy_number__c=78945;
        insert opp;
            
        Policy__c temp=new Policy__c();
        temp.Policy_number__c=789457;
        temp.Name='what';
        insert temp;
        
        Policy__c pol=new Policy__c();
        pol.Parent_Policy__c=temp.Id;
        pol.Policy_number__c=78945;
        pol.name='yupp';
        pol.Opportunity__c=opp.Id;
        insert pol;
        List<Policy__c> polList=new List<Policy__c>();
        polList.add(temp);
        polList.adD(pol);
        
        test.startTest();
        CustomObjectPolicyUpdate.UpdateOperation(polList);
        test.stopTest();
           
            
    }

}