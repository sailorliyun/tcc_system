      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS110(QTA110)
      ****************************************************************
      *                    �u���b�N�e�[�u��                          *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   * 
      *   000001   ���C�A�E�g�ύX�̈�            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                          *>�u���b�N�e�[�u��
             05        ()-PRM.            
               07      ()-PRMBLACKNO        PIC  9(08). *>�u���b�N�m�n
             05        ()-TEN.
               07      ()-TENEIGYOUCD       PIC  9(02). *>�c�ƓX�R�[�h
               07      ()-TENKAKUTOKU       PIC  9(02). *>�l���X
             05        ()-TOUROKU.
               07      ()-TOUROKUYMD        PIC  9(08). *>�o�^��
               07      ()-TOUROKUKBN        PIC  9(01). *>�o�^�敪
             05        ()-BLACK.         
               07      ()-BLACKRIYU         PIC  9(02). *>�u���b�N���R
               07      ()-BLACKRIYUTUIKI    PIC  N(10). *>�u���b�N���R(�ǋL)
             05        ()-UKETSUKENO        PIC  9(08). *>��t�ԍ�
             05        ()-KAIINNO           PIC  9(12). *>����ԍ�
             05        ()-HON.
               07      ()-HONSHIMEI.
                 09    ()-HONSHIMEIKANA     PIC  X(30). *>�J�i����(�@�l��)
                 09    ()-HONSHIMEIKAN      PIC  N(15). *>��������(�@�l��)
                 09    ()-HONSEINENGAPPI    PIC  9(08). *>���N����
               07      ()-HONSEX            PIC  9(01). *>����
               07      ()-YUUBINNO          PIC  X(07). *>�X�֔ԍ�
               07      ()-CHIBAN            PIC  X(03). *>�n��
             05        ()-JTK.                          *>����^�@�l
               07      ()-JTKTEL.                       *>�s�d�k 
                 09    ()-JTKTELSHIGAI      PIC  X(07). *>�s�O�ǔ�
                 09    ()-JTKTELKYOKU       PIC  X(04). *>�d�b�ǔ�
                 09    ()-JTKTELNO          PIC  X(04). *>�d�b�ԍ�
               07      ()-JTKJUSHOCD        PIC  9(11). *>�Z���R�[�h
               07      ()-JTKKANA.                      *>�Z���J�i
                 09    ()-JTKBANCHIKANA     PIC  X(15). *>�Ԓn�J�i
                 09    ()-JTKKATAKANA       PIC  X(32). *>�����J�i
               07      ()-JTKKAN.                       *>�Z������
                 09    ()-JTKBANCHIKAN      PIC  N(15). *>�Ԓn����
                 09    ()-JTKKATAKAN        PIC  N(32). *>��������
             05        ()-KMS.                          *>�Ζ���
               07      ()-KMSKBN            PIC  9(01). *>�敪
               07      ()-KMSTEL.                       *>�s�d�k
                 09    ()-KMSTELSHIGAI      PIC  X(07). *>�s�O�ǔ�
                 09    ()-KMSTELKYOKU       PIC  X(04). *>�d�b�ǔ�
                 09    ()-KMSTELNO          PIC  X(04). *>�d�b�ԍ�
               07      ()-KMSMEI.                       *>����
                 09    ()-KMSMEIKANA        PIC  X(30). *>���̃J�i
                 09    ()-KMSMEIKAN         PIC  N(15). *>���̊���
               07      ()-KMSJUSHOCD        PIC  9(11). *>�Z���R�[�h
               07      ()-KMSKANA.                      *>�Z���J�i 
                 09    ()-KMSBANCHIKANA     PIC  X(15). *>�Ԓn�J�i
                 09    ()-KMSKATAKANA       PIC  X(32). *>�����J�i
               07      ()-KMSKAN.                       *>�Z������
                 09    ()-KMSBANCHIKAN      PIC  N(15). *>�Ԓn����
                 09    ()-KMSKATAKAN        PIC  N(32). *>��������
             05        ()-CIFNO             PIC  9(08). *>�b�h�e�m�n
             05        ()-CARDKBN           PIC  9(06). *>�J�[�h�敪
             05        ()-CDSKNNAME         PIC  X(30). *>�R���f���X���Ȏ���
             05        ()-CDSKNKINNAME      PIC  X(30). *>�R���f���X�Ζ��於
             05        ()-CDSJITAKUTEL      PIC  X(14). *>�R���f���X����s�d�k
             05        ()-CDSKINTEL         PIC  X(14). *>�R���f���X�Ζ���s�d�k
             05        ()-HOSTSHORIYMD      PIC  X(08). *>�z�X�g������
             05        ()-HOSTSHORITIME     PIC  X(06). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>�T�[�o�X�V��
