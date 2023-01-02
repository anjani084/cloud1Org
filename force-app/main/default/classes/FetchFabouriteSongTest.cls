@isTest
public class FetchFabouriteSongTest {
    @istest public static void TestOperation(){
        Contact con=new Contact();
        con.Lastname='akm';
        insert con;
        
        song__c song=new song__c();
        song.name='okay';
        song.Favourite__c=True;
        song.Contact__c=con.Id;
        insert song;
        
        test.startTest();
        FetchFavouriteSong.FetchOperation();
        test.stopTest();
    }

}