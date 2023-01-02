public class SalesRepresentativeOnAccount {
    public static void FieldFillingOperation(List<Account> accList){
        try{
          
            Map<Id,User> UserMap = new Map<Id,User>([Select Id, Name from User]); 
            for(Account each:accList){
                each.Sales_Representative__c=UserMap.get(each.OwnerId).Name;
            }  
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    } 

}