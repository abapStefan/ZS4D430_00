CLASS z40_04_filter_in_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_04_filter_in_sql IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Abbildung 122

*  SELECT FROM /dmo/i_connection_r
*         FIELDS AirlineID, ConnectionID, \_Airline-Name, \_Airline-CurrencyCode
*         INTO TABLE @DATA(result).
*
*         out->write( result ).

* Abbildung 123

*  SELECT FROM /dmo/i_connection_r
*         FIELDS AirlineID, ConnectionID,
*                \_Airline-Name, \_Airline-CurrencyCode, \_Airline\_Currency-CurrencyISOCode
*         INTO TABLE @DATA(result).
*
*         out->write( result ).

* Abbildung 124

    DATA dat TYPE d. " VALUE sy-datum. funktioniert hier nicht
    dat = sy-datum.

   Select FROM i_currency
       FIELDS currency,

          \_Text[ MANY TO ONE WHERE Language = 'E' ]-CurrencyShortName AS CurrencyNameEN,

          \_Text[ MANY TO MANY WHERE LANGUAGE = 'D' ]-CurrencyShortName AS CurrencyNameDE

          INTO TABLE @DATA(result).

         out->write( result ).





  ENDMETHOD.
ENDCLASS.
