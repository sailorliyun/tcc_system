      *8...........2.........3.........4.........5........6........7.........8
      *    QTA110
      ****************************************************************
      *                �v���~�A������W�v���                        *
      *                             DATA-WRITTEN  2005.03.17         *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   *
      ****************************************************************
           03        ()-SEG.                              *>�W�v�}�X�^
             05      ()-PRM.                              *>�G���g���[�L�[
               07    ()-PRMKIGYOUCD         PIC  X(04).   *>��L�[�E��ƃR�[�h
               07    ()-PRMSUBRANGEKEY      PIC  X(04).   *>��L�[�E�T�u�����W�L�[
               07    ()-PRMNAIBUKAIINNO     PIC  X(08).   *>��L�[�E��������ԍ�
               07    ()-PRMSYUKEINENGETU    PIC  X(06).   *>�W�v�N��
             05      ()-MONTH.                            *>�����W�v���
               07    ()-JYOUTAIFLAG         PIC  X(01).   *>��ԃt���O
               07    ()-SUM.                              *>�݌v�z����
                 09  ()-SOUGAKU             PIC S9(13).   *>���z
                 09  ()-TAISYOUSYOUHIN      PIC S9(13).   *>�Ώۏ��i
                 09  ()-TAISYOUGAISYOUHIN   PIC S9(13).   *>�ΏۊO���i
                 09  ()-SYOUHIZEI           PIC S9(13).   *>�����
                 09  ()-ATAMAKIN            PIC S9(13).   *>����
                 09  ()-RIYOUKENSUU         PIC  9(05).   *>���p����
                 09  ()-RAITENNISSU         PIC  9(03).   *>���X����
               07    ()-SUMKEY.                           *>�W�v�p����
                 09  ()-HASSEITEN           PIC  X(02).   *>�����X
                 09  ()-KEIJYOUDATE         PIC  X(08).   *>�v���
                 09  ()-SHIHARAIHOUHOU      PIC  X(02).   *>�x�����@
             05      ()-CNTL-INF.                         *>�Ǘ����
               07    ()-HOSTSAKUSEIDATE     PIC  X(08).   *>�쐬��
               07    ()-SVRKOUSHINYMD       PIC  X(08).   *>�X�V��
             05      FILLER                 PIC  X(16).
