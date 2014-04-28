public class EmailController {
    
    public string toaddr{get;set;}
    public string ebody{get;set;}
    public string eRes{get;set;}
    
    
    public void shootEmail(){

        Messaging.Singleemailmessage sm=new Messaging.Singleemailmessage();
        sm.setToAddresses(new List<String>{toaddr});
        sm.setPlainTextBody(ebody);
        try{
        Messaging.sendEmail(new list<Messaging.Singleemailmessage>{sm});
        eres='Email Sent to universal containers.Please Reach for verification';
        }Catch(Exception e){
        eres='Email Not Sent';
        }
    }
}