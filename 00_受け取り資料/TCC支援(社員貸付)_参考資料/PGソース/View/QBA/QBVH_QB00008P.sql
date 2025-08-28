CREATE VIEW QBVH_QB00008P ( 
QBVH_COURIER_ID
,QBVH_ACT_NAME
,QBVH_NISSU
 ) AS 
SELECT   a.Courier_ID,    /* �N�[���A�h�c */
         a.RETURN_STATE, /* �A�N�e�B�r�e�B�� */
         QBAP_UkeMemoArameListPKG.QBAP_GetNissuCount(c.QBVH_Nissu)
    FROM     QBV3_CourierLogV a, QBVH_QB00006P b , QBVH_QB00007P c
    WHERE    a.Courier_ID = b.QBVH_Courier_ID 
    and      a.RETURN_DATE = b.QBVH_Nissu
    and      b.QBVH_Courier_ID = c.QBVH_Courier_ID 
    and      b.QBVH_Nissu = c.QBVH_Nissu
union
SELECT   a.Courier_ID,    /* �N�[���A�h�c */
         a.ACT_NAME, /* �A�N�e�B�r�e�B�� */
         QBAP_UkeMemoArameListPKG.QBAP_GetNissuCount(c.QBVH_Nissu)
    FROM     QBV3_CourierLogV a, QBVH_QB00006P b , QBVH_QB00007P c
    WHERE    a.Courier_ID = b.QBVH_Courier_ID 
    and      a.RETURN_DATE = b.QBVH_Nissu 
    and      b.QBVH_Courier_ID = c.QBVH_Courier_ID 
    and      b.QBVH_Nissu <> c.QBVH_Nissu

;
