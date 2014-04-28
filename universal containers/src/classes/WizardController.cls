public class WizardController {
	Candidate__c ncandidate;
	
	public WizardController(ApexPages.StandardController cont){
		
		ncandidate=(Candidate__c)cont.getrecord();
		
	}
	
	public Pagereference showNext(){
		
		if(ncandidate.first_name__c=='' || ncandidate.last_name__c==''){
			
			ApexPages.Message errMsg= new ApexPages.Message(ApexPages.Severity.ERROR,'Invalid values');
			ApexPages.addMessage(errMsg);
			return null;
		}else{
			
			PageReference pr=new PageReference('/apex/candidate2');
			pr.getParameters().put('Fname',ncandidate.first_name__c);
			pr.getParameters().put('Lname',ncandidate.last_name__c);
			pr.SetRedirect(true);
			return pr;
		}
	}
	
	public PageReference finishrecord(){
		
		if(ncandidate.email__c=='' || ncandidate.city__c==''){
					
			ApexPages.Message errMsg= new ApexPages.Message(ApexPages.Severity.ERROR,'Invalid values');
			ApexPages.addMessage(errMsg);
			return null;
		}else{
			
			Pagereference p=new Pagereference('/apex/SucessPage');
			Candidate__c newRecord=new Candidate__c();
			newRecord.first_name__c=ApexPages.currentPage().getParameters().get('Fname');
			newRecord.last_name__c=ApexPages.currentPage().getParameters().get('Lname');
			newRecord.email__c=ncandidate.email__c;
			newRecord.city__c=ncandidate.city__c;
			try{
				Database.Insert(newrecord,false);
			}Catch(System.Exception e){
				p.getParameters().put('MSG',e.getMessage());
			}
			return p;
		}
		
	
		
	}

}