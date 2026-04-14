@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Datumsverarbeitung'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_09_DATUM as select from /dmo/travel
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,

    
    dats_is_valid( begin_date ) as valid,
    dats_add_days( begin_date, 7, 'FAIL' ) as add_7_days,
    dats_days_between(  begin_date, end_date ) as duration,

    substring( begin_date, 5, 2 )  as Monat
    
    


}
