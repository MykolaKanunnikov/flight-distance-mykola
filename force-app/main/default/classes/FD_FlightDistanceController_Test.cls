@isTest
private with sharing class FD_FlightDistanceController_Test {

    @isTest
    static void testGetDistanceKm() {
        System.runAs(FD_TestDataFactory.createFlightDistanceUser()) {
            FD_Airport__c departureAirport = new FD_Airport__c(Name = 'BCN', FD_Latitude__c = 41.2971, FD_Longitude__c = 2.07846);
            FD_Airport__c arrivalAirport = new FD_Airport__c(Name = 'LHR', FD_Latitude__c = 51.4706, FD_Longitude__c = -0.461941);
            insert new List<FD_Airport__c> {departureAirport, arrivalAirport};

            Test.startTest();
                Integer distance = FD_FlightDistanceController.getDistanceKm(departureAirport.Id, arrivalAirport.Id);
            Test.stopTest();

            Assert.areEqual(1148, distance, 'Not expected distance');
        }
    }

}