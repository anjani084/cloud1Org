public class DeleteLastNameFromAccount {
    public static void DeletionOperation(List<Contact> conList){
        try{
            List<Contact> newConList=new List<Contact>();
            newConList=[SELECT Id,LastName,AccountId,Account.Name FROM Contact WHERE Id in:conList LIMIT 50000];
            List<Account> accList=new List<Account>();
            If(newConList.size()>0){
                for(Contact each: newConList){
                    each.Account.Name=each.Account.Name.replace(each.LastName,'');
                    accList.add(each.Account);
                }
            }
            if(accList!=null && accList.size()>0){
                upsert accList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}