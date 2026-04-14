CLASS z40_09_eingebaute_funktionen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_09_eingebaute_funktionen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT
    FROM /dmo/travel
    FIELDS customer_id, begin_date, end_date,

    is_valid( begin_date ) AS valid,
    add_days( begin_date, 7 ) As add_7_days,
    days_between(  begin_date, end_date ) AS duration,

    extract_month( begin_date ) AS month,
    weekday(  begin_date ) AS weekday


    INTO Table @DATA(result).

    out->write( sy-datum ).



  ENDMETHOD.
ENDCLASS.
