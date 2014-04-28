public  class Offers2 {
    
    public static void checkoffer(List<Offer__c> offers1){
        
        for(Offer__c o:offers1){
          Position__c p= [Select min_pay__c, max_pay__c from Position__c where id in (select position__c from job_application__c where id=:o.job_application__c) Limit 1 ];
          if(o.Actual_Salary__c<p.min_pay__c || o.Actual_Salary__c>p.max_pay__c){
            
            o.addError('Actual salary is not between the min pay and max pay');
          }
        }
    }

}