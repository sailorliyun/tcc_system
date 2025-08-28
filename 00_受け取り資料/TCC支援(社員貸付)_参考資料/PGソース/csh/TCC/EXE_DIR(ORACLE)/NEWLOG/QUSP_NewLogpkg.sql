/*******************************************************************************
/*                                                                             *
/*   ユーザログシステムモジュール (パイプ初期化機能版）                        * 
/*                                    作成日：  '99.3.15  ANX.大竹貢司         *
/*   QUSP_DispUponCons                修正日：  '99.4.15  ANX.大竹貢司         *
/*   QUSP_SubDispCons                 修正日：  '99.6.15  ANX.桑原典之         *
/*   QUSP_WriteOpeLog                 修正日：  '99.7.24  ANX.桑原典之         *      
/*   QUSP_SubWriteLog                 修正日：  '99.7.27  ANX.桑原典之         *
/*   QUSP_SubPipe1Close                                                        *
/*   QUSP_SubPipe2Close                                                        *
/*******************************************************************************
CREATE OR REPLACE PACKAGE QUSP_LOGPKG
IS	
	--------------------------------------------
	--    コンソールログ出力インタフェース    --
	--------------------------------------------
	PROCEDURE QUSP_DispUponCons(	i_JobNetMei	IN  QUS1_CONSLOGT.QUS1_JOBNETMEI%TYPE,	
					i_JobMei 	IN  QUS1_CONSLOGT.QUS1_JOBMEI%TYPE,	
					i_UserKey 	IN  QUS1_CONSLOGT.QUS1_USERKEY%TYPE,	
					i_ModuleId 	IN  QUS1_CONSLOGT.QUS1_MODULEID%TYPE,
					i_MsgKbn 	IN  QUS1_CONSLOGT.QUS1_MSGKBN%TYPE,
					i_Msg   	IN  QUS1_CONSLOGT.QUS1_MSG%TYPE);

	--------------------------------------------
	--        コンソールログ出力ライタ        --
	--------------------------------------------
        PROCEDURE QUSP_SubDispCons;   /* 常駐プロシジャ */

        --------------------------------------------
	--  オペレーションログ出力インタフェース  --
	--------------------------------------------
	PROCEDURE QUSP_WriteOpeLog(	i_MenuId	IN  QUS2_OPELOGT.QUS2_MENUID%TYPE,	
					i_ModuleId 	IN  QUS2_OPELOGT.QUS2_MODULEID%TYPE,	
					i_UserId 	IN  QUS2_OPELOGT.QUS2_USERID%TYPE,	
					i_ComputerMei 	IN  QUS2_OPELOGT.QUS2_COMPUTERMEI%TYPE,	
					i_TouzaiKbn 	IN  QUS2_OPELOGT.QUS2_TOUZAIKBN%TYPE,
	                                i_BushoCd 	IN  QUS2_OPELOGT.QUS2_BUSHOCD%TYPE,
					i_Msg   	IN  QUS2_OPELOGT.QUS2_MSG%TYPE);

	--------------------------------------------
	--  オペレーションログ出力ライタ          --
	--------------------------------------------
        PROCEDURE QUSP_SubWriteLog;   /* 常駐プロシジャ */

        --------------------------------------------
	--   コンスログ出力ライタ停止プロシジャ   --
	--------------------------------------------
        PROCEDURE QUSP_SubPipe1Close;
        --------------------------------------------
	--   オペログ出力ライタ停止プロシジャ     --
	--------------------------------------------
        PROCEDURE QUSP_SubPipe2Close;
     
END QUSP_LogPkg;

CREATE OR REPLACE PACKAGE BODY QUSP_LOGPKG
IS
       --------------------------------------------
       --    コンソールログ出力インタフェース    --
       --------------------------------------------
	PROCEDURE QUSP_DispUponCons(    i_JobNetMei	IN  QUS1_CONSLOGT.QUS1_JOBNETMEI%TYPE,	
					i_JobMei 	IN  QUS1_CONSLOGT.QUS1_JOBMEI%TYPE,	
					i_UserKey 	IN  QUS1_CONSLOGT.QUS1_USERKEY%TYPE,	
					i_ModuleId 	IN  QUS1_CONSLOGT.QUS1_MODULEID%TYPE,	
					i_MsgKbn 	IN  QUS1_CONSLOGT.QUS1_MSGKBN%TYPE,	
					i_Msg   	IN  QUS1_CONSLOGT.QUS1_MSG%TYPE)
        IS
	------------------------------
	--	作業領域	    --
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

---パラメータチェック
---COBOLを意識しVARCHAR2項目は空白を削除する
---パラメータエラーの場合はユーザエラーを発生

---JOBNETMEIは必須項目
        W_JobNetMei := rtrim(i_JobNetMei);
        W_JobNetMei := ltrim(W_JobNetMei);
        IF W_JobNetMei IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_JobNetMei := W_JobNetMei;

---JOBMEIは必須項目
        W_JobMei := rtrim(i_JobMei);
        W_JobMei := ltrim(W_JobMei);
        IF W_JobMei IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_JobMei := W_JobMei;

---USERKEYは必須項目ではないため空白の削除のみ
        W_UserKey := rtrim(i_UserKey);
        W_UserKey := ltrim(W_UserKey);
        S_UserKey := W_UserKey;
        if W_UserKey is null then
           S_USerKey := '#####';
        end if;

---MODULEIDは必須項目
        W_ModuleId := rtrim(i_ModuleId);
        W_ModuleId := ltrim(W_ModuleId);
        IF W_ModuleId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_ModuleId := W_ModuleId;

---MSGKBNは必須項目かつI/W/E/Sであること（小文字の場合は大文字に変換)
        W_MsgKbn := upper(i_MsgKbn);
        IF W_MsgKbn IS NULL then
           RAISE W_PRMERROR;
        END IF;
        IF (W_MsgKbn <> 'I') and (W_MsgKbn <> 'W') and (W_MsgKbn <> 'E') and (W_MsgKbn <> 'S') then
           RAISE W_PRMERROR;
        END IF;
        S_MsgKbn := W_MsgKbn;

---MSGは必須項目
        W_Msg := rtrim(i_Msg);
        W_Msg := ltrim(W_Msg);
        IF W_Msg IS NULL then
           RAISE W_PRMERROR;
        END IF;
     
-- ログレコード追加 --
        W_Buffer := S_JobNetMei || S_JobMei || S_UserKey || S_ModuleId || S_MsgKbn || W_Msg;
        DBMS_PIPE.pack_message( W_Buffer );
        stat := DBMS_PIPE.send_message('QUSP_PIPE1',2000);
        if stat != 0 then
           raise PIPE_ERROR;
        end if;   

EXCEPTION
        WHEN W_PRMERROR THEN
---- パラメータエラーは-20012を返却
           RAISE_APPLICATION_ERROR(-20012,'QUSP_DISPUPONCONS USER ERROR PARAMETER ERROR');
        WHEN PIPE_ERROR THEN
---- ＰＩＰＥエラーは-20016を返却
           RAISE_APPLICATION_ERROR(-20016,'QUSP_DISPUPONCONS SYSTEM ERROR PIPE ERROR');
        WHEN OTHERS THEN
	   RAISE;
END QUSP_DispUponCons; 

       ------------------------------------
       --    コンソールログ出力ライタ    --
       ------------------------------------
	PROCEDURE QUSP_SubDispCons
	IS
	------------------------------
	--	作業領域	    --
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
-- パイプの初期化処理 --
DBMS_PIPE.PURGE('QUSP_PIPE1');

-- メッセージ受信処理 --
loop
  begin
   	stat := DBMS_PIPE.receive_message('QUSP_PIPE1');
        DBMS_PIPE.unpack_message( W_Buffer );
-- 受信処理終了判断 --
        if W_Buffer = 'PIPE_CLOSE' then
           DBMS_OUTPUT.put_line('pipe_close end');
           return;
        end if;
-- メッセージ分解 --
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

-- ログレコード追加 --
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
	--  オペレーションログ出力インタフェース  --
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
	--	作業領域	    --
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
---パラメータチェック
---COBOLを意識しVARCHAR2項目は空白を削除する
---またCHAR項目はＡＬＬ空白は不可とする
---パラメータエラーの場合はユーザエラーを発生

---MENUIDは必須項目
        W_MenuId := rtrim(i_MenuId);
        W_MenuId := ltrim(W_MenuId);
        IF W_MenuId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_MenuId := W_MenuId;

---MODULEIDは必須項目
        W_ModuleId := rtrim(i_ModuleId);
        W_ModuleId := ltrim(W_ModuleId);
        IF W_ModuleId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_ModuleId := W_ModuleId;

---USERIDは必須項目
        W_UserId := rtrim(i_UserId);
        W_UserId := ltrim(W_UserId);
        IF W_UserId IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_UserId := W_UserId;

---COMMPUTERMEIは必須項目
        W_ComputerMei := rtrim(i_ComputerMei);
        W_ComputerMei := ltrim(W_ComputerMei);
        IF W_ComputerMei IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_ComputerMei := W_ComputerMei;

---TOUZAIKBNは必須項目かつ1/2/3であること
        W_TouzaiKbn := rtrim(i_TouzaiKbn);
        W_TouzaiKbn := ltrim(W_TouzaiKbn);
        IF (W_TouzaiKbn IS NULL) OR ( (W_TouzaiKbn <> '1') and (W_TouzaiKbn <> '2') and (W_TouzaiKbn <> '3') )  then
           RAISE W_PRMERROR;
        END IF;
        S_TouzaiKbn := W_TouzaiKbn;

---BUSHOCDは必須項目
        W_BushoCd := rtrim(i_BushoCd);
        W_BushoCd := ltrim(W_BushoCd);
        IF W_BushoCd IS NULL then
           RAISE W_PRMERROR;
        END IF;
        S_BushoCd := W_BushoCd;
  
---MSGは必須項目
        W_Msg := rtrim(i_Msg);
        W_Msg := ltrim(W_Msg);
        IF W_Msg IS NULL then
           RAISE W_PRMERROR;
        END IF;
       
-- ログレコード追加 --
        W_Buffer := S_MenuId || S_ModuleId || S_UserId || S_ComputerMei || S_BushoCd || S_TouzaiKbn || W_Msg;
	DBMS_PIPE.pack_message( W_Buffer );
        stat := DBMS_PIPE.send_message('QUSP_PIPE2');
        if stat != 0 then
           raise PIPE_ERROR;
        end if;   

EXCEPTION
        WHEN W_PRMERROR THEN
---- パラメータエラーは-20012を返却
           RAISE_APPLICATION_ERROR(-20012,'QUSP_WRITEOPELOG USER ERROR PARAMETER ERROR');
        WHEN PIPE_ERROR THEN
---- ＰＩＰＥエラーは-20016を返却
           RAISE_APPLICATION_ERROR(-20016,'QUSP_DISPUPONCONS SYSTEM ERROR PIPE ERROR');
        WHEN OTHERS THEN
	   RAISE;
END QUSP_WriteOpeLog; 

        --------------------------------------------
	--      オペレーションログ出力ライタ      --
	--------------------------------------------
	PROCEDURE QUSP_SubWriteLog
	IS
	------------------------------
	--	作業領域	    --
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
-- パイプの初期化処理 --
DBMS_PIPE.PURGE('QUSP_PIPE2');

-- メッセージ受信処理 --
loop
  begin
   	stat := DBMS_PIPE.receive_message('QUSP_PIPE2');
        DBMS_PIPE.unpack_message( W_Buffer );
-- 受信処理終了判断 --
        if W_Buffer = 'PIPE_CLOSE' then
           DBMS_OUTPUT.put_line('pipe_close end');
           return;
        end if;
-- メッセージ分解 --
        W_SysDate := SYSDATE;
        W_MenuId := SUBSTR(W_Buffer, 1, 5);
        W_ModuleId := SUBSTR(W_Buffer, 6, 40);
        W_UserId := SUBSTR(W_Buffer, 46, 8);
        W_ComputerMei := SUBSTR(W_Buffer, 54, 20);
        W_BushoCd := SUBSTR(W_Buffer, 74, 4);
        W_TouzaiKbn := SUBSTR(W_Buffer, 78, 1);
        W_Msg := SUBSTR(W_Buffer, 79);
              
-- ログレコード追加 --
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
	--   コンスログ出力ライタ停止   --
	---------------------------------- 
        PROCEDURE QUSP_SubPipe1Close
        IS
	------------------------------
	--	作業領域	    --
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
---- ＰＩＰＥエラーは-20016を返却
           RAISE_APPLICATION_ERROR(-20016,'QUSP_SubPipe1Close PIPE ERROR');
        WHEN OTHERS THEN
	     RAISE;
END QUSP_SubPipe1Close;

        ---------------------------------
	--   オペログ出力ライタ停止    --
	--------------------------------- 
        PROCEDURE QUSP_SubPipe2Close
        IS
	------------------------------
	--	作業領域	    --
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
---- ＰＩＰＥエラーは-20016を返却
           RAISE_APPLICATION_ERROR(-20016,'QUSP_SubPipe2Close PIPE ERROR');
        WHEN OTHERS THEN
           RAISE;  
END QUSP_SubPipe2Close;

END QUSP_LogPkG;
