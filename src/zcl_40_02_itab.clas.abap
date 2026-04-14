CLASS zcl_40_02_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_02_itab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*  DATA con TYPE /dmo/flight.     " Für Select Schleife
  DATA t_con TYPE z40t_40_flight.

  out->write( 'Hier die Ausgabe in Datenbanksortierung' ).
  out->write( |-----------------------------------------------------------------| ).

  SELECT *
  FROM /dmo/flight
  WHERE carrier_id = 'LH'
*  order by flight_date
  into TABLE @DATA(con1).           " Oder Array Fetch

  out->write( con1 ).

*  ENDSELECT.                       " Für END bei Select Schleife


  out->write( |-----------------------------------------------------------------| ).

  out->write( 'Hier die Sortierung nach der ITAB' ).
  out->write( |-----------------------------------------------------------------| ).

  SELECT *
  from /dmo/flight
  WHERE carrier_id = 'LH'
  INTO TABLE @t_con.

  out->write( t_con ).


  ENDMETHOD.
ENDCLASS.
