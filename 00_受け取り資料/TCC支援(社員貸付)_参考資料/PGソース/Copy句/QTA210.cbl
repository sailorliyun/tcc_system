      *8...........2.........3.........4.........5........6........7.........8
      *    QTA210
      ****************************************************************
      *                �v���~�A������}�X�^                          *
      *                             DATA-WRITTEN  2005.03.17         *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   *
      ****************************************************************
           03        ()-SEG.                          *>����}�X�^
             05      ()-PRM.                          *>�G���g���[�L�[
               07    ()-PRMKIGYOUCD       PIC  X(04). *>��L�[�E��ƃR�[�h
               07    ()-PRMSUBRANGEKEY    PIC  X(04). *>��L�[�E�T�u�����W�L�[
               07    ()-PRMNAIBUKAIINNO   PIC  X(08). *>��L�[�E��������ԍ�
               07    ()-PRMSYUKEINENGETU  PIC  X(06). *>�W�v�N��
             05      ()-KAIIN-INF.                    *>������
               07    ()-KANRITEN          PIC  X(02). *>�Ǘ��X
               07    ()-CARDKBN           PIC  X(06). *>�J�[�h�敪
               07    ()-SYUKEICYU.                    *>�W�v������
                 09  ()-SYUKEICYUNENDO    PIC  X(04). *>�W�v���N�x
                 09  ()-RUISEKIGAKU       PIC S9(13). *>�ݐϊz
                 09  ()-RAITENNISSU       PIC  9(03). *>���X����
                 09  ()-RIYOUKENSUU       PIC  9(05). *>���p����
             05      ()-HANTEIRIREKI1.                *>���藚���P
               07    ()-PUREMIAMUKBN1     PIC  X(01). *>�v���~�A���敪�P
               07    ()-RUISEKIGAKU1      PIC S9(13). *>�ݐϊz�P
               07    ()-RAITENNISSU1      PIC  9(03). *>���X�����P
               07    ()-RIYOUKENSUU1      PIC  9(05). *>���p�����P
               07    ()-HANTEISTATUS1     PIC  X(04). *>���莞�X�e�[�^�X�P
               07    ()-HANTEIBI1         PIC  X(08). *>������P
             05      ()-HANTEIRIREKI2.                *>���藚���Q
               07    ()-PUREMIAMUKBN2     PIC  X(01). *>�v���~�A���敪�Q
               07    ()-RUISEKIGAKU2      PIC S9(13). *>�ݐϊz�Q
               07    ()-RAITENNISSU2      PIC  9(03). *>���X�����Q
               07    ()-RIYOUKENSUU2      PIC  9(05). *>���p�����Q
               07    ()-HANTEISTATUS2     PIC  X(04). *>���莞�X�e�[�^�X�Q
               07    ()-HANTEIBI2         PIC  X(08). *>������Q
             05      ()-HANTEIRIREKI3.                *>���藚���R
               07    ()-PUREMIAMUKBN3     PIC  X(01). *>�v���~�A���敪�R
               07    ()-RUISEKIGAKU3      PIC S9(13). *>�ݐϊz�R
               07    ()-RAITENNISSU3      PIC  9(03). *>���X�����R
               07    ()-RIYOUKENSUU3      PIC  9(05). *>���p�����R
               07    ()-HANTEISTATUS3     PIC  X(04). *>���莞�X�e�[�^�X�R
               07    ()-HANTEIBI3         PIC  X(08). *>������R
             05      ()-HANTEIRIREKI4.                *>���藚���S
               07    ()-PUREMIAMUKBN4     PIC  X(01). *>�v���~�A���敪�S
               07    ()-RUISEKIGAKU4      PIC S9(13). *>�ݐϊz�S
               07    ()-RAITENNISSU4      PIC  9(03). *>���X�����S
               07    ()-RIYOUKENSUU4      PIC  9(05). *>���p�����S
               07    ()-HANTEISTATUS4     PIC  X(04). *>���莞�X�e�[�^�X�S
               07    ()-HANTEIBI4         PIC  X(08). *>������S
             05      ()-HANTEIRIREKI5.                *>���藚���T
               07    ()-PUREMIAMUKBN5     PIC  X(01). *>�v���~�A���敪�T
               07    ()-RUISEKIGAKU5      PIC S9(13). *>�ݐϊz�T
               07    ()-RAITENNISSU5      PIC  9(03). *>���X�����T
               07    ()-RIYOUKENSUU5      PIC  9(05). *>���p�����T
               07    ()-HANTEISTATUS5     PIC  X(04). *>���莞�X�e�[�^�X�T
               07    ()-HANTEIBI5         PIC  X(08). *>������T
             05      ()-KANRIINF.                     *>�Ǘ����
               07    ()-HOSTSAKUSEIDATE   PIC  X(08). *>�g�n�r�s�쐬��
               07    ()-HOSTKOUSINDATE    PIC  X(08). *>�g�n�r�s�X�V��
               07    ()-SERVERKOUSINDATE  PIC  X(08). *>�T�[�o�X�V��
             05      FILLER               PIC  X(11).
