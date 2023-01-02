@isTest
public class CopyAddressTest {
    @isTest public static void TestOperation(){
        Account acc=new account();
        acc.name='akm';
        insert acc;
        
        List<contact> conList=new List<Contact>();
        for(integer i=0;i<5;i++){
        Contact con=new Contact();
        con.LastName='akmishra'+i;
        con.AccountId=acc.Id;
        con.copy_Address__c=True;
        con.Copy_Address_From_Account__c=True;
            conList.add(con);}
        insert conList;
        test.startTest();
        CopyAddress.CopyOperation();
        CopyAddressFromAccount.CopyAddressOperation(conList);
        test.stopTest();
            
    }

}