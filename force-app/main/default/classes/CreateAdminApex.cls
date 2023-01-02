public class CreateAdminApex {
    public static void CreateAdmin(){
        try{
            Profile proID=new Profile();
            proID=[SELECT Id FROM Profile WHERE name='System Administrator' LIMIT 1];
            User newUser=new User();
            newUser.Alias='anj1';
            newUser.Lastname='mis1';
            newUser.Email='anjani.mishra@cloudanalogy.com';
            newUser.username='anjmish11@cloud.com';
            newUser.EmailEncodingKey='UTF-8';
            newUser.ProfileId=proID.id;
            newUser.LocaleSidKey='en_US';
            newUser.TimeZoneSidKey='GMT';
            newUser.LanguageLocaleKey='en_US';
            insert newUser;
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' At Line: '+e.getLineNumber());
        }
    }

}