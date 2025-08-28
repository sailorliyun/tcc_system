      ****************************************************************
      *    会員サマリデータファイル 　            ID:QTS850          *
      *          RL：950Byte                  DATA-WRITTEN  03.01.10 *
      *--------------------------------------------------------------*
      *            修  正  履  歴                                    *
      *   管理NO    修正理由                    担当者    修正日付   *
      *   000001    出力編集の項目追加のため    Hasegawa  03/12/09   *
      *                                                              *
      ****************************************************************
            03  QTS850-REC.
                05  QTS850-PRMNAIBUKAIINNO        PIC  X(016).
                05  QTS850-TENSAIKENKANRI         PIC  X(002).
                05  QTS850-TENKAKUTOKU            PIC  X(002).
                05  QTS850-TENDM                  PIC  X(002).
                05  QTS850-NYKUKETSUKENO          PIC  X(008).
                05  QTS850-NYKKESSAIYMD           PIC  X(010).
                05  QTS850-YUKOKIGEN              PIC  9(006).
                05  QTS850-STS.
                    07  QTS850-STSKOZA            PIC  X(004).
                05  QTS850-KOZA        OCCURS  20.   
                    07  QTS850-STSKOZA            PIC  X(004).
                    07  QTS850-STSKOZATOROKUYMD   PIC  X(010).
                05  QTS850-CARD        OCCURS  10.   
                    07  QTS850-STSCARD            PIC  X(004).
                    07  QTS850-STSCARDTOROKUYMD   PIC  X(010).
                05  QTS850-CARDKBN                PIC  X(006).
                05  QTS850-PNTTEIKEIKBN           PIC  X(001).
                05  QTS850-PNTKBN                 PIC  X(001).
                05  QTS850-WEBKAIINKBN            PIC  X(001).
                05  QTS850-REVHURIKAEKAIINKBN     PIC  X(001).
                05  QTS850-YSNSOUGENDO            PIC  9(005).
                05  QTS850-YSNCASHGENDO           PIC  9(005).
                05  QTS850-HONSEINENGAPPI         PIC  X(010).
                05  QTS850-HONSEX                 PIC  X(001).
                05  QTS850-JTKYUUBINNO            PIC  X(007).
                05  QTS850-KMSYUUBINNO            PIC  X(007).
                05  QTS850-TORIYOUMKENSU          PIC  9(007).
                05  QTS850-TOKTKURIKOSIPOINT      PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOKTHASSEIPOINT        PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOKTHIKIKAEPOINT       PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOKTTORIKESIPOINT      PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMKOKUNAISYPKEI     PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMKAIGAISYPKEI      PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMKOKUNAICAHKEI     PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMKAIGAICAHKEI      PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMSYPHKTEN          PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMSYPTUUHAN         PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMSYPKANKEI         PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMSYPKKAMEI         PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMSYPTKAMEI         PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMSYPSONOTA         PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TRSUMCAHKEI            PIC S9(014)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMSYP1KAI           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMSYP2KAI           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMSYPBNS1           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMSYPBNS2           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMSYPBUNKATU        PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMSYPRIBO           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMCAH1KAI           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMCAHRIBO           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUML1KAI             PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUML2KAI             PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMLBNS1             PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMLBNS2             PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMLBUNKATU          PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMLGANKIN           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMMGANKIN           PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-TOSUMMGANRI            PIC S9(011)
                           SIGN LEADING SEPARATE.
                05  QTS850-POSSTS                 PIC  X(002).
                05  QTS850-SYORIYMD               PIC  X(010).
      * 2003/12/9  項目追加 -->
                05  QTS850-REVSMAITSUKI           PIC  X(001).
                05  QTS850-REVSBONUS              PIC  9(002).
                05  QTS850-REVCMAITSUKI           PIC  X(001).
                05  QTS850-REVCBONUS              PIC  9(002).
      * 2003/12/9 <--
      *         05  FILLER                        PIC  X(000).
