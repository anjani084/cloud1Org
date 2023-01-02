@isTest
public class PricebookcreateopTest
{
    @isTest public static void testOperation(){
        Pricebook2 customPb=new Pricebook2(name='2 Pricebook',isActive=true);
            insert customPb;
            List<Product2> prodList=new List<Product2>();
            
            for(integer i=0;i<10;i++){
                Product2 pro=new product2(name='2 eb'+string.valueOF(i));
                prodList.add(pro);
            }
            insert prodList;
          
        test.startTest();
        PriceBookCreateOperation.PricebookCreation();
        ProductCreation.productOperation();
        test.stopTest();
           
    } 

}