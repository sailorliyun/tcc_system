      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS150(QTA150)
      ****************************************************************
      *                �R�[�h�e�[�u��                                *
      *                             DATA-WRITTEN  99.01.14           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   *
      *   000001   ���C�A�E�g�ύX�̈�            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                        *>�R�[�h�e�[�u��
             05        ()-PRM.                        *>�G���g���[�L�[
               07      ()-PRMCODEKBN     PIC  X(03).  *>�R�[�h�敪
               07      ()-PRMCODENO      PIC  X(04).  *>�R�[�h�ԍ�
             05        ()-MEI            PIC  N(40).  *>���́i���{��j 
             05        ()-SUUCHIBU       PIC  X(60).  *>���l��
             05        ()-CODEMEIKATA    REDEFINES    
                                         ()-SUUCHIBU. *>�R�[�h���̒�    
               07      ()-KETASUU        PIC  9(03).  *>���̗L������
               07      FILLER            PIC  X(57).  *>�\��
             05        ()-GND            REDEFINES 
                                         ()-SUUCHIBU. *>���x�z�e�[�u�� 
               07      ()-GNDSOU         PIC  9(05).  *>�����x�z
               07      ()-GNDNOBE        PIC  9(05).  *>�q�ו������x�z
               07      ()-GNDQCKIKAN     PIC  9(05).  *>�p���ފ��ԗ^�M 
               07      ()-GNDQCGEKKAN    PIC  9(05).  *>�p���ތ��ԗ^�M
               07      FILLER            PIC  X(40).  *>�\��
             05        ()-KGN            REDEFINES 
                                         ()-SUUCHIBU. *>�����e�[�u��
               07      ()-KGNYMD         PIC  9(08).  *>�����N����
               07      FILLER            PIC  X(52).  *>�\��
             05        ()-STS            REDEFINES 
                                         ()-SUUCHIBU. *>�X�e�[�^�X���
               07      ()-STSKANRITANI   PIC  X(01).  *>�Ǘ��P��
               07      ()-STSS.                       *>�X�e�[�^�X
                 09    ()-STSSYURUI      PIC  9(02).  *>���
                 09    ()-STSSYOSAI      PIC  9(02).  *>�ڍ�
                 09    ()-STSJYUYOUDO    PIC  9(04).  *>�d�v�x
                 09    ()-STSPOSCD       PIC  9(02).  *>�o�n�r�R�[�h
                 09    ()-STSSOEJIKOZA   PIC  9(02).  *>�Y���i�����j
                 09    ()-STSSOEJICARD   PIC  9(02).  *>�Y���i�J�[�h�j
               07      ()-STSH.                       *>�\��ү���ޏ��
                 09    ()-STSHOST        PIC  N(05).  *>�z�X�g
               07      FILLER            PIC  X(35).  *>�\��
             05        ()-KYK            REDEFINES 
                                         ()-SUUCHIBU. *>�ڋq�萔����
               07      ()-T0260.                      *>���ؗ���
                 09    ()-KYKENTS1       PIC  99V99.  *>�r�P��
                 09    ()-KYKENTS2       PIC  99V99.  *>�r�Q��
                 09    ()-KYKENTB1       PIC  99V99.  *>�r�{�P
                 09    ()-KYKENTB2       PIC  99V99.  *>�r�{�Q
                 09    ()-KYKENTKAPPU    PIC  99V99.  *>�r����
                 09    ()-KYKENTRIVO     PIC  99V99.  *>�r���{
                 09    ()-KYKENTC1       PIC  99V99.  *>�b�P��
                 09    ()-KYKENTC2       PIC  99V99.  *>�b���{
               07      FILLER            PIC  X(28).  *>�\��
             05        ()-HBT            REDEFINES 
                                         ()-SUUCHIBU. *>��ޥʲ���ݽ���
               07      ()-HBTTBL         OCCURS  6.   *>ʲ���ݽð���
                 09    ()-HBTRIPO        PIC  9(05).  *>���{�c�����
                 09    ()-HBTYAKU        PIC  9(05).  *>���ԍϊz              
             05        ()-DEN            REDEFINES
                                         ()-SUUCHIBU. *>�`�[��ʏ��
               07      ()-DENSOUSEIKBN   PIC  X(01).  *>�`�[�n���敪
               07      ()-DENNIKKEIKBN   PIC  X(01).  *>���v�\�W�v�敪
               07      FILLER            PIC  X(58).  *>�\��
             05        ()-TKS            REDEFINES 
                                         ()-SUUCHIBU. *>�X�Ԍ��Ϗ��
               07      ()-TKSRITU        PIC  99V99   *>�萔���� 
                                         OCCURS 10.        
               07      FILLER            PIC  X(20).  *>�\��
             05        ()-CSH            REDEFINES 
                                         ()-SUUCHIBU. *>����ݸޗ���
               07      ()-CSHRITU        PIC  99V99.  *>������
               07      FILLER            PIC  X(56).  *>�\��
             05        ()-TES            REDEFINES 
                                         ()-SUUCHIBU. *>����ݸސ��Z���
               07      ()-TESSIMEBI      PIC  9(02).  *>���Z����
               07      ()-TESRIYOU0      PIC  9(05).  *>���p�萔���P�� 
               07      ()-TESJIKANGAI    PIC  9(05).  *>���ԊO�萔���P�� 
               07      ()-TESTORIATUKAI  PIC  99V99.  *>�戵�萔���� 
               07      FILLER            PIC  X(44).  *>�\��
             05        ()-ZEI            REDEFINES 
                                         ()-SUUCHIBU. *>����ŏ��
               07      ()-ZEIRITU        PIC  99V99.  *>�����
               07      FILLER            PIC  X(56).  *>�\��
             05        ()-HOSTSHORIYMD   PIC  X(08).  *>�z�X�g������
             05        ()-HOSTSHORITIME  PIC  X(06).  *>�z�X�g��������
             05        ()-SVRKOUSHINYMD  PIC  9(08).  *>�T�[�o�X�V��
