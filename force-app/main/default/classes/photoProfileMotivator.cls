public with sharing class photoProfileMotivator {
    

    @InvocableMethod( label='Set Random User Photo')
    public static void setPhotoForUser(list<id> userids) {    
        list<Id> documentIds = getDocumentIdsFromAssets();
        for (id userid:userids) {
            if (Limits.getDmlStatements() < Limits.getLimitDmlStatements()) {
                // find a random photo from the list
                id fileId = documentIds[getRandomIndex(documentIds)];
                // make the update
                ConnectApi.UserProfiles.setPhoto('internal', userId, fileId, null);
            } else {
                break;
            }            
        }
    }
    
    public static Integer getRandomIndex(list<Id> input) {
        return Integer.valueof((Math.random() * ( input.size() - 1 )));
    }

    public static List<Id> getDocumentIdsFromAssets() {
        list<id> output = new list<id>();

        for (contentAsset asset:[select id, ContentDocumentId from contentAsset where MasterLabel like 'MotivatorBadPhoto%']) {
            output.add(asset.ContentDocumentId);
        }

        return output;
    }

}