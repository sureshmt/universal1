global class PositionBatch implements Database.Batchable<Sobject> {

	public String dataQry='';
	
	public void setdataQry(String dataQry){
		
		this.dataQry=dataQry;
		
	}
	
	public Database.querylocator Start(Database.batchableContext bc){
		
		Database.Querylocator ql=Database.getQueryLocator(dataqry);
		return  ql;
	}
	
	public void execute(Database.BatchableContext bc,List<Sobject> bt){

         for(Sobject s:bt){
         	
         	System.debug('PositionID---->'+s.get('ID')+'--------'+s.get('Name'));
         }		
		
	}
	
	public void finish(Database.batchableContext bc){
		dataQry='';
	}
}