({
	myAction : function(component, event, helper) {
       
        
        console.log('Calling helper');
        var StageName=component.find('oppId').get('v.value');
        console.log('+++++++++++'+StageName);
        
        var OpportunityObje = component.get("v.OppDetails");
        OpportunityObje.StageName=StageName;
        console.log('...........'+JSON.stringify(OpportunityObje));
        if(OpportunityObje.Name==null){
         var cmpTarget = component.find('nameid');
        console.log(';check'+cmpTarget);
        
       
            console.log('cmpTarget>>>'+cmpTarget);
        $A.util.addClass(cmpTarget,"slds-has-error");
        }
        if(OpportunityObje.CloseDate==null){
        var dateTarget = component.find('dateid');
        console.log(';check'+dateTarget);
       
            console.log('dateTarget>>>'+dateTarget);
        $A.util.addClass(dateTarget,"slds-has-error");
        }else{
            var dateTarget = component.find('dateid');
        console.log(';check'+dateTarget);
       
            console.log('dateTarget>>>'+dateTarget);
        $A.util.removeClass(dateTarget,"slds-has-error");
            
        }
        if(OpportunityObje.StageName==null || OpportunityObje.StageName=='None'){
        var stageTarget = component.find('oppId');
        console.log(';check'+stageTarget);
            console.log('stageTarget>>>'+stageTarget);
        $A.util.addClass(stageTarget,"slds-has-error");
        }else{
            var stageTarget = component.find('oppId');
        console.log(';check'+stageTarget);
            console.log('stageTarget>>>'+stageTarget);
        $A.util.removeClass(stageTarget,"slds-has-error");
            
        }
        
        if((OpportunityObje.Name!=null && OpportunityObje.CloseDate!=null && 
           OpportunityObje.StageName!=null)&& StageName!='None'){
		helper.insertOpportunity(component, event, helper);
        }
        else 
        {  
            var tst = $A.get("e.force:showToast");
            tst.setParams({
                type:"error",
                message:"Please fill the required field."
              
            });
                tst.fire();
        }
	},
    ChangeAction : function(component, event, helper){
        console.log('Controller: ');
        helper.fetchList(component, event, helper);
    },
    thisAction : function(component, event, helper){
        try{
        var contactObje = component.get("v.OppDetails.StageName");
        console.log('<<<<<<clear1>>>>>>>>'+JSON.stringify(contactObje));
         component.set("v.OppDetails.Name",'');
         component.set("v.OppDetails.StageName",'None');
         component.set("v.OppDetails.CloseDate",'');
         component.set("v.OppDetails.AnnualRevenue",'');
         console.log('<<<<<<clear1>>>>>>>>'+JSON.stringify(contactObje));
        }catch(error){
            console.log('ERROR>>>'+error);
        }

    }
})