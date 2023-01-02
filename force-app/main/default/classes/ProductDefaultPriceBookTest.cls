@isTest
public class ProductDefaultPriceBookTest {
    @isTest public static void TestOperation(){
        List<Product2> prodList=new List<Product2>();
            for(integer i=0;i<10;i++){
                Product2 pro=new product2();
                pro.Name='Prod'+i;
                pro.Description=i+'Description'+i;
                pro.Family='None';
                prodList.add(pro);
            }
        insert prodList;
          PriceBook2 priceList=new Pricebook2();
        Pricebook2 standardPB = [select id from Pricebook2 where isStandard=true];

        priceList.name='what';
        priceList.IsActive=true;
        insert pricelist;
        List<PricebookEntry> standardPBE = new List<PricebookEntry>();
    
         List<PricebookEntry> pbList=new List<PricebookEntry>();
            
            for(Product2 each:prodList){
                PricebookEntry temp=new PricebookEntry();
                temp.Pricebook2Id=priceList.Id;
                temp.UnitPrice=1;
                temp.IsActive=True;
                temp.Product2Id=each.Id;
                standardPBE.add(temp);
                pbList.add(temp);}
            insert standardPBE;
            insert pbList;
        test.startTest();
        ProductDefaultPricebook.PricebookUpdate(prodList);
        test.stopTest();
    }
    }