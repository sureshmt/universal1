public  class BatchController {
	
	public String result{get;set;}
	
	public void show(){
		PositionBatch pb=new PositionBatch();
		pb.setDataqry('Select name from Position__c');
		Database.executeBatch(pb);
		result='Batch successfully created... plesae monitor';
	}

}