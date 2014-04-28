public with sharing class SuccessController {
	
	public String tMsg{get;set;}
	
	public SuccessController(){
		tMsg=ApexPages.currentPage().getParameters().get('MSG');
	}

}