--���Z�@�ֈ������҂���t�ꗗ
--DROP   VIEW QBVM_QB00014P;
CREATE VIEW QBVM_QB00014P ( 
 QBVM_UKETSUKENO
,QBVM_KAKUTOKUTEN
,QBVM_ETNMEIKAN
,QBVM_CARDKBN
,QBVM_CARDMEI
,QBVM_DATE
,QBVM_HONKNNAME
,QBVM_SHINSAYMD
,QBVM_BANKCD
,QBVM_MEMOYMD
 ) AS 
Select 
A.A1                             QBVM_UKETSUKENO,    --��t�ԍ�
A.A2                             QBVM_KAKUTOKUTEN,   --�l���X
B.QTAB_ETNMEIKAN                 QBVM_ETNMEIKAN,     --�l���X��
A.A3                             QBVM_CARDKBN,       --�J�[�h�敪
C.QTA6_CARDMEI                   QBVM_CARDMEI,       --�J�[�h�敪����
A.A4                             QBVM_DATE,          --�X�L������
A.A5                             QBVM_HONKNNAME,     --�\���҃J�i����
A.A6                             QBVM_SHINSAYMD,     --�R�������
A.A7                             QBVM_BANKCD,        --��s�b�c
A.A8                             QBVM_MEMOYMD        --�ʃ����o�^��
From     (
SELECT   M.QBA1_UKETSUKENO                                            A1, --��t�ԍ�
         M.QBA1_KAKUTOKUTEN                                           A2, --�l���X
         M.QBA1_CARDKBN                                               A3, --�J�[�h�敪
         Nvl(To_Char(M.QBA1_IMAGESTRDATE ,'YYYY/MM/DD'),' ')          A4, --�X�L������
         Nvl(M.QBA1_HONKNNAME,' ')                                    A5, --�\���҃J�i����
         Nvl(To_Char(M.QBA1_CTLFSTSGDATE ,'YYYY/MM/DD'),' ')          A6, --�R�������
         JIF.QBA4_BANKCD                                              A7, --��s�b�c
         Memo2.YMD                                                    A8  --�ʃ����o�^��
FROM     QBE4_PRINTTSHIJIT MM,
         QBA1_MOSHIKOMIT M,
         QBA4_JIFURIT JIF,
         (Select QBM1_UKETSUKENO                                      UKETSUKENO,
                 Nvl(To_Char(Max(QBM1_MAKEDATE),'YYYY/MM/DD'),' ')    YMD
            From QBM1_MEMOT
           Where QBM1_OPID       <> 'JCBITAKU'
             And QBM1_DELDATE    IS Null
           Group by QBM1_UKETSUKENO)                                  Memo2
Where    MM.QBE4_CHOHYOID   =  'QB00014P'
  And    MM.QBE4_UKETSUKENO =  M.QBA1_UKETSUKENO
  And    M.QBA1_UKETSUKENO  =  JIF.QBA4_UKETSUKENO(+)
  And    M.QBA1_UKETSUKENO  =  Memo2.UKETSUKENO(+)
) A,
QTAB_MISET B,
QTA6_CardCTRLT C 
WHERE    A.A2   = QTAB_PRMEigyouTenCd
AND      A.A3   = QTA6_PRMCardKbn
;
