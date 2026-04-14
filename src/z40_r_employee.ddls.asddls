@AbapCatalog: { 
     dataMaintenance: #RESTRICTED,
     viewEnhancementCategory: [ #PROJECTION_LIST ],
     extensibility.dataSources: [ 'Employee' ],
     extensibility.elementSuffix: 'ZEM'
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter (Entity)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
             serviceQuality: #D,
             sizeCategory: #M,
             dataClass: #MASTER
}
define view entity Z40_R_EMPLOYEE
  as select from z40employ as Employee
  
  association [1..1] to Z40_R_DEPARTMENT as _department
       on $projection.DepartmentId = _department.Id
  
{
  key employee_id           as EmployeeId,
      first_name            as FirstName,
      last_name             as LastName,
      birth_date            as BirthDate,
      entry_date            as EntryDate,
      department_id         as DepartmentId,
@Semantics.amount.currencyCode: 'CurrencyCode'          
      annual_salary         as AnnualSalary,
@EndUserText.label: 'Währungsschlüssel'
      currency_code         as CurrencyCode,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _department
}
