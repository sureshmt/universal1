public  class PositionBC implements CalculateBC {
	
	public Integer calculateHRA(Position__c p ){
		
		if(p.type__c=='temp'){
			
			  return Integer.valueOf(0.2*(p.Max_Pay__c-p.Min_Pay__c));
		}
		return Integer.valueOf(0.3*(p.Max_Pay__c-p.Min_Pay__c));
	}
	
	public Double calculatePremium(Position__c p ){
		if(p.type__c=='temp'){
			
			  return Integer.valueOf(0.2*(p.Max_Pay__c-p.Min_Pay__c));
		}
		return Integer.valueOf(0.15*(p.Max_Pay__c-p.Min_Pay__c));
	}
	
    public static void checkPosition(List<Position__c> positions){
    	
    	for(Position__C p:positions){
    		
    		if(p.department__c == 'Engineering' || p.department__c == 'IT'){
    			if(p.type__c == 'Temp'){
    				p.addError('Cannot have temporary positions in tehnical departments');
    			}
    		}
    	}
    	
    }
    
    public static void checkpayScale(list<Position__c>newlist,list<Position__c>oldlist){
    	
    	for(Position__c p:newlist){
    		for(Position__c p1:oldlist){
    			if(p.Min_Pay__c<p1.Min_Pay__c || p.max_pay__c<p1.max_pay__c){
    				p.addError('Pay Scale must be edited to higher ');
    			}
    		}
    	}
    } 


public static void subscribe(List<Position__c> plist){
	
	list<EntitySubscription> es=new list<EntitySubscription>();
	
	for(Position__c p:plist){
		
		EntitySubscription e=new EntitySubscription();
		e.subscriberId=p.hiring_manager__c;
		e.ParentId=p.Id;
		es.add(e);
	}
	
	Database.Insert(es);
}

public static void sharerecord(List<Position__c>plist){
	
	List<Position__share> sharelist=new List<Position__share>();
	for(Position__c p:pList){
		
		Position__share ps=new Position__share();
		
		ps.parentID=p.Id;
		ps.userOrGroupID=p.hiring_manager__c;
		ps.accessLevel='Edit';
		ps.RowCause=Position__share.RowCause.Supervisor__c;
		
		shareList.add(ps);
	}
	
	Database.Insert(shareList);
}

public static void publishRecords(List<Position__c>plist){

	CollaborationGroup cg=[Select id from CollaborationGroup where name='manager' Limit 1];	
	List<FeedItem>flist=new List<FeedItem>();
	
	for(position__c p:plist){
		if(p.status__c=='Open' || p.status__c=='closed'){
		FeedItem fi=new FeedItem();
		fi.parentID=cg.id;
		fi.title='Positioned Opened please nominate';
		fi.body='Send Resumes for position';
		fi.linkurl='/'+p.id;
		flist.add(fi);
	 }
	}
	Database.Insert(flist);
	
}


}