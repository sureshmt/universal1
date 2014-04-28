global class WebServiceWSdemo {

	webservice static String displayMsg(String firstname,String lastname){
		return firstname+' '+lastname;
	}
	
	
	webservice static String insertCase(String firstname,String lastname,String State,String city){
		
		Candidate__c cand=new Candidate__c();
		cand.First_Name__c=firstname;
		cand.Last_Name__c=lastname;
		cand.State_Province__c=State;
		cand.City__c=city;
		try{
			Database.insert(cand);
			
		}Catch(Exception e){
			return e.getMessage();
		}
		
			return 'Insertion of Candidate object is successful and the Refernece Id is '+cand.Id;
		
	}
}