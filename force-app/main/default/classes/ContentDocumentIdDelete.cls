public class ContentDocumentIdDelete {
    public static void DeleteOperation(){
        try{
        List<Account> accList=new List<Account>();
        accList=[SELECT Id FROM Account LIMIT 50000];
        set<Id> idSet=new Set<Id>();
        for(account each:accList){
            idSet.add(each.Id);
        }
        List<Attachment> attList=[SELECT Id, ParentId FROM Attachment
                                           WHERE ParentId IN: idSet LIMIT 1];
        List<ContentDocument> ConDocList =[SELECT Id, CreatedBy.name, ContentSize, ParentId FROM ContentDocument
                                           WHERE ParentId IN: idSet LIMIT 1];
        for(Attachment each:attList){
        system.debug('content document...'+each.Id);
        }
 
        }catch(Exception e){
            system.debug('Error:'+e.getMessage());
        }
    }

}