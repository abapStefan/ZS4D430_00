CLASS zcl_40_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_path_expr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT FROM Z40_C_EmployeeQuery
       FIELDS EmployeeId,
              FirstName,
              LastName,
              DepartmentId,
              DepartmentDescription,
              AssistentName,
              \_department\_head-LastName AS HeadName ORDER BY EmployeeId
    INTO TABLE @DATA(lt_result).

    out->write( lt_result ).

  ENDMETHOD.
ENDCLASS.
