public class ReverseAccountNameOperation {
    public static void ReverseOperation(){
        try{
            List<Account> accList=[SELECT Name FROM account LIMIT 1];
           // List<String> revList=new List<String>();
            if(accList.size()>0){
            for (Account acc: accList){
                String test=acc.Name;
                system.debug(test);
                String revStr=test.reverse();
                system.debug('Reverse string will be: '+revStr);
            }
            }
            
        }
        Catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}