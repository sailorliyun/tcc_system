      ****************************************************************
      *    会員基本属性ファイル 　            ID:QTS870              *
      *          RL：900Byte                  DATA-WRITTEN  03.01.10 *
      *--------------------------------------------------------------*
      *            修  正  履  歴                                    *
      *   管理NO    修正理由                    担当者    修正日付   *
      *   000001    出力編集の項目追加のため    Hasegawa  03/12/16   *
      *   1006060   顧客分析ｻｰﾊﾞIF変更対応      kobayashi 11/09/01   *
      *                                                              *
      ****************************************************************
            03  QTS870-REC.
                05  QTS870-PRMNAIBUKAIINNO        PIC  X(016).
                05  QTS870-GKNEDABAN              PIC  X(001).
                05  QTS870-GKNSHIKIBETSUNO        PIC  X(016).
                05  QTS870-TENSAIKENKANRI         PIC  X(002).
                05  QTS870-TENKAKUTOKU            PIC  X(002).
                05  QTS870-TENDM                  PIC  X(002).
                05  QTS870-NYKUKETSUKENO          PIC  X(008).
                05  QTS870-NYKKESSAIYMD           PIC  X(010).
                05  QTS870-YUKOKIGEN              PIC  9(006).
                05  QTS870-STS.
                    07  QTS870-DAISTSKOZA         PIC  X(004).
                05  QTS870-KOZA        OCCURS  20.   
                    07  QTS870-STSKOZA            PIC  X(004).
                    07  QTS870-STSKOZATOROKUYMD   PIC  X(010).
                05  QTS870-CARD        OCCURS  10.   
                    07  QTS870-STSCARD            PIC  X(004).
                    07  QTS870-STSCARDTOROKUYMD   PIC  X(010).
                05  QTS870-EDBYUKOMUKO1           PIC  X(001).
                05  QTS870-EDBYUKOMUKO2           PIC  X(001).
                05  QTS870-EDBYUKOMUKO3           PIC  X(001).
                05  QTS870-EDBYUKOMUKO4           PIC  X(001).
                05  QTS870-EDBYUKOMUKO5           PIC  X(001).
                05  QTS870-EDBYUKOMUKO6           PIC  X(001).
                05  QTS870-EDBYUKOMUKO7           PIC  X(001).
                05  QTS870-EDBYUKOMUKO8           PIC  X(001).
                05  QTS870-EDBYUKOMUKO9           PIC  X(001).
                05  QTS870-CARDKBN                PIC  X(006).
                05  QTS870-PNTTEIKEIKBN           PIC  X(001).
                05  QTS870-ICMSKBN                PIC  X(001).
                05  QTS870-PNTKBN                 PIC  X(001).
                05  QTS870-WEBKAIINKBN            PIC  X(001).
                05  QTS870-REVHURIKAEKAIINKBN     PIC  X(001).
                05  QTS870-SOHCARD                PIC  X(001).
                05  QTS870-SOHSEIKYU              PIC  X(001).
                05  QTS870-YSNSOUGENDO            PIC  9(005).
                05  QTS870-YSNCASHGENDO           PIC  9(005).
                05  QTS870-HONSHIMEIKANA          PIC  X(030).
                05  QTS870-HONSHIMEIKAN           PIC  N(015).
                05  QTS870-HONSEINENGAPPI         PIC  X(010).
                05  QTS870-HONSEX                 PIC  X(001).
                05  QTS870-JTKYUUBINNO            PIC  X(007).
                05  QTS870-JTKJUSHOKAN            PIC  N(025).
                05  QTS870-JTKBANCHIKAN           PIC  N(015).
                05  QTS870-JTKKATAKAN             PIC  N(032).
                05  QTS870-JTKTELSHIGAI           PIC  X(007).
                05  QTS870-JTKTELKYOKU            PIC  X(004).
                05  QTS870-JTKTELNO               PIC  X(004).
                05  QTS870-KMSMEIKAN              PIC  N(030).
                05  QTS870-KMSMEIKANA             PIC  X(030).
                05  QTS870-KMSYUUBINNO            PIC  X(007).
                05  QTS870-KMSTELSHIGAI           PIC  X(007).
                05  QTS870-KMSTELKYOKU            PIC  X(004).
                05  QTS870-KMSTELNO               PIC  X(004).
                05  QTS870-KOZGINKOUCD            PIC  X(004).
                05  QTS870-KOZSHITENCD            PIC  X(005).
                05  QTS870-KOZSHUMOKU             PIC  X(001).
                05  QTS870-POSSTS                 PIC  X(002).
                05  QTS870-SYORIYMD               PIC  X(010).
      * 2003/12/16  項目追加 -->
                05  QTS870-REVSMAITSUKI           PIC  X(001).
                05  QTS870-REVSBONUS              PIC  9(002).
                05  QTS870-REVCMAITSUKI           PIC  X(001).
                05  QTS870-REVCBONUS              PIC  9(002).
      * 2003/12/16 <--
      * ADD  2011/09/01 1006060 IMZ Kobayashi START
                05  QTS870-ETCUMU                 PIC  X(001).
                05  QTS870-ATUKAKARI              PIC  X(006).
      * ADD  2011/09/01 1006060 IMZ Kobayashi END
