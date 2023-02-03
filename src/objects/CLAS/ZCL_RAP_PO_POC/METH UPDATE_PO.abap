  METHOD update_po.

    DATA lt_po_item_change TYPE TABLE FOR UPDATE I_PurchaseOrderItemTP_2.

    MODIFY ENTITIES OF i_purchaseordertp_2
    ENTITY PurchaseOrderItem
        UPDATE FROM lt_po_item_change
    ENTITY PurchaseOrderAccountAssignment
        UPDATE SET FIELDS WITH VALUE #( ( CostCenter = 'blablabla' ) )
      MAPPED DATA(mapped_c)
      FAILED DATA(failed_c)
      REPORTED DATA(reported_c).

    COMMIT ENTITIES BEGIN RESPONSE OF i_purchaseordertp_2 FAILED DATA(failed_u) REPORTED DATA(reported_u).
    COMMIT ENTITIES END.
"


  ENDMETHOD.