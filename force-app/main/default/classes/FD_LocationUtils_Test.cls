@isTest
private with sharing class FD_LocationUtils_Test {
    
    @isTest
    static void testGetDistance() {
        System.runAs(FD_TestDataFactory.createFlightDistanceUser()) {
            FD_LocationUtils.DistanceParameter param = new FD_LocationUtils.DistanceParameter();
            //Barcelona BCN
            param.departureLatitude = 41.2971;
            param.departurelongitude = 2.07846;
            //London LHR
            param.arrivalLatitude = 51.4706;
            param.arrivalLongitude = -0.461941;
            param.unit = 'km';
            
            Test.startTest();
                Double distance = FD_LocationUtils.getDistance(param);
            Test.stopTest();
            
            Assert.areEqual(1147.7144840100757, distance, 'Not expected distance');
        }
    }
}