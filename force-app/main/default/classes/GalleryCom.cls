public with sharing class GalleryCom {
    @AuraEnabled(cacheable=true)
    public static String getEncodedFileContent(String cvId){
        try{
        system.debug('cvId :'+cvId);
           contentVersion cv=[Select versionData from contentVersion where id=:cvId];
            String data=EncodingUtil.base64Encode(cv.versionData);
            System.debug('val :'+cv.versionData);
            return data;
        }
         catch(Exception e){
            System.debug('Error is:'+e.getMessage()+' in line number:'+e.getLineNumber());
            return NULL;
        }
    }
    @AuraEnabled(cacheable=true)
    public static string getVFOrigin() {
      string vfOrigin = '';
    string baseURL = URL.getOrgDomainUrl().toExternalForm(); // Expected Format = https://domain.my.salesforce.com
 
    // Expected Format for DE, Sandbox & Production ORgs = https://domain--c.visualforce.com
    vfOrigin = baseURL.split('.my.')[0] + '--c.' + 'visualforce.com';
 System.debug('vfOrigin'+vfOrigin);
    return vfOrigin;
    }
    @AuraEnabled
    public static  List<ContentVersion> getAllAttachmentForDataTable(String[] documentIds,String recordIds){
        try{
        List<ContentDocumentLink> cdlList=[SELECT Id,ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId =:recordIds];
            Set<Id> documentIdSet=new Set<Id>();
            for(ContentDocumentLink each:cdlList){
                documentIdSet.add(each.ContentDocumentId);
            }
           
           List<contentVersion> cvList=[SELECT Id,FileExtension,Title,ContentSize,fileType,ContentDocumentId,contentUrl FROM ContentVersion WHERE ContentDocumentId In: documentIdSet OR ContentDocumentId In:documentIds];
          System.debug(cvList);
        return cvList;
        }
        catch(Exception e){
            System.debug('Error is:'+e.getMessage()+' in line number:'+e.getLineNumber());
            return null;
        }
    }
    @AuraEnabled 
    public static contentversion getSelectedImage(String ImageId){
        try{ System.debug('documentIds'+ImageId);
           contentversion contentdocuments=[SELECT Id,Title FROM contentversion WHERE contentDocumentId=:ImageId];
             System.debug('contentdocumentList'+contentdocuments);
            return contentdocuments;
        }
        catch(Exception e){
            System.debug('Error is:'+e.getMessage()+' in line number:'+e.getLineNumber());
            return NULL;
        }    
}
}