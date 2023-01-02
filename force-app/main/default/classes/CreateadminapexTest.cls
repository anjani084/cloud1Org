@istest
public class CreateadminapexTest {
    @isTest public static void TestOperation(){
        Profile proID=new Profile();
            proID=[SELECT Id FROM Profile WHERE name='System Administrator' LIMIT 1];
         User newUser=new User();
            newUser.Alias='aj1';
            newUser.Lastname='mis1';
            newUser.Email='anjani.mishra@cloudanalogy.com';
            newUser.username='anjish11@cloud.com';
            newUser.EmailEncodingKey='UTF-8';
            newUser.ProfileId=proID.id;
            newUser.LocaleSidKey='en_US';
            newUser.TimeZoneSidKey='GMT';
            newUser.LanguageLocaleKey='en_US';
            insert newUser;
        test.startTest();
        CreateAdminApex.CreateAdmin();
        test.stopTest();
    }

}