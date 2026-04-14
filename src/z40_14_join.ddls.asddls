@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Distinct'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_14_JOIN as select from /dmo/connection as a
                              inner join /dmo/carrier as c
                              on a.carrier_id = c.carrier_id
{
    key a.carrier_id as CarrierId,
    key a.connection_id as ConnectionId,
        c.name as CarrierName,
        a.airport_from_id,
        a.airport_to_id
    
//    airport_from_id as AirportFromId,
//    airport_to_id as AirportToId,
//    departure_time as DepartureTime,
//    arrival_time as ArrivalTime,
//    distance as Distance,
//    distance_unit as DistanceUnit,
    


}





