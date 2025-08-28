#
#  ���O���C�^��~  (QUAJ_LWTRSTOP.BAT)
#
#     �@  �\�F���O�o�̓��C�^��~�p�t�@�C�����쐬���A
#           �F���O�o�̓��C�^��~�X�g�A�[�h�v���V�W�����N������B
#     ��  ���F$1 --- opelog or conslog      (�K�{)
#           �F$2 --- oracle sid             (�K�{)
#
#     EXIT�l�F0 --- ����
#             1 --- �G���[����
#             2 --- �p�����[�^�G���[
#

set  SQLUID   =  tccuser
set  SQLPSW   =  tccuser
set  MODULE   = QUAJ_LWTRSTOP
set  LOGFILE  = $USER_LOG_DIR/db_ope.log
set  LOGWRITE = "$EXE_DIR/QUAJ_BATCHLOG.BAT ($MODULE)"


if ( $#argv < 2 ) then								# ���̓p�����^��2�����̏ꍇ
     echo  "Lack of Input Parameter" 						# �G�R�[�o��
     LOGWRITE "Lack of Input Parameters" >> $LOGFILE				# ���O�o��
     exit 2									# �I��
else
  if ( $1 == "opelog" ) then							# ��1�p�����^��"opelog"�̎�
        set LWTRNAME = "QUSP_SubWriteLog"					# ���C�^���w��
        set PCLOSE   = "QUSP_SubPipe2Close"					# �N���[�Y�v���V�[�W�����w��
  else
    if ( $1 == "conslog"  ) then						# ��1�p�����^��"conslog"�̎�
        set LWTRNAME = "QUSP_SubDispCons"					# ���C�^���w��
        set PCLOSE   = "QUSP_SubPipe1Close"					# �N���[�Y�v���V�[�W�����w��
    else			 						# "opelog","conslog"�ȊO�̎�
        echo  "$1 Invalid  Parameter"						# �G�R�[�o��
        $LOGWRITE "$1 Invalid  Parameter" >> $LOGFILE 				# ���O�o��
        exit 1									# �I��
    endif
  endif
endif

setenv ORACLE_SID	$2							# ���ϐ���ORACLE_SID���w��


set  ENDFILE  = /tmp/$1.dat							# ���O���C�^�I���p�t�@�C��������
touch $ENDFILE									# ���O���C�^�I���p�t�@�C���쐬

#echo "EXECUTE QUSP_LOGPKG.$PCLOSE;" > $EXE_DIR/$PCLOSE.SQL
#echo "exit" >> $EXE_DIR/$PCLOSE.SQL
echo "EXECUTE QUSP_LOGPKG.$PCLOSE;" > $EXE_DIR/$PCLOSE.$ORACLE_SID		# sqlplus�Ɏw�肷�镶���t�@�C���ɏ���
echo "exit" >> $EXE_DIR/$PCLOSE.$ORACLE_SID					#

#sqlplus    $SQLUID/$SQLPSW  @$EXE_DIR/$PCLOSE.SQL
#sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$PCLOSE.SQL
sqlplus -s $SQLUID/$SQLPSW  @$EXE_DIR/$PCLOSE.$ORACLE_SID >> $LOGFILE		# sqlplus��p���A���O���C�^��~

echo "$1 Writer Nomaly Stopping"
$LOGWRITE  "$1 Writer Nomaly Stopping" >> $LOGFILE

sleep 15

exit 0
