@restresource(urlmapping='/firstrest/')
Global class FirstRest {
    
    
    @httpget
    global static string gettest(){
        string objname;
        id i;
        
        restrequest req=restcontext.request;
        restresponse res=restcontext.response;
        objname=req.headers.get('Objectname');
        i=req.headers.get('id');
        string qr= 'select name from '+objname+' where ID = :i ' +'Limit 1';
        
        sobject s=database.query(qr);
        string jsonresp='{"Name":"'+s.get('Name')+'"}';
        return jsonresp;
    }

    @httppost
    global static string test(){
        
        string fname,lname,comp;
        string fieldname,fieldvalue;
        
        restrequest req=restcontext.request;
        
        restresponse res=restcontext.response;
        
        string JSONBody=req.requestbody.tostring();
        
        JsonParser parser= json.createParser(JSONBody);
        
        while(parser.nextToken() != null){
            if(parser.getCurrentToken()!=JSONtoken.END_OBJECT){
                fieldname=parser.getCurrentName();
                fieldvalue=parser.getText();
                if(fieldname=='firstname'){
                    fname=fieldvalue;
                }
                else if(fieldname=='lastname'){
                    lname=fieldvalue;
                }
                else if(fieldname=='company'){
                    comp=fieldvalue;
                }
                
            }
        }
        lead l=new lead(firstname=fname,lastname=lname,company=comp);
        insert l;
        return l.id;
        
    }
}