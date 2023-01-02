public class LanguageDetectionClass {
    @auraenabled
    public static string PostAnddetect(String str){
        try{
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://api.inten.to/ai/text/detect-language?apikey=kBnnu16dsIoXSfiJOXqBcNNu2OhqSO3QJsiP_QdJ6pA');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setBody('{"context": {"text": "'+str+'"},"service": {"provider": "ai.text.detect-language.microsoft.text_analytics_api.2-1"}}');
            HttpResponse response = http.send(request);
            system.debug('response status code'+response.getStatusCode());
            if(response.getStatusCode() == 200) {
                LanguageDetectionWrapperClass.parse(response.getbody());
                system.debug(response.getbody());
                System.debug('Result '+response.getbody());
                return response.getbody();
                
            }else{
                return 'error';
            }
        }catch(exception e){
            system.debug('error at: '+e.getMessage());
            return null;
        }
    }
    public class ResultLanguage {
        public String language;
        public Double confidence;
    }
}