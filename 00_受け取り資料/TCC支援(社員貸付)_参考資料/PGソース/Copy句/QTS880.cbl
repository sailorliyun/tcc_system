      ****************************************************************
      *    会員基本属性ファイル配信用ﾚｲｱｳﾄ    ID:QTS880              *
      *                                       DATA-WRITTEN  11.05.22 *
      *--------------------------------------------------------------*
      *            修  正  履  歴                                    *
      *   管理NO    修正理由                    担当者    修正日付   *
      *   1006060   顧客分析ｻｰﾊﾞIF変更対応      kobayashi 11/09/01   *
      *                                                              *
      ****************************************************************
            03  QTS880-REC.
                05  QTS880-PRMNAIBUKAIINNO        PIC  X(016).
                05  QTS880-GKNEDABAN              PIC  X(001).
                05  QTS880-GKNSHIKIBETSUNO        PIC  X(016).
                05  QTS880-TENSAIKENKANRI         PIC  X(002).
                05  QTS880-TENKAKUTOKU            PIC  X(002).
                05  QTS880-TENDM                  PIC  X(002).
                05  QTS880-NYKUKETSUKENO          PIC  X(008).
                05  QTS880-NYKKESSAIYMD           PIC  X(010).
                05  QTS880-YUKOKIGEN              PIC  9(006).
                05  QTS880-STS.
                    07  QTS880-DAISTSKOZA         PIC  X(004).
                05  QTS880-KOZA        OCCURS  14.   
                    07  QTS880-STSKOZA            PIC  X(004).
                    07  QTS880-STSKOZATOROKUYMD   PIC  X(010).
                05  QTS880-CARD        OCCURS   4.   
                    07  QTS880-STSCARD            PIC  X(004).
                    07  QTS880-STSCARDTOROKUYMD   PIC  X(010).
                05  QTS880-CARDKBN                PIC  X(006).
                05  QTS880-PNTTEIKEIKBN           PIC  X(001).
                05  QTS880-ICMSKBN                PIC  X(001).
                05  QTS880-PNTKBN                 PIC  X(001).
                05  QTS880-WEBKAIINKBN            PIC  X(001).
                05  QTS880-REVHURIKAEKAIINKBN     PIC  X(001).
                05  QTS880-SOHCARD                PIC  X(001).
                05  QTS880-SOHSEIKYU              PIC  X(001).
                05  QTS880-YSNSOUGENDO            PIC  9(005).
                05  QTS880-YSNCASHGENDO           PIC  9(005).
                05  QTS880-HONSEINENGAPPI         PIC  X(010).
                05  QTS880-HONSEX                 PIC  X(001).
                05  QTS880-JTKYUUBINNO            PIC  X(007).
                05  QTS880-KOZGINKOUCD            PIC  X(004).
                05  QTS880-KOZSHITENCD            PIC  X(005).
                05  QTS880-KOZSHUMOKU             PIC  X(001).
                05  QTS880-POSSTS                 PIC  X(002).
                05  QTS880-SYORIYMD               PIC  X(010).
                05  QTS880-REVSMAITSUKI           PIC  X(001).
                05  QTS880-REVSBONUS              PIC  9(002).
                05  QTS880-REVCMAITSUKI           PIC  X(001).
                05  QTS880-REVCBONUS              PIC  9(002).
      * ADD  2011/09/01 1006060 IMZ Kobayashi START
                05  QTS880-ETCUMU                 PIC  X(001).
                05  QTS880-ATUKAKARI              PIC  X(006).
      * ADD  2011/09/01 1006060 IMZ Kobayashi END
