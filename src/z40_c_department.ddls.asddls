@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department (consumption)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_C_DEPARTMENT as select from Z40_R_DEPARTMENT
{
    key Id,
    Description,
    HeadId,
    AssistantId,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _assistent,
    _Employee,
    _head,
    
    
    max(_Employee.BirthDate) as birthyoungstar
    
}
group by
    Id,
    Description,
    HeadId,
    AssistantId,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
//    _assistent,
//    _Employee
//    _head

