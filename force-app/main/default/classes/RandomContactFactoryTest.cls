@isTest
public class RandomContactFactoryTest {
    @isTest Public static void TestOperation(){
        Contact con=new Contact();
        con.lastName='akm';
        insert con;
        integer n=5;
        String j='What';
        test.startTest();
        RandomContactFactory.generateRandomContacts(n,j);
        test.stopTest();
    }

}