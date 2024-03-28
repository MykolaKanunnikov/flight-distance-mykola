@isTest
private with sharing class FD_LoadAirportsBatch_Test {
    
    @isTest 
    static void loadAirportsTest() {
        System.runAs(FD_TestDataFactory.createFlightDistanceUser()) {
            Test.startTest();
                Database.executeBatch(new FD_LoadAirportsBatch());
            Test.stopTest();
            Assert.areEqual(false, [SELECT Id FROM FD_Airport__c LIMIT 10].isEmpty(), 'Airports should be inserted');
        }
    }
}