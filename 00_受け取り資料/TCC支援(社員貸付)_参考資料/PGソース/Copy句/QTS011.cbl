      *8...........2.........3.........4.........5........6........7.........8
      *    QTS011
      ****************************************************************
      *                �J�[�h�X�V�C���^�[�t�F�[�X                    *
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
             05        ()-RECKBN               PIC  9(01).  *>���R�[�h�敪
             05        ()-ZANDAKAKANRIKBN      PIC  9(01).  *>�c���Ǘ��敪
             05        ()-10TO16KBN            PIC  9(01).  *>10��16���敪
             05        ()-GKN.                              *>�O������ԍ�
               07      ()-GKNSHIKIBETSUNO      PIC  9(12).  *>������ʔԍ�
               07      ()-GKNEDABAN            PIC  9(01).  *>�{�l�}��
             05        ()-TEN.                              *>�X
               07      ()-TENKAISHA            PIC  9(02).  *>��ГX
               07      ()-TENSAIKENKANRI       PIC  9(02).  *>���Ǘ��X
               07      ()-TENEIGYOU            PIC  9(02).  *>�c�ƓX
               07      ()-TENDM                PIC  9(02).  *>�c�l�X
               07      ()-TENJIGYOHONBU        PIC  9(02).  *>���Ɩ{���R�[�h
               07      ()-TENKAKUTOKU          PIC  9(02).  *>�l���X
             05        ()-CARDKBN              PIC  9(06).  *>�J�[�h�敪
             05        ()-TRS.                              *>�戵���i���
               07      ()-TRSS.                             *>�V���b�s���O
                 09    ()-TRSSYOKU1            PIC  9(01).  *>���P��
                 09    ()-TRSSYOKU2            PIC  9(01).  *>���Q��
                 09    ()-TRSSBONUS1           PIC  9(01).  *>�{�[�i�X�P��
                 09    ()-TRSSBONUS2           PIC  9(01).  *>�{�[�i�X�Q��
 	         09    ()-TRSSKAPPU            PIC  9(01).  *>����
                 09    ()-TRSSREVOLVING        PIC  9(01).  *>���{���r���O
                 09    ()-TRSSHANBAI           PIC  9(01).  *>�E������
                 09    ()-TRSSKAKEURI          PIC  9(01).  *>�E���|��
               07      ()-TRSC.                            *>�L���V���O
                 09    ()-TRSCREVOLVING        PIC  9(01).  *>���{���r���O
                 09    ()-TRSCYOKU1            PIC  9(01).  *>���P��
             05        ()-REV.                              *>���{��z
               07      ()-REVS.                             *>�V���b�s���O
                 09    ()-REVSMAITSUKI         PIC  9(01).  *>������
                 09    ()-REVSBONUS            PIC  9(02).  *>�{�[�i�X��
               07      ()-REVC.                             *>�L���V���O
                 09    ()-REVCMAITSUKI         PIC  9(01).  *>������
                 09    ()-REVCBONUS            PIC  9(02).  *>�{�[�i�X��
             05        ()-ANS.                              *>�Ïؔԍ����
               07      ()-ANSGEN               PIC  9(04).  *>�Ïؔԍ�
               07      ()-ANSKYUU              PIC  9(04).  *>���Ïؔԍ�
               07      ()-ANSHENKOUYMD         PIC  9(08).  *>�ύX��
             05        ()-YUKOKIGEN            PIC  9(06).  *>�L������
             05        ()-YSN.                              *>�^�M���
               07      ()-YSNRANK              PIC  X(01).  *>�^�M�����N
               07      ()-YSNSOUGENDO          PIC  9(05).  *>�����x�z
               07      ()-YSNNOBEGENDO         PIC  9(05).  *>�������x�z
               07      ()-YSNYOBIGENDO         PIC  9(05).  *>�\�����x�z
               07      ()-YSNCASHGENDO         PIC  9(05).  *>����ݸތ��x�z
               07      ()-YSNIKKATSUGENDO      PIC  9(05).  *>�ꎞ�ꊇ���x�z 
               07      ()-YSNKAPPUGENDO        PIC  9(05).  *>�ꎞ�������x�z
               07      ()-YSNBONUSGENDO        PIC  9(05).  *>�ꎞ�ްŽ���x�z
               07      ()-YSNYUKOKAISHI        PIC  9(08).  *>�L�������J�n
               07      ()-YSNYUKOOWARI         PIC  9(08).  *>�L�������I��
             05        ()-HON.                              *>�{�l���
               07      ()-HONSHIMEI.                        *>����
                 09    ()-HONSHIMEIKANA        PIC  X(30).  *>�����J�i
                 09    ()-HONSHIMEIROMA        PIC  X(30).  *>�������[�}��
                 09    ()-HONSHIMEIKAN         PIC  N(15).  *>��������
               07      ()-HONSEINENGAPPI       PIC  9(08).  *>���N����
               07      ()-HONSEX               PIC  9(01).  *>����
             05        ()-STS.                              *>�X�e�[�^�X���
               07      ()-STSK.                             *>�����X�e�[�^�X
                 09    ()-STSKOZATOROKUYMD     PIC  9(08).  *>�o�^��
                 09    ()-STSKOZA              PIC  9(04).  *>�X�e�[�^�X
               07      ()-STSC.                             *>�J�[�h�X�e�[�^�X
                 09    ()-STSCARDTOROKUYMD     PIC  9(08).  *>�o�^��
                 09    ()-STSCARD              PIC  9(04).  *>�X�e�[�^�X
             05        ()-SAISHURIYOU          PIC  9(01).  *>�ŏI���p�҃R�[�h
             05        ()-KIK.                              *>�����ڊǏ��
               07      ()-KIKYMD               PIC  9(08).  *>�ڊǓ�
               07      ()-KIKKYUUNO            PIC  9(12).  *>������ԍ�
               07      ()-KIK10KETANO          PIC  9(10).  *>10������ԍ�
             05        ()-PNT.                              *>�|�C���g�Ǘ����
               07      ()-PNTKBN               PIC  9(01).  *>�����^�|�C���g�敪
               07      ()-PNTCARDFACE          PIC  X(01).  *>�J�[�h�t�F�[�X
               07      ()-PNTTEIKEIKBN         PIC  X(01).  *>��g�敪
               07      ()-PNTMAECARDKBN        PIC  9(06).  *>�ڊǑO�J�[�h�敪
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>�z�X�g������
             05        ()-HOSTSHORITIME        PIC  X(06).  *>�z�X�g��������
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>�T�[�o�X�V��
