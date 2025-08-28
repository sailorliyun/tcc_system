--�ϑ��߂薢���󂫎�t�ꗗ
--DROP   VIEW QBVN_QB00015P;
CREATE VIEW QBVN_QB00015P ( 
 QBVN_UKETSUKENO
,QBVN_KAKUTOKUTEN
,QBVN_ETNMEIKAN
,QBVN_CARDKBN
,QBVN_CARDMEI
,QBVN_DATE
,QBVN_HONKNNAME
,QBVN_FUBIYMD
,QBVN_SAIYMD
,QBVN_MEMOYMD
 ) AS 
Select 
A.A1                             QBVN_UKETSUKENO,    --��t�ԍ�
A.A2                             QBVN_KAKUTOKUTEN,   --�l���X
B.QTAB_ETNMEIKAN                 QBVN_ETNMEIKAN,     --�l���X��
A.A3                             QBVN_CARDKBN,       --�J�[�h�敪
C.QTA6_CARDMEI                   QBVN_CARDMEI,       --�J�[�h�敪����
A.A4                             QBVN_DATE,          --�X�L������
A.A5                             QBVN_HONKNNAME,     --�\���҃J�i����
A.A6                             QBVN_FUBIYMD,       --�߂�o�^��
A.A7                             QBVN_SAIYMD,        --�Ĉ˗���
A.A8                             QBVN_MEMOYMD        --�ʃ����o�^��
From     (
SELECT   M.QBA1_UKETSUKENO                                            A1, --��t�ԍ�
         M.QBA1_KAKUTOKUTEN                                           A2, --�l���X
         M.QBA1_CARDKBN                                               A3, --�J�[�h�敪
         Nvl(To_Char(M.QBA1_STRDATE      ,'YYYY/MM/DD'),' ')          A4, --�X�L������
         Nvl(M.QBA1_HONKNNAME,' ')                                    A5, --�\���҃J�i����
         Nvl(To_Char(M.QBA1_UPDDATE      ,'YYYY/MM/DD'),' ')          A6, --�߂�o�^��
         Nvl(To_Char(M.QBA1_IMAGESTRDATE ,'YYYY/MM/DD'),' ')          A7, --�Ĉ˗���
         Memo2.YMD                                                    A8  --�ʃ����o�^��
FROM     QBE4_PRINTTSHIJIT MM,
         QBA1_MOSHIKOMIT M,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       <> 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo2
Where    MM.QBE4_CHOHYOID   =  'QB00015P'
  And    MM.QBE4_UKETSUKENO =  M.QBA1_UKETSUKENO
  And    M.QBA1_UKETSUKENO  =  Memo2.UKETSUKENO(+)
) A,
QTAB_MISET B,
QTA6_CardCTRLT C 
WHERE    A.A2   = QTAB_PRMEigyouTenCd
AND      A.A3   = QTA6_PRMCardKbn
;
