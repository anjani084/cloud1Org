public class FetchFavouriteSong {
    public static void FetchOperation(){
        try{
            List<Contact> conList=new List<Contact>();
            conList=[SELECT Id,Name FROM Contact LIMIT 50000];
            List<Song__c> SongList=new List<Song__c>();
            
            Set<Id> setId=new Set<Id>();
            if(conList.size()>0){
            for(Contact each:conList){
                setId.add(each.Id);
            }
            }
            SongList=[SELECT Id, Name, Favourite__c, Contact__r.Id FROM Song__c WHERE Contact__r.Id in:setId ORDER BY Favourite__c,Name DESC LIMIT 50000];
            if(SongList.size()>0){
                for(song__c each:songList){
                    if(each.Favourite__c==True){
                        system.debug('Favourite song: '+each.Name);
                    }else{
                        system.debug('Others song: '+each.Name);
                    }
                }
            }
            
        }catch(Exception e){
            system.debug('Error: '+e.getMessage()+' At Line'+e.getLineNumber());
        }
    }

}