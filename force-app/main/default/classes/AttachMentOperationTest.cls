@isTest
public class AttachMentOperationTest {
    @isTest public static void TestOperation(){
        Account acc=new Account();
        acc.Name='akmq';
        insert acc;
        List<Contact>conList=new List<Contact>();
        for(integer i=0;i<5;i++){
            Contact temp=new Contact();
            temp.LastName='akm'+i;
            temp.AccountId=acc.Id;
            conList.add(temp);
        }
        insert conList;
      ContentVersion contentVersion = new ContentVersion(
          Title          = 'a picture',
          PathOnClient   = 'Pic.jpg',
          VersionData    = Blob.valueOf('Test Content'),
          IsMajorVersion = true);
        insert contentVersion; 
        
List<ContentDocument> documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];

//create ContentDocumentLink  record 
    ContentDocumentLink cdl = New ContentDocumentLink();
        cdl.LinkedEntityId = acc.id;
        cdl.ContentDocumentId = documents[0].Id;
        cdl.shareType = 'V';
        cdl.visibility = 'AllUsers';
        insert cdl;
        Test.startTest();
        AttachmentOperation.CopyAttachment();
        test.stopTest();
    }

}