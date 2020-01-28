/**
 * Created by bjohnson on 1/27/20.
 */

public with sharing class SLAFactory {

    public static ISLAManager getInstance(String supportType){

       /* We query the custom meta data here and use the APEX type class
         rather than tightly couple the factory to implementations using the new key word
        to add a new service type we just need to write the class and add a new custom meta data record keeping the
        original clode closed for modification but open for extension. */

        SLAServiceSupport__mdt support = [SELECT Class_Name__c
        FROM SLAServiceSupport__mdt
        WHERE Label =: supportType ];
        System.debug(support);

        Type t = Type.forName(support.Class_Name__c);
        ISLAManager manager = (ISLAManager)t.newInstance();
        return manager;
    }
}