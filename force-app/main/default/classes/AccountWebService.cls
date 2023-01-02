@RestResource(urlMapping='/AccountTest/*')
global with sharing class AccountWebService{
    @HttpGet
    global static List<Account> getAccount() {
        List<Account> result =new List<Account>();
        result =  [SELECT Id,Name,Phone FROM Account LIMIT 100];
        return result;
    }
    @HttpPost
    global static ID createAccount(String Name, String Phone) {
        Account acc = new Account(
            Name=Name,
        Phone=Phone);
        insert acc;
        return acc.Id;
    }   
    @HttpDelete
    global static void deleteAccount() {
        RestRequest request = RestContext.request;
        String AccountId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Account thisaccount = [SELECT Id FROM Account WHERE Id = :AccountId];
        delete thisaccount;
    }     
    @HttpPatch
    global static ID updateAccountFields() {
        RestRequest request = RestContext.request;
        String AccountId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Account thisaccount = [SELECT Id FROM Account WHERE Id = :AccountId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            thisaccount.put(fieldName, params.get(fieldName));
        }
        update thisaccount;
        return thisaccount.Id;
    }    
}