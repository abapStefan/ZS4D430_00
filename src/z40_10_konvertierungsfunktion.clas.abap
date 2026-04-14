CLASS z40_10_konvertierungsfunktion DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_10_konvertierungsfunktion IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(today) = cl_abap_context_info=>get_system_date(  ).

        SELECT FROM /dmo/travel
            FIELDS total_price,
                   currency_code,

                   currency_conversion( amount             = total_price,
                                        source_currency    = currency_code,
                                        target_currency    = 'EUR',
                                        exchange_rate_date = @today
                                       ) AS total_price_eur

              WHERE customer_id = '0000003' AND currency_code <> 'EUR'
                 INTO TABLE @DATA(result_currency).

           out->write( result_currency ).



  ENDMETHOD.
ENDCLASS.
