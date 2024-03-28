/**
 * @author Mykola Kanunnikov
 * @date 28 March, 2024
 * @description Controller for FlightDistance LWC
 */
public with sharing class FD_FlightDistanceController {

    /**
     * @author Mykola Kanunnikov
     * @date 28 March, 2024
     * @description getDistanceKm between airports
     * @param  departureAirportId 
     * @param  arrivalAirportId 
     * @return       return approx. distance in km
     */
    @AuraEnabled
    public static Integer getDistanceKm(Id departureAirportId, Id arrivalAirportId) {
        FD_LocationUtils.DistanceParameter param = new FD_LocationUtils.DistanceParameter();
        param.unit = 'km';
        try {
            List<FD_Airport__c> airports = [SELECT FD_Latitude__c, FD_Longitude__c
                                         FROM FD_Airport__c
                                         WHERE Id IN :new List<String> {departureAirportId, arrivalAirportId}
                                         WITH USER_MODE];

            for (FD_Airport__c airport : airports) {
                if (airport.Id == departureAirportId) {
                    param.departureLatitude = airport.FD_Latitude__c;
                    param.departurelongitude = airport.FD_Longitude__c;
                } else {
                    param.arrivalLatitude = airport.FD_Latitude__c;
                    param.arrivalLongitude = airport.FD_Longitude__c;
                }
            }
            return Math.round(FD_LocationUtils.getDistance(param));
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}