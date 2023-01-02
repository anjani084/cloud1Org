@isTest
public class DiscountCalculator_Test {
    @isTest
    static void testStdDiscount(){
        Opportunity opp=new Opportunity();
        opp.Amount=500.00;
        IDiscount big= new BigDiscount();
        DiscountCalculator calculator=new DiscountCalculator(Opp, big);

        Test.startTest();
        Decimal result=calculator.discountOpportunity();
        Test.stopTest();
        system.assertEquals(450.00, result,'It should return a 5% discount');
    }
}