({
	packItem : function(component, event, helper) {
        var a = component.get("v.item",true);
        a.Packed__c = true;
        component.set("v.item",a);
        btnClicked = event.getSource();         // the button
        //var btnMessage = btnClicked.get("v.label"); // the button's label
        //component.set("v.item.Packed__c", true);
        btnClicked.set("v.disabled", true);
		
	}
})