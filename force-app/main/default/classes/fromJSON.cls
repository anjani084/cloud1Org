public class fromJSON{
	public cls_results[] results;
	public cls_meta meta;
	public cls_service service;
	class cls_0 {
		public String language;	//en
		public Integer confidence;	//1
	}
	class cls_results {
		public cls_0 okay;
	}
	class cls_meta {
		public cls_size_info size_info;
		public cls_timing timing;
		public String client_key_label;	//production
	}
	class cls_size_info {
		public Integer provider_symbols;	//5
		public Integer symbols;	//5
	}
	class cls_timing {
		public Double provider;	//0.263316
	}
	class cls_service {
		public cls_provider provider;
	}
	class cls_provider {
		public String id;	//ai.text.detect-language.microsoft.text_analytics_api.2-1
		public String name;	//Microsoft Text Analytics API
		public cls_timing timing;
	}
	public static fromJSON parse(String json){
		return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
	}
}