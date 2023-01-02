public class Contact100records {
    public static List<Contact> getFetchInfo(){ 
        List<Contact> conList=new List<Contact>();
        conList=[SELECT Id,Name,CreatedDate FROM Contact LIMIT 100];
        return conList;
    }

}