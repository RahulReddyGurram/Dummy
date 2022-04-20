trigger OppTrigger on Opportunity (before Update) {
    if(trigger.isbefore && trigger.isupdate){
        
        map<id,opportunity> OppOldMap = trigger.oldmap;
        for(opportunity ObjOpp:trigger.new){
            opportunity ObjOld=OppOldMap.get(ObjOpp.AccountId);
            if(ObjOpp.StageName != ObjOld.StageName){
               if(ObjOpp.stageName=='Closed Won' && ObjOpp.leadsource == null){
                ObjOpp.adderror('lead source is null');
                }
            }
        }
    }	
}