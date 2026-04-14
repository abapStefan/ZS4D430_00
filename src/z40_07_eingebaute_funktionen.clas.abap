CLASS z40_07_eingebaute_funktionen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_07_eingebaute_funktionen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT
    FROM /dmo/flight
    FIELDS carrier_id, connection_id, flight_date, seats_max, seats_occupied,

    div( seats_occupied * 100, seats_max )  as percentage_int,
    division( seats_occupied * 100, seats_max, 2 )  as percentage_dec

    into TABLE @DATA(result).

    out->write( Result ).



  ENDMETHOD.
ENDCLASS.
