public class BulkiFyConcatenationName {
    public static void ConcatenationOperation(List<Contact> conList){
        try{
            List<Contact> newconList=new List<Contact>();
            newconList=[SELECT Id,LastName,ownerId FROM Contact LIMIT 50000];
            Map<Id,Contact> idConMap=new Map<Id,Contact>();
            for(Contact each:newConList){
                idConMap.put(each.Id,each);
            }
            for(Contact each:idConMap.Values()){
                each.LastName=each.LastName+'undeleted contact';
                EmailManager.sendMail(each.ownerId, 'record is Undeleted', 'record Name:'+each.LastName+' and id is: '+each.Id);
            }
            if(idConMap.values().size()>0){
                Upsert idConMap.Values();
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' At Line: '+e.getLineNumber());
        }
        
    }

}