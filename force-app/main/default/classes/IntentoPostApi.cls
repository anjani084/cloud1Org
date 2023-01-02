public class IntentoPostApi {
    @auraenabled
    public static string PostAndTranslate(String str){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.inten.to/ai/text/translate?apikey=kBnnu16dsIoXSfiJOXqBcNNu2OhqSO3QJsiP_QdJ6pA');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"context": {"text":"'+str+'","to": "ja"},"service": {"provider": "ai.text.translate.microsoft.translator_text_api.3-0"}}');
        HttpResponse response = http.send(request);
        system.debug('response status code'+response.getStatusCode());
        if(response.getStatusCode() == 200) {
            String desResult=TranslateResonseParser.parse(response.getbody());
            system.debug('desResult: '+desResult);
        return desResult;
        }else{
        return 'error';
        }
    }
}