public class GmailApiNamedCredential {

public pagereference sendEmail(){
    try{
        List<ContentVersion> conVer=new List<ContentVersion>();

        conVer=[Select id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where FileType='PNG'];

     String mimeBody ='';

     String nl = '\n';

     String boundary = '__ctrlq_dot_org__';   

     mimeBody += 'MIME-Version: 1.0\n';

     mimeBody += 'To: example@gmail.com\n';

     mimeBody += 'cc: example1@gmail.com\n';

     mimeBody += 'bcc: example2@gmail.com\n';

     mimeBody += 'Subject: Email_Testing \n';

     mimeBody += 'Hello Testing\n';

     mimeBody += 'Content-Type: multipart/mixed; boundary='+boundary+'\n';

     mimeBody += '–'+boundary+'\n';

     mimeBody += 'Content-Type: text/plain; charset=UTF-8\n';

     mimeBody += 'Content-Transfer-Encoding: base64\n';

     mimeBody += EncodingUtil.base64Encode(blob.valueOf('Testinggg'))+'\n\n';

     mimeBody += '–'+boundary+'\n';

     mimeBody += 'Content-Type: text/html; charset=UTF-8\n';

     mimeBody += 'Content-Transfer-Encoding: base64\n\n';

     mimeBody += EncodingUtil.base64Encode(blob.valueOf('Testinggg'))+'\n\n';

     mimeBody += '–'+boundary+'\n';

        for(ContentVersion cv:conVer){

     mimeBody += 'Content-Type:image/png'+';name='+cv.Title+'\n';

     mimeBody += 'Content-Disposition: attachment; filename="'+cv.PathOnClient+'"\n';

     mimeBody += 'Content-Transfer-Encoding: base64\n\n';

     mimeBody += Encodingutil.base64Encode(cv.VersionData)+'\n\n';

     }

     mimeBody += '–'+boundary+'–';

     Http http = new Http();

     HttpRequest req = new HttpRequest();  

    req.setEndpoint('callout:Gmail_API/upload/gmail/v1/users/{userId}/messages/send?uploadType=media');

//(Gmail_API)API Name of Name credential

        req.setHeader('Authorization', 'Bearer ');

    req.setHeader('Content-Type', 'message/rfc822');

        req.setBody('{"raw":"'+ mimeBody +'"}');

        req.setMethod('POST');

        req.setTimeout(60 * 1000);

        system.debug('req——>>'+req);

     HttpResponse response = http.send(req);

        system.debug('response——>>'+response.getBody());

        System.debug(response);

     if (response.getStatusCode() != 201) {

            System.debug('The status code returned was not expected: ' +

                         response.getStatusCode() + ' ' + response.getStatus());  

     } else {

            System.debug(response.getBody());

     }  

     return null;
                     }
                    catch(exception e){
                        system.debug('error>>'+e.getMessage()+' at line:>>'+e.getLineNumber());
                        return null;
                    }

}
                    

}