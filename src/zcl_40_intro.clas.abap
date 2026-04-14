CLASS zcl_40_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     DATA var TYPE  string.                     " Datentyp string eingebaut vollständig ABAP

     DATA var1 TYPE /lrn/s4d430_ind_delem.      " Datentyp Datenelemnt Global ABAP Dictonary

     DATA var2 TYPE /lrn/s4d430_ind.            " Datentyp Datenbanktabelle Global ABAP Dictonary

     DATA var3 TYPE /lrn/s4d430_ind_struct.     " Datentyp Structur Global ABAP Dictonary

     DATA var4 TYPE /lrn/s4d430_ind_ttype.      " Datentyp Tabellentyp Global ABAP Dictonary

     DATA var5 TYPE /LRN/S4D430_IND_CDS_View.   " Datentyp CDS View Core Data Services


     SELECT FROM /dmo/connection
       FIELDS *
       INTO TABLE @DATA(result).


     DATA preis TYPE /dmo/flight_price.

        preis = '12345678912345.00'.


     out->write( preis ).


  ENDMETHOD.
ENDCLASS.
