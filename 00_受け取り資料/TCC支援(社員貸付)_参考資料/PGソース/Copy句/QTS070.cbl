      *8...........2.........3.........4.........5........6........7.........8
      *    QTS070
      ****************************************************************
      *                �����X���`�t�@�C��                            *
      *                             DATA-WRITTEN  99.02.05           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   *
      *   V0101          �����X���`ڲ��ĕύX     ANX      2000/07/27 *
      *   V0102          �����X���`ڲ��ĕύX     NBC      2002/11/27 *
      ****************************************************************
          03           ()-SEG.                         *>�����X���`�t�@�C��
             05        ()-PRM.                         *>�L�[���
               07      ()-PRMURITUUBAN     PIC  9(13). *>����ʔԁi�T�j
             05        ()-URI.                         *>������
               07      ()-URITORIHIKIA     PIC  9(02). *>����`
               07      ()-URITORIHIKIB     PIC  9(01). *>����a
               07      ()-URITORIHIKIC     PIC  9(01). *>����b
               07      ()-URICARDNO        PIC  9(16). *>�J�[�h�ԍ�
               07      ()-URIRIYOUBI       PIC  9(08). *>���p��
               07      ()-URIUKETSUKEBI    PIC  9(08). *>��t��
               07      ()-URIKEIJYOUBI     PIC  9(08). *>�v����i�P�j
               07      ()-URISHIHARAIHOHO  PIC  9(02). *>�x�����@
               07      ()-URIBUNKATSUKAISU PIC  9(03). *>������
               07      ()-URIRIYOUKNG      PIC S9(09)  *>���p���z
                                           SIGN LEADING SEPARATE.
               07      ()-URIURIAGEKNG     PIC S9(09)  *>������z
                                           SIGN LEADING SEPARATE.
               07      ()-URIZEISOURYOU    PIC S9(07)  *>�ő���
                                           SIGN LEADING SEPARATE.
               07      ()-URIURIAGEGOUKEI  PIC S9(09)  *>���㍇�v
                                           SIGN LEADING SEPARATE.
               07      ()-URIWARIBIKIGAKU  PIC S9(07)  *>�����z
                                           SIGN LEADING SEPARATE.
               07      ()-URIGAITESURYOU   PIC S9(09)  *>���ԊO�萔��
                                           SIGN LEADING SEPARATE.
               07      ()-URISHOUNINNO     PIC  9(07). *>���F�ԍ�
               07      ()-URIKOKUNAIKAIGAI PIC  9(01). *>�����C�O���ʋ敪
             05        ()-KAI.                         *>�C�O���p���
               07      ()-KAITUUKAGAKU     PIC S9(10)V9(03) *>���n�ʉ݊z
                                           SIGN LEADING SEPARATE.
               07      ()-KAIKANSANRATE    PIC S9(06)V9(07) *>���Z���[�g
                                           SIGN LEADING SEPARATE.
               07      ()-KAIKANSANBI      PIC  9(08). *>���Z��
               07      ()-KAITOSHIMEI      PIC  X(13). *>�����X�s�s��
               07      ()-KAITUUKAKOSHOU   PIC  X(25). *>�ʉ݌ď�
               07      ()-KAITUUKACD       PIC  X(03). *>�ʉ݃R�[�h
               07      ()-KAISHUUCD        PIC  X(03). *>�B�R�[�h
               07      ()-KAIKUNICD        PIC  X(03). *>���R�[�h
             05        ()-TKS.                         *>��g����
               07      ()-TKSSHOUKAINO1    PIC  X(23). *>��g��Ɖ�ԍ��P
               07      ()-TKSSHOUKAINO2    PIC  X(23). *>��g��Ɖ�ԍ��Q
               07      ()-TKSKAMEITENNO    PIC  X(15). *>�����X�ԍ�
               07      ()-TKSKAMEITENMEI1  PIC  X(25). *>�����X���̂P
               07      ()-TKSKAMEITENMEI2  PIC  X(25). *>�����X���̂Q
               07      ()-TKSGYOUSHUCD     PIC  X(05). *>�Ǝ�R�[�h
               07      ()-TKSPOSENTRYCD    PIC  X(02). *>�o�n�r�G���g���[�R�[�h
               07      ()-TKSBONUSHYOUJI   PIC  X(01). *>�{�[�i�X�\��
             05        ()-KJK.                         *>�v�㎞������
               07      ()-KJKENTRYKEY.                 *>�G���g���[�L�[
                 09    ()-KJKLOCATION.                 *>���P�[�V�����L�[
                   11  ()-KJKKIGYOUCD      PIC  9(04). *>��ƃR�[�h�i�Q�j
                   11  ()-KJKSUBRANGEKEY   PIC  9(04). *>�T�u�����W�L�[�i�R�j
                 09    ()-KJKNAIBUKAIINNO  PIC  9(08). *>��������ԍ��i�S�j
               07      ()-KJKKANRITEN      PIC  9(02). *>���Ǘ��X
               07      ()-KJKCARDKBN       PIC  9(06). *>�J�[�h�敪
               07      ()-KJKCARDKAIINMEI  PIC  N(15). *>�J�[�h�������
             05        ()-HOSTSHORIYMD     PIC  X(08). *>�z�X�g������
             05        ()-HOSTSHORITIME    PIC  X(06). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD    PIC  9(08). *>�T�[�o�X�V��
      *--------------------------------------------------------------*
      *-V0101 2000/07/27 ITEM ADD                                   -*
      *--------------------------------------------------------------*
             05        ()-KMTINF.                      *>�����X���
               07      ()-KMTCHARGEBACK    PIC  9(01). *>�`���[�W�o�b�N�敪
               07      ()-KMTKJYAGOU       PIC  N(20). *>�����X��������
               07      ()-KMTDENPYOUKI     PIC  X(24). *>�`�[�����L�[
               07      ()-KMTSEISANKBN     PIC  X(01). *>���Z�敪
      *--------------------------------------------------------------*
      *-V0102 2002/11/27 ITEM ADD                            START  -*
      *--------------------------------------------------------------*
               07      ()-MOTOECINDICATOR    PIC  X(01). *>MO/TO/EC INDICATOR
               07      ()-CHACTTERMINDICATOR PIC  X(01). *>C/H ACT TERM INDICATOR
               07      ()-AUTHSOURCECODE     PIC  X(01). *>AUTH SOURCE CODE
               07      ()-TCQ                PIC  X(01). *>TCQ
      *--------------------------------------------------------------*
      *-V0102 2002/11/27 ITEM ADD                            END    -*
      *--------------------------------------------------------------*
