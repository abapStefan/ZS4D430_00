CLASS zcl_40_12_datensets DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_12_datensets IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

** ORDER BY
*
*  SELECT FROM /dmo/customer
*    FIELDS customer_id, last_name,first_name
*
*    ORDER BY last_name
*
*    INTO TABLE @DATA(result).
*
*   out->write( result ).

** DISTINCT
*
*  SELECT FROM /dmo/customer
*    FIELDS DISTINCT " customer_id,
*                    last_name,
*                    first_name
*
*    INTO TABLE @DATA(result).
*
*   out->write( result ).

* Aggregation

*    SELECT FROM /dmo/connection
*
*            FIELDS MAX( distance ) AS maximum,
*                   MIN( distance ) AS minimum,
*                   SUM( distance ) AS total,
*                   COUNT( * ) AS count_all,
*                   COUNT( DISTINCT airport_from_id ) AS count_dist,
*                   AVG( distance ) AS average
*
*     INTO TABLE @DATA(result).
*
*       out->write( result ).

** GROUP BY

       SELECT FROM /dmo/connection

            FIELDS
                   Carrier_id,
                   MAX( distance ) AS maximum,
                   MIN( distance ) AS minimum,
                   SUM( distance ) AS total,
                   COUNT( * ) AS count_all

           GROUP BY carrier_id


     INTO TABLE @DATA(result).

       out->write( result ).





  ENDMETHOD.
ENDCLASS.
