@isTest
public class DisplayUserInfoTest {
    @isTest public static void TestOperation(){
        User salesforce=[SELECT CompanyName, Email, phone, Name FROM user WHERE ID =: UserInfo.getUserId()];
        test.startTest();
        DisplayUserInfo.Display1();
        test.stopTest();
    }

}