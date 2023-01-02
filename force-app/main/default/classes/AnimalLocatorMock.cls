@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('contentType', 'application/json');
        response.setBody('{"animal":{"id":1,"name":"mouse","eats":"plants","says":"bellows"}}');
        response.setStatusCode(200);
        return response;
        
    }

}