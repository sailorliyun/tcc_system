      *8...........2.........3.........4.........5........6........7.........8  
      *    QXB250
      ****************************************************************
      *                �v�㎞�X�e�|�^�X�t�@�C��                      *
      *                             DATA-WRITTEN  05.05.01           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO            �C�����R             �S����   �C�����t   * 
      ****************************************************************    
           03          ()-SEG.                          *>�v�㎞�X�e�|�^�X
             05        ()-PRM.                          *>�L�|����
               07      ()-PRMROKE.                      *>���P�|�V�����L�|
                 09    ()-PRMKIGYOUCD       PIC  X(04). *>��ƃR�|�h
                 09    ()-PRMSUBRANGEKEY    PIC  X(04). *>�T�u�����W�L�|
               07      ()-PRMNAIBUKAIINNO   PIC  X(08). *>��������ԍ�
               07      ()-PRMTORIHIKINO     PIC  9(07). *>����ʔ�
             05        ()-GAIBUKAIINNO.                 *>������
               07      ()-POSSTATUS         PIC  X(02). *>�o�n�r�X�e�|�^�X
               07      ()-DAIHYOSTATUS      PIC  X(04). *>��\�X�e�|�^�X
               07      ()-KEIJYOSTATUS.                 *>�v��X�e�|�^�X�e�|�u��
                 09    ()-KEIJYOTOUROKUBI01 PIC  9(08). *>�v��X�e�[�^�X�o�^���O�P
                 09    ()-KEIJYOSTATUS01    PIC  X(04). *>�v��X�e�|���O�P
                 09    ()-KEIJYOTOUROKUBI02 PIC  9(08). *>�v��X�e�[�^�X�o�^���O�Q
                 09    ()-KEIJYOSTATUS02    PIC  X(04). *>�v��X�e�|���O�Q
                 09    ()-KEIJYOTOUROKUBI03 PIC  9(08). *>�v��X�e�[�^�X�o�^���O�R
                 09    ()-KEIJYOSTATUS03    PIC  X(04). *>�v��X�e�|���O�R
                 09    ()-KEIJYOTOUROKUBI04 PIC  9(08). *>�v��X�e�[�^�X�o�^���O�S
                 09    ()-KEIJYOSTATUS04    PIC  X(04). *>�v��X�e�|���O�S
                 09    ()-KEIJYOTOUROKUBI05 PIC  9(08). *>�v��X�e�[�^�X�o�^���O�T
                 09    ()-KEIJYOSTATUS05    PIC  X(04). *>�v��X�e�|���O�T
             05        ()-NEGAJYOUHO.                   *>�l�K���
               07      ()-NEGACODE          PIC  X(04). *>�l�K�R�|�h
               07      ()-NEGAJIKOBI        PIC  9(08). *>���̓�
             05        ()-SEIGYOJYOUHO.                 *>������
               07      ()-SEIGYOSIKIBETUKUBUN  PIC  X(01).  *>���ʋ敪
               07      ()-TEIKEITORIHIKITUUBAN PIC  9(13). *>��g����ʔ�
               07      ()-HOSTSHORIYMD      PIC  X(08). *>�v�㏈����
               07      ()-HOSTSHORITIME     PIC  X(06). *>�v�㏈������
             05        ()-FILLER            PIC  X(06). *>�\��                                                          
             05        ()-SVRKKOUSHINYMD    PIC  9(08). *>�T�|�o�X�V��
             
