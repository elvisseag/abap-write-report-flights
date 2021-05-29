REPORT zes_program.

" TOP ****************************************************************
TYPES:
  BEGIN OF gty_spfli,
    carrid   TYPE s_carr_id,
    connid   TYPE s_conn_id,
    cityfrom TYPE s_from_cit,
    cityto   TYPE s_to_city,
    checked  TYPE c,
  END OF gty_spfli.

DATA: gtd_spfli TYPE STANDARD TABLE OF gty_spfli,
      gwa_spfli TYPE gty_spfli.


" MAI ****************************************************************

START-OF-SELECTION.
  PERFORM get_data.
  PERFORM print_report.

END-OF-SELECTION.

" F01 ****************************************************************


*&---------------------------------------------------------------------*
*&      Form  get_data
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM get_data.

  SELECT carrid connid cityfrom cityto UP TO 20 ROWS
    INTO TABLE gtd_spfli
    FROM spfli.
*    WHERE carrid IN s_carr.

ENDFORM.                    "get_data


*&---------------------------------------------------------------------*
*&      Form  print_report
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM print_report.

*  FORMAT COLOR 1. "light blue
*  FORMAT COLOR 2. "gray
*  FORMAT COLOR 3. "yellow
*  FORMAT COLOR 4. "green gray
*  FORMAT COLOR 5. "green
*  FORMAT COLOR 6. "red
*  FORMAT COLOR 7. "purple

  WRITE :/ sy-dbcnt COLOR 3. "Cuenta cantidad del SELECT anterior realizado

  FORMAT COLOR 7. "purple
  WRITE :/3 'Id Compañia Aérea'(001),
         25 'Id Conexión Vuelo'(002),
         45 'Ciudad de salida'(003),
         65 'Ciudad de entrada'(004).
  FORMAT COLOR OFF.

  FORMAT COLOR 2.
  LOOP AT gtd_spfli INTO gwa_spfli.


    WRITE :/3 gwa_spfli-carrid,
           25 gwa_spfli-connid,
           45 gwa_spfli-cityfrom,
           65 gwa_spfli-cityto.

  ENDLOOP.
  FORMAT COLOR OFF.

ENDFORM.                    "print_report