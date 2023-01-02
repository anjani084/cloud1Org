public class parsgetname {
    public static void getname(){
        List<Account> accList=new List<Account>();
        accList=[SELECT Id,Name,createddate FROM Account LIMIT 1];
        system.debug(accList);
    }

}