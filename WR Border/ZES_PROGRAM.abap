
REPORT zes_program LINE-SIZE 1023.

" TOP ****************************************************************

TYPES:
  BEGIN OF gty_spfli,
    carrid    TYPE s_carr_id,
    connid    TYPE s_conn_id,
    countryfr TYPE spfli-countryfr,
    cityfrom  TYPE s_from_cit,
    countryto TYPE spfli-countryto,
    cityto    TYPE s_to_city,
    checked   TYPE c,
  END OF gty_spfli.

DATA: gtd_spfli TYPE STANDARD TABLE OF gty_spfli,
      gwa_spfli TYPE gty_spfli.

FIELD-SYMBOLS: <fs_spfli> TYPE gty_spfli.
REFRESH: gtd_spfli.

" MAI ***************************************************************

START-OF-SELECTION.
  PERFORM get_data.
  PERFORM print_report.

END-OF-SELECTION.


" F01 ***************************************************************

FORM get_data .

  SELECT carrid connid countryfr cityfrom countryto cityto UP TO 20 ROWS
    INTO TABLE gtd_spfli
    FROM spfli.

ENDFORM.                    "get_data

*&---------------------------------------------------------------------*
*&      Form  print_report
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM print_report.

  READ TABLE gtd_spfli INTO  gwa_spfli INDEX 1.
  IF sy-subrc EQ 0.
    WRITE: /1 sy-uline(50).
    WRITE: /1 sy-vline, 3(22) 'ID Compañia'          COLOR COL_HEADING, 26(1) sy-vline, gwa_spfli-carrid,    50(1) sy-vline,
           /1 sy-vline, 3(22) 'ID Conexión Aérea'    COLOR COL_HEADING, 26(1) sy-vline, gwa_spfli-connid,    50(1) sy-vline,
           /1 sy-vline, 3(22) 'Clave de Pais (FROM)' COLOR COL_HEADING, 26(1) sy-vline, gwa_spfli-countryfr, 50(1) sy-vline,
           /1 sy-vline, 3(22) 'Ciudad de Salida'     COLOR COL_HEADING, 26(1) sy-vline, gwa_spfli-cityfrom,  50(1) sy-vline,
           /1 sy-vline, 3(22) 'Clave de Pais (TO)'   COLOR COL_HEADING, 26(1) sy-vline, gwa_spfli-countryto, 50(1) sy-vline,
           /1 sy-vline, 3(22) 'Ciudad de Salida'     COLOR COL_HEADING, 26(1) sy-vline, gwa_spfli-cityto,    50(1) sy-vline.
    WRITE: /1 sy-uline(50).
  ENDIF.

  WRITE: /1 sy-uline(130).

  WRITE: /1 sy-vline,
         3(12)   'ID Compañia'          COLOR COL_HEADING, 16(1) sy-vline,
         18(18)  'ID Conexión Aérea'    COLOR COL_HEADING, 37(1)  sy-vline,
         39(20)  'Clave de Pais (FROM)' COLOR COL_HEADING, 61(1)  sy-vline,
         63(20)  'Ciudad de Salida'     COLOR COL_HEADING, 84(1)  sy-vline,
         86(20)  'Clave de Pais (TO)'   COLOR COL_HEADING, 107(1) sy-vline,
         109(20) 'Ciudad de Llegada'    COLOR COL_HEADING, 130(1) sy-vline.
  WRITE: /1 sy-uline(130).

  LOOP AT gtd_spfli ASSIGNING <fs_spfli>.
    WRITE: /1 sy-vline,
           3(12)   <fs_spfli>-carrid,    16(1)  sy-vline,
           18(18)  <fs_spfli>-connid,    37(1)  sy-vline,
           39(20)  <fs_spfli>-countryfr, 61(1)  sy-vline,
           63(20)  <fs_spfli>-cityfrom,  84(1)  sy-vline,
           86(20)  <fs_spfli>-countryto, 107(1) sy-vline,
           109(20) <fs_spfli>-cityto,    130(1) sy-vline.

  ENDLOOP.

  WRITE: /1 sy-uline(130).

ENDFORM.                    "print_report