      *8...........2.........3.........4.........5........6........7.........8  
      *    QTA200
      ****************************************************************
      *                  ���[����ʃe�[�u��                          *
      *                             DATA-WRITTEN  99.02.05           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   * 
      ****************************************************************
           03          ()-SEG.                         *>���[�����
             05        ()-PRM.                         *>�L�[
               07      ()-PRMLOANSHUBETSU  PIC  9(05). *>���[�����
             05        ()-SHOUHINRANKCD    PIC  X(01). *>���i�����N�R�[�h
             05        ()-TRI              OCCURS 5.   *>�戵�X���
               07      ()-TRIMISERANKCD    PIC  X(01). *>�戵�X�����N�R�[�h
               07      ()-TRIHANBAIRITSU   PIC  99.99. *>�̔��萔����
               07      ()-TRIJYUCHURITSU   PIC  99.99. *>�󒍎萔����
             05        ()-SHO.                         *>���i��ʏ��
               07      ()-SHOSIHARAIHOHO   PIC  9(02). *>�x�����@
               07      ()-SHOYAKUJORIRITSU PIC  99.99. *>��藘��
               07      ()-SHOENTAIRIRITSU  PIC  99.99. *>���ؗ���
               07      ()-SHOLOANMEI       PIC  N(20). *>���[������
               07      ()-SHOKAISUKAGEN    PIC  9(03). *>�x���񐔉���
               07      ()-SHOKAISUJOGEN    PIC  9(03). *>�x���񐔏��
               07      ()-SHOYUSIGAKUTANI  PIC S9(05)  *>�Z���z�P��
                                           SIGN LEADING SEPARATE.
               07      ()-SHOHENSAIGAKU    PIC S9(05)  *>�ԍϊz�P��
                                           SIGN LEADING SEPARATE.
               07      ()-SHOYUSIGAKUJOGEN PIC S9(05)  *>�Z���z���
                                           SIGN LEADING SEPARATE.
               07      ()-SHOBOHEIYOWARIAI PIC  9(03). *>�{�[�i�X���p����
               07      ()-SHOTORIHIKIKAISI PIC  9(08). *>�戵�J�n��
             05        ()-HOSTSHORIYMD     PIC  X(08). *>�z�X�g������
             05        ()-HOSTSHORITIME    PIC  X(06). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD    PIC  9(08). *>�T�[�o�X�V��
