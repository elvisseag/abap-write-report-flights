REPORT zes_program.


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

*WRITE: 10 'Carrier', 30 'Connection'.
FORMAT COLOR 4.
WRITE: 3 'ID Compañia',
       18 'ID Conexión Aérea',
       38 'Clave de Pais (FROM)',
       60 'Ciudad de Salida',
       82 'Clave de Pais (TO)',
       102 'Ciudad de Llegada'.
FORMAT COLOR OFF.

ULINE.

SELECT carrid connid countryfr cityfrom countryto cityto UP TO 20 ROWS
  INTO TABLE gtd_spfli
  FROM spfli.

FORMAT COLOR 2.

LOOP AT gtd_spfli INTO gwa_spfli .

  WRITE: / gwa_spfli-carrid    UNDER 'ID Compañia',
           gwa_spfli-connid    UNDER 'ID Conexión Aérea',
           gwa_spfli-countryfr UNDER 'Clave de Pais (FROM)',
           gwa_spfli-cityfrom  UNDER 'Ciudad de Salida',
           gwa_spfli-countryto UNDER 'Clave de Pais (TO)',
           gwa_spfli-cityto    UNDER 'Ciudad de Llegada'.

ENDLOOP.

FORMAT COLOR OFF.


*SELECT carrid connid
*  FROM spfli
*  INTO (ls_carrid, ln_connid).
*
*  WRITE: / ls_carrid UNDER 'Carrier',
*           ln_connid UNDER 'Connection'.
*ENDSELECT.