public class EmailMessageClass {
    public static void emailAttachment(){
        try{
            EmailMessage emailMessage = new EmailMessage();
            emailMessage.status = '3'; 
            emailMessage.fromAddress = 'sender@example.com'; 
            emailMessage.fromName = 'Dan Perkins'; 
            emailMessage.subject = 'This is the Subject!'; 
            emailMessage.htmlBody = '<html><body><b>Hello</b></body></html>'; 
            insert emailMessage;
           // List<Attachment> att=new List<Attachment>();
            //att=[SELECT Id,body,Name,ContentType FROM Attachment limit 5];
            //List<Attachment> attList=new List<Attachment>();
            //for(attachment each:att){
           /// Attachment obj = new Attachment();
           // obj.Body = each.body;
            //obj.ParentId = emailMessage.Id;
           // obj.Name = each.Name;//
           // obj.ContentType = each.ContentType;
           // attList.add(obj);
           //     }
           // insert attList;
            List<ContentVersion> cv=new List<ContentVersion>();
            cv=[SELECT Id,Title, versionData from ContentVersion LIMIT 4];
             List<ContentVersion> cvList=new List<ContentVersion>();
            for(contentversion each:cv){
            contentVersion cVersion = new contentVersion();
                cversion.PathOnClient = 'TestDocument.pdf';
            cVersion.Title = each.Title;
            cVersion.versionData =each.versionData;
            cvList.add(cVersion);
                }
    insert cvList; 
            set<Id> idSet=new Set<Id>();
             for(ContentVersion each:cvList){
                 idSet.add(each.Id);
             }
            List<ContentVersion> CdList=new List<ContentVersion>();
            CdList=[SELECT Id,ContentDocumentId FROM ContentVersion WHERE Id in:idSet LIMIT 50000];
            List<ContentDocumentLink> newCdList=new List<ContentDocumentLink>();
            for(ContentVersion each:CdList){
                ContentDocumentLink cdl = New ContentDocumentLink();
              cdl.LinkedEntityId = emailMessage.Id;
              cdl.ContentDocumentId = each.ContentDocumentId;
                newCdList.add(cdl);
            }
            insert newCdList;

            system.debug('emailMessage:'+emailMessage);
        }catch(exception e){
            system.debug('Error: '+e.getMessage());
        }
    }

}