#!/bin/csh
#
#  �I�����C���I��  (QUOJE1UX)
#
#     �@  �\�F0.���O���C�^���~����B
#             1.��f�[�^�x�[�X���~����B
#             2.�Z�L�����e�B�f�[�^�x�[�X���~����B
#             3.���X�i�[���~����B
#            
#     ��  ���F
#
#     EXIT�l�F0 --- ����
#             1 --- �G���[����
#
set  SHELL_NAME = $0                                    			# �V�F����
set  MODULE   =  $SHELL_NAME:t                          			# ���W���[����
set  LOGFILE  = $USER_LOG_DIR/db_ope.log                			# ���O�t�@�C����
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"  			# ���O�o�͗p���ʃV�F��

if ( $#argv == 1 ) then								# �������w�肳��Ă����ꍇ
    setenv ORACLE_SID   $1							# ���ϐ�ORACLE_SID��ݒ�
endif

#echo $MODULE " : " $ORACLE_SID

$LOGWRITE  "�I�����C���I��" >> $LOGFILE

#####################################
# 0. ���O���C�^��~�i�R���X���O�j   #
#####################################
$EXE_DIR/QUAJ_LWTRSTOP.BAT conslog $ORACLE_SID					# �R���\�[�����O���C�^�̒�~
set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "ConslogWriter Stopping error occured[RC=$RC]" >> $LOGFILE 
    exit 1
endif

#####################################
# 1. ���O���C�^��~�i�I�y���O�j     #
#####################################
$EXE_DIR/QUAJ_LWTRSTOP.BAT opelog $ORACLE_SID					# �I�y���O���C�^�̒�~
set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "OpelogWriter Stopping error occured[RC=$RC]" >> $LOGFILE 
    exit 1
endif

#########################
# 2. ��f�[�^�x�[�X��~ #
#########################
#$EXE_DIR/QUAJ_DBSTOP.BAT  tcc
#$EXE_DIR/QUAJ_DBSTOP.BAT  PT1
$EXE_DIR/QUAJ_DBSTOP.BAT  $ORACLE_SID						# ���ϐ���p���Ăc�a��~
set RC = $status
if ( $RC != 0 ) then
	exit 1
endif

if ( $ORACLE_SID == PT1 ) then							# ORACLE_SID��PT1�̎�
	$LOGWRITE  "�I�����C���I������I��" >> $LOGFILE				# ���O�o��
	exit 0									# �I��
endif

### �ȉ���PT1�ȊO�̎����� ###

###################################
# 3. �Z�L�����e�B�f�[�^�x�[�X��~ #
###################################
$EXE_DIR/QUAJ_DBSTOP.BAT  SECU							# �Z�L�����e�B�c�a��~
set RC = $status
if ( $RC != 0 ) then
	exit 1
endif

########################
# 4. ���X�i�[��~      #
########################
$EXE_DIR/QUAJ_LSNRSTOP.BAT 							# ���X�i�[��~
set RC = $status
if ( $RC != 0 ) then
	exit 1
endif

$LOGWRITE  "�I�����C���I������I��" >> $LOGFILE

exit 0
