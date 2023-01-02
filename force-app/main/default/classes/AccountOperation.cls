public class AccountOperation {
    public static void insertAccount(){
        try{
            List<account> accountList = new List<account>();
            for (Integer i=0;i<20;i++){
                account acc=new account();
                acc.BillingCity='abcdf'+i;
                acc.BillingPostalCode='123we'+i;
                acc.AccountNumber='abc12345'+i;
                acc.Name=i+'anja'+i;
                acc.BillingStreet='bongston'+i;
                accountList.add(acc);
            }
            if(accountList!=null && accountList.size()>0){
            insert accountList;
            }
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+ 'at line: '+e.getLineNumber());
        }
    }

}