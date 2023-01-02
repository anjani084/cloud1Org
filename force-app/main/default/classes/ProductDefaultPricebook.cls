public class ProductDefaultPricebook {
    public static void PricebookUpdate(List<Product2> prodList){
        try{
        List<PricebookEntry> pbList=new List<PricebookEntry>();
        PriceBook2 priceList=[SELECT Id FROM Pricebook2 WHERE IsStandard=true LIMIT 50000];
            
            for(Product2 each:prodList){
                PricebookEntry temp=new PricebookEntry();
                temp.Pricebook2Id=priceList.Id;
                temp.UnitPrice=1;
                temp.Product2Id=each.Id;
                pbList.add(temp);
            }
            Insert PbList;
             
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
        
        }

}