public class AccOppConCreate {
    
    public string accName{get;set;}
    public integer accNumEmp{get;set;}
    
    public string conName{get;set;}
    
    public string oppName{get;set;}
    public date oppClose{get;set;}
    public string stage{get;set;}
    
    public pagereference saveTheDetails(){
        Account a = new account(name=accName, numberofemployees=accNumEmp);
        insert a;
        
        contact c= new contact(lastname=conName,accountid=a.Id);
        opportunity o= new opportunity(name=oppName, closedate=oppClose, stagename=stage, accountid=a.Id);
        insert c;
        insert o;
        pagereference pr=new pagereference('/apex/StudentView'+a);
        return pr;
    }

}