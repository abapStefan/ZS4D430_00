CLASS zcl_40_01_use_structure_type DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_01_use_structure_type IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF st_address,
             strasse TYPE /dmo/street,
             plz     TYPE /dmo/postal_code,
             stadt   TYPE /dmo/city,
             land    TYPE land1,
             status  TYPE c LENGTH 1,
           END OF st_address.


    TYPES: BEGIN OF st_person1,
             vorname  TYPE /dmo/first_name,
             nachname TYPE /dmo/last_name,
             adresse   TYPE z40s_address,
             adressen  TYPE z40t_addresses,
           END OF st_person1.

    DATA mitarbeiter1 TYPE st_person1.


    mitarbeiter1-nachname = 'breidenbach'.
    mitarbeiter1-vorname = 'Stefan'.
    mitarbeiter1-adresse-country = 'DE'.
    mitarbeiter1-adresse-postal_code = 39456.
    mitarbeiter1-adresse-city = 'Göttingen'.
    mitarbeiter1-adresse-street = 'Schlossalee'.

     mitarbeiter1-nachname = 'Rummelplatz'.
    mitarbeiter1-vorname = 'Dora'.
    mitarbeiter1-adresse-country = 'EN'.
    mitarbeiter1-adresse-postal_code = 33454.
    mitarbeiter1-adresse-city = 'Gotham'.
    mitarbeiter1-adresse-street = 'Pinkraod'.






    TYPES: BEGIN OF st_person,
             vorname  TYPE /dmo/first_name,
             nachname TYPE /dmo/last_name,

              adressen  TYPE z40t_addresses.

             INCLUDE TYPE st_address AS %tky.    " Hier benanntes Include
    TYPES:
           END OF st_person.

    DATA mitarbeiter TYPE st_person.

    mitarbeiter-%tky-stadt = 'Berlin'.

    mitarbeiter-nachname = 'Rollmann'.
    mitarbeiter-vorname = 'Sabine'.
    mitarbeiter-land = 'DE'.
    mitarbeiter-plz = 45678.
    mitarbeiter-stadt = 'Werlingen'.
    mitarbeiter-strasse = 'Butterstr'.
    mitarbeiter-status = 'A'.



    DATA person TYPE z40s_person_deep..




    out->write( mitarbeiter1 ).





  ENDMETHOD.
ENDCLASS.
