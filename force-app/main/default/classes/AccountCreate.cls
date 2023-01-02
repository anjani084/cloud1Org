public class AccountCreate {
    @AuraEnabled 
    public static Account AccountCreateMethod(Account ApexParams){
        try{
            System.debug('Contact >>'+ApexParams);
               insert ApexParams;
            System.debug('Inserted Account >'+ApexParams);
            return ApexParams;
        }
        catch(Exception ex){
            System.debug('Error>>'+ex.getMessage());
            return null;
        }
    }
}