      ****************************************************************
      *    ‰ïˆõŠî–{‘®«ƒtƒ@ƒCƒ‹               ID:QTS800              *
      *          RLF900Byte                  DATA-WRITTEN  03.01.10 *
      *--------------------------------------------------------------*
      *            C  ³  —š  —ð                                    *
      *   ŠÇ—NO    C³——R                    ’S“–ŽÒ    C³“ú•t   *
      *   000001    o—Í•ÒW‚Ì€–Ú’Ç‰Á‚Ì‚½‚ß    Hasegawa  03/12/09   *
      *   1006060   ŒÚ‹q•ªÍ»°ÊÞIF•ÏX‘Î‰ž      kobayashi 11/09/01   *
      *                                                              *
      ****************************************************************
            03  QTS800-REC.
                05  QTS800-PRMNAIBUKAIINNO        PIC  X(016).
                05  QTS800-GKNEDABAN              PIC  X(001).
                05  QTS800-GKNSHIKIBETSUNO        PIC  X(016).
                05  QTS800-TENSAIKENKANRI         PIC  X(002).
                05  QTS800-TENKAKUTOKU            PIC  X(002).
                05  QTS800-TENDM                  PIC  X(002).
                05  QTS800-NYKUKETSUKENO          PIC  X(008).
                05  QTS800-NYKKESSAIYMD           PIC  X(010).
                05  QTS800-YUKOKIGEN              PIC  9(006).
                05  QTS800-STS.
                    07  QTS800-DAISTSKOZA         PIC  X(004).
                05  QTS800-KOZA        OCCURS  20.
                    07  QTS800-STSKOZA            PIC  X(004).
                    07  QTS800-STSKOZATOROKUYMD   PIC  X(010).
                05  QTS800-CARD        OCCURS  10.
                    07  QTS800-STSCARD            PIC  X(004).
                    07  QTS800-STSCARDTOROKUYMD   PIC  X(010).
                05  QTS800-EDBYUKOMUKO1           PIC  X(001).
                05  QTS800-EDBYUKOMUKO2           PIC  X(001).
                05  QTS800-EDBYUKOMUKO3           PIC  X(001).
                05  QTS800-EDBYUKOMUKO4           PIC  X(001).
                05  QTS800-EDBYUKOMUKO5           PIC  X(001).
                05  QTS800-EDBYUKOMUKO6           PIC  X(001).
                05  QTS800-EDBYUKOMUKO7           PIC  X(001).
                05  QTS800-EDBYUKOMUKO8           PIC  X(001).
                05  QTS800-EDBYUKOMUKO9           PIC  X(001).
                05  QTS800-CARDKBN                PIC  X(006).
                05  QTS800-PNTTEIKEIKBN           PIC  X(001).
                05  QTS800-ICMSKBN                PIC  X(001).
                05  QTS800-PNTKBN                 PIC  X(001).
                05  QTS800-WEBKAIINKBN            PIC  X(001).
                05  QTS800-REVHURIKAEKAIINKBN     PIC  X(001).
                05  QTS800-SOHCARD                PIC  X(001).
                05  QTS800-SOHSEIKYU              PIC  X(001).
                05  QTS800-YSNSOUGENDO            PIC  9(005).
                05  QTS800-YSNCASHGENDO           PIC  9(005).
                05  QTS800-HONSHIMEIKANA          PIC  X(030).
                05  QTS800-HONSHIMEIKAN           PIC  N(015).
                05  QTS800-HONSEINENGAPPI         PIC  X(010).
                05  QTS800-HONSEX                 PIC  X(001).
                05  QTS800-JTKYUUBINNO            PIC  X(007).
                05  QTS800-JTKJUSHOKAN            PIC  N(025).
                05  QTS800-JTKBANCHIKAN           PIC  N(015).
                05  QTS800-JTKKATAKAN             PIC  N(032).
                05  QTS800-JTKTELSHIGAI           PIC  X(007).
                05  QTS800-JTKTELKYOKU            PIC  X(004).
                05  QTS800-JTKTELNO               PIC  X(004).
                05  QTS800-KMSMEIKAN              PIC  N(030).
                05  QTS800-KMSMEIKANA             PIC  X(030).
                05  QTS800-KMSYUUBINNO            PIC  X(007).
                05  QTS800-KMSTELSHIGAI           PIC  X(007).
                05  QTS800-KMSTELKYOKU            PIC  X(004).
                05  QTS800-KMSTELNO               PIC  X(004).
                05  QTS800-KOZGINKOUCD            PIC  X(004).
                05  QTS800-KOZSHITENCD            PIC  X(005).
                05  QTS800-KOZSHUMOKU             PIC  X(001).
                05  QTS800-POSSTS                 PIC  X(002).
                05  QTS800-SYORIYMD               PIC  X(010).
      * 2003/12/9  €–Ú’Ç‰Á -->
                05  QTS800-REVSMAITSUKI           PIC  X(001).
                05  QTS800-REVSBONUS              PIC  9(002).
                05  QTS800-REVCMAITSUKI           PIC  X(001).
                05  QTS800-REVCBONUS              PIC  9(002).
      * 2003/12/9 <--
      *
      * ADD  2011/09/01 1006060 IMZ Kobayashi START
                05  QTS800-ETCUMU                 PIC  X(001).
                05  QTS800-ATUKAKARI              PIC  X(006).
      * ADD  2011/09/01 1006060 IMZ Kobayashi END
      * DEL  2011/09/01 1006060 IMZ Kobayashi START
      *          05  QTS800-TOKTKURIKOSIPOINT      PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *          05  QTS800-TOKTHASSEIPOINT        PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *          05  QTS800-TOKTHIKIKAEPOINT       PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *          05  QTS800-TOKTTORIKESIPOINT      PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *          05  QTS800-TOKTZANPOINT           PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      * DEL  2011/09/01 1006060 IMZ Kobayashi END
