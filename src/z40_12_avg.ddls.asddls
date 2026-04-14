@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Distinct'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_12_AVG as select from /dmo/connection 
{
//    key carrier_id as CarrierId,
//    key connection_id as ConnectionId,
//    airport_from_id as AirportFromId,
//    airport_to_id as AirportToId,
//    departure_time as DepartureTime,
//    arrival_time as ArrivalTime,
//    distance as Distance,
//    distance_unit as DistanceUnit,
    
    max( distance ) as maximum,
                   min( distance ) as minimum,
                   sum( distance ) as total,
                   count( * ) as count_all,
                   count( distinct airport_from_id ) as count_dist,
                   avg( distance  as abap.fltp ) as average
}
