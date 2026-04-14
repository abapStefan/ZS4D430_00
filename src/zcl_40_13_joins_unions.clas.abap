CLASS zcl_40_13_joins_unions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_13_joins_unions IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

** INNER JOIN

*   SELECT FROM /dmo/carrier AS a
*   INNER JOIN /dmo/connection AS c
*   ON a~carrier_id = c~carrier_id
*
*   FIELDS a~carrier_id,
*   connection_id,
*    a~name AS CarrierName,
*   airport_from_id,
*   airport_to_id
*
*   INTO TABLE @DATA(result).
*
*   out->Write( result ).

** Union / UNION ALL

   SELECT FROM /dmo/i_carrier

       FIELDS 'Airline' AS type,
       Airlineid AS ID,
       NAME

    UNION ALL

    SELECT FROM /dmo/i_airport

       FIELDS 'Airport' AS type,
       Airportid AS ID,
       NAME

    WHERE CITY = 'Berlin'

       INTO TABLE @DATA(result).

       out->write( result ).





  ENDMETHOD.
ENDCLASS.
