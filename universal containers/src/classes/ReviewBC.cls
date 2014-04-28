public with sharing class ReviewBC {
	
	public static void checkreviews(List<Review__C> rlist){
		
		for(Review__c r:rlist){
			if((r.Cultural_Fit__c!=0) && (r.Cultural_Fit__c < 1 || r.Cultural_Fit__c > 5)){
				r.Cultural_Fit__c.addError('Cultural fit must be between 1 and 5');
			}
			
			if((r.Experience__c!=0) && (r.Experience__c<1 || r.Experience__c>5)){
				r.Experience__c.addError('Experience must be between 1 and 5');
			}
			
			if((r.Leadership_Skills__c!=0) && (r.Leadership_Skills__c<1 || r.Leadership_Skills__c>5)){
				r.Leadership_Skills__c.addError('LeaderShip Skills must be between 1 and 5');
			}
		}
	}

}