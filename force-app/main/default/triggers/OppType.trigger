trigger OppType on Opportunity (before insert,after insert) {
   
    if(trigger.isbefore && trigger.isinsert){
        
    	list<opportunity> OppList = trigger.new;
    	for(opportunity ObjOpp: OppList){
            if(ObjOpp.type=='new customer' && ObjOpp.LeadSource==null){
                ObjOpp.LeadSource='Other';
            }
                
   		 }
    }
}