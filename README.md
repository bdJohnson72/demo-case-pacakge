#Demo Case Handler Package

This package is demo  for the use of custom metadata in creating a loosly coupled code base.

The class CaseFactory_Hanlder extends Trigger Handler. This is a virtual class found in a seperate package.  
The custom metadata records deployed with this package tell the class to instantatiate a verion of the   
CaseSLAManager on Before Insert using the Salesforce Built In Type Class.

The CaseSLA Manager avoids being tightly couple to concrete implementatons of SLA Manager  
implementations by  interacting with them though a factory that returns Abstract types via an interface.  

The SLA Factory also queries custom metadata and instantiates them through the Type class  
If we needed to add a new level of service 'Platinum SLA' then we just need to write the class and  
add the appropriate mdt record. 

This creates a loosly coupled pattern that is closed for modification but open for extension. 


