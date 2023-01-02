public with sharing class GetAccount {
    public static List<Account> GetAccountDetail() {
        try{
            List<Account> accList=new List<Account>();
            accList=[SELECT Id,Name FROM Account limit 100];
            return accList;

        }catch(exception e){
            system.debug('error>'+e.getMessage());
            return null;
            
        }

    }
}