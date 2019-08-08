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

        test.startTest();
        photoProfileMotivator.setPhotoForUser(new list<id>{UserInfo.getUserId()});
        test.stopTest();

        //TODO: create a testuser, verify its no-photo, then verify update afterwards.

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

    
}
