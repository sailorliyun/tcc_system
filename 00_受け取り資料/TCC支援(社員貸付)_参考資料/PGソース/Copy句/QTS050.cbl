      *8...........2.........3.........4.........5........6........7.........8
      *    QTS050
      ****************************************************************
      *                ���p���׃t�@�C��                              *
      *                             DATA-WRITTEN  99.02.16           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   *
      * 0001   ���ڒǉ��Ή�               �m�a�b   2002/08/05        *
      *                                                              *
      * 0002   ���{���p���i�V�X�e���Ή�   �m�a�b   2003/01/20        *
      *          �����U�֋敪�ǉ�                                    *
      *                                                              *
      * 0003   ���ڒǉ��Ή�               ���c     2005/04/01        *
      *          ���O�����@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
      * 1006060 ���i���މ��葽�X�܉�      imz�g�c  2011/09/01        *
      *                                                              *
      ****************************************************************    
           03          ()-SEG.                          *>���p����
             05        ()-PRM.                          *>�L�[
               07      ()-PRMROKE.                      *>���P�[�V�����L�[
                 09    ()-PRMKIGYOUCD       PIC  9(04). *>��ƃR�[�h
                 09    ()-PRMSUBRANGEKEY    PIC  9(04). *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO   PIC  9(08). *>��������ԍ�
               07      ()-PRMTORIHIKINO     PIC  9(07). *>����ʔ�
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
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-HASSEITEN         PIC  9(02). *>�����X
             05        ()-HASSEITEN         PIC  9(03). *>�����X
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
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
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-SAICD             PIC  9(03). *>�ÃR�[�h
             05        ()-SAICD             PIC  9(04). *>�ÃR�[�h
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-TKURIAGETUUBAN    PIC  9(13). *>��g����ʔ�
             05        ()-GYOUSU            PIC  9(02). *>�s��
             05        ()-GYOUNO            PIC  9(02). *>�s�m��
             05        ()-GKG.                          *>���v�s
               07      ()-GKGSHIHARAIHOHO   PIC  9(02). *>�x�����@ 
               07      ()-GKGLOANSHUBETSU   PIC  9(05). *>���[�����
               07      ()-GKGRIYOUKNG       PIC S9(11)  *>���p���z
                                            SIGN LEADING SEPARATE.
               07      ()-GKGSHOUHINDAIKIN  PIC S9(11)  *>���i���
                                            SIGN LEADING SEPARATE.
               07      ()-GKGBUBIKIRITSU    PIC  9(02). *>������
               07      ()-GKGBUBIKIGAKU     PIC S9(11)  *>�����z
                                            SIGN LEADING SEPARATE.
               07      ()-GKGBUBIKITAISHOU  PIC S9(11)  *>�����Ώۊz���v
                                            SIGN LEADING SEPARATE.
               07      ()-GKGBUBIKIJYOGAI   PIC S9(11)  *>�������O�z���v
                                            SIGN LEADING SEPARATE.
               07      ()-GKGSHOUNINNO      PIC  9(07). *>���F�ԍ�
               07      ()-GKGBUNKATSUKAISU  PIC  9(03). *>������
               07      ()-GKGBONUSKAISU     PIC  9(02). *>�{�[�i�X��
               07      ()-GKGBONUSKASAN     PIC S9(11)  *>�{�[�i�X���Z�z
                                            SIGN LEADING SEPARATE.
               07      ()-GKGMAESHOUHIZEI   PIC S9(09)  *>�����O�����  
                                            SIGN LEADING SEPARATE.
               07      ()-GKGATOSHOUHIZEI   PIC S9(09)  *>����������
                                            SIGN LEADING SEPARATE.
               07      ()-GKGATAMAKIN       PIC S9(11)  *>����
                                            SIGN LEADING SEPARATE.
               07      ()-GKGTESURYOURITSU  PIC  99.99. *>�萔���� 
               07      ()-GKGTESURYOUGAKU   PIC S9(09)  *>�萔���z
                                            SIGN LEADING SEPARATE.
               07      ()-GKGCHUSYUTSUSUMI  PIC  X(01). *>�������o�σT�C��
               07      ()-GKGPO1KEIJYOUKBN  PIC  X(01). *>�|�P�v��敪
               07      ()-GKGRIYOUSHACD     PIC  X(01). *>���p�҃R�[�h
               07      ()-GKGGENTIKAKAKU    PIC  9(10).9(03). *>���n���i
               07      ()-GKGKANSANRATE     PIC  9(06).9(07). *>���Z���[�g
               07      ()-GKGKANSANBI       PIC  9(08). *>���Z��
               07      ()-GKGKOKUNAIKAIGAI  PIC  9(01). *>�����C�O����
             05        ()-GKGKEISANSUMISIGN PIC  X(01). *>�����萔���v�Z�σT�C��
             05        ()-GKGHURIKAEKAIINNO PIC  9(16). *>�U�։���ԍ�
             05        ()-GKGHASSEIROUTO    PIC  9(01). *>�������[�g
             05        ()-KAMEITENTESURYO   PIC S9(09)  *>�����X�萔��
                                            SIGN LEADING SEPARATE.
             05        ()-DANKEITESURYOU    PIC S9(09)  *>�c�_�萔��
                                            SIGN LEADING SEPARATE.
             05        ()-DENPYOUUMUFLG     PIC  X(01). *>�`�[���t���O
             05        ()-IDUKEIJYOUKBN     PIC  X(01). *>�ړ��v��敪
             05        ()-CASH.                      
               07      ()-CASHINGBUNKAI     PIC  9(05). *>�L���b�V���O���������ʔ�
             05        ()-HURIKAEKBN        PIC  X(01). *>�U�֋敪
             05        ()-SHAINNOUMUKBN     PIC  X(01). *>�Ј��m�n�L���敪
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-DENNYURYOKUTEN    PIC  9(02). *>�`�[���͓X
             05        ()-DENNYURYOKUTEN    PIC  9(03).  *>�`�[���͓X
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-DAIHIKIDENPYOKBN  PIC  X(01). *>����`�[�敪
             05        ()-POINTSHKIBETSU    PIC  9(01). *>�����|�C���g���ʋ敪
             05        ()-GKP.                          *>���v�|�C���g
               07      ()-GKPTSUJYOUGOUKEI  PIC S9(11)  *>�ʏ퍇�v�|�C���g
                                            SIGN LEADING SEPARATE.
               07      ()-GKPBONUSGOUKEI    PIC S9(11)  *>�{�[�i�X���v�|�C���g
                                            SIGN LEADING SEPARATE.
             05        ()-YOUTAICD          PIC  X(02). *>�l�ԃR�[�h
             05        ()-KEIJYOUURICHOUKBN PIC  X(01). *>�W�v�㔄���敪
             05        ()-ZEIRITUKBN        PIC  X(01). *>�ŗ��敪
             05        ()-HOSTSHORIYMD      PIC  X(08). *>�z�X�g������
             05        ()-HOSTSHORITIME     PIC  X(06). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>�T�[�o�X�V��
             05        ()-ISOTUUKA          PIC  X(03). *>ISO�ʉݒP��
             05        ()-ITIBUHENPINKBN    PIC  X(01). *>�ꕔ�ԕi�敪
             05        ()-JIDOUFURIKAEKBN   PIC  X(01). *>�����U�֋敪
             05        ()-JYOGAIUTIKIN      PIC S9(13)  *>���O����
                                            SIGN LEADING SEPARATE.
