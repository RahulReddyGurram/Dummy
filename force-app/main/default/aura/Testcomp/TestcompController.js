({
	inter : function(component, event, helper) {        
	},
    handleClick : function(component, event, helper) {
		var a=component.get("v.amount");
        var r=component.get("v.rate");
        var y=component.get("v.years");
        var i=((a*r*y)/100);
        component.set("v.interest",i);
}
})