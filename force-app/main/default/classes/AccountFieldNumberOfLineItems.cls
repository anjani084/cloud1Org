public class AccountFieldNumberOfLineItems {
    public static void FieldFillingOperation(List<OpportunityLineItem> oppLineItemList){
        try{
            Set<Id> idSet=new Set<Id>();
            if(oppLineItemList.size()>0){
                for(OpportunityLineItem each:oppLineItemList){
                    idSet.add(each.OpportunityId);
                }
            }
            List<Opportunity> oppList=new List<Opportunity>();
            oppList=[SELECT Id,AccountId,Account.Number_of_LineItems__c,(SELECT Id FROM OpportunityLineItems) FROM Opportunity 
                     WHERE Id in:idSet LIMIT 50000];
            
            List<Account> accList=new List<Account>();
            if(oppList.size()>0){
                for(Opportunity each:oppList){
                    each.account.Number_of_LineItems__c=each.OpportunityLineItems.size();
                    accList.add(each.account);
                }
            }
            if(accList.size()>0){
                Upsert accList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }
    
}