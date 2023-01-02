@isTest public class test2answertest {
    @isTest public static void TestOperation(){
        account acc=new account();
        acc.name='akm';
        insert acc;
        
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<12;i++){
            Contact con=new Contact();
            con.LastName='what'+i;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        insert conList;
        test.startTest();
        test2answer.AccountCreation();
        test.stopTest();
    }
    

}