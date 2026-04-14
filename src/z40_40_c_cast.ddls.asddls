@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cast'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_40_c_CAST as select from /dmo/flight
{
    key carrier_id as CarrierId,
    key connection_id as ConnectionId,
    key flight_date as FlightDate,
    
    '20260409'   as numc8,
    
    cast( '20260409' as abap.char( 8 ) ) as char8,
    cast( '20260409' as abap.int4 ) as int4,
    cast( '20260409' as abap.dec( 10,2 ) ) as dec10_2,
    cast( '20260409' as abap.fltp) as fltp,
    cast( '20260409' as abap.dats) as dats,
    cast( '20260409' as /dmo/flight_date ) as fldate,
    cast( '20260409' as /dmo/travel_id preserving type ) as travelid
    

}
