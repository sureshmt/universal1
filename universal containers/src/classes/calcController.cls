public  class calcController {

   

    public Integer num2{get;set;}
    public Integer num1{get;set;}
    public String res{get;set;}
    
    public void calculate(){
        
        //Accessing session by capturing partner wsdl.
        partnerSoapSforceCom.Soap soap= new partnerSoapSforceCom.soap();
        partnerSoapSforceCom.LoginResult log=new partnerSoapSforceCom.LoginResult();
        log=soap.Login('admin@dev501.30000.com','Password1');
        
        //creation of business login stub
        SoapService.SoapDemo sd=new SoapService.SoapDemo();
        //assigning authentication of service to stub header 
        soapservice.SessionHeader_element se=new soapservice.SessionHeader_element();
        se.sessionId=log.sessionId;
        //loading stub header to stub
        sd.SessionHeader=se;
        res=sd.calcData(num1, num2);
    }
}