public class DisplayUserInfo {
    public static void Display1(){
            User salesforce=[SELECT CompanyName, Email, phone, Name FROM user WHERE ID =: UserInfo.getUserId()];
            system.debug(salesforce.name+'....'+salesforce.CompanyName+'........'+salesforce.phone+'.......'+salesforce.Email);
       
    }

}