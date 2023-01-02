public class AnimalLocator {
    public static string getAnimalNameById(integer i){
      Http http=new Http();
      HttpRequest request=new HttpRequest();
      request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
      request.setMethod('GET');
      HttpResponse response=http.send(request);


            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> animal = (Map<String, Object>)result.get('animal');
            system.debug('name: '+string.valueOf(animal.get('name')));
            return string.valueOf(animal.get('name'));
        
}


}