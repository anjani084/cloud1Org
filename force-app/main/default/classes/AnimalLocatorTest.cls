@isTest
public class AnimalLocatorTest {
    @isTest
    static void animalLocatorTest1(){
        Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        String actual=AnimalLocator.getAnimalNameById(3);
        String expected='mouse';
        system.assertEquals(actual, expected);
    }

}