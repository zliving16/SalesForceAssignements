@RestResource(urlMapping='/Contact/*')
global with sharing class RestService {
    @HttpGet
    global static contact getContact(){
        RestRequest request = RestContext.request;
        String contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Contact result =  [SELECT id,name,phone,email FROM contact WHERE Id = :contactId];
        return result;
    }
    @HttpPut
    global static ID updateContactPhone() {
        RestRequest request = RestContext.request;
        String ContactId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Contact ct = [SELECT Id,phone FROM contact WHERE Id = :ContactId];
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());        
        for(String fieldName : params.keySet()) {
            if(fieldName.toLowerCase()=='phone'){
                ct.put(fieldName, params.get(fieldName)); 
            }  
        }
        
        update ct;
        return ct.Id;
    }    

}
/*
Create a Rest Webservice that allows a user to get a Contact via the id and also allows a user to update a Contact’s phone number. 

Your class should be covered by a test class.  

*/