#!/bin/csh
#��������ץ�̾  �� qbkb_s000200.csh
#�� ��  ǽ       �� SFTP�ۿ����̽���
#�� ������       �� FIP
#
#   ��������
#   ����   �����ֹ�    ��������                ������         ������
#   

##################################
#           �Ķ�����             #
##################################
set    SHELL_NAME = $0                              		  	#������̾
setenv JOB_ID       $SHELL_NAME:t                  			 	#�����̾
setenv JOBNET_ID   'QBTK40UX'									#����֥ͥå�̾
set    LOGFILE    = $USER_LOG_DIR/user.log        				#���ե�����̾
set    LOGWRITE   = $EXE_DIR/QUAJ_MSGLOG.BAT       			 	#�����ϥ⥸�塼��
set    USERKEY    = 'qbkb_s000200.csh'                			#�桼������
set    KINOU      = 'SFTP�ۿ����̽���'							#��ǽ

set    MODULE     = 'SHELL'
set    WORK_FILE_NUM  = `ls -1 $2* | wc -l`						#WORK�ǥ��쥯�ȥ��۲��Υե������

set    FAXUSER    = 'apmuser'									#FAXUSRER�Υ桼����ID
set    PSWFILE    = /s040/tcc/fax_pass    	 					#�ѥ���ɳ�Ǽ�ե�����

$LOGWRITE "$MODULE" I "����:$KINOU" "$USERKEY"   				#���ϥ�å������ν���

#################################################
# STEP-1  ���������å�                          #
#################################################
if ( $#argv != 2 ) then
	$LOGWRITE "$MODULE" E "����:�����ο����ۤʤ�ޤ�" "$USERKEY"
	exit 1		#�۾ｪλ
endif

#################################################
# STEP-2  WORK�ǥ��쥯�ȥ�ե���������å�      #
#################################################
if ( $WORK_FILE_NUM == 0 ) then
	$LOGWRITE "$MODULE" E "����:WORK�ǥ��쥯�ȥ���˥ե����뤬����ޤ���" "$USERKEY"
	exit 1		# �۾ｪλ
endif

#################################################
# STEP-3  FAX����BOX�ؤ���������                #
#################################################
set    MODULE     = 'sftpg3'

$LOGWRITE "$MODULE" I "����:FAX����BOX�ؤ�����" "$USERKEY"		#���ϥ�å�����

sftpg3 --password=file://$PSWFILE $FAXUSER@$1 << EOF
put $2*
quit
EOF

#ľ���˼¹Ԥ������ޥ�ɤ�����������0�����Ԥ�����1��RC�˥��å�
set RC = $status
if ( $RC != 0 ) then
    $LOGWRITE  "$MODULE"  E  "����:FAX����BOX�ؤ����� RC=[$RC]" "$USERKEY"
	exit 1		# �۾ｪλ
endif

$LOGWRITE "$MODULE" I "��λ:FAX����BOX�ؤ�����" "$USERKEY"    	#��λ��å�����

#################################################
# STEP-99  ��λ����                             #
#################################################
set    MODULE     = 'SHELL'
$LOGWRITE "$MODULE" I "��λ:$KINOU" "$USERKEY"   				#��λ��å������ν���
exit 0                                           				#���ｪλ
