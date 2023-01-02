public class CaseRecordCreation {
    public static void Casecreation(){
        try{
            List<Account> accountList=new List<Account>();
            List<Contact> contactList=new List<Contact>();
            List<Case> caseList=new List<Case>();
            //Data store to the account Object
            for(Integer i=0;i<10;i++){
                Account addRecord = new Account();
                addRecord.Name='anjani'+i;
                accountList.add(addRecord);
            }
            if(accountList!=null && accountList.size()>0){
            insert accountList;
            }
            // Data store to the Contact Object
            for(integer i=0;i<10;i++){
                Contact addContact=new Contact();
                addContact.LastName='new one'+i;
                contactList.add(addContact);
            }
            if (contactList!=null && contactList.size()>0){
            insert contactList;
            }
            for(Integer i=0;i<5;i++){
                Case addCase= new Case();
                addCase.AccountId=accountList[i].Id;
                addCase.ContactId=contactList[i].Id;
                addCase.Description='3 february';
                addCase.Status='Working';
                addCase.Origin='Phone';
                caseList.add(addCase);
            }
            if(caseList!=null && caseList.size()>0){
            insert caseList;
            }
        }catch(exception e){
            system.debug('Error: '+e.getMessage()+' At Line: '+e.getLineNumber());
        }
    }

}