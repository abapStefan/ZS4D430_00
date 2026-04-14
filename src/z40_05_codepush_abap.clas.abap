CLASS z40_05_codepush_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_05_codepush_abap IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA(dat) = cl_abap_context_info=>get_system_date(  ).

*  SELECT FROM /dmo/flight
*  FIELDS carrier_id, connection_id, flight_date,
*
*  seats_max - seats_occupied as seats_free
*
*   INTO TABLE @DATA(result).
*
*   out->write( result ).

  SELECT FROM z40_r_sql_logic
  FIELDS carrierid, connectionid, flightdate, seats_free

   INTO TABLE @DATA(result).

   out->write( result ).





  ENDMETHOD.
ENDCLASS.
