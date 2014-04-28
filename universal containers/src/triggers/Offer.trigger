trigger Offer on Offer__c (before insert) {
	
	Offers2.checkoffer(Trigger.new);
 
}