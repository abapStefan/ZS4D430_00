@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Filter in Pfadausdrücken'
@Metadata.ignorePropagatedAnnotations: true
define view entity z40_c_filter1_ as select from /DMO/I_Connection_R
{
    key AirlineID,
    key ConnectionID,
    
        min(_Flight.FlightDate)           as FirstFlightDate,
        min(_Flight[OccupiedSeats > MaximumSeats ].FlightDate )  as FirstOverbookedFlight
    /* Associations */
}
group by
    AirlineID,
    ConnectionID



