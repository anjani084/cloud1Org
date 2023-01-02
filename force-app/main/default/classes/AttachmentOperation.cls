public class AttachmentOperation {
    public static void CopyAttachment(){
        try{
            List<ContentDocumentLink> contactDocList=new List<ContentDocumentLink>();
            contactDocList=[SELECT ContentDocumentId,LinkedEntityId FROM ContentDocumentLink WHERE LinkedEntityId in(SELECT Id from Account) LIMIT 50000];
            set<Id> contactId=new set<Id>();
            system.debug(contactDocList);
            if(contactDocList!=null && contactDocList.size()>0){
                for(ContentDocumentLink each:contactDocList){
                    contactId.add(each.LinkedEntityId);
                }
            }
            List<Contact>conList=new List<Contact>();
            conList=[SELECT Id,AccountId FROM Contact WHERE AccountId in :ContactId LIMIT 50000];
            List<ContentDocumentLink> contentDocList=new List<ContentDocumentLink>();
            
            if(contactDocList!=null && contactDocList.size()>0){
                for(ContentDocumentLink cdl:contactDocList){
                    if(conList!=null && conList.size()>0){
                        for(Contact each:conList){
                            if(each.AccountId==cdl.LinkedEntityId){
                                ContentDocumentLink cObject=new ContentDocumentLink();
                                cObject.ContentDocumentId=cdl.ContentDocumentId;
                                cObject.LinkedEntityId=each.id;
                                ContentDocList.add(cObject);
                            }
                        }
                    }
                }
            }
            if(ContentDocList.size()>0){
                insert ContentDocList;
            }
            system.debug(ContentDocList);
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at line: '+e.getLineNumber());
        }
    }

}