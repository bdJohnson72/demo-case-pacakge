/**
 * Created by bjohnson on 1/27/20.
 */

public with sharing class CaseSLAManager {
    List<Case> casesToProcess;

    public CaseSLAManager(List<Case> cases){
        this.casesToProcess = cases;
        procesSLA();
    }

    private void procesSLA(){
        for (Case c : casesToProcess){
            ISLAManager sLaManager = SLAFactory.getInstance(String.valueOf(c.Service_Type__c));
            c.SLA_Hours__c = sLaManager.getHours();
             }
    }

}