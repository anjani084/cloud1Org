public class ReverseNumberOperation {
    public static void ReverseOperation(){
        
        try{
            integer num = 789234;
            integer i=0;
            while(num!=0){
                i=i*10+math.mod(num,10);
                num=num/10;
            }
            system.debug(i);
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at line '+e.getLineNumber());
        }
    }

}