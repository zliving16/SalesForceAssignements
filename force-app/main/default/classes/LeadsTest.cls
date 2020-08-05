@istest
public class LeadsTest {
    testMethod static void testmakeLead(){
        id x=leadswebservice.makeLead( 'lName',  'company',  'Open - Not Contacted');
        system.assert(x!=null);
    }
}