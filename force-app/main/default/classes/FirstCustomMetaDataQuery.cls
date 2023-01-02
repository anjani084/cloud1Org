public class FirstCustomMetaDataQuery {
    public static void queryLanguage(){
        try{
            String UserLanguage = UserInfo.getLanguage();
            system.debug(UserLanguage.substring(0,2));
       IntentoPostApi.PostAndTranslate('what',UserLanguage.substring(0,2));
        }catch(exception e)
        {
            system.debug('error at: '+e.getMessage());
        }
    }

}