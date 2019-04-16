*&---------------------------------------------------------------------*
*& Report zbc_fold_write
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zbc_fold_write.

"Konstanten für Ausgabepositionen
constants:
  gc_pos type i value 12,
  gc_len type i value 10.

*  start-of-selection.
*  select carrid, connid, cityfrom, cityto
*    from spfli
*    into table @
*
*  write at: / sy-vline,
*              gc_pos(gc_len) gs_
*at selection-screen on gstrp.
*
*  data archivable_date type p0001-begda.
*
*  call function 'RP_CALC_DATE_IN_INTERVAL'
*    exporting
*      date      = sy-datum
*      days      = 0
*      month     = 0
*      signum    = '-'
*      years     = 3
*    importing
*      calc_date = archivable_date.
*
*  if gstrp-low > archivable_date.
*    message s602(zm) display like 'E'.
*  endif.
