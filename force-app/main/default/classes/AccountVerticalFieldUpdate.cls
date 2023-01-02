public class AccountVerticalFieldUpdate {
    public static void FieldUpdateOperation(List<Account> accList){
        try{
            System.debug('accList>'+accList);
            Set<id> idSet=new Set<Id>();
            for(Account each:accList){
                idSet.add(each.ParentId);
            }
            
            System.debug('idSet '+idSet);
            List<Account> newAccList=new List<Account>();
            newAccList=[SELECT Id,vertical__c from account WHERE Id in: idSet];
            List<Account> newAccList1=new List<Account>();
            newAccList1=[SELECT Id,vertical__c,parentId from account WHERE parentId in: idSet];
            
            Map<Account,List<Account>> accMap=new Map<Account,List<Account>>();
            List<Account> tempList=new List<Account>();
            for(account each:newAccList1){
                if(accMap.containskey(each.Parent)){
                    
                    tempList=accMap.get(each.Parent);
                    tempList.add(each);
                    accMap.put(each.Parent,tempList);
                        }else{
                             tempList.add(each);
                        accMap.put(each.Parent,tempList);
                        }
            }
             List<Account> updateAccList=new List<account>();
            for(Account each:accMap.keyset()){
                for(integer i=0;i<accMap.get(each).size();i++){
                    accMap.get(each)[i].vertical__c=each.Vertical__c;
                    updateAccList.add(accMap.get(each)[i]);
                }
            }
           
        }catch(exception e){
            system.debug('error: '+e.getMessage()+' at line: '+e.getLineNumber());
        }
        
    }
}