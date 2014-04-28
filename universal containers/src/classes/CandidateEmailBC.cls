/**
 * Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
global class CandidateEmailBC implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

		String emailbdy=EncodingUtil.urlDecode(email.plaintextbody, 'UTF-8');
		String[] emailtxt=emailbdy.split(';');
		Candidate__c nc=new Candidate__c();
		nc.first_Name__c=emailtxt[0];
		nc.last_name__c=emailtxt[1];
		nc.email__c=emailtxt[2];
		
		try{
			Database.Insert(nc);
			result.success=true;
		}Catch(Exception e){
		
		System.debug('The exception e is '+e.getMessage());
		result.success=false;
		}
        return result;
    }
    
    
}