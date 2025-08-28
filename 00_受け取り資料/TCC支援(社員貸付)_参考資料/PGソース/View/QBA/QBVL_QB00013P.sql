--�ϑ��߂薢�m�F��t�ꗗ
--DROP   VIEW QBVL_QB00013P;
CREATE VIEW QBVL_QB00013P ( 
 QBVL_UKETSUKENO
,QBVL_KAKUTOKUTEN
,QBVL_ETNMEIKAN
,QBVL_CARDKBN
,QBVL_CARDMEI
,QBVL_DATE
,QBVL_HONKNNAME
,QBVL_UKETSUKEYMD
,QBVL_HORYUYMD
,QBVL_MEMOYMD
 ) AS 
Select 
A.A1                             QBVL_UKETSUKENO,    --��t�ԍ�
A.A2                             QBVL_KAKUTOKUTEN,   --�l���X
B.QTAB_ETNMEIKAN                 QBVL_ETNMEIKAN,     --�l���X��
A.A3                             QBVL_CARDKBN,       --�J�[�h�敪
C.QTA6_CARDMEI                   QBVL_CARDMEI,       --�J�[�h�敪����
A.A4                             QBVL_DATE,          --�X�L������
A.A5                             QBVL_HONKNNAME,     --�\���҃J�i����
A.A6                             QBVL_UKETSUKEYMD,   --�����t��
A.A7                             QBVL_HORYUYMD,      --�R���ۗ���
A.A8                             QBVL_MEMOYMD        --�ʃ����o�^��
From     (
SELECT   M.QBA1_UKETSUKENO                                            A1, --��t�ԍ�
         M.QBA1_KAKUTOKUTEN                                           A2, --�l���X
         M.QBA1_CARDKBN                                               A3, --�J�[�h�敪
         Nvl(To_Char(M.QBA1_IMAGESTRDATE ,'YYYY/MM/DD'),' ')          A4, --�X�L������
         Nvl(M.QBA1_HONKNNAME,' ')                                    A5, --�\���҃J�i����
         Nvl(To_Char(M.QBA1_CTLSEISADATE ,'YYYY/MM/DD'),' ')          A6, --�����t��
         Memo1.YMD                                                    A7, --�R���ۗ���
         Memo2.YMD                                                    A8  --�ʃ����o�^��
FROM     QBE4_PRINTTSHIJIT MM,
         QBA1_MOSHIKOMIT M,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       = 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo1,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       <> 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo2
Where    MM.QBE4_CHOHYOID   =  'QB00013P'
  And    MM.QBE4_UKETSUKENO =  M.QBA1_UKETSUKENO
  And    M.QBA1_UKETSUKENO  =  Memo1.UKETSUKENO(+)
  And    M.QBA1_UKETSUKENO  =  Memo2.UKETSUKENO(+)
) A,
QTAB_MISET B,
QTA6_CardCTRLT C 
WHERE    A.A2   = QTAB_PRMEigyouTenCd
AND      A.A3   = QTA6_PRMCardKbn
;
