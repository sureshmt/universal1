public class HelloWorldPositionClass {
    
    public static void helloWorld(List<Position__c> positions){
        
        for (Position__c p:positions){
            if (p.Hello__c != 'World') {
                p.Hello__c = 'World'; 
            }
        }
    }
    
      public static void average(List<Position__c> positions){
        
        for (Position__c p:positions){
            if (p.Average_Pay_Scale__c ==null) {
                p.Average_Pay_Scale__c =p.Max_Pay__c-p.Min_Pay__c ; 
            }
        }
    }
    
    
  
}