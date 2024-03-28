/**
* @author Nazim Aliyev
* @date 2020-02-19
* @group Travelite
* @description DataFactory Class for centralized test data generation
*/
@isTest
public with sharing class FD_TestDataFactory {

    /**
     * @description Method to create a test user
     * @return User - newly created Flight Distance User
     */
    public static User createFlightDistanceUser() {
        String username = 'fdu' + System.now().getTime() + '@test' + UserInfo.getOrganizationId() + '.net';
        User u = new User(ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
                          LastName = 'last',
                          Email = username,
                          Username = username,
                          Alias = 'alias',
                          TimeZoneSidKey = 'America/Los_Angeles',
                          EmailEncodingKey = 'UTF-8',
                          LanguageLocaleKey = 'en_US',
                          LocaleSidKey = 'en_US');
        insert u;
        insert new PermissionSetAssignment(AssigneeId = u.Id,
                                           PermissionsetId = [SELECT Id FROM PermissionSet
                                                              WHERE Name = 'Flight_Distance'].Id);
        return u;
    }
}