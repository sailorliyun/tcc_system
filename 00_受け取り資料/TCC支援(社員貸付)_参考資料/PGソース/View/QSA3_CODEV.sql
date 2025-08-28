------------------------------------------------------------------------------------------------
--更新日付  案件/障害番号    修正理由
--20090329  0807073/0808052  0807073：クレジット支援システムの再構築
--                           0808052：TCC支援システムの再構築
--                             ・アプリケーション移行対応
--                               RTRIMで全角スペースを削除する
--                               (Oracle10g PL/SQLのRTRIMでは全角スペースが削除されないため)
------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW TCCUSER.QSA3_CODEV ( 
QSA3_PRMCODEKBN
,QSA3_PRMCODENO
,QSA3_MEI
 ) AS 
--DEL 20090329 0807073/0808052 NBC YOKOYAMA START
--SELECT QTA8_PRMCodeKbn,RTRIM(QTA8_PRMCodeNo),  QTA8_Mei
--             FROM QTA8_CodeT   WHERE QTA8_PRMCodeNo ! = '    '
--             UNION
--             SELECT QSA2_PRMCodeKbn,RTRIM(QSA2_PRMCodeNo), QSA2_Mei
--             FROM QSA2_SCodeT    WHERE QSA2_PRMCodeNo ! = '    '
--DEL 20090329 0807073/0808052 NBC YOKOYAMA START
--ADD 20090329 0807073/0808052 NBC YOKOYAMA START
SELECT QTA8_PRMCodeKbn,RTRIM(QTA8_PRMCodeNo),  RTRIM(QTA8_Mei,'　')
             FROM QTA8_CodeT   WHERE QTA8_PRMCodeNo ! = '    '
             UNION
             SELECT QSA2_PRMCodeKbn,RTRIM(QSA2_PRMCodeNo), RTRIM(QSA2_Mei,'　')
             FROM QSA2_SCodeT    WHERE QSA2_PRMCodeNo ! = '    '
--ADD 20090329 0807073/0808052 NBC YOKOYAMA START
;
