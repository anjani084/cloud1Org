public class Createaccount {
    public static void createOperation(){
        List<Account> accList=new List<Account>();
        For(integer i=0;i<500;i++){
            account temp=new account();
            temp.Name='AKM'+i;
            accList.add(temp);
        }
        insert accList;
        webchat__ChatTransferEvent__e objStartChat = new webchat__ChatTransferEvent__e(webchat__Token__c= 'abs1234@==');
        EventBus.publish( objStartChat );
        
    }

}