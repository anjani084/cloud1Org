@isTest
public class ScoreContactLookUpTest {
    @isTest public static void TestOperation(){
        Contact con=new Contact();
        con.lastName='akm';
        insert con;
        
        Student__C st=new Student__C();
        st.Highest_Scoring_Subject__c='science';
        st.Lowest_Scoring_Subject__c='Hindi';
        st.Name='yes';
        st.Percentage__c=78;
        st.Total_Marks__c=478;
        insert st;
        
        
        Score__c sc=new score__c();
        sc.Name='whaat';
        sc.Subject__c='Math';
        sc.Marks__c=84;
        sc.Contact__c=con.Id;
        sc.Student__c=st.id;
        insert sc;
        

        test.startTest();
        ScoreContactLookUp.HighestAndLowestPrice();
        StudentsScore.CalculationOperation();
        test.stopTest();
    }

}