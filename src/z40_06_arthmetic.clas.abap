CLASS z40_06_arthmetic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_06_arthmetic IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   SELECT FROM /dmo/flight
  FIELDS carrier_id, connection_id, flight_date,

   seats_max - seats_occupied as seats_free,

   ( cast( seats_occupied AS fltp ) * cast( 100 AS fltp ) / cast( seats_max as fltp ) ) as percentage_fltp

   INTO TABLE @DATA(result).

   out->write( result ).
  ENDMETHOD.
ENDCLASS.
