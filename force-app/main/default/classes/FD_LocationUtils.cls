/**
 * @author Mykola Kanunnikov
 * @date 27 March, 2024
 * @description It holds location-related functionality for reuse  
 */
public with sharing class FD_LocationUtils {

    /**
     * @author Mykola Kanunnikov
     * @date 27 March, 2024
     * @description getDistance is a way to calculate distance 
     * between coordinates using standard functionality
     * @param  param is a wrapper to avoid long param list
     * @return       return distance in double
     */
    public static Double getDistance(DistanceParameter param) {
        return Location.getDistance(Location.newInstance(param.departureLatitude, param.departurelongitude),
                                    Location.newInstance(param.arrivalLatitude, param.arrivalLongitude),
                                    param.unit);
    }

    /**
     * @author Mykola Kanunnikov
     * @date 27 March, 2024
     * @description It facilitates getDistance 
     * method parameters organization
     */
    public class DistanceParameter {
        public Decimal departureLatitude;
        public Decimal departurelongitude;
        public Decimal arrivalLatitude;
        public Decimal arrivalLongitude;
        public String unit; //mi or km
    }
}