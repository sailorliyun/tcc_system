      *8...........2.........3.........4.........5........6........7.........8
      *    QCS061
      ****************************************************************
      *                CS���p�����L�ڃt�@�C��                        *
      *                             DATA-WRITTEN  04.08.13           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   *
      *   000001   �|�C���g�̃T�C����t�^        ����     06.02.15   *
      ****************************************************************
           03          ()-SEG.                              *>����}�X�^
             05        ()-PRM.                              *>�G���g���[�L�[
               07      ()-PRMKIGYOUCD          PIC  9(004). *>��ƃR�[�h
               07      ()-PRMSUBRANGEKEY       PIC  9(004). *>�T�u�����W�L�[
               07      ()-PRMNAIBUKAIINNO      PIC  9(008). *>��������ԍ�
               07      ()-PRMSHIMEYMD          PIC  9(006). *>���N����
             05        ()-CARDKBN              PIC  9(006). *>�J�[�h�敪
             05        ()-TOUZAIKBN            PIC  X(001). *>�����敪
             05        ()-KANRITEN             PIC  X(002). *>�Ǘ��X
             05        ()-KAKUTOKUTEN          PIC  X(002). *>�l���X
             05        ()-NONEMASTERFLAG       PIC  X(001). *>�m���}�X�^�t���O
             05        ()-FUSEIGOUFLAG         PIC  X(001). *>�s�������ʃt���O
             05        ()-KISAISKB             PIC  X(001). *>�����L�ڃf�[�^���ʃt���O
             05        ()-NYUKAIJIPOINT        PIC  9(011). *>����|�C���g
             05        ()-BONUSPOINT           PIC  9(011). *>�{�[�i�X�|�C���g
             05        ()-POINTSBTFLAG         PIC  X(001). *>�|�C���g���ʃt���O
             05        ()-SEIKYUTENNAI         PIC  9(011). *>�����z�i�X���j
             05        ()-SEIKYUCS             PIC  9(011). *>�����z�iCS�����X�j
             05        ()-DATAREC.                          *>�f�[�^���R�[�h
               07      ()-RECORDKBN            PIC  X(001). *>���R�[�h�敪
               07      ()-KEY.                              *>�L�[����
                 09    ()-TAKASHIMAYANO        PIC  X(009). *>�������Ǘ��ԍ�
                 09    ()-CARDNO               PIC  X(016). *>�J�[�h�ԍ�
               07      ()-POINTINFO.                        *>�|�C���g���
                 09    ()-TAKASHIMAYA.                      *>�������ҏW����
                   11  ()-SHIMEYMD             PIC  9(008). *>���N����
                   11  ()-TUMITATEKGN          PIC  9(006). *>�ϗ�����
                   11  ()-KOUKANKGN            PIC  9(006). *>��������
                   11  ()-KOUKANMAIZEN         PIC  9(003). *>���������i�O���j
                   11  ()-ZENGETUZANP          PIC S9(011)  *>�O���c�|�C���g
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-TOUGETUKOUP          PIC S9(011)  *>���������|�C���g
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-TENNAIHASSEIP        PIC S9(011)  *>�X�������|�C���g
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-TUIKAPKUBUN          PIC  X(002). *>�ǉ��|�C���g�敪
                   11  ()-TUIKAPOINT           PIC S9(011)  *>�ǉ��|�C���g
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-BONUSRUIKEI          PIC S9(013)  *>�{�[�i�X�݌v�z
                                SIGN IS LEADING SEPARATE CHARACTER.
                 09    ()-CSHENSYU.                         *>�N���f�B�Z�]���ҏW����
                   11  ()-KOUKANNO             PIC  9(004). *>�����ԍ�
                   11  ()-KOUKANMAISUU         PIC  9(003). *>���������i���v�j
                   11  ()-KAMEITENHP           PIC S9(011)  *>�����X�����|�C���g
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-GENZAIHOYUUP         PIC S9(011)  *>���ݕۗL�|�C���g
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-RIYOUKINGOUKEI       PIC S9(011)  *>���p���z���v
                                SIGN IS LEADING SEPARATE CHARACTER.
               07      ()-KANRIINFO.                        *>�Ǘ����
                 09    ()-SEIDO                PIC  X(002). *>���x
                 09    ()-KOKYAKUKBN           PIC  X(002). *>�ڋq�敪
             05        ()-HOSTSHORIYMD         PIC  X(008). *>�z�X�g������
             05        ()-HOSTSHORITIME        PIC  X(006). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD        PIC  9(008). *>�T�[�o�X�V��
