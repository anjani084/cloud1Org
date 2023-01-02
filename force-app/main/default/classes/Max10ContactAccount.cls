public class Max10ContactAccount {
    public static void SizeOperation(){
        try{
            Account acc=new Account();
            acc=[SELECT Name,Id FROM Account LIMIT 1];
            List<Contact> conList=[SELECT Name,LastName,Id,AccountId FROM Contact WHERE AccountId =:acc.Id LIMIT 50000];
            if(conList.size()>10){
                Account newAcc=new Account();
                newAcc.Name=acc.Name;
                for(Integer i=10;i<conList.size()-1;i++){
                    conList[i].AccountId=newAcc.Id;
                }
                if(newAcc!=null){
                    Insert newAcc;
                }
            }
            if(acc!=null){
                Upsert acc;
            }
            if(conList!=null && conList.size()>0){
                Upsert conList;
            }
            

        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}