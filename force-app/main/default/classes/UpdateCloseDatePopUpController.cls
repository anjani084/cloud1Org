public class UpdateCloseDatePopUpController {
    @AuraEnabled 
    public static String CreatecontactMethod(date ApexParams, string accountId){
        try{
            System.debug('Contact >>'+ApexParams);
           Opportunity oppObj = new Opportunity();
            oppObj.id=accountId;
            oppObj.CloseDate=ApexParams;
            update oppObj;
            System.debug('Inserted Contact >'+ApexParams);
            return null;
        }
       
        catch(Exception ex){
            System.debug('Error>>'+ex.getMessage());
            return null;
        }
    }

}