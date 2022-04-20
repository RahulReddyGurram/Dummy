trigger PhoneSchool on School__c (before insert) {
if(trigger.isbefore && trigger.isinsert)
{
    list<school__c> schList = trigger.new;
    for(school__c ObjSch: schList){
        if(ObjSch.phone__c==null && ObjSch.fax__c!=null)
        {
            string i=ObjSch.fax__c;
            integer j=i.length();
            if(j==10)
            {
           		ObjSch.Phone__c = ObjSch.fax__c;
            }
        }
    }
}
}