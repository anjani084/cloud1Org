@isTest
public class ParkLocatorTest {
    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        string country='United State';
        system.assertEquals(new List<String>{'yosemite','crater Lake','sequioe'}, ParkLocator.country(country));
    }

}