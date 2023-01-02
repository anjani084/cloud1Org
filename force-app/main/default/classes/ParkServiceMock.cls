@isTest
global class ParkServiceMock implements WebServiceMock{
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, object> response,
            String endpoint,
            string soapAction,
            string requestName,
            string responseNS,
            string responseName,
            string responseType)
    {
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        response_x.return_x=new List<String>{'yosemite','crater Lake','sequioe'};
            response.put('response_x', response_x);
    }
            
        
        
}