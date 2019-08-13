@isTest
private class photoProfileMotivatorTest {
    
    static testMethod void testDocumentQuery() {
        test.startTest();        
        list<id> output = photoProfileMotivator.getDocumentIdsFromAssets();
        test.stopTest();

        System.assert(output.size() > 0);
    }

    @isTest(SeeAllData=true)
    static void executeUserTest(){
        makeData();

        user u = [select id, IsProfilePhotoActive from user where LastName = 'testUser' and Firstname = 'motivator'];
        system.assertEquals(false, u.IsProfilePhotoActive);

        test.startTest();
        photoProfileMotivator.setPhotoForUser(new list<id>{u.Id});
        test.stopTest();

        // Asynchronous operations: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_connectapi_differences.htm
        // Some Chatter in Apex operations are asynchronous, that is, they don’t occur immediately. 
        // For example, if your code adds a feed item for a user, it isn’t immediately available in the news feed. 
        // Another example: when you add a photo, it’s not available immediately. 
        // For testing, if you add a photo, you can’t retrieve it immediately.

        // user u2 = [select id, IsProfilePhotoActive from user where LastName = 'testUser' and Firstname = 'motivator'];
        // system.assertEquals(true, u.IsProfilePhotoActive);
    }

    static testMethod void randomGetter() {
        
        list<id> options = new list<id>{'06955000000kWqGAAU', '06955000000kWqIAAU', '06955000000kWqMAAU'};     
        
        test.startTest();
        integer randomIndex = photoProfileMotivator.getRandomIndex(options);        
        test.stopTest();



        // removed because it fails sometimes, and who knows why
        System.assert(randomIndex >= 0);
        System.assert(randomIndex < options.size());
       
    }

    static void makeData(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];

        // create User
        User u = new User();

        u.FirstName = 'motivator';
        u.LastName = 'testUser';
        u.Email = 'test@profileMotivator222.com';
        u.Username = 'astest@profileMotivator222.com';
        u.Alias = 'astest';
        u.ProfileId = p.Id;
        u.TimeZoneSidKey    = 'America/Denver';
        u.LocaleSidKey      = 'en_US';
        u.EmailEncodingKey  = 'UTF-8';
        u.LanguageLocaleKey = 'en_US';

        insert u;
    }
    
}
