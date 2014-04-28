public  class positionCalcController {
	
	Position__c precord;
	public double vpay{get;set;}
	public double pay{get;set;}
	public double gross{get;set;}
	ApexPages.StandardController pcont1;
	
	public positionCalcController(ApexPages.StandardController pcont){
		
		precord=(Position__c)pcont.getRecord();
		
	}
	

	public void calc(){
		
		double pay=precord.Max_Pay__c-precord.Min_Pay__c;
		vpay=pay*0.4;
		gross=pay+vpay;
	}

}