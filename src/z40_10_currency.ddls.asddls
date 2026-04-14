@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Währungsumrechnung'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z40_10_CURRENCY as select from /dmo/travel
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'currencycode'
    total_price as  TotalPrice,
    currency_code as CurrencyCode,

    @Semantics.amount.currencyCode: 'currencycode'
    currency_conversion(  amount  => cast( total_price as abap.curr( 16, 2 ) ),
                                        source_currency    => currency_code,
                                        target_currency    => cast( 'EUR' as abap.cuky ) ,
                                        exchange_rate_date => begin_date )  as total_price_eur

}
