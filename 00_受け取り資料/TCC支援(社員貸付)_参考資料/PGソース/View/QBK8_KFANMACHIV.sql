------------------------------------------------------------------------------------------------
--�X�V���t  �Č�/��Q�ԍ�    �C�����R
--20090329  0807073/0808052  0807073�F�N���W�b�g�x���V�X�e���̍č\�z
--                           0808052�FTCC�x���V�X�e���̍č\�z
--                             �ECS�ڊǍς݃f�[�^�Ɖ�@CS�ڊǍς݃f�[�^����Ή�
--                             �E����ԍ��̐擪�T���܂��͂U����CS�ڊǍς݃f�[�^�𔻒肵�A
--                               �f�[�^�̏Ɖ�E�����}�~����B
------------------------------------------------------------------------------------------------

-- DROP VIEW QBK8_KFANMACHIV;
CREATE OR REPLACE VIEW TCCUSER.QBK8_KFANMACHIV ( 
QBK8_PRMUKETUKENO
,QBK8_PRMNAIBUKAIINNO
,QBK8_PRMHASOUINYMD
,QBK8_KIGYOUCD
,QBK8_SUBRANGEKEY
,QBK8_GAIBUKAIINNO
--ADD 20090329 0807073/0808052 NBC LIU START
,QBK8_GAIBUKAIINNO1
--ADD 20090329 0807073/0808052 NBC LIU START
,QBK8_BLACKNO
,QBK8_SOHTOUZAIKBN
,QBK8_SOHSOUFUSAKIKBN
,QBK8_SOHGINKOUCD
,QBK8_SOHSHITENCD
,QBK8_KOZTOUZAIKBN
,QBK8_KOZGINKOUCD
,QBK8_KOZSHITENCD
,QBK8_KOZSHUMOKU
,QBK8_KOZYUCHOSAIHATU
,QBK8_KOZNO
,QBK8_KOZMEIGI
,QBK8_SOHTELNO
,QBK8_KNJNAME
,QBK8_KNJSOHATENA
,QBK8_KNJSOHSITEN
,QBK8_KNJKOZGINKOU
,QBK8_KNJKOZSITEN
,QBK8_KOUTANTOCD
,QBK8_KOUTANTOMEI
,QBK8_KOUBUSHOCD
,QBK8_KOUDATETIME
 ) AS 
SELECT QBK5_PRMUketukeNo QBK8_PRMUketukeNo,
       QBK5_PRMNaibuKaiinNo QBK8_PRMNaibuKaiinNo,
       QBK5_PRMHasouInYmd QBK8_PRMHasouInYmd,
       QBK5_KigyouCd QBK8_KigyouCd,
       QBK5_SubRangeKey QBK8_SubRangeKey,
       REPLACE(QSAP_EdKaiinNoPkg.QSAP_EdKaiinNoFnc(2, QBK5_GaibuKaiinNo), '00-00-0000-0-0', ' ') QBK8_GaibuKaiinNo,
--ADD 20090329 0807073/0808052 NBC LIU START
       QBK5_GaibuKaiinNo QBK8_GaibuKaiinNo1,
--ADD 20090329 0807073/0808052 NBC LIU START
       QBK5_BlackNo QBK8_BlackNo,
       QBK5_SOHTouzaiKbn QBK8_SOHTouzaiKbn,
       QBK5_SOHSoufusakiKbn QBK8_SOHSoufusakiKbn,
       QBK5_SOHGinkouCd QBK8_SOHGinkouCd,
       QBK5_SOHShitenCd QBK8_SOHShitenCd,
       QBK5_KOZTouzaiKbn QBK8_KOZTouzaiKbn,
       QBK5_KOZGinkouCd QBK8_KOZGinkouCd,
       QBK5_KOZShitenCd QBK8_KOZShitenCd,
       QBK5_KOZShumoku QBK8_KOZShumoku,
       QBK5_KOZYuchosaihatu QBK8_KOZYuchosaihatu,
       QBK5_KOZNo QBK8_KOZNo,
       QBK5_KOZMeigi QBK8_KOZMeigi,
       QBK5_SOHTELNo QBK8_SOHTELNo,
       QBK5_KNJName QBK8_KNJName,
       -- �m�������ꍇ�̕s��Ή� IMZ.YAMADA -->
       --QBK5_KNJSOHAtena QBK8_KNJSOHAtena,
       Nvl(QBK5_KNJSOHAtena,' ') QBK8_KNJSOHAtena,
       -- �m�������ꍇ�̕s��Ή� IMZ.YAMADA <--
       QBK5_KNJSOHSiten QBK8_KNJSOHSiten,
       -- �m�������ꍇ�̕s��Ή� IMZ.YAMADA -->
       --QBK5_KNJKOZGinkou QBK8_KNJKOZGinkou,
       Nvl(QBK5_KNJKOZGinkou,' ') QBK8_KNJKOZGinkou,
       -- �m�������ꍇ�̕s��Ή� IMZ.YAMADA <--
       QBK5_KNJKOZSiten QBK8_KNJKOZSiten,
       QBK5_KOUTantoCd QBK8_KOUTantoCd,
       QBK5_KOUTantoMei QBK8_KOUTantoMei,
       QBK5_KOUBushoCd QBK8_KOUBushoCd,
       QBK5_KOUDateTime QBK8_KOUDateTime
FROM   QBK5_KFAnMachiT

;
