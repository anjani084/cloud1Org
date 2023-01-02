public with sharing class DiscountFactory {
    public static IDiscount getDiscount(Decimal amount) {
        if(amount>=1000){
            return new BigDiscount();

        }else if(amount>=500){
            return new standardDiscount();
        }else{
            return new SmallDiscount();
        }

    }
}