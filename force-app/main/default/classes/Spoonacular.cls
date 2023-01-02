public class Spoonacular {
        private static final string SpoonacularCons='https://api.spoonacular.com' ;
        private static final string apiKey='96713a55cee940b2a9cf1270ce7e84b3';
    @auraenabled
    public static string getRandomReceipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SpoonacularCons+'/recipes/random?apiKey='+apiKey);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response status code'+response.getStatusCode());
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
        return response.getbody();
        }else{
        return 'error';
        }
        
    }
    @auraenabled (cacheable=true)
    public static string getReceipe(string receipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SpoonacularCons+'/recipes/'+receipeId+'/information?apiKey='+apiKey);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response status code'+response.getStatusCode());
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
             return response.getbody();
        }  else{
        return 'error';
        }
    }
    @auraenabled (cacheable=true)
    public static string getReceipeByIngredient(string ingredient){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SpoonacularCons+'/recipes/findByIngredients?apiKey='+apiKey+'&ingredients='+ingredient);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response status code'+response.getStatusCode());
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
        return response.getbody();
        } 
        else{
            return 'error';
        }
    }
}