@isTest
public class DeleteoppLineItemTest {
    @isTest public static void TestOperation(){
        Contact con=new Contact();
        con.LastName='akam';
        insert con;
        

        Opportunity opp=new opportunity();
        opp.Name='akms';
        opp.CloseDate=system.today();
        opp.StageName='Qualification';
        opp.Highest_Price__c=4;
        opp.Lowest_Price__c=2;
        insert opp;
        List<Opportunity> oppList=new List<Opportunity>();
        oppList.add(opp);
        
         Pricebook2 pb22 = new Pricebook2(Name='testDIE');
         insert pb22;

         Product2 pro2 = new Product2(Name='BXCD',isActive=true);
         insert pro2;
        product2 pro3=new Product2(Name='AXCD',isActive=True);
        insert pro3;
           PricebookEntry pbe2 =new PricebookEntry(unitprice=0.01,Product2Id=pro2.Id,
                                             Pricebook2Id=Test.getStandardPricebookId(),
                                             isActive=true,UseStandardPrice = false);
        
           insert pbe2;
        PricebookEntry pbe3 =new PricebookEntry(unitprice=0.01,Product2Id=pro3.Id,
                                             Pricebook2Id=Test.getStandardPricebookId(),
                                             isActive=true,UseStandardPrice = false);
        insert pbe3;

            OpportunityLineItem OPplineitem2 = new OpportunityLineItem 
                                             (Quantity=2, OpportunityId=opp.Id,UnitPrice=0.01,PriceBookEntryId=pbe2.Id);
            insert OPplineitem2;
        OpportunityContactRole ocr=new opportunitycontactRole();
        ocr.ContactId=con.Id;
        ocr.OpportunityId=opp.id;
        
        insert ocr;
        
        test.startTest();
        DeleteOppLineItem.DeletionOperation();
        NoOfProductSoldTrigger.IncreamentOperation(oppList);
        OddNumberLineItems.FetchOpportunityOperation();
        OpportunityPriceField.PriceFillOperation();
        test.stopTest();
        
        
    }

}