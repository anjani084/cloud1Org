({
   clickHandler : function(component, event, helper) { 
       var items=[];
       //var value = 0;
       var sumup=component.get('v.imaginarySum');
       let sum =0;
       if(event.target.name == 'div1'){
           console.log('Clicked on div1');
           let value1 = 1;
           sumup+=value1;
       }
        if(event.target.name == 'div2'){
           console.log('Clicked on div2');
           let value2 = 2;
            sumup+=value2;
       }
        if(event.target.name == 'div3'){
           console.log('Clicked on div3');
           let value3 = 3;
            sumup+=value3;
       }
       component.set("v.imaginarySum",sumup);
       sum+=sumup;
       console.log('sum: '+sum);
       
     
       
}, 
      itemsChange: function(cmp, evt) {
        console.log("numItems has changed");
        console.log("old value: " + evt.getParam("oldValue"));
        console.log("current value: " + evt.getParam("value"));
    },
    doInit: function(cmp) {
        var k=0;
        cmp.set("v.imaginarySum", k);
    }
})