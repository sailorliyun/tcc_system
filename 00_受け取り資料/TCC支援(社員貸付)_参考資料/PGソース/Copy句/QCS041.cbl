      *8...........2.........3.........4.........5........6........7.........8
      *    QCS041(QTS055)
      ****************************************************************
      *                ���p���׍s�t�@�C��                            *
      *                             DATA-WRITTEN  99.02.16           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   * 
      ****************************************************************    
           03          ()-SEG.                          *>���p����
             05        ()-PRM.                          *>�L�[
               07      ()-PRMROKE.                      *>���P�[�V�����L�[
                 09    ()-PRMKIGYOUCD       PIC  9(04). *>��ƃR�[�h
                 09    ()-PRMSUBRANGEKEY    PIC  9(04). *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO   PIC  9(08). *>��������ԍ�
               07      ()-PRMTORIHIKINO     PIC  9(07). *>����ʔ�
               07      ()-PRMGYOUNO         PIC  9(02). *>�s�m��
             05        ()-DENPYOUNO         PIC  X(12). *>�`�[�m�n
             05        ()-RECKBN            PIC  X(01). *>���R�[�h�敪
             05        ()-KAIJYOKBN         PIC  X(01). *>�����敪
             05        ()-AKAKUROKBN        PIC  X(01). *>�ԍ���\���敪
             05        ()-SEIKYUHORYUKBN    PIC  X(01). *>�����ۗ��敪
             05        ()-DENPYOUSHUBETSU   PIC  9(04). *>�`�[���
             05        ()-BATCHNO           PIC  9(04). *>�o�b�`�m�n
             05        ()-GNO.                          *>�f�|�m�n
               07      ()-GNOBATCHNO        PIC  9(04). *>�f�o�b�`�m�n
               07      ()-GNOSEQUENCE       PIC  9(03). *>�f�`�[�V�[�P���X
             05        ()-CARDNO            PIC  9(16). *>�J�[�h�ԍ�
             05        ()-RIYOUBI           PIC  9(08). *>���p��
             05        ()-UKETSUKEBI        PIC  9(08). *>��t��
             05        ()-KEIJYOUBI         PIC  9(08). *>�v���
             05        ()-HASSEITEN         PIC  9(02). *>�����X
             05        ()-KAMEITENNO        PIC  X(10). *>�����X�m�n
             05        ()-POS.                          *>�o�n�r�[�����
               07      ()-POSREGNO          PIC  9(04). *>�o�n�r���W�m�n
               07      ()-POSTORIHIKINO     PIC  9(05). *>�o�n�r����m�n
             05        ()-TANMATSU          PIC  X(09). *>�b�c�[�����
             05        ()-KAK.                          *>�یW
               07      ()-KAKA.                         *>����
                 09    ()-KAKAKAATSUKAI     PIC  9(02). *>��
                 09    ()-KAKAKAKA          PIC  9(02). *>��
               07      ()-KAKKKAKARIKAKARI  PIC  9(02). *>�W
             05        ()-SAICD             PIC  9(03). *>�ÃR�[�h
             05        ()-TKURIAGETUUBAN    PIC  9(13). *>��g����ʔ�
             05        ()-GYOUSU            PIC  9(02). *>�s��
             05        ()-GYOUMEISAI.                   *>�s����
               07      ()-GMSHINGUNCDG.                 *>�i�Q�R�[�h
                 09    ()-GMSBUMON          PIC  9(02). *>����
                 09    ()-GMSHINGUNCD       PIC  9(03). *>�i�Q
                 09    ()-GMSHGCHECKDIGIT   PIC  9(01). *>�b�^�c
               07      ()-GMSHINMEICDG.                 *>�i���R�[�h
                 09    ()-GMSFLOOR          PIC  9(01). *>�t���A�[
                 09    ()-GMSHINMEICD       PIC  9(03). *>�R�[�h
                 09    ()-GMSHMCHECKDIGIT   PIC  9(01). *>�b�^�c
               07      ()-GMSSEIKYUKANJI    PIC  N(20). *>��������
               07      ()-GMSHINMEISAISAI   PIC  X(04). *>�i���ׁX�R�[�h
               07      ()-GMSSEIKYUSAKUIN   PIC  X(01). *>���������R�[�h
               07      ()-GMSSURYOU         PIC  9(07).9(02). *>����
               07      ()-GMSTANKA          PIC S9(07)  *>�P��
                                            SIGN LEADING SEPARATE.
               07      ()-GMSKNG            PIC S9(11)  *>���z
                                            SIGN LEADING SEPARATE.
               07      ()-GMSJYOGAIKBN      PIC  X(01). *>�������O�敪
               07      ()-GMSBUBIKIGAKU     PIC S9(09)  *>�����z
                                            SIGN LEADING SEPARATE.
               07      ()-GMSZEIKBN         PIC  X(01). *>�ŋ敪
               07      ()-GMSKANKINKBN      PIC  X(01). *>�����敪
               07      ()-GMSGETSUREICD     PIC  X(01). *>���߃R�[�h
               07      ()-GMSMAESHOUHIZEI   PIC S9(09)  *>�����O�����
                                            SIGN LEADING SEPARATE.
               07      ()-GMSPOINT.                     *>�����|�C���g���
                 09    ()-GMSTSUUJYOU.                  *>�ʏ핪
                   11  ()-GMSPOINTRITSU     PIC  99.99. *>�����|�C���g��
                   11  ()-GMSGAKUPOINTSU    PIC S9(11)  *>�����z�|�C���g��
                                            SIGN LEADING SEPARATE.
                 09    ()-GMSBONASU.                    *>�{�[�i�X�� 
                   11  ()-GMSBOPOINTRITSU   PIC  99.99. *>�����|�C���g�� 
                   11  ()-GMSBOGAKUPOINTSU  PIC S9(11)  *>�����z�|�C���g��
                                            SIGN LEADING SEPARATE.
             05        ()-HOSTSHORIYMD      PIC  X(08). *>�z�X�g������
             05        ()-HOSTSHORITIME     PIC  X(06). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>�T�[�o�X�V��
             05        ()-JGIANBUNGAKU      PIC S9(11)  *>���O���z
                                            SIGN LEADING SEPARATE.
             05        ()-SHJANBUNJUNI      PIC  9(02). *>���O������



