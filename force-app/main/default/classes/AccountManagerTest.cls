@isTest
private class AccountManagerTest {
    @isTest
    static void testGetAccount(){
        Account a=new Account(Name='TestAccount');
        insert a;
        Contact c=new Contact(FirstName='Test',LastName='Class',AccountId=a.Id);
        insert c;
         RestRequest request = new RestRequest();
        request.requestURI='https://yourInstance.salesforce.com/services/apexrest//Accounts/'+a.Id+'/contacts';
        request.httpMethod='GET';
        RestContext.request=request;
        test.startTest();
        AccountManager.getAccount();
        test.stopTest();
        
    }

}