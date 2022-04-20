public class Fact {

    public static string USDTOINR(){
        http h=new http();
        httprequest req=new httprequest();
        
        req.setEndpoint('http://api.fungenerators.com/fact/random?category=Countries&subcategory=USA&api_key=X-FunGenerators-Api-Secret');
        req.setMethod('GET');
        req.setHeader('X-FunGenerators-Api-Secret','');
        httpresponse res = h.send(req);
        
        map<string,object> jsonbody= (map<string,object>)json.deserializeUntyped(res.getBody());
        system.debug(jsonbody);
       // map<string,object> mmap = (map<string,object>)jsonbody.get('contents');
       // string val= (string) mmap.get('fact');
        string val;
        return val;
        
    }
}