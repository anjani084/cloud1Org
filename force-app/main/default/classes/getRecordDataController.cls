public with sharing class getRecordDataController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
    return [SELECT Id, Name,(SELECT Id,Name FROM Opportunities),(SELECT Id,Name FROM Contacts) FROM Account];
    }
}