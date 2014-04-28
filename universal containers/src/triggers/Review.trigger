trigger Review on Review__c (before insert) {
	
	ReviewBC.checkreviews(Trigger.New);

}