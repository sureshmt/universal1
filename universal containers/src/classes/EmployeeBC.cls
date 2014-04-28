public  class EmployeeBC {
	
	public static void loadEmployee(List<Employee__c> e){
		
		for(Employee__c ec:e){
			
			if(ec.name=='Full Time' && ec.level__c=='Manager'){
				ec.vpay__c=ec.pay__c*0.40;
			}
		}
	}

}