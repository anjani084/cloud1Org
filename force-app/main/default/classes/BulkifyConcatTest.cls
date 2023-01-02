@isTest
public class BulkifyConcatTest {
    @isTest public static void TestOperation(){
        List<Contact>conList=new List<Contact>();
        for(integer i=0;i<5;i++){
            Contact temp=new Contact();
            temp.LastName='akm'+i;
            conList.add(temp);
        }
        insert conList;
        test.startTest();
        BulkiFyConcatenationName.ConcatenationOperation(conList);
        test.stopTest();
    }

}