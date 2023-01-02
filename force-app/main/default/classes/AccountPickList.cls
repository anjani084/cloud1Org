public class AccountPickList {
    @AuraEnabled
    public static List<Account> PickListMethod(){
        try{
            List<Account> accList=new List<Account>();
            accList=[SELECT Name FROM Account LIMIT 50000];
            system.debug('Method 1 '+accList);
            return accList;
            }Catch(Exception e){
                system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
                return null;
            }
    }
    @AuraEnabled
    public static List<Contact> fetchContact(String accId){
        List<Contact> showCon = [SELECT AccountId,LastName FROM Contact WHERE AccountId =: accId];
        system.debug('Mwthod 2'+showCon);
        return showCon;
    }
    @AuraEnabled
    public static List<Opportunity> fetchOpportunity(String accId){
        System.debug('accId '+accId);
        List<Opportunity> showOpp = [SELECT AccountId,Name FROM Opportunity WHERE AccountId =: accId];
        
       System.debug('Opportunity List>>'+showOpp);
        return showOpp;
    }

}