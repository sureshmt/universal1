public  class SoqlController {
	
	public String objName{get;set;}
	public String objField{get;set;}
	public String errMsg{get;set;}
	public List<String> recList{get;set;}
	public void display(){
		
		String query='Select '+objField+' from '+objName;
		List<Sobject> result=Database.query(query);
	
	
	if(result.size()==0){
		
		errMsg='Object or fields are not available';
		
	 }
	 
	 else{
	 	    String[] flds;
	 	    flds=objField.Split(',');
	 	    
	 	  
	 	    	
	 	    	for(Sobject s:result){
	 	    		String rec='';
	 	    		for(String f:flds){
	 	    			
	 	    	    rec=rec+'------------'+s.get(f);
	 	    		recList.add(rec);
	 	    		
	 	    			
	 	    		}
	 	    		
	 	    	}
	 	    
	 }
  }

}