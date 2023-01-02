public class UndeleteContactTrigger {
    public static void ConcatenationOperation(List<Contact> conList){
        try{
            List<Contact> newConList=new List<Contact>();
            newConList=[SELECT Id,LastName,OwnerId From Contact WHERE Id in:conList];
            for(Contact each:newConList){
                each.LastName=each.LastName+'undeleted contact';
                EmailManager.sendMail(each.ownerId, 'record is Undeleted', 'record Name:'+each.LastName+' and id is: '+each.Id);
            }
            if(newConList.size()>0){
                Upsert newConList;
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
        
    }

}