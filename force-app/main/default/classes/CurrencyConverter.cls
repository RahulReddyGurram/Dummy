public class CurrencyConverter {

    public static decimal USDTOINR(decimal usd){
        decimal inr=0.0;
        http h=new http();
        httprequest req=new httprequest();
        
        req.setEndpoint('https://free.currconv.com/api/v7/convert?q=USD_INR&apiKey=690bfef58241570ab027');
        req.setMethod('GET');
        
        httpresponse res = h.send(req);
        
        map<string,object> jsonbody= (map<string,object>)json.deserializeUntyped(res.getBody());
        system.debug(jsonbody);
        map<string,object> mmap = (map<string,object>)jsonbody.get('results');
        map<string,object> mmap1 = (map<string,object>)mmap.get('USD_INR');
        decimal val= (decimal)mmap1.get('val');
        inr=val*usd;
        
        return inr;
    }
}