      *8...........2.........3.........4.........5........6........7.........8  
      *    QCS011(QTS010(QTA010))
      ****************************************************************
      *                ����}�X�^                                    *
      *                             DATA-WRITTEN  04.08.04           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   * 
      ****************************************************************    
           03          ()-SEG.                              *>����}�X�^
             05        ()-PRM.                              *>�G���g���[�L�[
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>��ƃR�[�h
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>��������ԍ�
               07      ()-PRMRIYOUSHACD        PIC  X(01).  *>�{�l�^�Ƒ�����
             05        ()-TKSCARDNO            PIC  X(16).  *>�b�r�s�J�[�h�ԍ�
             05        ()-KIKKYUUNO            PIC  9(12).  *>�����b�r�s�J�[�h�ԍ�
             05        ()-NYKUKETSUKENO        PIC  9(08).  *>��t�ԍ�
             05        ()-CARDKBN              PIC  9(06).  *>�J�[�h�敪
             05        ()-HON.                              *>�ڋq�������
               07      ()-HONSHIMEIKAN         PIC  N(10).  *>��������
               07      ()-HONSHIMEIKANA        PIC  X(30).  *>�J�i����
               07      ()-HONSEX               PIC  X(01).  *>����
               07      ()-HONSEINENGAPPI       PIC  9(08).  *>���N����
               07      ()-YUKOKIGEN            PIC  9(06).  *>�L������
               07      ()-NYKKESSAIYMD         PIC  9(08).  *>�o�^�N�����i������j
             05        ()-JTK.                              *>������
               07      ()-JTKYUUBINNO          PIC  X(07).  *>�X�֔ԍ�
               07      ()-JTKJUSHOCD           PIC  9(11).  *>�Z���R�[�h
               07      ()-JTKKAN.                           *>�����Z��
                 09    ()-JTKJUSHOKAN          PIC  N(25).  *>�s���{�����`�����ڊ���
                 09    ()-JTKBANCHIKAN         PIC  N(15).  *>�Ԓn����
                 09    ()-JTKKATAKAN           PIC  N(30).  *>��������
               07      ()-JTKKANA.                          *>�����Z��
                 09    ()-JTKKENKANA           PIC  X(08).  *>�s���{�����J�i
                 09    ()-JTKJUSHOKANA         PIC  X(42).  *>�s��S�`�����ڃJ�i
                 09    ()-JTKBANCHIKANA        PIC  X(15).  *>�Ԓn�J�i
                 09    ()-JTKKATAKANA          PIC  X(32).  *>�����J�i
               07      ()-JTKTEL.                           *>�d�b�ԍ�
                 09    ()-JTKTELSHIGAI         PIC  X(07).  *>�s�O�ǔ�
                 09    ()-JTKTELKYOKU          PIC  X(04).  *>�ǔ�
                 09    ()-JTKTELNO             PIC  X(04).  *>�ԍ�
               07      ()-HONKEITAITEL         PIC  X(11).  *>�g�ѓd�b�ԍ�
             05        ()-SEKYU.                            *>���������t��Z��
               07      ()-SEKYUYUUBINNO        PIC  X(08).  *>�X�֔ԍ�
               07      ()-SEKYUKENKAN          PIC  N(04).  *>�s���{����
               07      ()-SEKYUJUSHOKAN        PIC  N(50).  *>�s��S�`������
               07      ()-SEKYUBANCHIKAN       PIC  N(30).  *>�Ԓn�E����
             05        ()-PNT.                              *>�����ԍ����
               07      ()-PNTSHINNO            PIC  9(04).  *>�����ԍ�
               07      ()-PNTKYUUNO            PIC  9(04).  *>�������ԍ�
               07      ()-PNTHENKOUYMD         PIC  9(08).  *>�����ԍ��o�^�^�ύX��
             05        ()-TENKANRI             PIC  X(02).  *>�Ǘ��X
             05        ()-TENKAKUTOKU          PIC  X(02).  *>�l���X
             05        ()-TENDM                PIC  X(02).  *>�c�l�X
             05        ()-DMKBN                PIC  X(01).  *>�c�l�������ۋ敪
             05        ()-DMKBNHENKOUYMD       PIC  9(08).  *>DM�������ۋ敪�ݒ��
             05        ()-ATU.                              *>�l���ҏ��
               07      ()-ATUKAKARI            PIC  X(09).  *>�l���ҁE����
               07      ()-KTKSHOUKAISHACD      PIC  X(08).  *>�S���҃R�[�h
             05        ()-STS.                              *>�b�r�X�e�[�^�X�e�[�u��
               07      ()-STSKBN               PIC  9(01).  *>�b�r�X�e�[�^�X
               07      ()-STSKBNTOROKUYMD      PIC  9(08).  *>�b�r�X�e�[�^�X�ݒ��
             05        ()-CIFNO                PIC  9(08).  *>�b�h�e�ԍ�
             05        ()-SHIKIBETSUNO         PIC  9(09).  *>�E�������ʔԍ�
             05        ()-KOKYOKU              PIC  X(02).  *>�ڋq�敪
             05        ()-TOUYMD               PIC  9(08).  *>�쐬��
             05        ()-KOUYMD               PIC  9(08).  *>�X�V��
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>�z�X�g������
             05        ()-HOSTSHORITIME        PIC  X(06).  *>�z�X�g��������
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>�T�[�o�X�V��
