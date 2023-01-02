public class Contactcreate {
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
}