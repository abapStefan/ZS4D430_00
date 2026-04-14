@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters Benutzen 01'
@Metadata.ignorePropagatedAnnotations: false
define view entity Z40_PARAMETERS
  with parameters
    
 
    DemoCurrency    : /dmo/currency_code,
    FreeOrOccupied  : abap.char( 1 ),
    @Environment.systemField: #SYSTEM_LANGUAGE
    Language        : spras,
    @Environment.systemField: #SYSTEM_DATE
    @EndUserText.label: 'Nur diese Flüge Berücksichtigt'
    FirstFlightDate : /dmo/flight_date

  as select from /DMO/I_Flight
  
{
  key AirlineID,
  key ConnectionID,
  key FlightDate,

      MaximumSeats,
      OccupiedSeats,
      
// 1
  
  $parameters.DemoCurrency  as TargetCurrency,
  
  $parameters.FreeOrOccupied as FreeOrOccupied_1,
  
  $parameters.Language  as Language_1,
  
  $parameters.FirstFlightDate  as First_flight_1,
  
  
// 2

   case $parameters.FreeOrOccupied
        when 'X' then MaximumSeats - OccupiedSeats 
   end as FreeSeats,
   
// 3
    
     @Semantics.amount.currencyCode: 'TargetCurrency'  
     currency_conversion( amount => Price,
                         source_currency => CurrencyCode,
                         target_currency => $parameters.DemoCurrency,
                         exchange_rate_date => $session.user_date, error_handling => 'SET_TO_NULL' )   as PriceConverted,
                         
// 4

    _Currency._Text[1: Language = $parameters.Language ].CurrencyName as CurrencyName 

}

// 5

   where /DMO/I_Flight.FlightDate > $parameters.FirstFlightDate
   
