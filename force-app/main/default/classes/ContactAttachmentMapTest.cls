@isTest
public class ContactAttachmentMapTest {
    @isTest public static void TestOperation(){
        Contact con=new Contact();
        con.LastName='akm';
        insert con;
        
        Attachment attach=new Attachment();   	
    	attach.Name='Unit Test Attachment';
    	Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
    	attach.body=bodyBlob;
        attach.parentId=con.id;
        insert attach;
        
        Attachment attachm=new Attachment();   	
    	attachm.Name='Unit Test Attachment1';
    	Blob bodyBlob1=Blob.valueOf('Unit Test Attachment Body1');
    	attachm.body=bodyBlob1;
        attachm.parentId=con.id;
        insert attachm;
        
        test.startTest();
        ContactAttachmentMap.MappingOperation();
        test.stopTest();
        
        
    }

}