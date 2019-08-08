@isTest
private class photoProfileMotivatorTest {
    
    static testMethod void testDocumentQuery() {
        test.startTest();        
        list<id> output = photoProfileMotivator.getDocumentIdsFromAssets();
        test.stopTest();

        System.assertEquals(photoProfileMotivator.PhotoNames.size(), output.size());
    }

    static testMethod void randomGetter() {
        
        list<id> options = new list<id>{'06955000000kWqGAAU', '06955000000kWqIAAU', '06955000000kWqMAAU'};     
        test.startTest();
        id selected1 = photoProfileMotivator.getRandomIdFromList(options);
        id selected2 = photoProfileMotivator.getRandomIdFromList(options);
        id selected3 = photoProfileMotivator.getRandomIdFromList(options);
        id selected4 = photoProfileMotivator.getRandomIdFromList(options);
        id selected5 = photoProfileMotivator.getRandomIdFromList(options);
        test.stopTest();

        // System.debug(selected1);
        // System.debug(options);

        System.assert(options.contains(selected1));
        System.assert(options.contains(selected2));
        System.assert(options.contains(selected3));
        System.assert(options.contains(selected4));
        System.assert(options.contains(selected5));
    }

    
}
