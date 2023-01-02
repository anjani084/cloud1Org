public class TextBoxSearchTableClass {
    public string str{get;set;}
    public List<Account> acclist{get;set;}
    public void getInfofetch(){
        accList=new List<Account>();
       accList=[SELECT Name,Phone,BillingPostalCode,BillingCity from account WHERE Name=:str LIMIT 10];
        
    }

}