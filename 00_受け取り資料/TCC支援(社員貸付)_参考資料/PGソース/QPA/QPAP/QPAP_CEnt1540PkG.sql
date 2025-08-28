CREATE OR REPLACE PACKAGE  QPAP_CEnt1540PkG IS
/*****************************************************************************/
/* �V�X�e����    �F�������N���W�b�g�V�X�e��                                  */
/* �Ɩ���        �F�Ј��Z���Ǘ�                                              */
/* ���W���[����  �FQPAP_CEnt1540PkG                                          */
/* �@�\          �F�c�������e�[�u���o�^�����i�ݕt�E�����j                    */
/* �쐬��        �F2010/02/25                                                */
/* �쐬��        �FNBC saitoh                                                */
/*****************************************************************************/

/* �c�������e�[�u���o�^�����i�����j */
PROCEDURE QPAP_ZNDK_BNKITURK (
				InChaNetID	IN	CHAR,	--�l�b�g�h�c
				InChaJobID	IN	CHAR);	--�W���u�h�c

END QPAP_CEnt1540PkG;
/
SHOW ERROR

/*****************************************************************************/
/* �Q  �{�f�B�[                                                              */
/*****************************************************************************/
CREATE OR REPLACE PACKAGE BODY QPAP_CEnt1540PkG IS

--- �J�[�\����`�i�Ј��R�[�h�P�A�Ј��R�[�h�Q�A�Z���敪�A�Z���������擾�j
	CURSOR CurBNKI IS
		SELECT
			ROWID		BNKIROW,
			QPB2_SYAINCD1	SYAINCD1,
			QPB2_SYAINCD2	SYAINCD2,
			QPB2_SYUBETU	SYUBETU,
			QPB2_YUSIYMD	YUSIYMD,
			QPB2_YUSIKBN	YUSIKBN,
			QPB2_KOJOYMD	KOJOYMD,
			QPB2_BUNMODFLG	BUNMODFLG,
			QPB2_BUNKAIYMD	BUNKAIYMD,
			QPB2_GANKIN	GANKIN,
			QPB2_RISOKU	RISOKU,
			QPB2_KOUSINYMD	KOUSINYMD
		FROM	QPB2_BUNKAI
		WHERE	QPB2_RRKFLG = '0';


/*****************************************************************************/
/* ���W���[����  �FQPAP_CEnt1540PkG.QPAP_ZNDK_BNKITURK                       */
/* �@�\          �F�c�������e�[�u���o�^�����i�����j                          */
/*****************************************************************************/
PROCEDURE	QPAP_ZNDK_BNKITURK (
				InChaNetID	IN	CHAR,	--�l�b�g�h�c
				InChaJobID	IN	CHAR	--�W���u�h�c
)

IS

	-- �����ϐ���`
	module		VARCHAR2(40)	:= 'QPAP_CEnt1540PkG.QPAP_ZNDK_BNKITURK';
	RowBNKI		CurBNKI%ROWTYPE;		-- �J�[�\��
	SyoriKbn	NUMBER		:= 0;		-- �������s�ӏ��J�E���g
	TurkCNT		NUMBER		:= 0;		-- �c�������e�[�u���o�^����
	InsCount	NUMBER		:= 0;		-- �o�^�����i���O�擾�p�j
	Pg_Flg		NUMBER		:= 0;		-- �o�^�L���t���O

	i_BNKIROW	ROWID;				-- ROWID
	i_SYAINCD1	CHAR(1);			-- �Ј��R�[�h�P
	i_SYAINCD2	CHAR(7);			-- �Ј��R�[�h�Q
	i_SYUBETU	CHAR(1);			-- ���[�����
	i_YUSIYMD	DATE;				-- �Z����
	i_YUSIKBN	CHAR(1);			-- �Z���敪�i���^�E�ܗ^�j
	i_KOJOYMD	DATE;				-- �T����
	i_BUNMODFLG	CHAR(1);			-- ����߂��E�����t���O
	i_BUNKAIYMD	DATE;				-- ����������
	i_GANKIN	NUMBER;				-- ����
	i_RISOKU	NUMBER;				-- ����
	i_KOUSINYMD	DATE;				-- �X�V����
	o_SYORIYMD	DATE;				-- ������
	o_SYORIKBN	CHAR(1);			-- �����敪
	o_GANKIN	NUMBER;				-- ����
	o_KJRISOKU	NUMBER;				-- ����
	o_MKOJOYMD	DATE;				-- �T����
	o_MGANKINK	NUMBER;				-- ���^�T������
	o_KJRISOKUK	NUMBER;				-- ���^�T������
	o_MGANKINS	NUMBER;				-- �ܗ^�T������
	o_KJRISOKUS	NUMBER;				-- �ܗ^�T������


BEGIN

	-- �R���\�[�����O�o�́i�����J�n�j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'Start');

	-- �����E����߂��e�[�u���iQPB2_BUNKAI�j����o�^�\�����擾
	SELECT COUNT(*)
		INTO  InsCount
		FROM  QPB2_BUNKAI
		WHERE QPB2_RRKFLG = '0';

	-- �R���\�[�����O�o�́i�擾�����j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB2_BUNKAI:IN = ' || TO_CHAR(InsCount)
		);

	-- �����敪
	SyoriKbn :=	1;

	-- ���I�J�[�\���̃I�[�v��
	OPEN CurBNKI();

	LOOP
		Pg_Flg		:=	0;				-- �o�^�L���t���O������

		FETCH CurBNKI INTO RowBNKI;
		IF CurBNKI%NOTFOUND THEN
			EXIT;                                     --���[�v�I��
		END IF;

		-- �����E����߂��e�[�u������f�[�^�擾
		i_BNKIROW	:= RowBNKI.BNKIROW;
		i_SYAINCD1	:= RowBNKI.SYAINCD1;
		i_SYAINCD2	:= RowBNKI.SYAINCD2;
		i_SYUBETU	:= RowBNKI.SYUBETU;
		i_YUSIYMD	:= RowBNKI.YUSIYMD;
		i_YUSIKBN	:= RowBNKI.YUSIKBN;
		i_KOJOYMD	:= TO_DATE(TO_CHAR(RowBNKI.KOJOYMD, 'YYYYMMDD'), 'YYYYMMDD');
		i_BUNMODFLG	:= RowBNKI.BUNMODFLG;
		i_BUNKAIYMD	:= RowBNKI.BUNKAIYMD;
		i_GANKIN	:= NVL(RowBNKI.GANKIN, 0);
		i_RISOKU	:= NVL(RowBNKI.RISOKU, 0);
		i_KOUSINYMD	:= TO_DATE(TO_CHAR(RowBNKI.KOUSINYMD, 'YYYYMMDD'), 'YYYYMMDD');

		-- �����敪
		SyoriKbn :=	2;

		-- ������
		o_GANKIN	:= 0;
		o_KJRISOKU	:= 0;
		o_MGANKINK	:= 0;
		o_KJRISOKUK	:= 0;
		o_MGANKINS	:= 0;
		o_KJRISOKUS	:= 0;

		-- �擾�f�[�^���痚���e�[�u���̏��荀�ڂɑ��

		o_MKOJOYMD		:=	i_KOJOYMD;			-- �T�����ݒ�
		o_GANKIN		:=	i_GANKIN;			-- �����ݒ�
		o_KJRISOKU		:=	i_RISOKU;			-- �����ݒ�
		o_SYORIYMD		:=	i_KOJOYMD;			-- ������

		IF i_YUSIKBN = '3' THEN						-- ���^�̏ꍇ

			o_MGANKINK	:=	i_GANKIN;			-- ���^�����Ɍ�����ݒ�
			o_KJRISOKUK	:=	i_RISOKU;			-- ���^�����ɗ�����ݒ�

		ELSIF i_YUSIKBN = '4' THEN

			o_MGANKINS	:=	i_GANKIN;			-- �ܗ^�����Ɍ����ݒ�
			o_KJRISOKUS	:=	i_RISOKU;			-- �ܗ^�����ɗ����ݒ�

		ELSE								-- �ܗ^�̏ꍇ

			Pg_Flg		:=	1;				-- �ΏۊO�œo�^���Ȃ�

		END IF;

		IF i_BUNMODFLG = '0' THEN					-- ����߂��̏ꍇ

			o_GANKIN	:=	o_GANKIN   * -1;		-- ����߂��̈׃}�C�i�X���z�ɂ���i�����j
			o_KJRISOKU	:=	o_KJRISOKU * -1;		-- ����߂��̈׃}�C�i�X���z�ɂ���i�����j
			IF i_KOUSINYMD > i_KOJOYMD THEN
				o_SYORIYMD	:=	i_KOUSINYMD;		-- ������
			END IF;
			o_SYORIKBN	:=	'5';				-- �����敪�i����߂��j

		ELSIF i_BUNMODFLG = '1' THEN

			IF i_BUNKAIYMD > i_KOJOYMD THEN
				o_SYORIYMD	:=	i_BUNKAIYMD;		-- ������
			END IF;

			o_SYORIKBN	:=	'6';				-- �����敪�i�U���j
			o_MGANKINK	:=	o_MGANKINK  * -1;		-- �����̈׃}�C�i�X���z�ɂ���i���^�����j
			o_KJRISOKUK	:=	o_KJRISOKUK * -1;		-- �����̈׃}�C�i�X���z�ɂ���i���^�����j
			o_MGANKINS	:=	o_MGANKINS  * -1;		-- �����̈׃}�C�i�X���z�ɂ���i�ܗ^�����j
			o_KJRISOKUS	:=	o_KJRISOKUS * -1;		-- �����̈׃}�C�i�X���z�ɂ���i�ܗ^�����j

		ELSE

			Pg_Flg		:=	1;				-- �ΏۊO�œo�^���Ȃ�

		END IF;

		IF Pg_Flg = 0 THEN

			-- �����敪
			SyoriKbn :=	3;

			-- �c�������e�[�u���o�^����
			INSERT INTO QPB3_ZNDKRRK (
				QPB3_SYAINCD1,
				QPB3_SYAINCD2,
				QPB3_SYUBETU,
				QPB3_YUSIYMD,
				QPB3_SYORIYMD,
				QPB3_SYORIKBN,
				QPB3_GANKIN,
				QPB3_KJRISOKU,
				QPB3_MKOJOYMD,
				QPB3_MGANKINK,
				QPB3_KJRISOKUK,
				QPB3_MGANKINS,
				QPB3_KJRISOKUS,
				QPB3_KUSNFLG,
				QPB3_TURKYMD,
				QPB3_KUSNYMD
			) VALUES (
				i_SYAINCD1,
				i_SYAINCD2,
				i_SYUBETU,
				i_YUSIYMD,
				o_SYORIYMD,
				o_SYORIKBN,
				o_GANKIN,
				o_KJRISOKU,
				o_MKOJOYMD,
				o_MGANKINK,
				o_KJRISOKUK,
				o_MGANKINS,
				o_KJRISOKUS,
				'0',
				SYSDATE,
				SYSDATE
			);

			-- �����敪
			SyoriKbn :=	4;

			-- �����E����߂��e�[�u���X�V�i�c������T�o�^�A�X�V�����j
			UPDATE QPB2_BUNKAI
			SET	QPB2_RRKFLG	= '1',
				QPB2_KOUSINYMD	= SYSDATE
			WHERE ROWID = i_BNKIROW;

			-- �o�^�����J�E���g�A�b�v
			TurkCNT	:=	TurkCNT + 1;

		END IF;

	END LOOP;

	-- ���I�J�[�\���̃N���[�Y
	CLOSE CurBNKI;

	-- �����敪
	SyoriKbn :=	5;

	-- �R���\�[�����O�o�́i�ǉ������j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I',
		'QPB3_ZNDKRRK:Rec = ' || TO_CHAR(TurkCNT)
		);

	-- �����敪
	SyoriKbn :=	6;

	-- �R�~�b�g
	commit;

	-- �R���\�[�����O�o�́i�����I���j
	QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'I', 'End');


EXCEPTION
	WHEN	OTHERS	THEN
		-- ���[���o�b�N
		ROLLBACK;

		-- ���O�o�͂d�m�c
		QUSP_LogPkg.QUSP_DispUponCons(InChaNetID, InChaJobID, ' ', module, 'E',
			'SYORIKUBUN:' || SyoriKbn || '/EXCEPTION: SQLCODE(' || SQLCODE || ')' || SQLERRM );

		/* �G���[���� */
		RAISE;
		
END QPAP_ZNDK_BNKITURK;

END QPAP_CEnt1540PkG;
/
SHOW ERROR
