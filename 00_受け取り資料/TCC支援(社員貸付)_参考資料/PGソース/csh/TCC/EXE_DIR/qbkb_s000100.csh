#!/bin/csh
#��������ץ�̾  �� qbkb_s000100.csh
#�� ��  ǽ       �� FAX�����ѷ������ۥǡ�����ʬ���� �ʶ���)
#�� ������       �� FIP
#
#   ��������
#   ����   �����ֹ�    ��������                ������         ������
#   000001 14120002    WORK�ǥ��쥯�ȥ�̾������Ǽ���  FIP����  2015.12.22

##################################
#           �Ķ�����             #
##################################
set    SHELL_NAME = $0                               			  	#������̾
setenv JOB_ID       $SHELL_NAME:t                     			 	#�����̾
setenv JOBNET_ID   'QBTK00UX'										#����֥ͥå�̾
set    LOGFILE    = $USER_LOG_DIR/user.log	        				#���ե�����̾
set    LOGWRITE   = $EXE_DIR/QUAJ_MSGLOG.BAT          			 	#�����ϥ⥸�塼��
set    USERKEY    = 'qbkb_s000100.csh'                   			#�桼������
set    KINOU      = 'FAX�����ѷ������ۥǡ�����ʬ���� �ʶ���)'		#��ǽ

set    FILE_DATE  = `date +%Y%m%d%H%M%S`							#����
set    KAKUCHOU   = .csv											#��ĥ��
# MOD 000001  WORK�ǥ��쥯�ȥ�̾������Ǽ���  FIP����  2015.12.22
#set    WORK_DIR   = $QB_DATA_DIR/qb/FAXWORK							#WORK�ǥ��쥯�ȥ�
set    WORK_DIR   =  $2												#WORK�ǥ��쥯�ȥ�
set    MODULE     = 'SHELL'

$LOGWRITE "$MODULE" I "START:$KINOU" "$USERKEY"   					# ���ϥ�å������ν���

#################################################
# STEP-1  ���������å�                          #
#################################################
# MOD 000001  WORK�ǥ��쥯�ȥ�̾������Ǽ���  FIP����  2015.12.22
#if ( $1 == "" ) then
#	$LOGWRITE "$MODULE" E "ERR:���������ꤵ��Ƥ��ޤ���" "$USERKEY"	
#	exit 1													# �۾ｪλ
#endif

if ( $#argv != 2 ) then
	$LOGWRITE "$MODULE" E "ERR:�����ο����ۤʤ�ޤ�" "$USERKEY"
	exit 1		#�۾ｪλ
endif


#################################################
# STEP-2  �ե����뿶ʬ����                      #
#################################################
$LOGWRITE "$MODULE" I "START:File-Furiwake" "$USERKEY"	#���ϥ�å�����
setenv LANG ja_JP.UTF-8										#�����UTF-8���ѹ�

foreach  wk ( "`cat $1`" )
	set FORM_ID  = `echo $wk | awk -F, '{print $29}'`		#,���ڤ��29���ܤ�FORM_ID�˥��å�
	set OWNER_ID = `echo $wk | awk -F, '{print $26}'`		#,���ڤ��26���ܤ�OWNER_ID�˥��å�
	set FURI_KEY = `echo $wk | awk -F, '{print $28}'`		#,���ڤ��28���ܤ�FURI_KEY�˥��å�
	echo "$wk" >> ${WORK_DIR}/${FORM_ID}_${OWNER_ID}_${FURI_KEY}_${FILE_DATE}
	
	set RC = $status
	if ( $RC != 0 ) then
		setenv LANG ja
	    $LOGWRITE  "$MODULE"  E  "ERR:File-Furiwake RC=[$RC]" "$USERKEY"
		exit 1												# �۾ｪλ
	endif
	
end

setenv LANG ja

$LOGWRITE "$MODULE" I "END:File-Furiwake" "$USERKEY"    #��λ��å�����

#################################################
# STEP-3  �ե�����ʬ�����                      #
#################################################
$LOGWRITE "$MODULE" I "START:File-Bunkatsu" "$USERKEY"						#���ϥ�å�����

set CUR_DIR = `pwd`																#���ߤΥǥ��쥯�ȥ��CUR_DIR�˥��åȤ���
cd ${WORK_DIR}																	#WORK�ǥ��쥯�ȥ�˰�ư����

setenv LANG ja_JP.UTF-8

foreach WORK_FILENAME ( "`ls -1`" )
	split -100 ${WORK_FILENAME} ${WORK_FILENAME}_								#100�老�Ȥ˥ե������ʬ�䤹��
	
	foreach SPLIT_FILENAME ( "`ls -1 ${WORK_FILENAME}_*`" )						#Ϣ���ѹ����Υե�����̾��SPLIT_FILENAME�˥��å�
		set RENBAN_FILENAME = `ls -1 ${SPLIT_FILENAME} | tr '[a-j]' '[0-9]'` 	#Ϣ�֤�������ѹ�����Ϣ���ѹ���Υե�����̾��RENBAN_FILENAME�˥��å�
		mv ${SPLIT_FILENAME} ${RENBAN_FILENAME}${KAKUCHOU}						#�ե�����̾��Ϣ���ѹ����̾�����ѹ����������˳�ĥ��.csv����Ϳ
	end
		
	set RC = $status
	if ( $RC != 0 ) then
		setenv LANG ja
	    $LOGWRITE  "$MODULE"  E  "ERR:File-Bunkatsu RC=[$RC]" "$USERKEY"
		exit 1																	# �۾ｪλ
	endif
	
end

setenv LANG ja

cd ${CUR_DIR}																	#ʬ��ǥ��쥯�ȥ�˰�ư����

$LOGWRITE "$MODULE" I "END:File-Bunkatsu" "$USERKEY"    					#��λ��å�����

#################################################
# STEP-4  �ե�����������                      #
#################################################
rm -f ${WORK_DIR}/*${FILE_DATE}								#ʬ�����Υե������������

#################################################
# STEP-99  ��λ����                             #
#################################################
$LOGWRITE "$MODULE" I "END:$KINOU" "$USERKEY"   			# ��λ��å������ν���
exit 0                                           			# ���ｪλ
