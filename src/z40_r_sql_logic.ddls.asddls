@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Berechnung'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_R_SQL_LOGIC as select from /dmo/flight
{
    key carrier_id as CarrierId,
    key connection_id as ConnectionId,
    key flight_date as FlightDate,
    
    seats_max - seats_occupied as seats_free,
    
     ( cast( seats_occupied as abap.fltp ) * cast( 100.0 as abap.fltp ) / cast( seats_max as abap.fltp ) ) as percentage_fltp
    
//     'Hello' as character1,                  // Typ char
//     '1313' as character2 ,                // Typ numc
//                    1    as integer1,      // Typ INT1
//                   -1    as interger2,    // Typ INT1
//                  256    as integer3,     // Typ INT2
//                 32768   as interger4,     // Typ INT4
//                 
//                 1.5 as float1            // fltp
    
    
}
