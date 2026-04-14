@AbapCatalog: { 
     dataMaintenance: #RESTRICTED,
     viewEnhancementCategory: [ #PROJECTION_LIST ],
     extensibility.dataSources: [ 'Employee' ],
     extensibility.elementSuffix: 'ZEM'
}
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Mitarbeiterdaten'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity Z40_C_EmployeeQueryP 
   with parameters
   
    p_target_curr : /dmo/currency_code,
    
    
    @Environment.systemField: #SYSTEM_DATE
      
    p_date  : abap.dats


     as select from Z40_R_EMPLOYEE as Employee
{
    key EmployeeId,
    $parameters.p_date as Dates,
    FirstName,
    LastName,
    DepartmentId,
    
    _department.Description as DepartmentDescription,
//    _department._assistent.LastName as AssistentName,

     concat_with_space( _department._assistent.FirstName,
                        _department._assistent.LastName, 1 ) as AssistantName,
    
    
      
      case EmployeeId
         when _department.HeadId then 'H'
         when _department.AssistantId then 'A'
         else ''
      end as EmployeeRole,
      
        
      
      
//     cast( 'USD' as /dmo/currency_code ) as CurrencyCodeUSD,
      
      $parameters.p_target_curr as CurrencyCode,
      
            
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount => AnnualSalary,
                           source_currency => CurrencyCode,
                           target_currency => $projection.CurrencyCode,
                           exchange_rate_date => $parameters.p_date , error_handling => 'SET_TO_NULL')                                 as AnnualSalaryConverted,
     
       
       
       
       @Semantics.amount.currencyCode: 'CurrencyCode'
       
       cast( ( cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0 ) as abap.curr( 10, 2 ) ) as MonthlySalaryConverted,
     division( dats_days_between( EntryDate, $parameters.p_date ), 365, 1 ) as CompanyAffiliation,
    
    
    /* Associations */
    _department
}
