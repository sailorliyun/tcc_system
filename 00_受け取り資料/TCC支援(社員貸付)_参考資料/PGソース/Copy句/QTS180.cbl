      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS180(QTA180)
      ****************************************************************
      *                     �X�e�[�u��                               *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   *
      *   000001   ���C�A�E�g�ύX�̈�            FIP      99/03/06   *
      ****************************************************************    
           03            ()-SEG.                         *>�X�e�[�u�� 
             05          ()-PRM.                         *>�X�e�[�u���L�[   
               07        ()-PRMKIGYOUCD      PIC  X(04). *>��ƃR�[�h
               07        ()-PRMEIGYOUTENCD   PIC  X(02). *>�c�ƓX�R�[�h
               07        ()-PRMYU.                       *>�L������
                 09      ()-PRMYUKOKAISI     PIC  9(08). *>�J�n��
                 09      ()-PRMYUKOOWARI     PIC  9(08). *>�I����
             05          ()-ETN.                         *>�X�e�[�u�����̈�
               07        ()-ETNMEI.                      *>�c�ƓX����
                 09      ()-ETNMEIKANA       PIC  X(20). *>�J�i
                 09      ()-ETNMEIKAN        PIC  N(20). *>����
               07        ()-CDKBN            OCCURS 10.  *>�J�[�h�敪���
                 09      ()-KTN.                         *>��ГX���
                   11    ()-KTNCODE          PIC  X(02). *>��ГX�R�[�h
                   11    ()-KTNMEI.                      *>��ГX����
                     13  ()-KTNMEIKANA       PIC  X(20). *>�J�i
                     13  ()-KTNMEIKAN        PIC  N(20). *>����
                 09      ()-CTN.                         *>�Ǘ��X���
                   11    ()-CTNCODE          PIC  X(02). *>�Ǘ��X�R�[�h
                   11    ()-CTNMEI.                      *>�Ǘ��X����
                     13  ()-CTNMEIKANA       PIC  X(20). *>�J�i
                     13  ()-CTNMEIKAN        PIC  N(20). *>����
                 09      ()-JHB.                         *>���Ɩ{��
                   11    ()-JHBCODE          PIC  X(02). *>���Ɩ{���R�[�h
                   11    ()-JHBMEI.                      *>���Ɩ{������
                     13  ()-JHBMEIKANA       PIC  X(20). *>�J�i
                     13  ()-JHBMEIKAN        PIC  N(20). *>����
               07        ()-SKZNO.                       *>�W��������
                 09      ()-SKZNO1           PIC  X(16). *>�W������ԍ��P
                 09      ()-SKZNO2           PIC  X(16). *>�W������ԍ��Q
                 09      ()-SKZNO3           PIC  X(16). *>�W������ԍ��R
                 09      ()-SKZNO4           PIC  X(16). *>�W������ԍ��S
                 09      ()-SKZNO5           PIC  X(16). *>�W������ԍ��T
                 09      ()-SKZNO6           PIC  X(16). *>�W������ԍ��U
                 09      ()-SKZNO7           PIC  X(16). *>�W������ԍ��V
                 09      ()-SKZNO8           PIC  X(16). *>�W������ԍ��W
                 09      ()-SKZNO9           PIC  X(16). *>�W������ԍ��X
                 09      ()-SKZNO10          PIC  X(16). *>�W������ԍ��P�O
             05          ()-TOUZAIKBN        PIC  X(01). *>�����敪
             05          ()-KIG.                         *>��ƃR�[�h���̈�
                 07      ()-KIGYOUCD         PIC  X(04)  *>��ƃR�[�h
                                             OCCURS  6.  *>(�̔ԗp:���ދ敪��) 
             05          ()-SHOKUSAIBANKBN   PIC  X(02). *>�E���̔ԗp�敪
             05          ()-JSH.                         *>�Z��
               07        ()-JSHCODE          PIC  X(11). *>�Z���R�[�h
               07        ()-JSHYUBINNO       PIC  X(05). *>�X�֔ԍ�
               07        ()-JSHYUBINNOYOBI   PIC  X(03). *>�X�֔ԍ��\��
               07        ()-JSHKANA                    . *>�J�i
                 09      ()-JSHMEIKANA                 . *>�Z��
                   11    ()-JSHKENMEIKANA    PIC  X(08). *>����
                   11    ()-JSHCHOUMEKANA    PIC  X(42). *>�s��S�`������
                   11    ()-JSHBANCHIKANA    PIC  X(15). *>�Ԓn
                   11    ()-JSHKATAGAKIKANA  PIC  X(32). *>����
               07        ()-JSHKAN.                      *>����
                 09      ()-JSHMEIKAN.                   *>�Z��
                   11    ()-JSHJUSHOMEIKAN   PIC  N(25). *>�����`������
                   11    ()-JSHBANCHIKAN     PIC  N(15). *>�Ԓn
                   11    ()-JSHKATAGAKIKAN   PIC  N(32). *>����
             05          ()-TEL.                         *>�d�b�ԍ�
               07        ()-TELSHIGAI        PIC  X(07). *>�s�O�ǔ�
               07        ()-TELKYOKUBAN      PIC  X(04). *>�ǔ�
               07        ()-TELNO            PIC  X(04). *>�ԍ�
               07        ()-TELCHOKUTSU      PIC  X(01). *>���ʋ敪
               07        ()-MISESHUBETSU     PIC  X(01). *>�X���
               07        ()-ZANDAKASOUFU     PIC  N(10). *>�c���m�F�����t��
             05          ()-SHJ.                         *>���ԍ�
               07        ()-SHJZAIMUKYOKU    PIC  N(02). *>�����ǖ�
               07        ()-SHJKOUSINKAISU   PIC  9(01). *>�X�V��
               07        ()-SHJKYOKANO       PIC  X(05). *>�ԍ�
             05          ()-SHJM.                        *>�������\�����
               07        ()-SHJMISEMEI       PIC  N(12). *>�X��
               07        ()-SHJMISERYAKU     PIC  N(03). *>�X����
             05          ()-TES                        . *>۰ݎ萔���֘A���
               07        ()-TESUURYOUKBN     PIC  X(01). *>�萔����{�����x���敪
             05          ()-HOSTSHORIYMD     PIC  X(08). *>�z�X�g������
             05          ()-HOSTSHORITIME    PIC  X(06). *>�z�X�g��������
             05          ()-SVRKOUSHINYMD    PIC  9(08). *>�T�[�o�X�V��
