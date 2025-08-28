/*******************************************************************************
/*                                                                             *
/*   ���[�U���O�V�X�e�����W���[�� (�p�C�v�������@�\�Łj                        * 
/*                                    �쐬���F  '99.3.15  ANX.��|�v�i         *
/*   QUSP_DispUponCons                �C�����F  '99.4.15  ANX.��|�v�i         *
/*   QUSP_SubDispCons                 �C�����F  '99.6.15  ANX.�K���T�V         *
/*   QUSP_WriteOpeLog                 �C�����F  '99.7.24  ANX.�K���T�V         *      
/*   QUSP_SubWriteLog                 �C�����F  '99.7.27  ANX.�K���T�V         *
/*   QUSP_SubPipe1Close                                                        *
/*   QUSP_SubPipe2Close                                                        *
/*******************************************************************************
CREATE OR REPLACE PACKAGE QUSP_LOGPKG
IS	
	--------------------------------------------
	--    �R���\�[�����O�o�̓C���^�t�F�[�X    --
	--------------------------------------------
	PROCEDURE QUSP_DispUponCons(	i_JobNetMei	IN  QUS1_CONSLOGT.QUS1_JOBNETMEI%TYPE,	
					i_JobMei 	IN  QUS1_CONSLOGT.QUS1_JOBMEI%TYPE,	
					i_UserKey 	IN  QUS1_CONSLOGT.QUS1_USERKEY%TYPE,	
					i_ModuleId 	IN  QUS1_CONSLOGT.QUS1_MODULEID%TYPE,
					i_MsgKbn 	IN  QUS1_CONSLOGT.QUS1_MSGKBN%TYPE,
					i_Msg   	IN  QUS1_CONSLOGT.QUS1_MSG%TYPE);

	--------------------------------------------
	--        �R���\�[�����O�o�̓��C�^        --
	--------------------------------------------
        PROCEDURE QUSP_SubDispCons;   /* �풓�v���V�W�� */

        --------------------------------------------
	--  �I�y���[�V�������O�o�̓C���^�t�F�[�X  --
	--------------------------------------------
	PROCEDURE QUSP_WriteOpeLog(	i_MenuId	IN  QUS2_OPELOGT.QUS2_MENUID%TYPE,	
					i_ModuleId 	IN  QUS2_OPELOGT.QUS2_MODULEID%TYPE,	
					i_UserId 	IN  QUS2_OPELOGT.QUS2_USERID%TYPE,	
					i_ComputerMei 	IN  QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE,	
					i_TouzaiKbn 	IN  QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE,
	                                i_BushoCd 	IN  QUS2_OPELOGT.QUS2_BUSHOCD%TYPE,
					i_Msg   	IN  QUS2_OPELOGT.QUS2_MSG%TYPE);

	--------------------------------------------
	--  �I�y���[�V�������O�o�̓��C�^          --
	--------------------------------------------
        PROCEDURE QUSP_SubWriteLog;   /* �풓�v���V�W�� */

        --------------------------------------------
	--   �R���X���O�o�̓��C�^��~�v���V�W��   --
	--------------------------------------------
        PROCEDURE QUSP_SubPipe1Close;
        --------------------------------------------
	--   �I�y���O�o�̓��C�^��~�v���V�W��     --
	--------------------------------------------
        PROCEDURE QUSP_SubPipe2Close;
     
END QUSP_LogPkg;

CREATE OR REPLACE PACKAGE BODY QUSP_LOGPKG
IS
       --------------------------------------------
       --    �R���\�[�����O�o�̓C���^�t�F�[�X    --
       --------------------------------------------
	PROCEDURE QUSP_DispUponCons(    i_JobNetMei	IN  QUS1_CONSLOGT.QUS1_JOBNETMEI%TYPE,	
					i_JobMei 	IN  QUS1_CONSLOGT.QUS1_JOBMEI%TYPE,	
					i_UserKey 	IN  QUS1_CONSLOGT.QUS1_USERKEY%TYPE,	
					i_ModuleId 	IN  QUS1_CONSLOGT.QUS1_MODULEID%TYPE,	
					i_MsgKbn 	IN  QUS1_CONSLOGT.QUS1_MSGKBN%TYPE,	
					i_Msg   	IN  QUS1_CONSLOGT.QUS1_MSG%TYPE)
        IS
	------------------------------
	--	��Ɨ̈�	    --
	------------------------------
        W_SysDate    DATE := SYSDATE;
        W_JobNetMei  VARCHAR2(08);
        W_JobMei     VARCHAR2(08);
        W_UserKey    VARCHAR2(20);
        W_ModuleId   VARCHAR2(40);
        W_MsgKbn     VARCHAR2(01);
        W_Msg        VARCHAR2(1024);
        stat         INTEGER;
        S_JobNetMei  CHAR(08);
        S_JobMei     CHAR(08);
        S_UserKey    CHAR(20);
        S_ModuleId   CHAR(40);
        S_MsgKbn     CHAR(01);
        W_Buffer     VARCHAR2(2000);
        W_PRMERROR   EXCEPTION;
        PIPE_ERROR   EXCEPTION;
BEGIN

---�p�����[�^�`�F�b�N
---COBOL���ӎ���VARCHAR2���ڂ͋󔒂��폜����
---�p�����[�^�G���[�̏ꍇ�̓��[�U�G���[�𔭐�

---JOBNETMEI�͕K�{����
        W_JobNetMei := rtrim(i_JobNetMei);
        W_JobNetMei := ltrim(W_JobNetMei);
        IF W_JobNetMei IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_JobNetMei := W_JobNetMei;

---JOBMEI�͕K�{����
        W_JobMei := rtrim(i_JobMei);
        W_JobMei := ltrim(W_JobMei);
        IF W_JobMei IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_JobMei := W_JobMei;

---USERKEY�͕K�{���ڂł͂Ȃ����ߋ󔒂̍폜�̂�
        W_UserKey := rtrim(i_UserKey);
        W_UserKey := ltrim(W_UserKey);
        S_UserKey := W_UserKey;
        if W_UserKey is null then
           S_USerKey := '#####';
        end if;

---MODULEID�͕K�{����
        W_ModuleId := rtrim(i_ModuleId);
        W_ModuleId := ltrim(W_ModuleId);
        IF W_ModuleId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_ModuleId := W_ModuleId;

---MSGKBN�͕K�{���ڂ���I/W/E/S�ł��邱�Ɓi�������̏ꍇ�͑啶���ɕϊ�)
        W_MsgKbn := upper(i_MsgKbn);
        IF W_MsgKbn IS NULL then
           RAISE W_PRMERROR;
        END IF;
        IF (W_MsgKbn <> 'I') and (W_MsgKbn <> 'W') and (W_MsgKbn <> 'E') and (W_MsgKbn <> 'S') then
           RAISE W_PRMERROR;
        END IF;
        S_MsgKbn := W_MsgKbn;

---MSG�͕K�{����
        W_Msg := rtrim(i_Msg);
        W_Msg := ltrim(W_Msg);
        IF W_Msg IS NULL then
           RAISE W_PRMERROR;
        END IF;
     
-- ���O���R�[�h�ǉ� --
        W_Buffer := S_JobNetMei || S_JobMei || S_UserKey || S_ModuleId || S_MsgKbn || W_Msg;
        DBMS_PIPE.pack_message( W_Buffer );
        stat := DBMS_PIPE.send_message('QUSP_PIPE1',2000);
        if stat != 0 then
           raise PIPE_ERROR;
        end if;   

EXCEPTION
        WHEN W_PRMERROR THEN
---- �p�����[�^�G���[��-20012��ԋp
           RAISE_APPLICATION_ERROR(-20012,'QUSP_DISPUPONCONS USER ERROR PARAMETER ERROR');
        WHEN PIPE_ERROR THEN
---- �o�h�o�d�G���[��-20016��ԋp
           RAISE_APPLICATION_ERROR(-20016,'QUSP_DISPUPONCONS SYSTEM ERROR PIPE ERROR');
        WHEN OTHERS THEN
	   RAISE;
END QUSP_DispUponCons; 

       ------------------------------------
       --    �R���\�[�����O�o�̓��C�^    --
       ------------------------------------
	PROCEDURE QUSP_SubDispCons
	IS
	------------------------------
	--	��Ɨ̈�	    --
	------------------------------
        W_SysDate    DATE;
        stat         INTEGER;
        W_JobNetMei  VARCHAR2(08);
        W_JobMei     VARCHAR2(08);
        W_UserKey    VARCHAR2(20);
        W_ModuleId   VARCHAR2(40);
        W_MsgKbn     VARCHAR(01);
        W_Msg        VARCHAR2(1024);
        W_Buffer     VARCHAR2(2000);
BEGIN
-- �p�C�v�̏��������� --
DBMS_PIPE.PURGE('QUSP_PIPE1');

-- ���b�Z�[�W��M���� --
loop
  begin
   	stat := DBMS_PIPE.receive_message('QUSP_PIPE1');
        DBMS_PIPE.unpack_message( W_Buffer );
-- ��M�����I�����f --
        if W_Buffer = 'PIPE_CLOSE' then
           DBMS_OUTPUT.put_line('pipe_close end');
           return;
        end if;
-- ���b�Z�[�W���� --
        W_SysDate := SYSDATE;
        W_JobNetMei := SUBSTR(W_Buffer, 1, 8);
        W_JobMei := SUBSTR(W_Buffer, 9, 8);
        W_UserKey := rtrim(SUBSTR(W_Buffer, 17, 20));
        if W_UserKey = '#####' then
           W_UserKey := '';
        end if;
        W_ModuleId := SUBSTR(W_Buffer, 37, 40);
        W_MsgKbn := SUBSTR(W_Buffer, 77, 1);
        W_Msg := SUBSTR(W_Buffer, 78);

-- ���O���R�[�h�ǉ� --
	insert into QUS1_CONSLOGT(QUS1_DATETIME,
				  QUS1_JOBNETMEI,
				  QUS1_JOBMEI,
				  QUS1_USERKEY,
				  QUS1_MODULEID,
				  QUS1_MSGKBN,
 				  QUS1_MSG)
			   values(W_SysDate,
				  W_JobNetMei,
				  W_JobMei,
				  W_UserKey,
				  W_ModuleId,
				  W_MsgKbn,
				  W_Msg);
        COMMIT;

  end;
  end loop;
            
END QUSP_SubDispCons; 

        --------------------------------------------
	--  �I�y���[�V�������O�o�̓C���^�t�F�[�X  --
	--------------------------------------------
	PROCEDURE QUSP_WriteOpeLog(	i_MenuId	IN  QUS2_OPELOGT.QUS2_MENUID%TYPE,	
					i_ModuleId 	IN  QUS2_OPELOGT.QUS2_MODULEID%TYPE,	
					i_UserId 	IN  QUS2_OPELOGT.QUS2_USERID%TYPE,	
					i_ComputerMei 	IN  QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE,	
					i_TouzaiKbn 	IN  QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE,
	                                i_BushoCd 	IN  QUS2_OPELOGT.QUS2_BUSHOCD%TYPE,
					i_Msg   	IN  QUS2_OPELOGT.QUS2_MSG%TYPE)
	IS
	------------------------------
	--	��Ɨ̈�	    --
        ------------------------------
        W_SysDate     DATE := SYSDATE;
        W_MenuId      VARCHAR2(05);
        W_ModuleId    VARCHAR2(40);
        W_UserId      VARCHAR2(08);
        W_ComputerMei VARCHAR2(20);
        W_BushoCd     VARCHAR2(04);
        W_TouzaiKbn   VARCHAR2(01);
        W_Msg         VARCHAR2(1700);
        stat          INTEGER;
        S_MenuId      CHAR(05);
        S_ModuleId    CHAR(40);
        S_UserId      CHAR(08);
        S_ComputerMei CHAR(20);
        S_BushoCd     CHAR(04);
        S_TouzaiKbn   CHAR(01);
        W_Buffer      VARCHAR2(2000);
        W_PRMERROR    EXCEPTION;
        PIPE_ERROR    EXCEPTION;
BEGIN
---�p�����[�^�`�F�b�N
---COBOL���ӎ���VARCHAR2���ڂ͋󔒂��폜����
---�܂�CHAR���ڂ͂`�k�k�󔒂͕s�Ƃ���
---�p�����[�^�G���[�̏ꍇ�̓��[�U�G���[�𔭐�

---MENUID�͕K�{����
        W_MenuId := rtrim(i_MenuId);
        W_MenuId := ltrim(W_MenuId);
        IF W_MenuId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_MenuId := W_MenuId;

---MODULEID�͕K�{����
        W_ModuleId := rtrim(i_ModuleId);
        W_ModuleId := ltrim(W_ModuleId);
        IF W_ModuleId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_ModuleId := W_ModuleId;

---USERID�͕K�{����
        W_UserId := rtrim(i_UserId);
        W_UserId := ltrim(W_UserId);
        IF W_UserId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_UserId := W_UserId;

---COMMPUTERMEI�͕K�{����
        W_ComputerMei := rtrim(i_ComputerMei);
        W_ComputerMei := ltrim(W_ComputerMei);
        IF W_ComputerMei IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_ComputerMei := W_ComputerMei;

---TOUZAIKBN�͕K�{���ڂ���1/2/3�ł��邱��
        W_TouzaiKbn := rtrim(i_TouzaiKbn);
        W_TouzaiKbn := ltrim(W_TouzaiKbn);
        IF (W_TouzaiKbn IS NULL) OR ( (W_TouzaiKbn <> '1') and (W_TouzaiKbn <> '2') and (W_TouzaiKbn <> '3') )  then
           RAISE W_PRMERROR;
        END IF;
        S_TouzaiKbn := W_TouzaiKbn;

---BUSHOCD�͕K�{����
        W_BushoCd := rtrim(i_BushoCd);
        W_BushoCd := ltrim(W_BushoCd);
        IF W_BushoCd IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_BushoCd := W_BushoCd;
  
---MSG�͕K�{����
        W_Msg := rtrim(i_Msg);
        W_Msg := ltrim(W_Msg);
        IF W_Msg IS NULL then
           RAISE W_PRMERROR;
        END IF;
       
-- ���O���R�[�h�ǉ� --
        W_Buffer := S_MenuId || S_ModuleId || S_UserId || S_ComputerMei || S_BushoCd || S_TouzaiKbn || W_Msg;
	DBMS_PIPE.pack_message( W_Buffer );
        stat := DBMS_PIPE.send_message('QUSP_PIPE2');
        if stat != 0 then
           raise PIPE_ERROR;
        end if;   

EXCEPTION
        WHEN W_PRMERROR THEN
---- �p�����[�^�G���[��-20012��ԋp
           RAISE_APPLICATION_ERROR(-20012,'QUSP_WRITEOPELOG USER ERROR PARAMETER ERROR');
        WHEN PIPE_ERROR THEN
---- �o�h�o�d�G���[��-20016��ԋp
           RAISE_APPLICATION_ERROR(-20016,'QUSP_DISPUPONCONS SYSTEM ERROR PIPE ERROR');
        WHEN OTHERS THEN
	   RAISE;
END QUSP_WriteOpeLog; 

        --------------------------------------------
	--      �I�y���[�V�������O�o�̓��C�^      --
	--------------------------------------------
	PROCEDURE QUSP_SubWriteLog
	IS
	------------------------------
	--	��Ɨ̈�	    --
	------------------------------
        W_SysDate     DATE;
        stat          INTEGER;
        W_MenuId      VARCHAR2(05);
        W_ModuleId    VARCHAR2(40);
        W_UserId      VARCHAR2(08);
        W_ComputerMei VARCHAR2(20);
        W_BushoCd     VARCHAR2(04);
        W_TouzaiKbn   VARCHAR2(01);
        W_Msg         VARCHAR2(1700);
        W_Buffer      VARCHAR2(2000);
        pipe_timeout  EXCEPTION;
BEGIN
-- �p�C�v�̏��������� --
DBMS_PIPE.PURGE('QUSP_PIPE2');

-- ���b�Z�[�W��M���� --
loop
  begin
   	stat := DBMS_PIPE.receive_message('QUSP_PIPE2');
        DBMS_PIPE.unpack_message( W_Buffer );
-- ��M�����I�����f --
        if W_Buffer = 'PIPE_CLOSE' then
           DBMS_OUTPUT.put_line('pipe_close end');
           return;
        end if;
-- ���b�Z�[�W���� --
        W_SysDate := SYSDATE;
        W_MenuId := SUBSTR(W_Buffer, 1, 5);
        W_ModuleId := SUBSTR(W_Buffer, 6, 40);
        W_UserId := SUBSTR(W_Buffer, 46, 8);
        W_ComputerMei := SUBSTR(W_Buffer, 54, 20);
        W_BushoCd := SUBSTR(W_Buffer, 74, 4);
        W_TouzaiKbn := SUBSTR(W_Buffer, 78, 1);
        W_Msg := SUBSTR(W_Buffer, 79);
              
-- ���O���R�[�h�ǉ� --
	insert into QUS2_OPELOGT (QUS2_DATETIME,
				  QUS2_MENUID,
				  QUS2_MODULEID,
				  QUS2_USERID,
                                  QUS2_COMPUTERMEI,
				  QUS2_TOUZAIKBN,
                                  QUS2_BUSHOCD,
 				  QUS2_MSG)
			  values( W_SysDate,
				  W_MenuId,
				  W_ModuleId,
				  W_UserId,
				  W_ComputerMei,
				  W_TouzaiKbn,
                                  W_BushoCd,
				  W_Msg);
        COMMIT;

  end;
  end loop;
END QUSP_SubWriteLog;

        ----------------------------------
	--   �R���X���O�o�̓��C�^��~   --
	---------------------------------- 
        PROCEDURE QUSP_SubPipe1Close
        IS
	------------------------------
	--	��Ɨ̈�	    --
	------------------------------
        stat          INTEGER;
        W_Buffer      VARCHAR2(2000);
        PIPE_ERROR    EXCEPTION;
BEGIN
        W_Buffer := 'PIPE_CLOSE'; 
        DBMS_PIPE.pack_message( W_Buffer );
        stat := DBMS_PIPE.send_message('QUSP_PIPE1',2000);
        if stat != 0 then
          raise PIPE_ERROR;
        end if;
EXCEPTION
        WHEN PIPE_ERROR THEN
---- �o�h�o�d�G���[��-20016��ԋp
           RAISE_APPLICATION_ERROR(-20016,'QUSP_SubPipe1Close PIPE ERROR');
        WHEN OTHERS THEN
	     RAISE;
END QUSP_SubPipe1Close;

        ---------------------------------
	--   �I�y���O�o�̓��C�^��~    --
	--------------------------------- 
        PROCEDURE QUSP_SubPipe2Close
        IS
	------------------------------
	--	��Ɨ̈�	    --
	------------------------------
        stat          INTEGER;
        W_Buffer      VARCHAR2(2000);
        PIPE_ERROR    EXCEPTION;
BEGIN
        W_Buffer := 'PIPE_CLOSE'; 
        DBMS_PIPE.pack_message( W_Buffer );
        stat := DBMS_PIPE.send_message('QUSP_PIPE2',2000);
        if stat != 0 then
          raise PIPE_ERROR;
        end if;
EXCEPTION
        WHEN PIPE_ERROR THEN
---- �o�h�o�d�G���[��-20016��ԋp
           RAISE_APPLICATION_ERROR(-20016,'QUSP_SubPipe2Close PIPE ERROR');
        WHEN OTHERS THEN
           RAISE;  
END QUSP_SubPipe2Close;

END QUSP_LogPkG;
