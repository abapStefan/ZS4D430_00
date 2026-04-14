@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Numeriche Funktionen'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_07_NUM as select from /dmo/flight
{
    key carrier_id as CarrierId,
    key connection_id as ConnectionId,
    key flight_date as FlightDate,

    seats_max as SeatsMax,
    seats_occupied as SeatsOccupied,
    
    div( seats_occupied * 100, seats_max )  as percentage_int,
    division( seats_occupied * 100, seats_max, 2 )  as percentage_dec
}
