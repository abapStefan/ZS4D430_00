CLASS zcl_40_kopieren DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_kopieren IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   INSERT Z40_EMPLOYEE FROM @( VALUE #( employee_id = '000001' ) ).

   out->write(  |DB wurde mit einem Eintrag gefüllt| ).

  ENDMETHOD.
ENDCLASS.
