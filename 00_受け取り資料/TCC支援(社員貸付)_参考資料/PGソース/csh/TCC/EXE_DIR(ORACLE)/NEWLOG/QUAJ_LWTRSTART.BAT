#
#  ���O���C�^�N��  (QUAJ_LWTRSTART.BAT)
#
#     �@  �\�F���̓p�����[�^�Ŏw�肳�ꂽ���O���C�^�X�g�A�[�h�v���V�W�����N������B
#     ��  ���F$1 --- opelog or conslog      (�K�{)
#           �F$2 --- oracle sid             (�K�{)
#
#     EXIT�l�F0 --- ����
#             1 --- �G���[����
#             2 --- �p�����[�^�G���[
#


set  SQLUID   = tccuser
set  SQLPSW   = tccuser
set  MODULE   = QUAJ_LWTRSTART
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


echo "$1 Writer Starting"
$LOGWRITE  "$1 LogWriter Starting" >> $LOGFILE

if ( $#argv < 2 ) then								# ���̓p�����^��2�����̏ꍇ
     echo  "Lack of Input Parameter" 						# �G�R�[�o��
     LOGWRITE "Lack of Input Parameters" >> $LOGFILE				# ���O�o��
     exit 2									# �I��
else
  if ( $1 == "opelog" ) then							# ��1�p�����^��"opelog"�̎�
        set LWTRNAME = "QUSP_SubWriteLog"					# ���C�^���w��
  else
    if ( $1 == "conslog"  ) then						# ��1�p�����^��"conslog"�̎�
        set LWTRNAME = "QUSP_SubDispCons"					# ���C�^���w��
    else									# "opelog","conslog"�ȊO�̎�
        echo  "$1 Invalid  Parameter" 						# �G�R�[�o��
        $LOGWRITE "$1 Invalid  Parameter" >> $LOGFILE 				# ���O�o��
        exit 1									# �I��
    endif
  endif
endif

setenv ORACLE_SID	$2							# ���ϐ���ORACLE_SID���w��


set  ENDFILE  = /tmp/$1.dat							# ���O���C�^�I���p�t�@�C��������
rm -f $ENDFILE									# ���O���C�^�I���p�t�@�C���폜

#echo "EXECUTE QUSP_LOGPKG.$LWTRNAME;" > $EXE_DIR/$LWTRNAME.SQL
#echo "exit" >> $EXE_DIR/$LWTRNAME.SQL
echo "EXECUTE QUSP_LOGPKG.$LWTRNAME;" > $EXE_DIR/$LWTRNAME.$ORACLE_SID		# sqlplus�Ɏw�肷�镶���t�@�C���ɏ���
echo "exit" >> $EXE_DIR/$LWTRNAME.$ORACLE_SID					# 

while (1)									# ���O���C�^���I�����Ȃ��l�Ƀ��[�v
#   sqlplus    $SQLUID/$SQLPSW  @$EXE_DIR/$LWTRNAME.SQL
#   sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$LWTRNAME.SQL
    sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$LWTRNAME.$ORACLE_SID >> $LOGFILE	# sqlplus��p���A���O���C�^�N��

    if ( -f $ENDFILE ) then							# ���O���C�^�I�����A���O���C�^�I���p�t�@�C��
        rm -f $ENDFILE								# ���쐬�ς݂��`�F�b�N����
        break									# �쐬�ς݂̏ꍇ�A����I���Ȃ̂Ńt�@�C���폜
    else									# ���O���C�^�I���p�t�@�C�������쐬�̏ꍇ�i�ُ�I���j
        set PRCNUM = `ps -ef | grep -v 'grep' | grep -c "ora_.*${ORACLE_SID}"`	# �I���N���̃v���Z�X���N������Ă��邩�`�F�b�N
        if ( $PRCNUM < 6 ) then							# �I���N���v���Z�X��6���������N������Ă��Ȃ���
            echo "DB���N��(�풓�v���Z�X��ғ�)�̂��ߒ�~"			# �I���N���̏I���Ƃ������ƂŃ��O���C�^��~
            $LOGWRITE  "DB���N��(�풓�v���Z�X��ғ�)�̂��ߒ�~" >> $LOGFILE
            break
        else									# �I���N���͋N���ς݂̎�
            echo "$1 Writer Abnomaly Stopped... Restart"
            $LOGWRITE  "$1 Writer Abnomaly Stopped... Restart" >> $LOGFILE
            sleep 5								# �T�b�Ԓ�~������A���[�v�̍ŏ��ɖ߂�A���O���C�^�ċN��
        endif
    endif
end

echo "$1 Writer Nomaly Stopped"
$LOGWRITE  "$1 Writer Nomaly Stopped" >> $LOGFILE

exit 0
