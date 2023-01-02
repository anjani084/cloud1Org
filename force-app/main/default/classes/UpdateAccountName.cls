public class UpdateAccountName {
    public static void AddLastNameOperation(List<Contact> conList){
        try{
            List<Contact> newConList=new List<Contact>();
            newConList=[SELECT Id,LastName,Account.Name,AccountId FROM Contact WHERE Id in:conList LIMIT 50000];
            List<Account> accList=new List<Account>();
            if(newconList.size()>0){
                for(Contact each:newConList){
                    if(each.Account.Name!=null){
                        each.Account.Name=each.Account.Name+' '+each.LastName;
                        accList.add(each.Account);
                    }
                }
            }
            if(accList.size()>0){
                Update accList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
        
    }

}