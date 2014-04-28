trigger Position on Position__c (before insert, before update,after insert) {

    if(trigger.isInsert && trigger.isBefore){
        PositionBC.checkPosition(Trigger.new);
    }
    
    if(trigger.isInsert && trigger.isAfter){
        PositionBC.subscribe(Trigger.new);
        PositionBC.sharerecord(Trigger.new);
        PositionBC.publishRecords(Trigger.new);
    }
    if(trigger.isUpdate && trigger.isAfter){
        PositionBC.publishRecords(Trigger.new);
        
    }
    if(Trigger.isupdate && trigger.isbefore){
        PositionBC.checkpayScale(trigger.new,trigger.old);
    } 
}