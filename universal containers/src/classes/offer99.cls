public  class offer99 {

    
    
    public static void checkoffer(List<Offer__c> offers1){
        
        list<ID> op=new List<ID>();
        for(Offer__c o:offers1){
            
        op.add(o.job_application__c);   

        }
        
     
        List<Position__c> p= [Select id,min_pay__c, max_pay__c,(Select id from job_applications__r ) from Position__c where id in (select position__c from job_application__c where id=:op)];
        
        for(Offer__c o:offers1){
          for(Position__c p1:p){
          if(o.Actual_Salary__c<p1.min_pay__c || o.Actual_Salary__c>p1.max_pay__c){
            
            o.addError('Actual salary is not between the min pay and max pay');
          }
          }
        }
        
        
    }



}