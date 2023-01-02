public class NameAscOrderOperation {
    public static void AccountNameOrder(){
        
            list<Account>acc=[SELECT name FROM account ORDER BY name ASC];
            for(Account u:acc){
                system.debug(u.name);
            
        }
    }

}