CREATE VIEW QBVH_QB00007P ( 
QBVH_COURIER_ID
,QBVH_NISSU
 ) AS 
SELECT   Courier_ID,    /* �N�[���A�h�c */
         MAX(RETURN_DATE)
FROM     QBV3_CourierLogV
WHERE    RETURN_STATE  not LIKE  'IF%'  /* �A�N�e�B�r�e�B�� */
GROUP BY Courier_ID

;
