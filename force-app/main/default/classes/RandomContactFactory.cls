public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(integer n,string j){
        List<Contact> conList=new List<Contact>();
        for(integer i=0;i<n;i++){
            Contact each=new contact();
            each.FirstName='Test '+i;
            each.LastName=j;
            conList.add(each);
        }
        if(conList.size()>0){
            insert conList;
        }
        return conList;
        
    }
}