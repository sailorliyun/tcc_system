      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS020(QTA020)
      ****************************************************************
      *                ����Ƒ��t�@�C��                              *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   *
      *   000001   ���C�A�E�g�ύX�̈�            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                              *>����Ƒ� 
             05        ()-PRM.                              *>�G���g���[�L�[
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>��ƃR�[�h
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>��������ԍ�  
               07      ()-PRMRIYOUSHACD        PIC  9(01).  *>���p�҃R�[�h 
             05        ()-NYUKAIYMD            PIC  9(08).  *>����N����
             05        ()-KZK.                              *>�Ƒ���{���
               07      ()-KZKSIMEI.                         *>���� 
                 09    ()-KZKSHIMEIKANA        PIC  X(15).  *>�J�i
                 09    ()-KZKSHIMEIROMA        PIC  X(30).  *>���[�}��
                 09    ()-KZKSHIMEIKAN         PIC  N(15).  *>����
               07      ()-KZKSEINENGAPPI       PIC  9(08).  *>���N����
               07      ()-KZKSEX               PIC  9(01).  *>����
               07      ()-KZKZOKUGARA          PIC  9(01).  *>����
             05        ()-CDH.                              *>�J�[�h�������
               07      ()-CDHHAKKOUKBN         PIC  9(01).  *>�J�[�h���s�敪
               07      ()-CDHYMD               PIC  9(08).  *>�J�[�h������
             05        ()-CIFNO                PIC  9(08).  *>�b�h�e�ԍ�
             05        ()-EDABAN               PIC  9(01).  *>�}��
             05        ()-TKS.                              *>��g����
               07      ()-TKSHENREIYMD         PIC  9(08).  *>�Ԗߓ�
               07      ()-TKSRIYUCD            PIC  X(03).  *>���R�R�[�h
               07      ()-TKSCARDNO            PIC  9(16).  *>�J�[�h�ԍ�
             05        ()-ANS.                              *>�Ïؔԍ����
               07      ()-ANSGEN               PIC  9(04).  *>�Ïؔԍ�
               07      ()-ANSKYUU              PIC  9(04).  *>���Ïؔԍ�
               07      ()-ANSHENKOUYMD         PIC  9(08).  *>�ύX��
             05        ()-CLUBCD               PIC  9(02).  *>�N���u�R�[�h
             05        ()-STSG.                             *>�X�e�[�^�X���
               07      ()-STSTOUROKUYMD        PIC  9(08).  *>�o�^��
               07      ()-STS                  PIC  9(04).  *>�X�e�[�^�X
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>�z�X�g������
             05        ()-HOSTSHORITIME        PIC  X(06).  *>�z�X�g��������
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>�T�[�o�X�V��
