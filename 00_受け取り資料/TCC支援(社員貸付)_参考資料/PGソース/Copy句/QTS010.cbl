      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS010(QTA010)
      ****************************************************************
      *                ����}�X�^                                    *
      *                             DATA-WRITTEN  99.01.12           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   * 
      *   000001   ���C�A�E�g�ύX�̈�            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                              *>����}�X�^
             05        ()-PRM.                              *>�G���g���[�L�[
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>��ƃR�[�h
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>��������ԍ�
             05        ()-RECKBN               PIC  9(01).  *>���R�[�h�敪
             05        ()-ZANDAKAKANRIKBN      PIC  9(01).  *>�c���Ǘ��敪
             05        ()-KAIJOKBN             PIC  9(01).  *>�����敪
             05        ()-10TO16KBN            PIC  9(01).  *>10��16���敪
             05        ()-GKN.                              *>�O������ԍ�
               07      ()-GKNSHIKIBETSUNO      PIC  9(12).  *>������ʔԍ�
               07      ()-GKNEDABAN            PIC  9(01).  *>�{�l�}��
             05        ()-TEN.                              *>�X
               07      ()-TENKAISHA            PIC  9(02).  *>��ГX
               07      ()-TENSAIKENKANRI       PIC  9(02).  *>���Ǘ��X
               07      ()-TENEIGYOU            PIC  9(02).  *>�c�ƓX
               07      ()-TENDM                PIC  9(02).  *>�c�l�X
               07      ()-TENJIGYOHONBU        PIC  9(02).  *>���Ɩ{���R�[�h
               07      ()-TENKAKUTOKU          PIC  9(02).  *>�l���X
             05        ()-CARDKBN              PIC  9(06).  *>�J�[�h�敪
             05        ()-TRS.                              *>�戵���i���
               07      ()-TRSS.                             *>�V���b�s���O
                 09    ()-TRSSYOKU1            PIC  9(01).  *>���P��
                 09    ()-TRSSYOKU2            PIC  9(01).  *>���Q��
                 09    ()-TRSSBONUS1           PIC  9(01).  *>�{�[�i�X�P��
                 09    ()-TRSSBONUS2           PIC  9(01).  *>�{�[�i�X�Q��
 	         09    ()-TRSSKAPPU            PIC  9(01).  *>����
                 09    ()-TRSSREVOLVING        PIC  9(01).  *>���{���r���O
                 09    ()-TRSSHANBAI           PIC  9(01).  *>�E������
                 09    ()-TRSSKAKEURI          PIC  9(01).  *>�E���|��
               07      ()-TRSC.                             *>�L���V���O
                 09    ()-TRSCREVOLVING        PIC  9(01).  *>���{���r���O
                 09    ()-TRSCYOKU1            PIC  9(01).  *>���P��
             05        ()-CARDLOANUSEKBN       PIC  9(01).  *>����۰ݎg�p�敪
             05        ()-HENSAIHOUHOU         PIC  9(01).  *>�ԍϕ��@
             05        ()-SIHARAIYOTEIBI       PIC  9(02).  *>�x���\���
             05        ()-REV.                              *>���{��z
               07      ()-REVS.                             *>�V���b�s���O
                 09    ()-REVSMAITSUKI         PIC  9(01).  *>������
                 09    ()-REVSBONUS            PIC  9(02).  *>�{�[�i�X��
               07      ()-REVC.                             *>�L���V���O
                 09    ()-REVCMAITSUKI         PIC  9(01).  *>������
                 09    ()-REVCBONUS            PIC  9(02).  *>�{�[�i�X��
             05        ()-BBK.                              *>����
               07      ()-BBKSHUBETSU          PIC  9(01).  *>���
               07      ()-BBKRITSU             PIC  9(02).  *>��
             05        ()-ANS.                              *>�Ïؔԍ����
               07      ()-ASNGEN               PIC  9(04).  *>�Ïؔԍ�
               07      ()-ANSKYUU              PIC  9(04).  *>���Ïؔԍ�
               07      ()-ANSHENKOUYMD         PIC  9(08).  *>�ύX��
             05        ()-NYK.                              *>������
               07      ()-NYKUKETSUKENO        PIC  9(08).  *>��t�ԍ�
               07      ()-NYKUKETSUKEYMD       PIC  9(08).  *>��t��
               07      ()-NYKKESSAIYMD         PIC  9(08).  *>���ٓ�
             05        ()-YUKOKIGEN            PIC  9(06).  *>�L������
             05        ()-KTK.                              *>�l�����
               07      ()-KTKROUTE             PIC  9(09).  *>�l�����[�g
               07      ()-KTKSHOUKAISHACD      PIC  9(08).  *>�Љ�҃R�[�h
             05        ()-YSN.                              *>�^�M���
               07      ()-YSNRANK              PIC  X(01).  *>�^�M�����N
               07      ()-YSNSOUGENDO          PIC  9(05).  *>�����x�z
               07      ()-YSNNOBEGENDO         PIC  9(05).  *>�������x�z
               07      ()-YSNKYUBONUSGENDO     PIC  9(05).  *>���ްŽ���x�z
               07      ()-YSNCASHGENDO         PIC  9(05).  *>����ݸތ��x�z
               07      ()-YSNIKKATSUGENDO      PIC  9(05).  *>�ꎞ�ꊇ���x�z
               07      ()-YSNKAPPUGENDO        PIC  9(05).  *>�ꎞ�������x�z
               07      ()-YSNBONUSGENDO        PIC  9(05).  *>�ꎞ�ްŽ���x�z
               07      ()-YSNYUKOKAISHI        PIC  9(08).  *>�L�������J�n
               07      ()-YSNYUKOOWARI         PIC  9(08).  *>�L�������I��
             05        ()-CIF.                              *>�ԍ����
               07      ()-CIFDOUITSUNINNO      PIC  9(07).  *>����l�ԍ�
               07      ()-CIFNO                PIC  9(08).  *>�b�h�e�ԍ�
               07      ()-CIFSHOUKAINO         PIC  9(18).  *>�b�h�b�Ɖ�ԍ�
             05        ()-HON.                              *>�{�l���
               07      ()-HONSHIMEI.                        *>����
                 09    ()-HONSHIMEIKANA        PIC  X(30).  *>�����J�i
                 09    ()-HONSHIMEIROMA        PIC  X(30).  *>�������[�}��
                 09    ()-HONSHIMEIKAN         PIC  N(15).  *>��������
               07      ()-HONSEINENGAPPI       PIC  9(08).  *>���N����
               07      ()-HONSEX               PIC  9(01).  *>����
             05        ()-JTK.                              *>������ 
               07      ()-JTKTEL.                           *>�d�b�ԍ�
                 09    ()-JTKTELSHIGAI         PIC  X(07).  *>�s�O�ǔ�
                 09    ()-JTKTELKYOKU          PIC  X(04).  *>�d�b�ǔ�
                 09    ()-JTKTELNO             PIC  X(04).  *>�d�b�ԍ�
               07      ()-JTKJUSHOCD           PIC  9(11).  *>�Z���R�[�h
               07      ()-JTKYUUBINNO          PIC  X(07).  *>�X�֔ԍ�
               07      ()-JTKKANA.                          *>�J�i�Z��
                 09    ()-JTKKENKANA           PIC  X(08).  *>����
                 09    ()-JTKJUSHOKANA         PIC  X(42).  *>�Z����
                 09    ()-JTKBANCHIKANA        PIC  X(15).  *>�Ԓn
                 09    ()-JTKKATAKANA          PIC  X(32).  *>����
               07      ()-JTKKAN.                           *>�����Z��
                 09    ()-JTKJUSHOKAN          PIC  N(25).  *>�Z����
                 09    ()-JTKBANCHIKAN         PIC  N(15).  *>�Ԓn
                 09    ()-JTKKATAKAN           PIC  N(32).  *>����
             05        ()-KOZ.                              *>���U�������
               07      ()-KOZHENKOUYMD         PIC  9(08).  *>�o�^�ύX��
               07      ()-KOZGS.                            *>��s���
                 09    ()-KOZGINKOUCD          PIC  9(04).  *>��s�R�[�h
                 09    ()-KOZGINKOUMEI         PIC  N(10).  *>��s��
                 09    ()-KOZSHITENCD          PIC  9(05).  *>�x�X�R�[�h
                 09    ()-KOZSHITENMEI         PIC  N(10).  *>�x�X��
                 09    ()-KOZSHUMOKU           PIC  9(01).  *>�a�����
                 09    ()-KOZNO                PIC  9(08).  *>�����ԍ�      
                 09    ()-KOZMEIGI             PIC  X(30).  *>�������`
             05        ()-CLUBCD               PIC  9(02).  *>�N���u�R�[�h
             05        ()-STS.                              *>�X�e�[�^�X���
               07      ()-STSKOZAG.                         *>�����X�e�[�^�X
                 09    ()-STSKOZATOROKUYMD     PIC  9(08).  *>�o�^��
                 09    ()-STSKOZA              PIC  9(04).  *>�X�e�[�^�X
               07      ()-STSCARDG.                         *>�J�[�h�X�e�[�^�X
                 09    ()-STSCARDTOROKUYMD     PIC  9(08).  *>�o�^��
                 09    ()-STSCARD              PIC  9(04).  *>�X�e�[�^�X
             05        ()-EDJ.                              *>�}�ԏ��
               07      ()-EDJ1.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD1       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD1          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO1       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ2.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD2       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD2          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO2       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ3.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD3       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD3          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO3       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ4.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD4       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD4          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO4       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ5.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD5       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD5          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO5       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ6.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD6       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD6          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO6       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ7.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD7       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD7          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO7       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ8.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD8       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD8          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO8       PIC  9(04).  *>�J�[�h�󋵂P
               07      ()-EDJ9.                             *>�}�ԏ󋵂P
                 09    ()-EDJRIYOUSHACD9       PIC  9(01).  *>���p�҃R�[�h�P
                 09    ()-EDJJIKOYMD9          PIC  9(08).  *>���̔������P
                 09    ()-EDJCARDJYOKYO9       PIC  9(04).  *>�J�[�h�󋵂P
             05        ()-SOH.                              *>���t����
               07      ()-SOHCARD              PIC  9(01).  *>�J�[�h
               07      ()-SOHSEIKYU            PIC  9(01).  *>������
             05        ()-CDH.                              *>�J�[�h�������
               07      ()-CDHHAKKOUKBN         PIC  9(01).  *>���s�敪
               07      ()-CDHYUSOKBN           PIC  9(01).  *>�X���敪
               07      ()-CDHYMD               PIC  9(08).  *>�J�[�h������
               07      ()-CDHYUCHOSAIHATU      PIC  X(01).  *>�X���Ĕ��s��
             05        ()-KIK.                              *>�����ڊǏ��
               07      ()-KIKYMD               PIC  9(08).  *>�ڊǓ�
               07      ()-KIKKYUUNO            PIC  9(12).  *>������ԍ�
               07      ()-KIK10KETANO          PIC  9(10).  *>10������ԍ�
             05        ()-TKS.                              *>��g����
               07      ()-TKSHENREIYMD         PIC  9(08).  *>�Ԗߓ�
               07      ()-TKSCARDNO            PIC  9(16).  *>��g��J�[�h�ԍ�
               07      ()-TKSKEKKACD           PIC  9(01).  *>���ʃR�[�h
               07      ()-TKSRIYUCD            PIC  X(03).  *>���R�R�[�h
             05        ()-EDB.                              *>�}�ԏ��
               07      ()-EDBSAISHURIYOU       PIC  9(01).  *>�ŏI���p�҃R�[�h
               07      ()-EDBYUKOMUKO1         PIC  X(01).  *>�L�������敪�P
               07      ()-EDBYUKOMUKO2         PIC  X(01).  *>�L�������敪�Q
               07      ()-EDBYUKOMUKO3         PIC  X(01).  *>�L�������敪�R
               07      ()-EDBYUKOMUKO4         PIC  X(01).  *>�L�������敪�S
               07      ()-EDBYUKOMUKO5         PIC  X(01).  *>�L�������敪�T
               07      ()-EDBYUKOMUKO6         PIC  X(01).  *>�L�������敪�U
               07      ()-EDBYUKOMUKO7         PIC  X(01).  *>�L�������敪�V
               07      ()-EDBYUKOMUKO8         PIC  X(01).  *>�L�������敪�W
               07      ()-EDBYUKOMUKO9         PIC  X(01).  *>�L�������敪�X
             05        ()-ATU.                              *>�����یW���
               07      ()-ATUKAKARI            PIC  X(06).  *>�����یW
               07      ()-ATUKOUSHINMAE        PIC  X(06).  *>�X�V�O�����یW
               07      ()-ATUHENKOUYMD         PIC  9(08).  *>�ύX��
             05        ()-PNT.                              *>�����ԍ����
               07      ()-PNTSHINNO            PIC  9(04).  *>�V�����ԍ�
               07      ()-PNTKYUUNO            PIC  9(04).  *>�������ԍ�
               07      ()-PNTHENKOUYMD         PIC  9(08).  *>�����ԍ��ύX��
               07      ()-PNTKBN               PIC  9(01).  *>�敪
               07      ()-PNTCARDFACE          PIC  X(01).  *>�J�[�h�t�F�[�X
               07      ()-PNTTEIKEIKBN         PIC  X(01).  *>��g�敪
             05        ()-IKANMAECARDKBN       PIC  9(06).  *>�ڊǑO�J�[�h�敪
             05        ()-KMS.                              *>�Ζ�����
               07      ()-KMSKBN               PIC  9(01).  *>�敪
               07      ()-KMSMEI.                           *>�Ζ��於
                 09    ()-KMSMEIKANA           PIC  X(30).  *>�J�i
                 09    ()-KMSMEIKAN            PIC  N(30).  *>����
               07      ()-KMSBUKA              PIC  N(15).  *>��������
               07      ()-KMSTEL.                           *>�d�b�ԍ�
                 09    ()-KMSTELSHIGAI         PIC  X(07).  *>�s�O�ǔ�
                 09    ()-KMSTELKYOKU          PIC  X(04).  *>�d�b�ǔ�
                 09    ()-KMSTELNO             PIC  X(04).  *>�d�b�ԍ�
               07      ()-KMSJUSHOCD           PIC  9(11).  *>�Z���R�[�h
               07      ()-KMSYUUBINNO          PIC  X(07).  *>�X�֔ԍ�
               07      ()-KMSKANA.                          *>�J�i�Z��
                 09    ()-KMSKENKANA           PIC  X(08).  *>����
                 09    ()-KMSJUSHOKANA         PIC  X(42).  *>�Z����
                 09    ()-KMSBANCHIKANA        PIC  X(15).  *>�Ԓn
                 09    ()-KMSKATAKANA          PIC  X(32).  *>����
               07      ()-KMSKAN.                           *>�����Z��
                 09    ()-KMSJUSHOKAN          PIC  N(25).  *>�Z����
                 09    ()-KMSBANCHIKAN         PIC  N(15).  *>�Ԓn
                 09    ()-KMSKATAKAN           PIC  N(32).  *>����
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>�z�X�g������
             05        ()-HOSTSHORITIME        PIC  X(06).  *>�z�X�g��������
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>�T�[�o�X�V��
