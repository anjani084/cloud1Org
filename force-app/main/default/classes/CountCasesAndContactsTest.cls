@isTest
public class CountCasesAndContactsTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.name='akm';
        insert acc;
        
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<3;i++){
        Contact con=new contact();
        con.LastName='aks';
        con.AccountId=acc.Id;
            conList.add(con);
        }
        insert conList;
        List<case> csList=new List<Case>();
        for(integer i=0;i<3;i++){
        Case cs=new case();
        cs.Origin='Phone';
        cs.Status='Working';
            if(i<2){
                cs.ContactId=conList.get(1).Id;
                
            }else{
                cs.ContactId=conList.get(i).Id;
            }
            csList.add(cs);}
        insert csList;
        test.startTest();
        CountCasesAndContacts.CountingOperation();
        test.stopTest();
    }
    

}