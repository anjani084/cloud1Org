@isTest
public class productCreationTest {
    @istest public static void TestOperation(){
         Product2 pro=new product2();
                pro.Name='Parod';
                pro.Description='Desacription';
                pro.Family='None';
        insert pro;
        test.startTest();
        ProductCreation.productOperation();
        ProductHavingA.DescriptionLikeA();
        test.stopTest();
        
    }

}