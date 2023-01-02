({
    // To prepopulate the seleted value pill if value attribute is filled
    doInit : function( component, event, helper ) {
        $A.util.toggleClass(component.find('resultsDiv'), 'slds-is-open');
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        
        var objectList = component.get('v.objectList');
        objectList.push( {label:'Accounts', APIName:'Account', fieldName: 'Name', iconName: 'standard:account'} );
        objectList.push( {label:'Assets', APIName:'Asset', fieldName: 'Name', iconName: 'standard:queue'} );
        objectList.push( {label:'Campaigns', APIName:'Campaign', fieldName: 'Name', iconName: 'standard:campaign'} );
        objectList.push( {label:'Cases', APIName:'Case', fieldName: 'CaseNumber', iconName: 'standard:case'} );
        objectList.push( {label:'Change Requests', APIName:'ChangeRequest', fieldName: 'ChangeRequestNumber', iconName: 'standard:change_request'} );
        objectList.push( {label:'Entitlements', APIName:'Entitlement', fieldName: 'Name', iconName: 'standard:entitlement'} );
        objectList.push( {label:'Opportunities', APIName:'Opportunity', fieldName: 'Name', iconName: 'standard:opportunity'} );
        objectList.push( {label:'Orders', APIName:'Order', fieldName: 'OrderNumber', iconName: 'standard:orders'} );
        objectList.push( {label:'Contracts', APIName:'Contract', fieldName: 'ContractNumber', iconName: 'standard:contract'} );
        objectList.push( {label:'Products', APIName:'Product2', fieldName: 'Name', iconName: 'standard:product'} );
        objectList.push( {label:'Contacts', APIName:'Contact', fieldName: 'Name', iconName: 'standard:contact'} );

        component.set('v.objectList', objectList);
        component.set('v.selectedObject', component.get('v.objectList')[0]);
    },
    onclickMethod : function (component, event, helper){
        //console.log('onclick is working');
        helper.onclickHelper(component, event, helper);
    },
    
    showObjects : function( component, event, helper ) {
        component.set('v.showObjectList', true);
        $A.util.toggleClass(component.find('objectDataDiv'), 'slds-is-open');
    },
    
    selectObject : function( component, event, helper ) {
        component.set('v.showObjectList', false);
        component.set('v.message','');
        if(!$A.util.isEmpty(event.currentTarget.id)) {
            var objectList = component.get('v.objectList');
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
        } else {
            $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
        }
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
            
            
            
            var compEvent = component.getEvent("sampleComponentEvent");
        compEvent.setParams({
            "whatname" : res
        });
            console.log('child event fired successfully');
        compEvent.fire();
            
        }
    },
    
    removeItem : function( component, event, helper ){
        component.set('v.selectedRecord','');
        component.set('v.value','');
        component.set('v.searchString','');
        setTimeout( function() {
            component.find( 'inputLookup' ).focus();
        }, 250);
    },
    
    // To close the dropdown if clicked outside the dropdown.
    blurRecordList : function( component, event, helper ){
        $A.util.removeClass(component.find('resultsDiv'), 'slds-is-open');
    },
    
    blurObjectList : function( component, event, helper ){
        $A.util.removeClass(component.find('objectDataDiv'), 'slds-is-open');
        component.set('v.showObjectList', false);
    }
})