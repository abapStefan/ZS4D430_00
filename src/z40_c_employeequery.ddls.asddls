@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiterdaten'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_C_EmployeeQuery 
     as select from Z40_R_EMPLOYEE
{
    key EmployeeId,
    FirstName,
    LastName,
    DepartmentId,
    
    _department.Description as DepartmentDescription,
//    _department._assistent.LastName as AssistentName,

     concat_with_space( _department._assistent.FirstName,
                        _department._assistent.LastName, 1 ) as AssistentName,
    
    @EndUserText.label: 'EmployeeRole  (Übung 13)'
      
      case EmployeeId
         when _department.HeadId then 'H'
         when _department.AssistantId then 'A'
         else ''
      end as EmployeeRole,
      
       @EndUserText.label: 'Monthly Salary  (Übung 13)' 
      
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
         AnnualSalary as Annualsalary,
         CurrencyCode as currencyCode,


     cast( 'USD' as /dmo/currency_code ) as CurrencyCodeUSD,
      
     @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
     currency_conversion( amount => AnnualSalary,
                          source_currency => CurrencyCode,
                          target_currency => $projection.CurrencyCodeUSD,
                          exchange_rate_date => $session.system_date) as AnnualSalaryConverted,
       
       
       @EndUserText.label: 'Monthly Salary'
       @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
       
       cast( ( cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0 ) as abap.curr( 10, 2 ) ) as MonthlySalaryConverted,
     division( dats_days_between( EntryDate, $session.system_date ), 365, 1 ) as CompanyAffiliation,
    
    
    /* Associations */
    _department
}
