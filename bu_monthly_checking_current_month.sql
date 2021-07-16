SELECT
  "D_BU"."BU_CODE",
  "D_BU_BRAND"."BU_BRAND_NAME",
  "D_IB_BRAND"."IB_BRAND_NAME",
  "D_SUPPLIER"."SUPPLIER_CODE",
  "D_SUPPLIER"."SUPPLIER_NAME",
  "D_MOTHER_CO"."MOTHER_CO_CODE",
  "D_MOTHER_CO"."MOTHER_CO_NAME"
FROM
  IBBI_STAGING."D_BU",
  IBBI_STAGING."D_BU_BRAND",
  IBBI_STAGING."D_IB_BRAND",
  IBBI_STAGING."D_SUPPLIER",
  IBBI_STAGING."D_MOTHER_CO",
  IBBI_STAGING."D_TIME_MONTH",
  IBBI_STAGING.MOTHER_CO_SUPPLIER_TYPE,
  IBBI_STAGING."ITEM_MOTHER_CO_MAP",
  IBBI_STAGING."ITEM_SUPPLIER_MAP",
  IBBI_STAGING."D_ITEM_STS"
WHERE
  ( "ITEM_SUPPLIER_MAP"."BU_BRAND_ID"="D_BU_BRAND"."BU_BRAND_ID"  )
  AND  ( "ITEM_MOTHER_CO_MAP"."SUPPLIER_ID"="D_SUPPLIER"."SUPPLIER_ID"  )
  AND  ( "ITEM_MOTHER_CO_MAP"."ITEM_ID" = "ITEM_SUPPLIER_MAP"."ITEM_ID"  AND  "ITEM_MOTHER_CO_MAP"."BU_ID" = "ITEM_SUPPLIER_MAP"."BU_ID"  AND  "ITEM_MOTHER_CO_MAP"."BU_BRAND_ID" = "ITEM_SUPPLIER_MAP"."BU_BRAND_ID"  AND  "ITEM_MOTHER_CO_MAP"."SUPPLIER_ID" = "ITEM_SUPPLIER_MAP"."SUPPLIER_ID"  )
  AND  ( MOTHER_CO_SUPPLIER_TYPE.MOTHER_CO_ID="D_MOTHER_CO"."MOTHER_CO_ID"  )
  AND  ( "D_IB_BRAND"."IB_BRAND_ID"="ITEM_MOTHER_CO_MAP"."IB_BRAND_ID"  )
  AND  ( "ITEM_SUPPLIER_MAP"."ITEM_ID" = "D_ITEM_STS"."ITEM_ID"  AND  "ITEM_SUPPLIER_MAP"."TIME_MONTH_ID" = "D_ITEM_STS"."TIME_MONTH_ID"  AND  "ITEM_SUPPLIER_MAP"."BU_ID" = "D_ITEM_STS"."BU_ID"  )
  AND  ( "D_TIME_MONTH"."TIME_MONTH_ID"="D_ITEM_STS"."TIME_MONTH_ID"  )
  AND  ( "ITEM_MOTHER_CO_MAP"."BU_ID" = MOTHER_CO_SUPPLIER_TYPE.BU_ID  AND  "ITEM_MOTHER_CO_MAP"."MOTHER_CO_ID" = MOTHER_CO_SUPPLIER_TYPE.MOTHER_CO_ID  )
  AND  ( "D_BU"."BU_ID"=MOTHER_CO_SUPPLIER_TYPE.BU_ID  )
  AND  ( "ITEM_SUPPLIER_MAP"."ACTIVE_FLAG"='Y'  )
  AND  
  "D_TIME_MONTH"."FIS_YR_MON"  IN  ( '2021 - 06'  )
  AND
  "D_BU"."BU_CODE"  IN  ( 'WTCHK'  )

  