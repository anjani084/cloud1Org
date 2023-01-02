public class MatchBillingAddress {
     public static void copyAddressCode(List<Account> listOfAcc){
        try{
        for(Account each:listOfAcc){
            if(each.Match_Billing_Address__c==True){
                each.ShippingPostalCode = each.BillingPostalCode;
            }
        }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}