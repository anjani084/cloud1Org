public class TranslateResonseParser {
    public list<string> results;
    public list<meta> metaList;
    public class Timing_Z {
		public Double provider;
	}
    public class meta{
        public List<string> detected_source_language;
        public size_info sizeInfoList;
        public timing timingList;
        public string client_key_label;
    }
    public class size_info{
            public integer provider_symbols;
            public integer symbols;
        }
    public class timing{
            public Double total;
            public Double providers;
        }
    public service serviceList;
    public class service{
        public provider providerList;
    }
    public class provider{
            public string id;
            public string name;
            public timing timingList;
    }
    public static string parse(String json) {
		TranslateResonseParser resp=(TranslateResonseParser) System.JSON.deserialize(json, TranslateResonseParser.class);
        system.debug(resp.results[0]);
        return resp.results[0];
	}
}