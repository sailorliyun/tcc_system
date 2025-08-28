#!/bin/csh
#   �X�N���v�g���F qbfb_s000500.csh
#   �@  �\	�F �����f�[�^�ړ�
#   �쐬��	�F NBC �֓�

##################################
#           ���ݒ�             #
##################################
set    SHELL_NAME = $0                                 # �V�F����
setenv JOB_ID       'QBDJU5UX'                         # �W���u��
setenv JOBNET_ID   'QBD503UX'                          # �W���u�l�b�g��
set    LOGFILE    = $USER_LOG_DIR/${JOB_ID}.log        # ���O�t�@�C����
set    LOGWRITE   = $EXE_DIR/QUAJ_MSGLOG.BAT           # ���O�o�̓��W���[��
setenv USERKEY     'IMGHULFT'                          # ���[�U�L�[
set    KINOU      = '�����f�[�^�ړ�'                   # �@�\��
set    QB_DATA_DIR  = /d360/UFS/imgkanri/image_buffer  # �����f�[�^�ۑ���
set    QB_BACK_DIR  = /d360/UFS/imgkanri/bkhost        # �����f�[�^�o�b�N�A�b�v�f�B���N�g��

set MODULE = 'SHELL'
# �J�n���b�Z�[�W�̏o��
$LOGWRITE "$MODULE" I "�J�n:$KINOU" "$USERKEY"


##############################################
# STEP-0 �o�b�N�A�b�v�f�B���N�g���m�F        #
##############################################

### 01
if !( -d $QB_BACK_DIR/01 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��01�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/01
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��01�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 02
if !( -d $QB_BACK_DIR/02 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��02�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/02
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��02�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 03
if !( -d $QB_BACK_DIR/03 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��03�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/03
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��03�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 04
if !( -d $QB_BACK_DIR/04 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��04�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/04
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��04�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 05
if !( -d $QB_BACK_DIR/05 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��05�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/05
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��05�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 06
if !( -d $QB_BACK_DIR/06 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��06�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/06
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��06�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 07
if !( -d $QB_BACK_DIR/07 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��07�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/07
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��07�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 08
if !( -d $QB_BACK_DIR/08 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��08�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/08
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��08�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 09
if !( -d $QB_BACK_DIR/09 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��09�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/09
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��09�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif

### 10
if !( -d $QB_BACK_DIR/10 ) then

	$LOGWRITE "$MODULE" W "�x��:$KINOU �o�b�N�A�b�v�f�B���N�g��10�����݂��Ȃ��׍쐬" "$USERKEY"
	mkdir $QB_BACK_DIR/10
	set rc = $status

	if ( $rc != 0 ) then

		# �ُ�I�����b�Z�[�W�̏o��
		$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��10�̍쐬�s�� RC=[$rc]" "$USERKEY"
		exit 1

	endif

endif


##############################################
# STEP-1 �o�b�N�A�b�v�f�B���N�g��10����ړ�  #
##############################################

### �o�b�N�A�b�v�f�B���N�g��10�̍폜
/usr/bin/rm -fr $QB_BACK_DIR/10
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��10�̍폜�s�� RC=[$rc]" "$USERKEY"
	exit 1

endif


### 09����10�ֈړ�
mv $QB_BACK_DIR/09 $QB_BACK_DIR/10
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 09-10 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 08����09�ֈړ�
mv $QB_BACK_DIR/08 $QB_BACK_DIR/09
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 08-09 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 07����08�ֈړ�
mv $QB_BACK_DIR/07 $QB_BACK_DIR/08
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 07-08 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 06����07�ֈړ�
mv $QB_BACK_DIR/06 $QB_BACK_DIR/07
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 06-07 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 05����06�ֈړ�
mv $QB_BACK_DIR/05 $QB_BACK_DIR/06
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 05-06 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 04����05�ֈړ�
mv $QB_BACK_DIR/04 $QB_BACK_DIR/05
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 04-05 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 03����04�ֈړ�
mv $QB_BACK_DIR/03 $QB_BACK_DIR/04
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 03-04 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 02����03�ֈړ�
mv $QB_BACK_DIR/02 $QB_BACK_DIR/03
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 02-03 RC=[$rc]" "$USERKEY"
	exit 1

endif


### 01����02�ֈړ�
mv $QB_BACK_DIR/01 $QB_BACK_DIR/02
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU ����o�b�N�A�b�v�G���[ 01-02 RC=[$rc]" "$USERKEY"
	exit 1

endif

### �o�b�N�A�b�v�f�B���N�g��01�쐬
mkdir $QB_BACK_DIR/01
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �o�b�N�A�b�v�f�B���N�g��01�쐬�s�� RC=[$rc]" "$USERKEY"
	exit 1

endif


### �C���[�W�Ǘ������p����o�b�N�A�b�v�f�B���N�g��01�ɉ����f�[�^���R�s�[
cp -p $QB_DATA_DIR/O.F.QA0?.txt $QB_BACK_DIR/01
set rc = $status

if ( $rc != 0 ) then

	# �ُ�I�����b�Z�[�W�̏o��
	$LOGWRITE "$MODULE" E "�ُ�I��:$KINOU �����f�[�^�R�s�[�G���[ IMG-01 RC=[$rc]" "$USERKEY"
	exit 1

endif


# �I�����b�Z�[�W�̏o��
$LOGWRITE "$MODULE" I "�I��:$KINOU" "$USERKEY"
exit 0
