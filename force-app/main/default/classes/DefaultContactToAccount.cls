public class DefaultContactToAccount {
    public static void AddContactByDefault(List<Account> accList){
        try{
            List<Contact> conList=new List<Contact>();
            if(accList.size()>0){
            for(Account each:accList){
                if(each.NumberOfEmployees!=null){
                for(integer i=0;i<each.NumberOfEmployees;i++){
                    Contact temp=new Contact();
                    temp.AccountId=each.Id;
                    temp.LastName='mishra'+i;
                    conList.add(temp);
                }
                }
            }
            }
            if(conList!=null && conList.size()>0){
                Insert  conList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}