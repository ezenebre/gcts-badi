  METHOD if_oo_adt_classrun~main.

    out->write( 'Purchase order : ' && create_po( ) ).

    update_po(  ).

  ENDMETHOD.