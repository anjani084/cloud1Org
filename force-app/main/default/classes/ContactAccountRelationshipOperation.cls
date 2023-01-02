public class ContactAccountRelationshipOperation {
    public static void RelationshipOperation(){
        try{
            List<Account>accList= new List<Account>();
            acclist = [SELECT ID,Name FROM account LIMIT 11];
            List<Contact> contList=new List<Contact>();
            integer k=0;
            for(integer i=1;i<=10;i++){
                k=k+1;
                Contact cont=new Contact();
                cont.AccountID =accList.get(k).ID;
                cont.LastName =accList.get(k).Name;
                cont.FirstName='relationship'+i;
                contList.add(cont);
            }
            if(contList!=null && contList.size()>0){
            insert contList;
            }
        }catch(Exception e){
            System.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}