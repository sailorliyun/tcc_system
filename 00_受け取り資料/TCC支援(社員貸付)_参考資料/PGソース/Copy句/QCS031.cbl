      *8...........2.........3.........4.........5........6........7.........8
      *    QCS031(QTS050)
      ****************************************************************
      *                ���p���׃t�@�C��                              *
      *                             DATA-WRITTEN  04.07.15           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   *
      ****************************************************************
      *>���p����
           03          ()-SEG.
      *>�L�[
             05        ()-PRM.
      *>���P�[�V�����L�[
               07      ()-PRMROKE.
      *>��ƃR�[�h
                 09    ()-PRMKIGYOUCD       PIC  9(04).
      *>�T�u�����W�L�[
                 09    ()-PRMSUBRANGEKEY    PIC  9(04).
      *>��������ԍ�
               07      ()-PRMNAIBUKAIINNO   PIC  9(08).
      *>����ʔ�
               07      ()-PRMTORIHIKINO     PIC  9(07).
      *>�`�[�m�n
             05        ()-DENPYOUNO         PIC  X(12).
      *>���R�[�h�敪
             05        ()-RECKBN            PIC  X(01).
      *>�����敪
             05        ()-KAIJYOKBN         PIC  X(01).
      *>�ԍ���\���敪
             05        ()-AKAKUROKBN        PIC  X(01).
      *>�����ۗ��敪
             05        ()-SEIKYUHORYUKBN    PIC  X(01).
      *>�`�[���
             05        ()-DENPYOUSHUBETSU   PIC  9(04).
      *>�o�b�`�m�n
             05        ()-BATCHNO           PIC  9(04).
      *>�f�|�m�n
             05        ()-GNO.
      *>�f�o�b�`�m�n
               07      ()-GNOBATCHNO        PIC  9(04).
      *>�f�`�[�V�[�P���X
               07      ()-GNOSEQUENCE       PIC  9(03).
      *>�J�[�h�ԍ�
             05        ()-CARDNO            PIC  9(16).
      *>���p��
             05        ()-RIYOUBI           PIC  9(08).
      *>��t��
             05        ()-UKETSUKEBI        PIC  9(08).
      *>�v���
             05        ()-KEIJYOUBI         PIC  9(08).
      *>�����X
             05        ()-HASSEITEN         PIC  9(02).
      *>�����X�m�n
             05        ()-KAMEITENNO        PIC  X(10).
      *>�o�n�r�[�����
             05        ()-POS.
      *>�o�n�r���W�m�n
               07      ()-POSREGNO          PIC  9(04).
      *>�o�n�r����m�n
               07      ()-POSTORIHIKINO     PIC  9(05).
      *>�b�c�[�����
             05        ()-TANMATSU          PIC  X(09).
      *>�یW
             05        ()-KAK.
      *>����
               07      ()-KAKA.
      *>��
                 09    ()-KAKAKAATSUKAI     PIC  9(02).
      *>��
                 09    ()-KAKAKAKA          PIC  9(02).
      *>�W
               07      ()-KAKKKAKARIKAKARI  PIC  9(02).
      *>�ÃR�[�h
             05        ()-SAICD             PIC  9(03).
      *>��g����ʔ�
             05        ()-TKURIAGETUUBAN    PIC  9(13).
      *>�s��
             05        ()-GYOUSU            PIC  9(02).
      *>�s�m��
             05        ()-GYOUNO            PIC  9(02).
      *>���v�s
             05        ()-GKG.
      *>�x�����@ 
               07      ()-GKGSHIHARAIHOHO   PIC  9(02).
      *>���[�����
               07      ()-GKGLOANSHUBETSU   PIC  9(05).
      *>���p���z
               07      ()-GKGRIYOUKNG       PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>���i���
               07      ()-GKGSHOUHINDAIKIN  PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>������
               07      ()-GKGBUBIKIRITSU    PIC  9(02).
      *>�����z
               07      ()-GKGBUBIKIGAKU     PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>�����Ώۊz���v
               07      ()-GKGBUBIKITAISHOU  PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>�������O�z���v
               07      ()-GKGBUBIKIJYOGAI   PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>���F�ԍ�
               07      ()-GKGSHOUNINNO      PIC  9(07).
      *>������
               07      ()-GKGBUNKATSUKAISU  PIC  9(03).
      *>�{�[�i�X��
               07      ()-GKGBONUSKAISU     PIC  9(02).
      *>�{�[�i�X���Z�z
               07      ()-GKGBONUSKASAN     PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>�����O�����
               07      ()-GKGMAESHOUHIZEI   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>����������
               07      ()-GKGATOSHOUHIZEI   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>����
               07      ()-GKGATAMAKIN       PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>�萔����
               07      ()-GKGTESURYOURITSU  PIC  99.99.
      *>�萔���z
               07      ()-GKGTESURYOUGAKU   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>�������o�σT�C��
               07      ()-GKGCHUSYUTSUSUMI  PIC  X(01).
      *>�|�P�v��敪
               07      ()-GKGPO1KEIJYOUKBN  PIC  X(01).
      *>���p�҃R�[�h
               07      ()-GKGRIYOUSHACD     PIC  X(01).
      *>���n���i
               07      ()-GKGGENTIKAKAKU    PIC  9(10).9(03).
      *>���Z���[�g
               07      ()-GKGKANSANRATE     PIC  9(06).9(07).
      *>���Z��
               07      ()-GKGKANSANBI       PIC  9(08).
      *>�����C�O����
               07      ()-GKGKOKUNAIKAIGAI  PIC  9(01).
      *>�����萔���v�Z�σT�C��
             05        ()-GKGKEISANSUMISIGN PIC  X(01).
      *>�U�։���ԍ�
             05        ()-GKGHURIKAEKAIINNO PIC  9(16).
      *>�������[�g
             05        ()-GKGHASSEIROUTO    PIC  9(01).
      *>�����X�萔��
             05        ()-KAMEITENTESURYO   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>�c�_�萔��
             05        ()-DANKEITESURYOU    PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>�`�[���t���O
             05        ()-DENPYOUUMUFLG     PIC  X(01).
      *>�ړ��v��敪
             05        ()-IDUKEIJYOUKBN     PIC  X(01).
             05        ()-CASH.
      *>�L���b�V���O���������ʔ�
               07      ()-CASHINGBUNKAI     PIC  9(05).
      *>�U�֋敪
             05        ()-HURIKAEKBN        PIC  X(01).
      *>�Ј��m�n�L���敪
             05        ()-SHAINNOUMUKBN     PIC  X(01).
      *>�`�[���͓X
             05        ()-DENNYURYOKUTEN    PIC  9(02).
      *>����`�[�敪
             05        ()-DAIHIKIDENPYOKBN  PIC  X(01).
      *>�����|�C���g���ʋ敪
             05        ()-POINTSHKIBETSU    PIC  9(01).
      *>���v�|�C���g
             05        ()-GKP.
      *>�ʏ퍇�v�|�C���g
               07      ()-GKPTSUJYOUGOUKEI  PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>�{�[�i�X���v�|�C���g
               07      ()-GKPBONUSGOUKEI    PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>�l�ԃR�[�h
             05        ()-YOUTAICD          PIC  X(02).
      *>�W�v�㔄���敪
             05        ()-KEIJYOUURICHOUKBN PIC  X(01).
      *>�ŗ��敪
             05        ()-ZEIRITUKBN        PIC  X(01).
      *>�z�X�g������
             05        ()-HOSTSHORIYMD      PIC  X(08).
      *>�z�X�g��������
             05        ()-HOSTSHORITIME     PIC  X(06).
      *>�T�[�o�X�V��
             05        ()-SVRKOUSHINYMD     PIC  9(08).
      *>ISO�ʉݒP��
             05        ()-ISOTUUKA          PIC  X(03).
      *>�ꕔ�ԕi�敪
             05        ()-ITIBUHENPINKBN    PIC  X(01).
      *>�����U�֋敪
             05        ()-JIDOUFURIKAEKBN   PIC  X(01).
      *>���O����
             05        ()-JYOGAIUTIKIN      PIC S9(13)
                                            SIGN LEADING SEPARATE.
