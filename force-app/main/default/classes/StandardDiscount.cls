public with sharing class StandardDiscount implements IDiscount{
    public Decimal calculateDiscount(Decimal oppAmount){
        return oppAmount-(oppAmount*.05);
    }
}