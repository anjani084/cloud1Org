public class UpdateAccount {
    public static void updateOperation( List<Account>accList){
        try{
            Map<string,Id> strIdMap=new Map<string,Id>();
            for(Account each:accList){
                strIdMap.put(each.name,each.Id);
            }
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,name, AccountId,Account.Name from Contact where Account.Name in:strIdMap.keyset() LIMIT 50000];
            for(Contact each:conList){
                each.AccountId=strIdMap.get(each.Account.Name);
            }
            if(conList!=null && conList.size()>0){
                UPDATE conList;
            }
             List<Account> newAccList=new List<Account>();
            newAccList=[SELECT Id,Name from Account where Name in:strIdMap.keyset() LIMIT 50000];
            if(newAccList.size()>0){
                DELETE newAccList;
            }
        }catch(exception e){
            system.debug('error>>>'+e.getMessage()+' at line: '+e.getLineNumber());
        }
    }
}