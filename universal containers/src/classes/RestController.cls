public  class RestController {
	public String res{get;set;}
	
	public void show(){
		
		HttpRequest Hr=new HttpRequest();
		hr.setMethod('GET');
		hr.setEndpoint('https://na8.salesforce.com/services/apexrest/restservice');
		hr.setHeader('Authorization', 'Bearer '+Userinfo.getSessionId());
		http h=new http();
		HttpResponse hrs=h.send(hr);
		res=hrs.getBody();
	}

}