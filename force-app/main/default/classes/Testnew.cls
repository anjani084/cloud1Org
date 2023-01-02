public with sharing class Testnew {

public Account acc{get;set;}

public Testnew(ApexPages.StandardController controller) {

acc = new Account();

acc = (Account)controller.getRecord();
}
public pageReference onSave(){
insert acc;
PageReference page = new PageReference('/'+acc.id);
return page;

}
}