public with sharing class SmallDiscount implements IDiscount{
    public decimal calculateDiscount(Decimal oppAmount){
        return oppAmount-(oppAmount*.25);
    }

}