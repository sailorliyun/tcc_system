      *8.1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
      *    QTS075
      ****************************************************************
      *            �����X�����e�[�u��         DATA-WRITTEN  99.07.15 *
      *--------------------------------------------------------------*
      *            �C  ��  ��  ��                                    *
      *    �Ǘ�NO            �C�����R              �S����  �C�����t  *
      *    XX-XXX  �m�m�m�m�m�m�m�m�m�m�m�m�m�m�m  �m�m�m 9999.99.99 *
      *    XX-XXX  �X�֔ԍ��V�����Ή�              ��@�� 2001.08.03 *
      ****************************************************************
           03        ()-SEG.                           *>�����X�����e�[�u��
             05      ()-ENTRYKEY.                      *>�G���g���[�L�[
               07    ()-PRMNAIBUNO         PIC  9(07). *>���������X�ԍ�
             05      ()-KAKUCHOIDX.                    *>�g���C���f�b�N�X�L�[
               07    ()-KANAMEISHO         PIC  X(10). *>�����J�i����
             05      ()-GAIBUNO.                       *>�O�������X�ԍ�
               07    ()-KAISHACD           PIC  X(05). *>��ЃR�[�h
               07    ()-HANBAITENCD        PIC  X(04). *>�̔��X�R�[�h
               07    ()-CHECKDIGIT         PIC  X(01). *>�`�F�b�N�f�B�W�b�g
             05      ()-SIHARAISAKINO      PIC  9(07). *>�����x����ԍ�
             05      ()-KAMEIYMD           PIC  9(08). *>�����N����
             05      ()-TORIKESIBI         PIC  9(08). *>�����
             05      ()-KAMEITENKBN        PIC  X(01). *>�����X�敪
             05      ()-KAMEITENKAKU       PIC  X(01). *>�����X�i
             05      ()-KAKUTOKUTEN        PIC  X(02). *>�l���X
             05      ()-GYOSHUCDG.                     *>�Ǝ�R�[�h
               07    ()-GYOSHUCD           PIC  X(02). *>�R�[�h
               07    ()-GYOSHURENBAN       PIC  9(03). *>�A��
             05      ()-KAISHAMEISHOCD.                *>��Ж��̃R�[�h
               07    ()-MEISHOATAMA        PIC  X(02). *>��
               07    ()-MEISHOSHITA        PIC  X(02). *>��
             05      ()-KAISHAMEI.                     *>��Ж�
               07    ()-SHAMEIKANA         PIC  X(30). *>�J�i
               07    ()-SHAMEIKAN          PIC  N(20). *>����
             05      ()-DAIHYOSHAMEI.                  *>��\�Җ�
               07    ()-DAIHYOSHAKANA      PIC  X(30). *>�J�i
               07    ()-DAIHYOSHAKAN       PIC  N(20). *>����
             05      ()-SHOZAICHI.                     *>���ݒn
               07    ()-JUSHOCD            PIC  X(10). *>�Z���R�[�h
               07    ()-YUBIN.                         *>�X�֔ԍ�
                 09  ()-YUBIN1             PIC  X(03). *>�X�֔ԍ��P
                 09  ()-YUBIN2             PIC  X(02). *>�X�֔ԍ��Q
               07    ()-JUSHO.                         *>�Z��
                 09  ()-JUSHOKAN1          PIC  N(20). *>�Z���P
                 09  ()-JUSHOKAN2          PIC  N(20). *>�Z���Q
               07    ()-BANCHIKAN          PIC  N(10). *>�Ԓn
               07    ()-KATAKAN            PIC  N(20). *>����
               07    ()-DAIHYOTELNO        PIC  X(15). *>��\�d�b�ԍ�
             05      ()-RENRAKUSAKI.                   *>�A����
               07    ()-RENTANTOBUKA       PIC  N(10). *>�S������
               07    ()-RENTANTOSHA        PIC  N(10). *>�S����
               07    ()-RENTELNO           PIC  X(15). *>�d�b�ԍ�
               07    ()-RENNAISEN          PIC  X(04). *>����
             05      ()-MUKOHYOBUSUU       PIC  9(03). *>�����ʒm�[����
             05      ()-KYUUJITU           PIC  9(01). *>�x��
             05      ()-MEMOJOHO           PIC  N(30). *>�������
             05      ()-KAISHAJOHO.                    *>��Џ��
               07    ()-KIGYOUCD           PIC  X(09). *>��ƃR�[�h
             05      ()-HANBAITENJOHO.                 *>�̔��X���
               07    ()-HANSEIKYUKANA      PIC  X(15). *>�������J�i
               07    ()-HANHINBAN          PIC  X(06). *>�i��
               07    ()-HANATENAKAN        PIC  N(20). *>����
               07    ()-HANCATTERMUMU      PIC  X(01). *>�b�`�s�[���L��
               07    ()-HANEIGYOTIME       PIC  9(08). *>�c�Ǝ���
               07    ()-HANRANK            PIC  X(01). *>�����I�[�\�������N
               07    ()-HANKAKUTOKUTEN     PIC  X(02). *>�l���X�R�[�h
               07    ()-HANKAKUTOKUSHA     PIC  X(07). *>�l���҃R�[�h
               07    ()-HANHIBAIHINUMU     PIC  X(01). *>��̔����i�L��
               07    ()-HANMITOROKUFLG     PIC  X(01). *>�̔��X��񖢓o�^�t���O
             05      ()-HOSTSHORIYMD       PIC  X(08). *>�z�X�g������
             05      ()-HOSTSHORITIME      PIC  X(06). *>�z�X�g��������
             05      ()-SVRKOUSHINYMD      PIC  9(08). *>�T�[�o�X�V��
      ***20010803START �X�֔ԍ��V�����Ή�***
             05      ()-NEWYUBIN.                      *>�V�X�֔ԍ�
               07    ()-NEWYUBIN1          PIC  X(03). *>�V�X�֔ԍ��P
               07    ()-NEWYUBIN2          PIC  X(04). *>�V�X�֔ԍ��Q
      ***20010803 END  �X�֔ԍ��V�����Ή�***
