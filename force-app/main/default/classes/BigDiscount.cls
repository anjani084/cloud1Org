public with sharing class BigDiscount implements IDiscount{
    public Decimal calculateDiscount(Decimal oppAmount){
        return oppAmount-(oppAmount*.10);
    }

}