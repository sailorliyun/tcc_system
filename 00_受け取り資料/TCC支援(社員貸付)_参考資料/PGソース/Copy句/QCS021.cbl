      *8...........2.........3.........4.........5........6........7.........8  
      *    QCS021(QTS040(QTA040))
      ****************************************************************
      *                �O���ϊ��t�@�C��                              *
      *                             DATA-WRITTEN  04.08.13           *
      *--------------------------------------------------------------*
      *                  �C  ��  ��  ��                              *
      *   �Ǘ�NO   �C�����R                      �S����   �C�����t   *
      ****************************************************************    
           03        ()-SEG.                         *>�O���ϊ�
             05      ()-PRM.                         *>�G���g���[�L�[
               07    ()-PRMCSTCARDNO     PIC  X(16). *>�b�r�s�J�[�h�ԍ�
             05      ()-NKN.                         *>��������ԍ�
               07    ()-NKNROKE.                     *>���P�[�V�����L�[
                 09  ()-NKNKIGYOUCD      PIC  9(04). *>��ƃR�[�h 
                 09  ()-NKNSUBRANGEKEY   PIC  9(04). *>�T�u�����W�L�[
               07    ()-NKNNO            PIC  9(08). *>��������ԍ�
             05      ()-SOKUAHTU.                    *>�����b�r�s�J�[�h�ԍ� 
               07    ()-NYKUKETSUKENO    PIC  9(08). *>��t�ԍ�
               07    ()-KIKKYUUNO        PIC  X(16). *>�����b�r�s�J�[�h�ԍ� 
             05      ()-IKN.                         *>�ڊǏ�� 
               07    ()-IKNKBN           PIC  9(01). *>�ڊǍσt���O
               07    ()-IKNKOUZAYMD      PIC  9(08). *>�ؑ֔N�����ڊǓ�
               07    ()-IKNSAKIKAIINNO   PIC  X(16). *>�ؑ֐�b�r�s�J�[�h�ԍ�
             05      ()-CARDKBN          PIC  9(06). *>�J�[�h�敪
             05      ()-HONSHIMEIKANA    PIC  X(30). *>�����i�J�i�j
             05      ()-RIYOUSHACD       PIC  X(01). *>�Ƒ��敪
             05      ()-YUKOKIGEN        PIC  9(06). *>�L������
             05      ()-TENKANRI         PIC  X(02). *>�Ǘ��X
             05      ()-TENKAKUTOKU      PIC  X(02). *>�l���X
             05      ()-STS.                         *>�X�e�[�^�X
               07    ()-STSKBN           PIC  9(01). *>�b�r�X�e�[�^�X
               07    ()-STSKBNTOROKUYMD  PIC  9(08). *>�b�r�X�e�[�^�X�ݒ��
             05      ()-PNT.                         *>�����ԍ����
               07    ()-PNTSHINNO        PIC  9(04). *>�����ԍ�
               07    ()-PNTKYUUNO        PIC  9(04). *>�������ԍ�
               07    ()-PNTHENKOUYMD     PIC  9(08). *>�����ԍ��o�^�^�ύX��
             05      ()-TOUYMD           PIC  9(08). *>�쐬��
             05      ()-KOUYMD           PIC  9(08). *>�X�V��
             05      ()-HOSTSHORIYMD     PIC  X(08). *>�z�X�g�쐬��
             05      ()-HOSTSHORITIME    PIC  X(06). *>�z�X�g�쐬����
             05      ()-SVRKOUSHINYMD    PIC  9(08). *>�T�[�o�o�^��
