public class FillAutomaticaly {
    public Contact conName{Get;Set;}
    public string result{get;set;}
    public FillAutomaticaly(){
        this.conName = new Contact();
        result = '';
    }
    
    public void automaticallyfillaccount(){
        System.debug('running value getter');
        List<Contact> ConList=new List<Contact>();
        this.result = 'sasa';
        String valueFormatter = '\'%'+conName.FirstName+'%\'';
        System.debug('running value getter'+valueFormatter);
        
        conList=[SELECT Id,LastName,Account.Name FROM Contact WHERE AccountId != null AND LastName =:conName.FirstName LIMIT 1];
        System.debug('running value getter'+conList);
        for(Contact each:conList){
            this.result=each.Account.name;
            System.debug('running value getter'+result);
        }
    }

}