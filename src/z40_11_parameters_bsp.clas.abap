CLASS z40_11_parameters_bsp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z40_11_parameters_bsp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

DATA(demo) = cl_abap_context_info=>get_system_date(  ).

*    SELECT FROM z40_c_employeequeryp( p_date = @sy-datum, p_target_curr = 'JPY'  )
*    SELECT FROM z40_c_employeequeryp( p_date = @( cl_abap_context_info=>get_system_date( ) ), p_target_curr = 'JPY'  )
*    SELECT FROM z40_c_employeequeryp( p_date = @demo,    p_target_curr = 'JPY'  )

    SELECT FROM z40_c_employeequeryp( p_target_curr = 'JPY' )
           FIELDS EmployeeId,
               FirstName,
               LastName,
               DepartmentId,
               DepartmentDescription,
               AssistantName,
               \_department\_Head-LastName AS HeadName,
               MonthlySalaryConverted,
               CurrencyCode,
               CompanyAffiliation
*                WHERE AssistantName = 'Jan Kowalski'
               INTO TABLE @DATA(lt_result).

    out->write( lt_result ).



  ENDMETHOD.
ENDCLASS.
