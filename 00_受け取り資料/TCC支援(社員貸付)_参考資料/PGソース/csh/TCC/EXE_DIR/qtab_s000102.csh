#!/bin/csh
#�@ �X�N���v�g�� �F qtab_s000102
#�@ �@  �\       �F ����}�X�^�f�[�^�ǉ�
#�@ �쐬��       �F �]��
#�@ �쐬��       �F 2006/08/06
#     ��  ���F$1 --- ������                         (�K�{)
#             $2 --- ��ƃf�B���N�g��                 (�K�{)
#             $3 --- �R���g���[���f�B���N�g��         (�K�{)
#
#     EXIT�l�F0 --- ����
#             1 --- �G���[����

##################################
#           ���ݒ�             #
##################################
set    SHELL_NAME    = $0
setenv JOB_ID          $SHELL_NAME:t 
setenv JOBNET_ID       'qtab_s000100'
set    LOGWRITE      = $EXE_DIR/QUAJ_MSGLOG.BAT
set    SOTFILE1      = qtab_s000100.dat$1.1                   # ��Ɨp�t�@�C���P
set    SOTFILE2      = qtab_s000100.dat$1.2                   # ��Ɨp�t�@�C���Q
set    QT_WORK_DIR   = $2                                     # ��Ɨp�f�B���N�g��
set    WLDR_CTRL_DIR = $3                                     # ���[�_�[�p�f�B���N�g��

set    KINOU         = '����}�X�^�f�[�^�ǉ�����'

#########################################
# STEP-1 �f�[�^�o�^�P                   #
#########################################
$LOGWRITE "SQL-LOADER1" I "�J�n:$KINOU 1" "qtab_s000102"

#MOD 0808052 �s�b�b�x���V�X�e���̍č\�z     20090329 murayama start
sqlldr   $DB_USERID/$DB_PASSWORD@$ORACLE_SID       \
         $WLDR_CTRL_DIR/qtad_kaiin_iko.sql         \
   data   = $QT_WORK_DIR/$SOTFILE1                 \
   log    = $WLDR_CTRL_DIR/$SOTFILE1.log           \
   bad    = $WLDR_CTRL_DIR/$SOTFILE1.bad           \
   errors = 1000                                   \
   direct = true
#MOD 0808052 �s�b�b�x���V�X�e���̍č\�z     20090329 murayama end


if($status != 0) then
   $LOGWRITE "SQL-LOADER1" E "���s:$KINOU 1" "qtab_s000102"
   exit(1)
endif

$LOGWRITE "SQL-LOADER1" I "�I��:$KINOU 1" "qtab_s000102"

#########################################
# STEP-2 �f�[�^�o�^�Q                   #
#########################################
$LOGWRITE "SQL-LOADER2" I "�J�n:$KINOU 2" "qtab_s000102"

#MOD 0808052 �s�b�b�x���V�X�e���̍č\�z     20090329 murayama start
sqlldr   $DB_USERID/$DB_PASSWORD@$ORACLE_SID       \
         $WLDR_CTRL_DIR/qtad_kaiin_iko.sql         \
   data   = $QT_WORK_DIR/$SOTFILE2                 \
   log    = $WLDR_CTRL_DIR/$SOTFILE2.log           \
   bad    = $WLDR_CTRL_DIR/$SOTFILE2.bad           \
   errors = 1000                                   \
   direct = true
#MOD 0808052 �s�b�b�x���V�X�e���̍č\�z     20090329 murayama end

if($status != 0) then
   $LOGWRITE "SQL-LOADER2" E "���s:$KINOU 2" "qtab_s000102"
   exit(1)
endif

$LOGWRITE "SQL-LOADER2" I "�I��:$KINOU 2" "qtab_s000102"

exit 0
