public with sharing class Dcontroller {
    
    public List<String> objname{get;set;}
    public String oname{get;set;}
    public List<String> fieldlist{get;set;}        
    public void displayObjects(){
        
        Map<String,Schema.Sobjecttype> objmap= Schema.getGlobalDescribe();
        objname=new List<String>(objmap.Keyset());
    }
    

    public void DisplayFields(){
    Map<String,Schema.Sobjecttype> objmap= Schema.getGlobalDescribe();
    Schema.DescribeSObjectResult obg=objmap.get(oname).getdescribe();
    Map<String,Schema.SobjectField> fldMap=obg.fields.getMap();
    fieldList=new List<String>(fldMap.KeySet());         
    }
}