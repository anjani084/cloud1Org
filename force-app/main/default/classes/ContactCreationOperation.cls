public class ContactCreationOperation {
    public static void insertContact(){
        try{
            List<Contact> contactList = new List<Contact>();
            for (Integer i=0;i<10;i++){
                contact newContact=new Contact();
                newContact.FirstName='anjani'+i;
                newContact.LastName='mishra'+i;
                newContact.Department='abc'+i;
                newContact.AssistantPhone=i+'12345678';
                newContact.Email='anjanimishra'+i+'@mail.com';
                contactList.add(newContact);
            }
            insert contactList;            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+ 'at line: '+e.getLineNumber());
        }
    }

}