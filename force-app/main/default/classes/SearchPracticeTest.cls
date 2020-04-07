@isTest
public class searchPracticeTest { 
    @isTest static void TestgetRelatedContacts(){
        list<account> x=[select id,(select id,name from contacts) from account where id='0016g00000D31dlAAB' WITH SECURITY_ENFORCED ];
        if(x.size()>0){
            account acct=x[0];
            list<contact> cts=acct.contacts;
            list<contact> actual=searchPractice.getRelatedContacts('0016g00000D31dlAAB');
            system.assertEquals(cts, actual);
        }      
    }
    @isTest static void TestgetRecentRecords(){
        list<sobject> accts=[select id,name,createdDate from account WITH SECURITY_ENFORCED order by createdDate desc limit 100 ];
        list<sobject> acctsAct=searchPractice.getRecentRecords('account');
        for(sobject acct:accts){
            system.debug(acct.id);
        }
        for(sobject acct:acctsAct){
            system.debug(acct.Id);
        }
        system.assertEquals(accts, acctsAct);
    }
    @isTest static void TestgetMap(){
        string param='garcia';
        list<list<sobject>> objs=[find :param in all fields returning account(id,name),contact,lead,opportunity];
        integer x=objs.size();
        Map<String, integer> myMap = new Map<String, integer>{'account' => objs[0].size(),'contact' => objs[1].size(), 'lead' => objs[2].size(), 'opportunity' => objs[3].size()};
		map<string,integer> mapAct=searchPractice.getMap('garcia');
        system.assertEquals(myMap, mapAct);
    }
}
