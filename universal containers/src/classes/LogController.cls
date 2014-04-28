public class LogController {

    public String username{get;set;}
    public String password{get;set;}
    public String result{get;set;}
    
    public void check(){
    
    if(username=='Accenture' && password=='Acc1234'){
           result='User login successful' ;  
}
else{

result='User login failure';
}
}
}