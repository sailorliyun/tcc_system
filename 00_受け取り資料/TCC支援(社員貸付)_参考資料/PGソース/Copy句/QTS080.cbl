      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS080  
      ****************************************************************
      *                �|�C���g�Ǘ��}�X�^                            *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   * 
      ****************************************************************    
           03          ()-SEG.                          *>�|�C���g���R�[�h
             05        ()-PRM.                          *>�G���g���[�L�[
               07      ()-PRMROKE.                      *>���P�[�V�����L�[
                 09    ()-PRMKIGYOUCD       PIC  9(04). *>��ƃR�[�h
                 09    ()-PRMSUBRANGEKEY    PIC  9(04). *>�T�u�����W
               07      ()-PRMNAIBUKAIINNO   PIC  9(08). *>��������ԍ�
               07      ()-PRMRECKBN         PIC  9(01). *>��������ԍ�
             05        ()-ZOK.                          *>�������
               07      ()-ZOKTUMITATEYUKO   PIC  9(08). *>�����ϗ��L������
               07      ()-ZOKHIKIKAEYUKO    PIC  9(08). *>���������L������
               07      ()-ZOKTORIKESITUUBAN PIC  9(07). *>�����^����ʔ�
             05        ()-TOK.                          *>�����|�C���g���
               07      ()-TOKT.                         *>�����|�C���g���
                 09    ()-TOKTKURIKOSIPOINT PIC S9(11)  *>�O���J�z�|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTHASSEIPOINT   PIC S9(11)  *>�����|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTHIKIKAEPOINT  PIC S9(11)  *>�����|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTTORIKESIPOINT PIC S9(11)  *>��������|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTZANPOINT      PIC S9(11)  *>�c�|�C���g
                                            SIGN LEADING SEPARATE.
               07      ()-TOKS.                         *>������
                 09    ()-TOKSHASSEIPOINT   PIC S9(11)  *>�����|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKSHIKIKAEPOINT  PIC S9(11)  *>�����|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKSTORIKESIPOINT PIC S9(11)  *>��������|�C���g
                                            SIGN LEADING SEPARATE.
               07      ()-TOKR.                         *>�݌v���
                 09    ()-TOKRHASSEIPOINT   PIC S9(11)  *>���������|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKRHIKIKAEPOINT  PIC S9(11)  *>���������|�C���g
                                            SIGN LEADING SEPARATE.
             05        ()-KIG.                          *>�����؂�|�C���g���
               07      ()-KIGM.                         *>�O�N���
                 09    ()-KIGMKIGENGIREFLG  PIC  X(01). *>�����؂�t���O
                 09    ()-KIGMTUMITATEYUKO  PIC  9(08). *>�ϗ��L������
                 09    ()-KIGMHIKIKAEYUKO   PIC  9(08). *>�����L������
                 09    ()-KIGMKIGENGIREPOINT PIC S9(11)  *>�����؂�|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-KIGMHIKIKAEPOINT  PIC S9(11)  *>�����|�C���g
                                            SIGN LEADING SEPARATE.
                 09    ()-KIGMTORIKESIPOINT PIC S9(11)  *>��������|�C���g
                                            SIGN LEADING SEPARATE.
             05        ()-HIK.                          *>�����Ïؔԍ����
               07      ()-HIKIKAEANSYOUNO   PIC  9(04). *>�����Ïؔԍ�
             05        ()-SEIKYUNENGETU     PIC  9(06). *>�����N��
             05        ()-HOSTSHORIYMD      PIC  X(08). *>�z�X�g������
             05        ()-HOSTSHORITIME     PIC  X(06). *>�z�X�g��������
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>�T�[�o�X�V��
