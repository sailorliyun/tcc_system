CREATE OR REPLACE PACKAGE  QPAP_CEnt240PkG IS
/*****************************************************************************/
/* �V�X�e�����@�@�F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ����@�@�@�@�F�Ј��ݕt�V�X�e���@�@                                      */
/* ���W���[�����@�FQPAP_CEnt240PkG                                           */
/* �@�\      �@�@�F�c�����̍X�V                                            */
/* �쐬��        �F2001/10/03                                                */
/* �쐬��        �FFIP                                                       */
/*****************************************************************************/
/* �C����        �F2005/01/28                                                */
/* �쐬��        �FFIP SEKINE                                                */
/* �C�����e      �F���ϒʒm�o�͑Ή��ɔ����A���^�E�ܗ^�������ɂ�鎩������    */
/*                 �����ꍇ�A���ϓ���ݒ肷��悤�ɏC��                      */
/*                                                                           */
/* �C����        �F2009/08/28                                                */
/* �쐬��        �FNBC ISHIDA                                                */
/* �C�����e      �F�T���f�[�^���T�������e�[�u���֓o�^���s��                  */
/*                                                                           */
/*****************************************************************************/
/******************************************************************************************************************/
/* �X�V���t  �Č�/��Q�ԍ�    �C�����R                                                                            */
/* 20100319  TR1003-010       �؏��T�����~���̐V�c���\���z��Z                                                    */
/*                            �EQPAY_SYNDAICYOWT��QPB6_SYNDAICYOW2T�Ƀo�b�N�A�b�v����                             */
/******************************************************************************************************************/

/*****************************************************************************/
/*�P�@�錾��															     */
/*****************************************************************************/

/* �c�����̍X�V */
PROCEDURE QPAP_CEnt240ZanUpd (
	InStrKBN	IN	CHAR);		--���^�ܗ^�敪�i1:���^,2:�ܗ^�j

END QPAP_CEnt240PkG;
/
show error

/*****************************************************************************/
/*�Q�@�{�f�B�[															     */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt240PkG IS

	/* �J�[�\����` */
	CURSOR CurKoguchi IS
		SELECT	 QPA1_PRMSYAINCD1,
				 QPA1_PRMSYAINCD2,
				 QPA1_KYUYOZANDAKA,
				 QPA1_KOJOCYUSHIFLG
		FROM	 QPA1_KGCDAICYOT
		ORDER BY QPA1_PRMSYAINCD1,
				 QPA1_PRMSYAINCD2
		FOR UPDATE;

	CURSOR CurShousho IS
		SELECT	 QPA8_PRMSYAINCD1,
				 QPA8_PRMSYAINCD2,
				 QPA8_PRMYUSIYMD,
				 QPA8_KYUYOZANDAKA,
				 QPA8_SYOYOZANDAKA,
				 QPA8_KANSAIYMD
		FROM	 QPA8_SYNDAICYOT
		WHERE	 QPA8_KYUYOZANDAKA > 0
		OR		 QPA8_SYOYOZANDAKA > 0
		ORDER BY QPA8_PRMSYAINCD1,
				 QPA8_PRMSYAINCD2,
				 QPA8_PRMYUSIYMD
		FOR UPDATE;

	CURSOR CurShousho2 IS
	SELECT 
	 QPA8_PRMSYAINCD1       
	,QPA8_PRMSYAINCD2       
	,QPA8_PRMYUSIYMD        
	,QPA8_GENDOGAKU         
	,QPA8_SYUBETU           
	,QPA8_RIRITU            
	,QPA8_HENSAITUKISU      
	,QPA8_KYUYOHENSAIALL    
	,QPA8_KYUYOHENSAI       
	,QPA8_SYOYOHENSAIALL    
	,QPA8_SYOYOHENSAI       
	,QPA8_KYUYOZANDAKA      
	,QPA8_SYOYOZANDAKA      
	,QPA8_KOJOCYUSIFLG      
	,QPA8_KANSAIYMD         
	FROM	 QPA8_SYNDAICYOT
		WHERE	 QPA8_KYUYOZANDAKA > 0
		OR		 QPA8_SYOYOZANDAKA > 0;



/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt240ZanUpd									     */
/* �@�\          �F�c�����̍X�V										     */
/*****************************************************************************/
PROCEDURE   QPAP_CEnt240ZanUpd (
	InStrKBN	IN	CHAR) IS	--���^�ܗ^�敪�i1:���^,2:�ܗ^�j

	/* �ŗL�ϐ� */
	v_SysTime		DATE;
	v_SysDate		CHAR(8);
	v_ZenYMD		CHAR(8);
	v_ZenZenYMD		CHAR(8);
	v_Count			NUMBER;
	v_SyainCD1		CHAR(1);
	v_SyainCD2		CHAR(7);
	v_YusiYMD		CHAR(8);
	v_KyuyoZan		NUMBER;
	v_SyoyoZan		NUMBER;
	v_StopFLG		CHAR(1);
	v_KansaiYMD		CHAR(8);
	v_Kingaku		NUMBER := 0;

	/* �s�ϐ� */
	RowKgc			CurKoguchi%ROWTYPE;
	RowSho			CurShousho%ROWTYPE;
	RowSho2			CurShousho2%ROWTYPE;

	v_ZenYMD_N		CHAR(8);                 -- 11/01 ADD
	v_ZenZenYMD_N	CHAR(8);                 -- 11/01 ADD

	--2005/01/28 ADD
	datQPAA_KOJOYMD		DATE;		--�T�����i���ϓ��Ɏg�p�j

	/*ADD 0811051_�O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START*/
	strYusiKBN		CHAR(1);
	/*ADD 0811051_�O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END*/


BEGIN

--ADD 20100319 0908047 NBC YOKOYAMA START
	/**************************************************************************/
	/* QPAY_SYNDAICYOWT��QPB6_SYNDAICYOW2T�Ƀo�b�N�A�b�v����                  */
	/*   �V�ݕt���c���\�Ő��Z�����T�������T���f�[�^���Ȃ��ꍇ��             */
	/*   �c�����痘�����v�Z�����Z���z�ɉ����邽�߂Ɏg�p����                   */
	/*   ��QPAY�͎c���X�V�Ŏc���O�ɂȂ邽�߁A1���̎c�������X�V�����Ŏg���Ȃ�  */
	/**************************************************************************/
	IF InStrKBN = '1' THEN
		DELETE FROM QPB6_SYNDAICYOW2T;
		INSERT INTO QPB6_SYNDAICYOW2T (SELECT * FROM QPAY_SYNDAICYOWT);
	END IF;
--ADD 20100319 0908047 NBC YOKOYAMA END

	/* �T�[�o�[�r�x�r�s�d�l���t�擾 */
	SELECT	SYSDATE INTO v_SysTime
	FROM DUAL;

	v_SysDate := TO_CHAR(v_SysTime,'YYYYMMDD');
--	v_SysDate := '20011130';

	/* �����̎c���X�V�Ώۓ��t�̐ݒ�         */
	/* �i�O�X�񋋗^�T�����`�O�񋋗^�T�����j */
	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
		v_ZenYMD := SUBSTR(v_SysDate,1,6) || '25';
	ELSE
		v_ZenYMD := SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),-1),'YYYYMMDD'),1,6) || '25';
	END IF;
	v_ZenZenYMD := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenYMD,'YYYYMMDD'),-1),'YYYYMMDD');

	/* 11/01 ADD �����w��Ώ۔͈͕ύX�ɔ����ǉ� */
	IF TO_NUMBER(SUBSTR(v_SysDate,7,2)) > 25 THEN
		v_ZenYMD_N := TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(ADD_MONTHS(TO_DATE(v_SysDate,'YYYYMMDD'),1),'YYYYMMDD'),1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');
	ELSE
		v_ZenYMD_N := TO_CHAR(TO_DATE(SUBSTR(v_SysDate,1,6) || '01','YYYYMMDD') - 1,'YYYYMMDD');
	END IF;
	v_ZenZenYMD_N := TO_CHAR(ADD_MONTHS(TO_DATE(v_ZenYMD_N,'YYYYMMDD'),-1),'YYYYMMDD');

	/******************/
	/* ����           */
	/******************/
	/* �����X�V�͋��^���̂ݍs�� */
	IF InStrKBN = '1' THEN
		--�J�[�\���I�[�v��
		OPEN CurKoguchi;

		--�e�d�s�b�g
		LOOP
			FETCH CurKoguchi INTO RowKgc;
			IF CurKoguchi%NOTFOUND THEN
				EXIT;
			END IF;

			v_SyainCD1 := NVL(RowKgc.QPA1_PRMSYAINCD1,' ');
			v_SyainCD2 := NVL(RowKgc.QPA1_PRMSYAINCD2,' ');
			v_KyuyoZan := NVL(RowKgc.QPA1_KYUYOZANDAKA,0);
			v_StopFLG := NVL(RowKgc.QPA1_KOJOCYUSHIFLG,'');

			/* �ݕt */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPA6_KINGAKU) INTO v_Kingaku FROM QPA6_KGCKASITUKET
				WHERE QPA6_SYAINCD = v_SyainCD2
				AND ((TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') <= v_ZenYMD)
				AND  (TO_CHAR(QPA6_TORIHIKIYMD,'YYYYMMDD') > v_ZenZenYMD))
				AND (QPA6_TORIKESHIFLG IS NULL OR QPA6_TORIKESHIFLG = ' ')
				GROUP BY QPA6_SYAINCD;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* �c���ɑݕt�������Z���� */
			v_KyuyoZan := v_KyuyoZan + NVL(v_Kingaku,0);

			/* ���� */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPA5_NYUKINGAKU) INTO v_Kingaku FROM QPA5_KGCNYUKINT
				WHERE QPA5_SYAINCD1 = v_SyainCD1
				AND QPA5_SYAINCD2 = v_SyainCD2
--				AND ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD)			-- 11/01 UPD
--				AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenZenYMD))		-- 11/01 UPD
				AND ((TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') <= v_ZenYMD_N)			-- 11/01 UPD
				AND  (TO_CHAR(QPA5_NYUKINYMD,'YYYYMMDD') > v_ZenZenYMD_N))		-- 11/01 UPD
				GROUP BY QPA5_SYAINCD1,QPA5_SYAINCD2;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* �c���ɓ��������Z���� */
			v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

			/* �ܗ^�T�� */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPA4_KOJOGAKU) INTO v_Kingaku FROM QPA4_KGCKOJOT
				WHERE QPA4_SYAINCD1 = v_SyainCD1
				AND QPA4_SYAINCD2 = v_SyainCD2
				AND ((TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') <= v_ZenYMD)
				AND  (TO_CHAR(QPA4_KOJOYMD,'YYYYMMDD') > v_ZenZenYMD))
				GROUP BY QPA4_SYAINCD1,QPA4_SYAINCD2;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* �c���ɏܗ^�T���������Z���� */
			v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

			/* ���^�T�� */
			v_Kingaku := 0;
			BEGIN
				SELECT SUM(QPAA_GANKIN) INTO v_Kingaku FROM QPAA_KOJOT
				WHERE QPAA_SYAINCD1 = v_SyainCD1
				AND QPAA_SYAINCD2 = v_SyainCD2
				AND QPAA_SYUBETU = '1'
				AND QPAA_YUSIKBN = '3'
				GROUP BY QPAA_SYAINCD1,QPAA_SYAINCD2,QPAA_SYUBETU,QPAA_YUSIKBN;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_Kingaku := 0;
			END;

			/* �c���ɋ��^�T���������Z���� */
			v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

			/* �T�����~�����Ј����c���ꊇ���������ہA		*/
			/* �������}�C�i�X�ɂȂ�̂ŁA�}�C�i�X����ZERO�ɂ��� 	*/
			IF v_StopFLG = '1' THEN
				IF v_KyuyoZan <= 0 THEN
					v_KyuyoZan := 0;
				END IF;
			END IF;

			/* ���^�c���̍X�V�i�䒠�j */
			UPDATE QPA1_KGCDAICYOT SET
				QPA1_KYUYOZANDAKA = NVL(v_KyuyoZan,0)
			WHERE CURRENT OF CurKoguchi;

			/* �c�������ɒǉ� */
			INSERT INTO QPA3_KGCZANDAKAT (
				 QPA3_PRMSYAINCD1
				,QPA3_PRMSYAINCD2
				,QPA3_PRMYUSIKBN
				,QPA3_PRMZANDAKAYMD
				,QPA3_ZANDAKA)
			VALUES ( NVL(v_SyainCD1,' ')
				,NVL(v_SyainCD2,' ')
				,'3'
				,TO_DATE(v_ZenYMD,'YYYYMMDD')
				,NVL(v_KyuyoZan,0));

		END LOOP;
		/* �J�[�\���̃N���[�Y */
		CLOSE CurKoguchi;
	END IF;

	/******************/
	/* �؏�           */
	/******************/
	--�J�[�\���I�[�v��
	OPEN CurShousho;

	--�e�d�s�b�g
	LOOP
		FETCH CurShousho INTO RowSho;
		IF CurShousho%NOTFOUND THEN
			EXIT;
		END IF;

		v_SyainCD1 := NVL(RowSho.QPA8_PRMSYAINCD1,' ');
		v_SyainCD2 := NVL(RowSho.QPA8_PRMSYAINCD2,' ');
		v_YusiYMD := TO_CHAR(RowSho.QPA8_PRMYUSIYMD,'YYYYMMDD');
		v_KyuyoZan := NVL(RowSho.QPA8_KYUYOZANDAKA,0);
		v_SyoyoZan := NVL(RowSho.QPA8_SYOYOZANDAKA,0);
		v_KansaiYMD := TO_CHAR(RowSho.QPA8_KANSAIYMD,'YYYYMMDD');

		/* ������ */
		IF (v_KansaiYMD IS NULL) OR (v_KansaiYMD ='') THEN
			IF InStrKBN = '1' THEN
				/* ���^ */
				v_Kingaku := 0;
				BEGIN
					SELECT SUM(QPAA_GANKIN) INTO v_Kingaku FROM QPAA_KOJOT
					WHERE QPAA_SYAINCD1 = v_SyainCD1
					AND QPAA_SYAINCD2 = v_SyainCD2
					AND TO_CHAR(QPAA_YUSIYMD,'YYYYMMDD') = v_YusiYMD
					AND QPAA_SYUBETU = '2'
					AND QPAA_YUSIKBN = '3'
					GROUP BY QPAA_SYAINCD1,QPAA_SYAINCD2,QPAA_YUSIYMD,QPAA_SYUBETU,QPAA_YUSIKBN;
				EXCEPTION
					WHEN NO_DATA_FOUND THEN
						v_Kingaku := 0;
				END;

				/* �c���ɋ��^�T���������Z���� */
				v_KyuyoZan := v_KyuyoZan - NVL(v_Kingaku,0);

--2005/01/28 UPD  ���ϓ��Ή�  ��������From��������
--				/* ���^�c���̍X�V�i�䒠�j */
--				UPDATE QPA8_SYNDAICYOT SET
--					QPA8_KYUYOZANDAKA = NVL(v_KyuyoZan,0)
--				WHERE CURRENT OF CurShousho;

				IF	v_KyuyoZan	=	0	AND
					v_SyoyoZan	=	0	THEN
					--���^�c�� �� �ܗ^�c�����[���i���ρj
					/* �T�������擾 */
					datQPAA_KOJOYMD		:=	NULL;
					BEGIN
						SELECT
							MAX(QPAA_KOJOYMD)
						INTO
							datQPAA_KOJOYMD
						FROM
							QPAA_KOJOT
						WHERE
								QPAA_SYAINCD1	=	v_SyainCD1
							AND	QPAA_SYAINCD2	=	v_SyainCD2
							AND	QPAA_YUSIYMD	=	TO_DATE(v_YusiYMD,'YYYYMMDD')
							AND	QPAA_SYUBETU	=	'2'
							AND	QPAA_YUSIKBN	=	'3'
						GROUP BY
							QPAA_SYAINCD1
						,	QPAA_SYAINCD2
						,	QPAA_YUSIYMD
						,	QPAA_SYUBETU
						,	QPAA_YUSIKBN
						;
					EXCEPTION
						WHEN NO_DATA_FOUND THEN
							datQPAA_KOJOYMD		:=	NULL;
					END;

					/* ���^�c���̍X�V�i�䒠�j */
					IF	datQPAA_KOJOYMD	IS NULL	THEN
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_KYUYOZANDAKA	=	NVL(v_KyuyoZan,0)
						WHERE CURRENT OF CurShousho;
					ELSE
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_KYUYOZANDAKA	=	NVL(v_KyuyoZan,0)
						,	QPA8_KANSAIYMD		=	datQPAA_KOJOYMD
						WHERE CURRENT OF CurShousho;
					END IF;
				ELSE
					--���^�c�� OR �ܗ^�c��������
					/* ���^�c���̍X�V�i�䒠�j */
					UPDATE QPA8_SYNDAICYOT SET
						QPA8_KYUYOZANDAKA	=	NVL(v_KyuyoZan,0)
					WHERE CURRENT OF CurShousho;
				END IF;
--2005/01/28 UPD  ���ϓ��Ή�  �������� To ��������

			ELSE
				/* �ܗ^ */
				v_Kingaku := 0;
				BEGIN
					SELECT SUM(QPAA_GANKIN) INTO v_Kingaku FROM QPAA_KOJOT
					WHERE QPAA_SYAINCD1 = v_SyainCD1
					AND QPAA_SYAINCD2 = v_SyainCD2
					AND TO_CHAR(QPAA_YUSIYMD,'YYYYMMDD') = v_YusiYMD
					AND QPAA_SYUBETU = '2'
					AND QPAA_YUSIKBN = '4'
					GROUP BY QPAA_SYAINCD1,QPAA_SYAINCD2,QPAA_YUSIYMD,QPAA_SYUBETU,QPAA_YUSIKBN;
				EXCEPTION
					WHEN NO_DATA_FOUND THEN
						v_Kingaku := 0;
				END;

				/* �c���ɋ��^�T���������Z���� */
				v_SyoyoZan := v_SyoyoZan - NVL(v_Kingaku,0);

--2005/01/28 UPD  ���ϓ��Ή�  ��������From��������
--				/* �ܗ^�c���̍X�V�i�䒠�j */
--				UPDATE QPA8_SYNDAICYOT SET
--					QPA8_SYOYOZANDAKA = NVL(v_SyoyoZan,0)
--				WHERE CURRENT OF CurShousho;

				IF	v_KyuyoZan	=	0	AND
					v_SyoyoZan	=	0	THEN
					--���^�c�� �� �ܗ^�c�����[���i���ρj
					/* �T�������擾 */
					datQPAA_KOJOYMD		:=	NULL;
					BEGIN
						SELECT
							MAX(QPAA_KOJOYMD)
						INTO
							datQPAA_KOJOYMD
						FROM
							QPAA_KOJOT
						WHERE
								QPAA_SYAINCD1	=	v_SyainCD1
							AND	QPAA_SYAINCD2	=	v_SyainCD2
							AND	QPAA_YUSIYMD	=	TO_DATE(v_YusiYMD,'YYYYMMDD')
							AND	QPAA_SYUBETU	=	'2'
							AND	QPAA_YUSIKBN	=	'3'
						GROUP BY
							QPAA_SYAINCD1
						,	QPAA_SYAINCD2
						,	QPAA_YUSIYMD
						,	QPAA_SYUBETU
						,	QPAA_YUSIKBN
						;
					EXCEPTION
						WHEN NO_DATA_FOUND THEN
							datQPAA_KOJOYMD		:=	NULL;
					END;

					/* ���^�c���̍X�V�i�䒠�j */
					IF	datQPAA_KOJOYMD	IS NULL	THEN
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_SYOYOZANDAKA	=	NVL(v_SyoyoZan,0)
						WHERE CURRENT OF CurShousho;
					ELSE
						UPDATE QPA8_SYNDAICYOT SET
							QPA8_SYOYOZANDAKA	=	NVL(v_SyoyoZan,0)
						,	QPA8_KANSAIYMD		=	datQPAA_KOJOYMD
						WHERE CURRENT OF CurShousho;
					END IF;
				ELSE
					--���^�c�� OR �ܗ^�c��������
					/* �ܗ^�c���̍X�V�i�䒠�j */
					UPDATE QPA8_SYNDAICYOT SET
						QPA8_SYOYOZANDAKA	=	NVL(v_SyoyoZan,0)
					WHERE CURRENT OF CurShousho;
				END IF;
--2005/01/28 UPD  ���ϓ��Ή�  �������� To ��������

			END IF;
		ELSE
			/* ���ύς́A�c����ZERO�ɂ��� */
			IF (v_KyuyoZan > 0) OR (v_SyoyoZan > 0) THEN
				/* ���^�c���A�ܗ^�c���̍X�V�i�䒠�j */
				UPDATE QPA8_SYNDAICYOT SET
					QPA8_KYUYOZANDAKA = 0,
					QPA8_SYOYOZANDAKA = 0
				WHERE CURRENT OF CurShousho;
			END IF;
		END IF;
	END LOOP;
	/* �J�[�\���̃N���[�Y */
	CLOSE CurShousho;


	/******************************************************/
	/* �؏�(���^�̏ꍇ�Ј��䒠���c���X�V��o�b�N�A�b�v����*/
	/* �ܗ^���̎c���𔽉f����Ɖ^�p�ŕs����������邽�� */
	/* 2002/01/27�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@ */
	/******************************************************/
	IF InStrKBN = '1' THEN
		--�J�[�\���I�[�v��
		DELETE FROM    QPAY_SYNDAICYOWT;
 		OPEN CurShousho2;

		--�e�d�s�b�g
		LOOP
			FETCH CurShousho2 INTO RowSho2;
			IF CurShousho2%NOTFOUND THEN
				EXIT;
			END IF;

		        INSERT INTO QPAY_SYNDAICYOWT VALUES (
		           NVL(RowSho2.QPA8_PRMSYAINCD1   ,' ')
		          ,NVL(RowSho2.QPA8_PRMSYAINCD2   ,' ')
		          ,RowSho2.QPA8_PRMYUSIYMD
		          ,NVL(RowSho2.QPA8_GENDOGAKU     ,0)
		          ,NVL(RowSho2.QPA8_SYUBETU       ,' ')
		          ,NVL(RowSho2.QPA8_RIRITU        ,0)
		          ,NVL(RowSho2.QPA8_HENSAITUKISU  ,0)
		          ,NVL(RowSho2.QPA8_KYUYOHENSAIALL,0)
		          ,NVL(RowSho2.QPA8_KYUYOHENSAI   ,0)
		          ,NVL(RowSho2.QPA8_SYOYOHENSAIALL,0)
		          ,NVL(RowSho2.QPA8_SYOYOHENSAI   ,0)
		          ,NVL(RowSho2.QPA8_KYUYOZANDAKA  ,0)
		          ,NVL(RowSho2.QPA8_SYOYOZANDAKA  ,0)
		          ,NVL(RowSho2.QPA8_KOJOCYUSIFLG  ,' ')
		          ,RowSho2.QPA8_KANSAIYMD);
		END LOOP;
		CLOSE CurShousho2;
	END IF;
	/*ADD 0811051_�O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START*/
	/************************************************/
	/* �T���f�[�^���T�������e�[�u���֓o�^           */
	/************************************************/

	/* �T���e�[�u���̒��o�����̒l���擾*/
	IF InStrKBN = '1' THEN
		strYusiKBN := '3';
	ELSE
		strYusiKBN := '4';
	END IF;

	/*�T�������e�[�u���o�^*/
	INSERT INTO QPB0_KOJORRKT (
		 QPB0_KOJOYM
		,QPB0_KSKBN
		,QPB0_KOJOYMD
		,QPB0_SYAINCD1
		,QPB0_SYAINCD2
		,QPB0_SYUBETU
		,QPB0_TOZAIKBN
		,QPB0_YUSIYMD
		,QPB0_YUSIKBN
		,QPB0_KANGAKU
		,QPB0_GANKIN
		,QPB0_RISOKU
		,QPB0_ZANDAKA
		,QPB0_INSERTDATE
		,QPB0_UPDATEDATE
		)
	SELECT 
		 TO_CHAR(QPAA_KOJOYMD,'YYYYMM')
		,InStrKBN
		,QPAA_KOJOYMD
		,QPAA_SYAINCD1
		,QPAA_SYAINCD2
		,QPAA_SYUBETU
		,QPAA_TOZAIKBN
		,QPAA_YUSIYMD
		,QPAA_YUSIKBN
		,QPAA_KANGAKU
		,QPAA_GANKIN
		,QPAA_RISOKU
		,QPAA_ZANDAKA
		,v_SysTime
		,v_SysTime
	FROM QPAA_KOJOT
	WHERE QPAA_YUSIKBN = strYusiKBN;

	/*ADD 0811051_�O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END*/

	/******************************/
	/* �T���t�@�C���폜           */
	/******************************/
	IF InStrKBN = '1' THEN
		DELETE FROM QPAA_KOJOT WHERE QPAA_YUSIKBN = '3';
	ELSE
		DELETE FROM QPAA_KOJOT WHERE QPAA_YUSIKBN = '4';
	END IF;

	/************************************/
	/* �c���X�V���t�@�C���X�V           */
	/************************************/
	v_Count := 0;
	IF InStrKBN = '1' THEN
		SELECT COUNT(*) INTO v_Count FROM QPAT_ZANYMD
		WHERE QPAT_PRMKBN = '1';

		IF v_Count > 0 THEN
			UPDATE QPAT_ZANYMD SET
				 QPAT_YMD = TO_DATE(v_SysDate,'YYYYMMDD')
				,QPAT_HMS = v_SysTime
			WHERE QPAT_PRMKBN = '1';
		ELSE
			INSERT INTO QPAT_ZANYMD (
				QPAT_PRMKBN,
				QPAT_YMD,
				QPAT_HMS)
			VALUES ('1',
				TO_DATE(v_SysDate,'YYYYMMDD'),
				v_SysTime);
		END IF;
	ELSE
		SELECT COUNT(*) INTO v_Count FROM QPAT_ZANYMD
		WHERE QPAT_PRMKBN = '2';

		IF v_Count > 0 THEN
			UPDATE QPAT_ZANYMD SET
				 QPAT_YMD = TO_DATE(v_SysDate,'YYYYMMDD')
				,QPAT_HMS = v_SysTime
			WHERE QPAT_PRMKBN = '2';
		ELSE
			INSERT INTO QPAT_ZANYMD (
				QPAT_PRMKBN,
				QPAT_YMD,
				QPAT_HMS)
			VALUES ('2',
				TO_DATE(v_SysDate,'YYYYMMDD'),
				v_SysTime);
		END IF;
	END IF;

	/* �R�~�b�g */
	COMMIT;
	--ROLLBACK;
EXCEPTION
	WHEN  OTHERS  THEN
		ROLLBACK;
		IF CurKoguchi%ISOPEN THEN
			CLOSE CurKoguchi;
		END IF;
		IF CurShousho%ISOPEN THEN
			CLOSE CurShousho;
		END IF;
		/*ADD 0811051_�O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA START*/
		/* �G���[�������ɃJ�[�\����closa���Ă��Ȃ����ߒǉ� */
		IF CurShousho2%ISOPEN THEN
			CLOSE CurShousho2;
		END IF;
		/*ADD 0811051_�O���[�v�Ј��؏��ݕt���[������ NBC ISHIDA END*/
		RAISE ;
END QPAP_CEnt240ZanUpd;

END QPAP_CEnt240PkG;

/
SHOW ERROR
