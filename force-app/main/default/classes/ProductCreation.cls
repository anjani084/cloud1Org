public class ProductCreation {
    public static void productOperation(){
      
            List<Product2> prodList=new List<Product2>();
            for(integer i=0;i<10;i++){
                Product2 pro=new product2();
                pro.Name='Prod'+i;
                pro.Description=i+'Description'+i;
                pro.Family='None';
                prodList.add(pro);
            }
        insert prodList;

    }}