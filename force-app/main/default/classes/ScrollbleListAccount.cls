public class ScrollbleListAccount  {
    public list<Account> accountList{get;set;}
    public ScrollbleListAccount()     {
        accountList = new list<Account>();
        accountList = [SELECT id,name FROM Account LIMIT 20];
    }
}