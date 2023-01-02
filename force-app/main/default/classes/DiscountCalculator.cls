public with sharing class DiscountCalculator {
    private opportunity opp;
    IDiscount discount;

    public DiscountCalculator(Opportunity opp) {
        this.opp=opp;
        this.discount=DiscountFactory.getDiscount(opp.Amount);
    }
    public Decimal discountOpportunity(){
        Decimal result=discount.calculateDiscount(this.opp.Amount);
        return result;
    }
}