/**
 * Created by bjohnson on 1/27/20.
 */
@IsTest
public with sharing class CaseSLAManagerTest {
    @IsTest
    public static void SLATests(){
        List<Case> cases = new List<Case>();
        Case bronzeCase = new Case(Reason = 'New', Origin = 'Test', Service_Type__c = 'Bronze');
        Case silverCase = new Case(Reason = 'New', Origin = 'Test', Service_Type__c = 'Silver');
        Case goldCase = new Case(Reason = 'New', Origin = 'Test', Service_Type__c = 'Gold');

        cases.add(bronzeCase);
        cases.add(silverCase);
        cases.add(goldCase);
        Test.startTest();
        insert cases;
        Test.stopTest();

        List<Case> updatedCases = [SELECT Id, SLA_Hours__c FROM Case LIMIT 3];
        System.assertEquals(36, updatedCases[0].SLA_Hours__c);
        System.assertEquals(24, updatedCases[1].SLA_Hours__c);
        System.assertEquals(12, updatedCases[2].SLA_Hours__c);
    }
}