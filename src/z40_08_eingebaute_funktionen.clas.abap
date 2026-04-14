CLASS z40_08_eingebaute_funktionen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_08_eingebaute_funktionen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT
    FROM /dmo/customer
    FIELDS customer_id, last_name, first_name,

    street && ',' && ' ' && postal_code && ' ' && city AS adresse_expr,
       concat( street, concat_with_space( ',',
                       concat_with_space(  postal_code,
                                           upper( city ), 1 ), 1 ) ) AS adresse_func


    INTO Table @DATA(result).

    out->write( result ).


  ENDMETHOD.
ENDCLASS.
