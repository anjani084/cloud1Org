public class SalesforceConnect {
     public static string getCasesFromSalesforceOrgB(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://resilient-moose-1yig4j-dev-ed.my.salesforce.com/services/apexrest/Cases');
        request.setMethod('GET');
         request.setHeader('Authorization', 'Bearer !AQYAQCeWVh7zvp3QOEudV4_AFkUQm3GS_YOPgLjnNPlcOc680RxXIl0gfGBbkfca3DdY13Ut2SzQnIhE761y5cnZB1GohdQ1');
        HttpResponse response = http.send(request);
        system.debug('response status code'+response.getStatusCode());
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
             system.debug('response body: '+response.getBody());
        return response.getbody();
           
        }else{
        return 'error';
        }
        
    }

}