public class Contactdeletion {
    public static void AContactDeletion(){
        try{
            List<Contact>contList=new List<Contact>();
            contList=[SELECT id FROM contact WHERE Account.Name Like'%a%' LIMIT 50000];
            System.debug(contList);
            if(contList!=null && contList.size()>0){
            Delete contList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}