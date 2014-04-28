public with sharing class CandidateBC {
	
	public static void candidateApp(Map<Id,Candidate__c> clist){
		
		Set<ID>cid=clist.keyset();
		
		for(ID d:cid){
			

			
		}

	}
	
	public static void checkcandidate(List<Candidate__c> clist){
		
		List<String> emails=new List<String>();
		for(Candidate__c c:clist){
			
			emails.add(c.email__c);
			
		}
		
		List<Candidate__c>c2=[Select email__c from Candidate__c where email__c In:emails];
		
		for(Candidate__c c3:clist){
			
			for(Candidate__c c4:c2){
				if(c4.email__c==c3.email__c){
				
				c3.addError('Candidate already exists');
			}
			
		  }
			
		}
	}

}