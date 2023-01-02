public class ParkLocator {
    public static List<String> country(String country){
        Parkservice.ParksImplPort prkSvc=new Parkservice.ParksImplPort();
        return prkSvc.byCountry(country);
    }

}