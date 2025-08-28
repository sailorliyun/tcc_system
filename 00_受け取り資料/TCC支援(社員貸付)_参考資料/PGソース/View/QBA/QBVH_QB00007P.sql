CREATE VIEW QBVH_QB00007P ( 
QBVH_COURIER_ID
,QBVH_NISSU
 ) AS 
SELECT   Courier_ID,    /* クーリアＩＤ */
         MAX(RETURN_DATE)
FROM     QBV3_CourierLogV
WHERE    RETURN_STATE  not LIKE  'IF%'  /* アクティビティ名 */
GROUP BY Courier_ID

;
