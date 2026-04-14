@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'test'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
             serviceQuality: #X,
             sizeCategory: #S,
             dataClass: #MIXED
}             

define view entity Z40_R_DEPARTMENT2 
         as select from z40depment
         
   association [0..*] to Z40_R_EMPLOYEE as _Employee 
            on $projection.Id = _Employee.DepartmentId
   association [0..1] to Z40_R_EMPLOYEE as _head
            on $projection.HeadId = _head.EmployeeId
   association [1..1] to Z40_R_EMPLOYEE as _assistent
            on $projection.AssistantId = _assistent.EmployeeId
{
    key id as Id,
    description as Description,
    head_id as HeadId,
    assistant_id as AssistantId,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _Employee,
    _head,
    _assistent
}
