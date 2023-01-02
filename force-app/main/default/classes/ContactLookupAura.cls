public class ContactLookupAura {
    @AuraEnabled 
    public static Contact CreatecontactMethod(Contact ApexParams){
        try{
            System.debug('Contact >>'+ApexParams);
               insert ApexParams;
            System.debug('Inserted Contact >'+ApexParams);
            return ApexParams;
        }
       
        catch(Exception ex){
            System.debug('Error>>'+ex.getMessage());
            return null;
        }
    }
     @AuraEnabled
         public static List<Account> fetchAccountInfo(){
        List<Account> showAcc = [SELECT Id,Name FROM Account];
        return showAcc; 
    }
}