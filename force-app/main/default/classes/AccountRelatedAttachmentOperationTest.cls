@isTest
public class AccountRelatedAttachmentOperationTest {
    @isTest Public static void TestOperation(){
        Account acc=new account();
        acc.name='Akm';
        insert acc;
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<20;i++){
        contact each=new contact();
        each.LastName='bob'+i;
            each.AccountId=acc.Id;
        conList.add(each);}
        
        insert conList;
        
        attachment attach=new Attachment();   	
    	attach.Name='Unit Test Attachment';
    	Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
    	attach.body=bodyBlob;
        attach.parentId=acc.id;
        insert attach;
        
        test.startTest();
        AccountRelatedAttachmentOperation.AccountContactAttachmentOperation();
        test.stopTest();
    }

}