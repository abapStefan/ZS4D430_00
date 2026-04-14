@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View auf view'
@Metadata.ignorePropagatedAnnotations: false
define view entity Z40_PARAMETERS_USE 
 with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
     Language   : spras,
    @Environment.systemField: #SYSTEM_DATE
     BeginWithFlightDate : /dmo/flight_date

      as select from Z40_PARAMETERS(
                                   
                                FreeOrOccupied: 'X',
                                
                                DemoCurrency: 'EUR',
                                
                                Language: $parameters.Language,
                                
                                FirstFlightDate: $parameters.BeginWithFlightDate    )  
{
    key AirlineID,
    key ConnectionID,
    key FlightDate,
    MaximumSeats,
    OccupiedSeats,
    TargetCurrency,
    FreeOrOccupied_1,
    Language_1,
    First_flight_1,
    FreeSeats,
    PriceConverted,
    CurrencyName
}
