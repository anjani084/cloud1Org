@isTest
public class contactDeletionTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.Name='kaam';
        insert acc;
        List<Contact>conList=new List<Contact>();
        for(integer i=0;i<5;i++){
        Contact con=new Contact();
        con.LastName='kam'+i;
            if(i>2){
            con.AccountId=acc.Id;
            
            }
            conList.add(con);
        }
        insert conList;
        Test.startTest();
        Contactdeletion.AContactDeletion();
        test.stopTest();
        
    }

}