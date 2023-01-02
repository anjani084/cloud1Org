@isTest
public class EmailManagerTest {
    @istest public static void TestOperation(){
        string str='anjanimishra084@gmail.com';
            string str2='whats new';
        string str3='yes!';
        test.startTest();
        EmailManager.sendMail(str,str2,str3);
        test.stopTest();
    }

}