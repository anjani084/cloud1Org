({
    // To prepopulate the seleted value pill if value attribute is filled
    doInit : function( component, event, helper ) {
        $A.util.toggleClass(component.find('resultsDiv'), 'slds-is-open');
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        $A.util.toggleClass(component.find('comboboxId'), 'slds-is-open');
        
        var objectList = component.get('v.objectList');
        objectList.push( {label:'Contact', APIName:'contact', fieldName: 'name', iconName: 'standard:contact'} );
        objectList.push( {label:'Lead', APIName:'lead', fieldName: 'name', iconName: 'standard:lead'} );
        component.set('v.objectList', objectList);
        //console.log('object>>>>>'+objectList);
        component.set('v.selectedObject', component.get('v.objectList')[0]);
        
    },
    onclickMethod : function (component, event, helper){
        console.log('onclick is working');
        helper.onclickHelper(component, event, helper);
    },
    showObjects : function( component, event, helper ) {
        //console.log('Lead and Contact On click called')
        component.set('v.showObjectList', true);
        $A.util.toggleClass(component.find('objectDataDiv'), 'slds-is-open');
        $A.util.toggleClass(component.find('comboboxId'), 'slds-is-open');
    },
    
    selectObject : function( component, event, helper ) {
        component.set('v.showObjectList', false);
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var objectList = component.get('v.objectList');
            //console.log('object>>>>>'+objectList)
            var index = objectList.findIndex(x => x.APIName === event.currentTarget.id)
            if(index != -1)
                var selectedObject = objectList[index];
            component.set('v.selectedObject', selectedObject);
            component.set('v.searchString', '');
        }
    },
    
    // When a keyword is entered in search box
    searchRecords : function( component, event, helper ) {
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        if( !$A.util.isEmpty(component.get('v.searchString')) ) {
            helper.searchRecordsHelper(component, event, helper);
        } 
    },
    getObjectName : function( component, event, helper){
        console.log('On click called');
        component.set('v.showObjectList', true);
        helper.onclickHelper( component, event, helper);
    },
    // When an item is selected
    selectItem : function( component, event, helper ) {
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var recordsList = component.get('v.recordsList');
            var index = recordsList.findIndex(x => x.value === event.currentTarget.id)
            if(index != -1)
                var selectedRecord = recordsList[index];
            component.set('v.selectedRecord', selectedRecord);
            component.set('v.value', selectedRecord.value);
            var res = component.get('v.value');
            var compEvent = component.getEvent("sampleComponentEventWho");
        compEvent.setParams({
            "whoName" :res 
        });
        compEvent.fire();
 
            $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
            $A.util.toggleClass(component.find('comboboxId'), 'slds-is-open');
        }
    },
    
    // To remove the selected item.
    removeItem : function( component, event, helper ){
        component.set('v.selectedRecord','');
        component.set('v.value','');
        component.set('v.searchString','');
        
    },
    
    // To close the dropdown if clicked outside the dropdown.
    blurRecordList : function( component, event, helper ){
        component.set('v.showObjectList', false);
        $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
        $A.util.toggleClass(component.find('comboboxId'), 'slds-is-open');
        component.set('v.showObjectList', false);
    },
    
    blurObjectList : function( component, event, helper ){
        component.set('v.showObjectList', false);
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        $A.util.toggleClass(component.find('comboboxId'), 'slds-is-open');
        component.set('v.showObjectList', false);
    }
})