      *8...........2.........3.........4.........5........6........7.........8
      *    QTS012
      ****************************************************************
      *                �J�[�h�X�V�C���^�[�t�F�[�X�i�Ƒ��j            *
      *                             DATA-WRITTEN  99.01.16           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   *
      ****************************************************************
           03          ()-SEG.                              *>�J�[�h�X�V
             05        ()-PRM.                              *>�G���g���[�L�[
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>��ƃR�[�h
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>��������ԍ�
             05        ()-KZK.                              *>�Ƒ����e�[�u��
               07      ()-KZKK.                             *>�Ƒ���{���
                 09    ()-PRMRIYOUSHACD        PIC  9(01).  *>���p�҃R�[�h
                 09    ()-NYUKAIYMD            PIC  9(08).  *>����N����
                 09    ()-KZKNM.                            *>����
                   11  ()-KZKSHIMEIKANA        PIC  X(15).  *>�J�i
                   11  ()-KZKSHIMEIROMA        PIC  X(30).  *>���[�}��
                   11  ()-KZKSHIMEIKAN         PIC  N(15).  *>����
                 09    ()-KZKSEINENGAPPI       PIC  9(08).  *>���N����
                 09    ()-KZKSEX               PIC  9(01).  *>����
                 09    ()-KZKANS.                           *>�Ïؔԍ����
                   11  ()-ANSGEN               PIC  9(04).  *>�Ïؔԍ�
                   11  ()-ANSKYUU              PIC  9(04).  *>���Ïؔԍ�
                   11  ()-ANSHENKOUYMD         PIC  9(08).  *>�ύX��
               07      ()-ST.                               *>�Ƒ��X�e�[�^�X
                 09    ()-STSTOUROKUYMD        PIC  9(08).  *>�o�^��
                 09    ()-STS                  PIC  9(04).  *>�X�e�[�^�X
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>�z�X�g������
             05        ()-HOSTSHORITIME        PIC  X(06).  *>�z�X�g��������
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>�T�[�o�X�V��
