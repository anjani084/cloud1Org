public class ProductHavingA {
    public static void DescriptionLikeA(){
        try{
            List<Product2> prodList=new List<Product2>();
            prodList=[SELECT Name,Description FROM product2 where Description like '%a%'];
            if(prodList.size()>0){
            for(product2 prod:ProdList){
                string str=prod.Name;
                system.debug('Product name: '+str);
            }
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' at Line: '+e.getLineNumber());
        }
    }

}