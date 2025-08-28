#!/bin/csh
#�@ �X�N���v�g�� �F qtab_s000101.csh
#�@ �@  �\       �F ����}�X�^�f�[�^�t�@�C���쐬
#�@ �쐬��       �F �]��
#�@ �쐬��       �F 2006/08/06
#     ��  ���F$1 --- ������                         (�K�{)
#             $2 --- ��M�f�B���N�g��                 (�K�{)
#             $3 --- ��ƃf�B���N�g��                 (�K�{)
#
#     EXIT�l�F0 --- ����
#             1 --- �G���[����

##################################
#           ���ݒ�             #
##################################
set    SHELL_NAME   = $0
setenv JOB_ID         $SHELL_NAME:t 
setenv JOBNET_ID      'qtab_s000101'
set    LOGWRITE     = $EXE_DIR/QUAJ_MSGLOG.BAT
set    SINFILE      = qtaf_kaiin9_$1.hft        # ��M�t�@�C��
set    SOTFILE1     = qtab_s000100.dat$1.1      # ��Ɨp�t�@�C���P
set    SOTFILE2     = qtab_s000100.dat$1.2      # ��Ɨp�t�@�C���Q
set    QT_DATA_DIR  = $2                        # �g�t�k�e�s��M�p�f�B���N�g��
set    QT_WORK_DIR  = $3                        # ��Ɨp�f�B���N�g��
set    KINOU        = '����}�X�^�f�[�^�t�@�C���쐬����'

#########################################
# �t�@�C���쐬                          #
#########################################
$LOGWRITE "COBOL" I "�J�n:$KINOU $1" "qtab_s000100"
setenv INFILE  $QT_DATA_DIR/$SINFILE
setenv OTFILE  $QT_WORK_DIR/$SOTFILE1
setenv OTFILE2 $QT_WORK_DIR/$SOTFILE2

$EXE_DIR/qtab_s000100_iko.exe >& $USER_LOG_DIR/$SINFILE.log
if($status != 0) then
   $LOGWRITE "COBOL" E "���s:$KINOU $1" "qtab_s000100"
   exit(1)
endif

$LOGWRITE "COBOL" I "�I��:$KINOU $1" "qtab_s000100"

exit 0
