@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Filter 2'
@Metadata.ignorePropagatedAnnotations: true
define view entity z40_c_filter2 as select from I_Currency
{
    key Currency,
    Decimals,
    CurrencyISOCode,
//    AlternativeCurrencyKey,
//    IsPrimaryCurrencyForISOCrcy,
    /* Associations */
    
//    _Text.CurrencyName as CurencyName,    // Pfadausdruck ohne Filter würde Ergebnismenge erhöhen
    
    _Text[1: Language = $session.system_language].CurrencyName as CurrencyNameEN,
    _Text[1: Language = 'D' ].CurrencyName as CurrencyNameDE
}
