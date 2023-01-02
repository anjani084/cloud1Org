public with sharing class fetchUserName {
    @AuraEnabled(cacheable=true)
    public static String fetchCurrentUserName() {
        try{
        String Name = UserInfo.getName();
            system.debug(Name);
        return Name.toUpperCase();
        }catch(exception e){
            system.debug('error: '+e.getMessage());
            return null;
        }
    }
}