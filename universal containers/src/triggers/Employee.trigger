trigger Employee on Employee__c (before insert) {
	
	EmployeeBC.loadEmployee(Trigger.new);

}