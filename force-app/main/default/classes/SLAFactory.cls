/**
 * Created by bjohnson on 1/27/20.
 */

public with sharing class SLAFactory {

    public static ISLAManager getInstance(String supportType){

        SLAServiceSupport__mdt support = [SELECT Class_Name__c
        FROM SLAServiceSupport__mdt
        WHERE Label =: supportType ];
        System.debug(support);

        Type t = Type.forName(support.Class_Name__c);
        ISLAManager manager = (ISLAManager)t.newInstance();
        return manager;
    }
}