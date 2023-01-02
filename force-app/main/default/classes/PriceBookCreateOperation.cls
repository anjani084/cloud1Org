public class PriceBookCreateOperation {
    public static void PricebookCreation(){
        try{
            Pricebook2 customPb=new Pricebook2(name='2feb Pricebook',isActive=true);
            insert customPb;
            List<Product2> prodList=new List<Product2>();
            
            for(integer i=0;i<10;i++){
                Product2 pro=new product2(name='2 feb'+string.valueOF(i));
                prodList.add(pro);
            }
            insert prodList;
            // List to add product in pricebook
            List<Pricebookentry>pbList=new List<Pricebookentry>();
            List<Pricebookentry>spbList=new List<Pricebookentry>();
            //Activate standard price from pricebook
            pricebook2 sPricebook=new Pricebook2();
            sPricebook=[SELECT Id FROM pricebook2 WHERE isstandard=True];
            
            for (product2 pr:prodList){
                Pricebookentry aBC=new Pricebookentry(Pricebook2id=CustomPb.id,isActive=True, UnitPrice=2,product2id=pr.id);
                pbList.add(aBC);
                PricebookEntry sABC=new PricebookEntry(PriceBook2Id=sPricebook.Id, Product2Id=pr.Id, UnitPrice=2);
                sPbList.add(sABC);
            }
            if(sPbList!=null && sPbList.size()>0){
                insert spbList;
            }
            if(pbList!=null && pbList.size()>0){
            insert pbList;
            }
            system.debug('Code Success');
        }
        Catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line '+e.getLineNumber());
        }
    }

}