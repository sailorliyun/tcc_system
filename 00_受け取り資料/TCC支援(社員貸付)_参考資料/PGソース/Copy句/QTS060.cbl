      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS060
      ****************************************************************
      *                ���p���ו����t�@�C��                          *
      *                             DATA-WRITTEN  99.02.04           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   * 
      *   1006060        ���i���މ��葽�X�܉�    imz�g�c  2011/09/01 *
      *                                                              *
      ****************************************************************   
           03          ()-SEG.                         *>���p���ו���
             05        ()-PRM.                         *>�L�[
               07      ()-PRMROKE.                     *>���P�[�V�����L�[
                 09    ()-PRMKIGYOUCD      PIC  9(04). *>��ƃR�[�h
                 09    ()-PRMSUBRANGEKEY   PIC  9(04). *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO  PIC  9(08). *>��������ԍ�
               07      ()-PRMTORIHIKINO    PIC  9(07). *>����ʔ�
             05        ()-DENPYOUNO        PIC  X(12). *>�`�[�m�n
             05        ()-RECKBN           PIC  X(01). *>���R�[�h�敪
             05        ()-SAKUJOKBN        PIC  X(01). *>�폜�敪
             05        ()-DENPYOUSHUBETSU  PIC  9(04). *>�`�[���
             05        ()-BATCHNO          PIC  9(04). *>�o�b�`�m�n
             05        ()-GNO.                         *>�f�|�m�n
               07      ()-GNOBATCHNO       PIC  9(04). *>�f�o�b�`�m�n
               07      ()-GNODENSEQUENCE   PIC  9(03). *>�f�`�[�V�[�P���X
             05        ()-CARDNO           PIC  9(16). *>�J�[�h�ԍ�
             05        ()-RIYOUBI          PIC  9(08). *>���p��
             05        ()-UKETSUKEBI       PIC  9(08). *>��t��
             05        ()-KEIJYOUBI        PIC  9(08). *>�v���
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-HASSEITEN        PIC  9(02). *>�����X
             05        ()-HASSEITEN        PIC  9(03). *>�����X
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-SIHARAIHOHO      PIC  9(02). *>�x�����@  
             05        ()-SEIKYUKANJI      PIC  N(20). *>��������
             05        ()-SHUSEIGAKU       PIC S9(11)  *>�����z�萔���C���z
                                           SIGN LEADING SEPARATE.
             05        ()-BUBIKISHOUHIZEI  PIC S9(09)  *>���������
                                           SIGN LEADING SEPARATE.
             05        ()-ZEIKBN           PIC  X(01). *>�ŋ敪
             05        ()-CHUSHUTUSUMISIGN PIC  X(01). *>�������o�σT�C��
             05        ()-HASSEIROUTE      PIC  9(01). *>�������[�g
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-DENNYURYOKUTEN   PIC  9(02). *>�`�[���͓X
             05        ()-DENNYURYOKUTEN   PIC  9(03). *>�`�[���͓X
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-HOSTSHORIYMD     PIC  X(08). *>�z�X�g������
             05        ()-HOSTSHORITIME    PIC  X(06). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD    PIC  9(08). *>�T�[�o�X�V��
      * ADD 2011/09/01 1006060 IMZ YOSHIDA START
             05        ()-URIBAKUKAKU      PIC  X(05). *>������
             05        ()-BUMON            PIC  9(02). *>����
             05        ()-HINGUNCD         PIC  9(03). *>�i�Q�R�[�h
             05        ()-HGCHECKDIGIT     PIC  9(01). *>�i�Q�R�[�h�E�b�^�c
             05        ()-FLOOR            PIC  9(01). *>�t���A�[
             05        ()-HINMEICD         PIC  9(03). *>�i���R�[�h
             05        ()-HMCHECKDIGIT     PIC  9(01). *>�i���R�[�h�E�b�^�c
             05        ()-HINMEISAISAI     PIC  X(04). *>�i���ׁX�R�[�h
      * ADD 2011/09/01 1006060 IMZ YOSHIDA END
