      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS130(QTA130)
      ****************************************************************
      *                �J�[�h�Ǘ��e�[�u��                            *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   *
      *   000001   ���C�A�E�g�ύX�̈�            FIP      99/03/06   *
      *   000002   ���C�A�E�g�ύX�̈� (ICMSKBN)  FIP      02/08/20   *
      ****************************************************************    
           03          ()-SEG.                          *>�J�[�h�Ǘ�
             05        ()-G0010.                        *>�G���g���[�L�[
               07      ()-PRMCARDKBN       PIC  9(06).  *>�J�[�h�敪
             05        ()-CDKMEI           PIC  N(10).  *>�J�[�h����
             05        ()-G0030.                        *>�戵���i
               07      ()-T0030.                        *>�V���b�s���O
                 09    ()-TRSSYOKU1        PIC  9(01).  *>���P��
                 09    ()-TRSSYOKU2        PIC  9(01).  *>���Q��
                 09    ()-TRSSBONUS1       PIC  9(01).  *>�{�[�i�X�P��
                 09    ()-TRSSBONUS2       PIC  9(01).  *>�{�[�i�X�Q��
                 09    ()-TRSSKAPPU        PIC  9(01).  *>����
                 09    ()-TRSSREVOLVING    PIC  9(01).  *>���{���r���O
                 09    ()-TRSSGENURI       PIC  9(01).  *>�E������
                 09    ()-TRSSKAKEURI      PIC  9(01).  *>�E���|��
               07      ()-T0110.                        *>�L���V���O
                 09    ()-TRSCREVOLVING    PIC  9(01).  *>���{���r���O
                 09    ()-TRSCYOKU1        PIC  9(01).  *>���P��
             05        ()-HESHOUHOU        PIC  9(01).  *>�ԍϕ��@
             05        ()-HESYOTEIYMD      PIC  9(02).  *>�x���\���
             05        ()-G0201.                        *>���{��z
               07      ()-T0201.                        *>�V���b�s���O
                 09    ()-REVSMAITSUKI     PIC  9(01).  *>������
                 09    ()-REVSBONUS        PIC  9(02).  *>�{�[�i�X��
               07      ()-T0203.                        *>�L���V���O
                 09    ()-REVCMAITSUKI     PIC  9(01).  *>������  
                 09    ()-REVCBONUS        PIC  9(02).  *>�{�[�i�X��  
             05        ()-CDHHAKKOUKBN     PIC  9(01).  *>�J�[�h���s�敪
             05        ()-CDHYUSOKBN       PIC  9(01).  *>�X���敪               
             05        ()-CDHSHIJIKBN      PIC  9(01).  *>���s�w���敪
             05        ()-G0240.                        *>�J�[�h���
               07      ()-CDHUMU           PIC  9(01).  *>�J�[�h���s�L��
               07      ()-CDHIRO           PIC  9(02).  *>�F
               07      ()-CDHGARA          PIC  9(02).  *>��
             05        ()-G0270.                        *>���
               07      ()-NENKAIHI         PIC  9(09).  *>�N���
             05        ()-BBKSHUBETSU      PIC  9(01).  *>�������
             05        ()-G0280.                        *>������
               07      ()-BBK1KAIRITSU     PIC  9(02).  *>�P�񕥂�������
               07      ()-BBK1BONUSRITSU   PIC  9(02).  *>�ްŽ�P�񕥂������� 
             05        ()-BBKSHOKUINRITSU  PIC  9(02).  *>�E������������
             05        ()-YUKOKIKAN        PIC  9(02).  *>�L������
             05        ()-G0320.                        *>�����敪    
               07      ()-UKETOUROKUKBN    PIC  9(01).  *>��t�o�^�敪
               07      ()-KAIINNOKBN       PIC  9(01).  *>����ԍ��敪
               07      ()-KAZOKUHAKKENKAHI PIC  9(01).  *>�Ƒ��J�[�h������
               07      ()-YOSHINSHINKYUU   PIC  9(01).  *>�^�M���x�z �V���敪
               07      ()-10OR16KETAKBN    PIC  9(01).  *>10��16���敪
               07      ()-AUTOSCORING      PIC  9(01).  *>�I�[�g�X�R�A�����O
               07      ()-YSNCASHGENDO     PIC  9(01).  *>����ݸތ��x�z
               07      ()-YSNZANKANRI      PIC  9(01).  *>�c���Ǘ�
             05        ()-G0371.                        *>�^�M���x�z�i�E���j
               07      ()-YSNSHOKUINGENDO  PIC  9(05).  *>�E�������^�M���x�z
               07      ()-YSNKAKEURIGENDO  PIC  9(05).  *>���|���^�M���x�z
             05        ()-G0380.                        *>�X�R�A�����Oð���
               07      ()-P0380      OCCURS 10.         *>�z�_�\ 
                 09    ()-SCRBAIRITSU      PIC  9(01).  *>�{�� 
                 09    ()-Q0390      OCCURS  6.         *>�z�_�\�Q
                   11  ()-SCRHAITEN        PIC  9(02).  *>�z�_
               07      ()-T0400      OCCURS 20.         *>�����\�M�����N��� 
                 09    ()-SYS              PIC  9(03).  *>�����\�M�����N
             05        ()-G0410.                        *>�ܔ���`�f�[�^
               07      ()-GHTKBN           PIC  9(02).  *>�ܔ��敪
               07      ()-GHTBUNRUI        PIC  9(02).  *>�ܔ�����
               07      ()-GHTTEIKEIKBN     PIC  9(01).  *>��g�敪
               07      ()-GHTKAKAKARI      PIC  9(06).  *>���یW
               07      ()-GHTGINKOCD       PIC  9(04).  *>��s�R�[�h
               07      ()-GHTSITENCD       PIC  9(03).  *>�x�X�R�[�h
             05        ()-KIGYOUCDBUNRUI   PIC  9(01).  *>��ƃR�[�h����
             05        ()-MISECDINDEX      PIC  9(01).  *>�X�R�[�h�h�c�w
             05        ()-SAIBANCARDKBN    PIC  9(06).  *>�̔ԗp�J�[�h�敪
             05        ()-G0500.                        *>�^�M���x�z���̋敪
               07      ()-YSNKYUUCARDMEI   PIC  X(01).  *>���J�[�h
               07      ()-YSNSHINCARDMEI   PIC  X(01).  *>�V�J�[�h
             05        ()-SEIKYUSYO        PIC  X(01).  *>���������
             05        ()-G0530            OCCURS  2.   *>�L���b�V���O
               07      ()-CAHYAKUJO        PIC  99.99.  *>��藘��
             05        ()-G0540            OCCURS  2.   *>�L���b�V���O
               07      ()-CAHENTAI         PIC  99.99.  *>���ؗ���
             05        ()-G0550.                        *>���j�b�g�Ǘ����
               07      ()-DOFUBUTSUGROUP   PIC  X(01).  *>�������O���[�v
               07      ()-HUTOSHUBETSU     PIC  X(01).  *>�������
               07      ()-RYUCHIKBN        PIC  X(01).  *>���u�敪
               07      ()-BUBIKIKBN        PIC  9(01).  *>�����^�|�C���g�敪
               07      ()-NYUKAIKANRIKBN   PIC  9(01).  *>�T�[�o����Ǘ��敪
             05        ()-HOSTSHORIYMD     PIC  X(08).  *>�z�X�g������
             05        ()-HOSTSHORITIME    PIC  X(06).  *>�z�X�g��������
             05        ()-SVRKOUSHINYMD    PIC  9(08).  *>�T�[�o�X�V��
             05        ()-ICMSKBN          PIC  X(01).  *>�h�b�^�l�r�敪
