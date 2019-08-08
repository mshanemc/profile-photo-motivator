public with sharing class photoProfileMotivator {
    
    public static list<string> PhotoNames = new list<string>{'alien', 'barney', 'candace', 'doloresUmbridge', 'edward', 'gollum', 'hans', 'jarjar', 'ralph', 'scrappyDoo', 'urkel', 'wesley'};

    @InvocableMethod( label='Set Random User Photo')
    public static void setPhotoForUser(list<id> userids) {    
        list<Id> documentIds = getDocumentIdsFromAssets();
        for (id userid:userids) {
            if (Limits.getDmlStatements() < Limits.getLimitDmlStatements()) {
                // find a random photo from the list
                id fileId = getRandomIdFromList(documentIds);
                // make the update
                ConnectApi.UserProfiles.setPhoto('internal', userId, fileId, null);
            } else {
                break;
            }            
        }
    }
    
    public static id getRandomIdFromList(list<Id> input) {
        Integer listSize = input.size() - 1;
        Integer randomNumber = Integer.valueof((Math.random() * listSize));
        return input[randomNumber];
    }

    public static List<Id> getDocumentIdsFromAssets() {
        list<id> output = new list<id>();

        for (contentAsset asset:[select id, ContentDocumentId from contentAsset where MasterLabel in: PhotoNames]) {
            output.add(asset.ContentDocumentId);
        }

        return output;
    }

}