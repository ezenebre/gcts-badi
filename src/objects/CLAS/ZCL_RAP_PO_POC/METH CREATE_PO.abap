  METHOD create_po.

    DATA lt_po TYPE TABLE FOR CREATE i_purchaseordertp_2.
    DATA lt_po_item TYPE TABLE FOR CREATE i_purchaseordertp_2\_purchaseorderitem.

    lt_po_item = VALUE #( ( %cid_ref = 'PO'
                            %target = VALUE #( ( %cid = 'POI'
                                                 material = 'TG13'
                                                 ManufacturerMaterial = 'TG13'
                                                 plant = '1010'
                                                 baseunit = 'PC'
                                                 purchaseorderitem = '00010'
                                                 orderquantity = 1
                            %control = VALUE #( plant = cl_abap_behv=>flag_changed
                                                material             = cl_abap_behv=>flag_changed
                                                ManufacturerMaterial = cl_abap_behv=>flag_changed
                                                baseunit             = cl_abap_behv=>flag_changed
                                                orderquantity        = cl_abap_behv=>flag_changed
                                                purchaseorderitem    = cl_abap_behv=>flag_changed ) ) ) ) ).


    MODIFY ENTITIES OF i_purchaseordertp_2
        ENTITY purchaseorder
            CREATE FIELDS (
                     purchaseordertype
                     companycode
                     purchasingorganization
                     purchasinggroup
                     supplier               )
          WITH VALUE #( ( %cid                   = 'PO'
                          purchaseordertype      = 'NB'
                          companycode            = '1010'
                          purchasingorganization = '1010'
                          purchasinggroup        = '001'
                          supplier               = '0010300006'
                 ) )
            CREATE BY \_purchaseorderitem FROM lt_po_item
             MAPPED DATA(mapped)
             FAILED DATA(failed)
             REPORTED DATA(reported).

    " Check if process is not failed
    cl_abap_unit_assert=>assert_initial( failed-purchaseorder ).
    cl_abap_unit_assert=>assert_initial( reported-purchaseorder ).

    COMMIT ENTITIES BEGIN RESPONSE OF i_purchaseordertp_2 FAILED DATA(lt_po_res_failed) REPORTED DATA(lt_po_res_reported).
    "Special processing for Late numbering to determine the generated document number.
    LOOP AT mapped-purchaseorder ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).
      CONVERT KEY OF i_purchaseordertp_2 FROM <fs_po_mapped>-%key TO DATA(ls_po_key).
      <fs_po_mapped>-purchaseorder = ls_po_key-purchaseorder.
    ENDLOOP.
    COMMIT ENTITIES END.

    rv_po = ls_po_key-purchaseorder.


  ENDMETHOD.