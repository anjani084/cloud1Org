public class RecentlyAddedContact {
    public static void RecentlyAddOperation(){
        try{
            List<Account> accList=new List<Account>();
            accList=[SELECT Id,Name,Recently_added__c FROM Account LIMIT 1];
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,Name,CreatedDate FROM Contact WHERE AccountId in:accList ORDER BY CreatedDate DESC,Id DESC LIMIT 1];
            if(!accList.isempty()){
                for(Account each:accList){
                    if(!conList.isempty()){
                        for(Contact each1:conList){
                            each.Recently_added__c=each1.Id;
                        }
                    }
                }
            }
            if(!accList.isempty()){
                Upsert accList;
            }
            system.debug(accList);
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }
}