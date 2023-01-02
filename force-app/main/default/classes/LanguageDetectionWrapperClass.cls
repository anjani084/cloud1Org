public class LanguageDetectionWrapperClass {
     public meta meta{get;set;}
		public service service{get;set;}
		public list<list<LanguageDetectionClass.ResultLanguage>> results{get;set;}
	public class timing{
		public Decimal providers{get;set;}
		public Decimal total{get;set;}
		public Decimal provider{get;set;}
	}
	public class size_info{
		public Integer symbols{get;set;}
		public Integer provider_symbols{get;set;}
	}
	public class service{
		public provider provider{get;set;}
	}
	public class provider{
		public String providerId{get;set;}
		public timing timing{get;set;}
		public String name{get;set;}
	}
	public class meta{
		public String client_key_label{get;set;}
		public timing timing{get;set;}
		public size_info size_info{get;set;}
	}
    
     public static void parse(String jsonBody) {
         String replaceReqBody = jsonBody.replace('"id"', '"providerId"');
         System.debug('replaceReqBody>>'+replaceReqBody);
		LanguageDetectionWrapperClass resp=(LanguageDetectionWrapperClass) JSON.deserialize(replaceReqBody, LanguageDetectionWrapperClass.class);
        system.debug('resp: '+resp.results[0][0].language);
        
	}
}