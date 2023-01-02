public class AddingTwoBinaryNum {
    public static Integer SumOperation(string value1, String value2){
        try{
            Integer res1;
            Integer res2;
            If((value1 !=null && value1.containsOnly('01')) && (value2 !=null && value2.containsOnly('01'))){
                res1=0;
                res2=0;
                for(String str1: value1.split('')){
                    res1=(res1 << 1) | (str1 =='1'?1: 0);
                }
                for(String str2: value2.split('')){
                    res2=(res2 << 1)|(str2 =='1'?1: 0);
                }
            }
            system.debug(res1+res2);
            return (res1+res2);
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
            return 0;
        }
        
    }

}