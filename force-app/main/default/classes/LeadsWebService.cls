global class LeadsWebService {
    
    webService static Id makeLead(string lName, string company, string leadstatus){
        lead ld =new lead();
        ld.Company=company;
        ld.LastName=lName;
        ld.Status=leadstatus;
        upsert ld;
        return ld.Id;
        
    }

}