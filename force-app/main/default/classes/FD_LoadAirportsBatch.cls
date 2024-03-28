public with sharing class FD_LoadAirportsBatch implements Database.Batchable<sObject> {

    public Iterable<SObject> start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Body FROM StaticResource WHERE Name = \'airportsJSON\' WITH USER_MODE LIMIT 1'); 
    }

    public void execute(Database.BatchableContext bc, List<sObject> scope){
        StaticResource res = (StaticResource)scope[0];
        insert as user (List<FD_Airport__c>)JSON.deserialize(res.Body.toString(), List<FD_Airport__c>.class);
    }

    public void finish(Database.BatchableContext bc) {}

}