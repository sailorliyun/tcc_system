------------------------------------------------------------------------------------------------
--�X�V���t  �Č�/��Q�ԍ�    �C�����R
--20090329  0807073/0808052  0807073�F�N���W�b�g�x���V�X�e���̍č\�z
--                           0808052�FTCC�x���V�X�e���̍č\�z
--                             �E�A�v���P�[�V�����ڍs�Ή�
--                               RTRIM�őS�p�X�y�[�X���폜����
--                               (Oracle10g PL/SQL��RTRIM�ł͑S�p�X�y�[�X���폜����Ȃ�����)
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
SELECT QTA8_PRMCodeKbn,RTRIM(QTA8_PRMCodeNo),  RTRIM(QTA8_Mei,'�@')
             FROM QTA8_CodeT   WHERE QTA8_PRMCodeNo ! = '    '
             UNION
             SELECT QSA2_PRMCodeKbn,RTRIM(QSA2_PRMCodeNo), RTRIM(QSA2_Mei,'�@')
             FROM QSA2_SCodeT    WHERE QSA2_PRMCodeNo ! = '    '
--ADD 20090329 0807073/0808052 NBC YOKOYAMA START
;
