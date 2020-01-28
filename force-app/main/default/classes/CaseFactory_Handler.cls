/**
 * Created by bjohnson on 1/27/20.
 */

public with sharing class CaseFactory_Handler extends TriggerHandler{

    List<Case> casesToProcess;

     public CaseFactory_Handler(){
         this.casesToProcess = (List<Case>)Trigger.new;
     }

    public override void  beforeInsert(){
        new CaseSLAManager(casesToProcess);
    }
}