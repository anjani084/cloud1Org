public class AccountDataTableAura {
    @auraenabled
    public static List<Account> fetchAccountList(){
        try{
        List<Account> accList=new List<Account>();
        accList=[SELECT Id,Name,Industry,Phone FROM Account LIMIT 100];
            system.debug(accList);
        return accList;
        }
        catch(Exception e){
            system.debug('error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return null;
        }
    }

}