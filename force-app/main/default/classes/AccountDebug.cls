public class AccountDebug {
    public static void debugAccount(List<Account> accList){
        try{
            system.debug('accList:>>>>>'+accList);
        }catch(exception e){
            system.debug('error: '+e.getMessage()+' at line:'+e.getLineNumber());
        }
    }

}