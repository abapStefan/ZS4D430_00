CLASS zcl_40_parameters DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_parameters IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT
      FROM Z40_C_EmployeeQueryP(
           p_target_curr = 'JPY'
*           p_date        = @sy-datum
                     )
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,

           departmentdescription,
           AssistantName,
           \_department\_head-lastname AS headname,

           MonthlySalaryConverted,
           CurrencyCode,
           CompanyAffiliation

    INTO TABLE @DATA(result).

    out->write( result ).


  ENDMETHOD.
ENDCLASS.
