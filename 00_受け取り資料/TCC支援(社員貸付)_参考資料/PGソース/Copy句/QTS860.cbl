      ****************************************************************
      *    会員ステータスファイル             ID:QTS860              *
      *          RL：1628Byte                 DATA-WRITTEN  03.01.10 *
      *--------------------------------------------------------------*
      *            修  正  履  歴                                    *
      *    管理NO            修正理由              担当者  修正日付  *
      *   1006060   顧客分析ｻｰﾊﾞIF変更対応      kobayashi 11/09/01   *
      *                                                              *
      ****************************************************************
           03  QTS860-REC.
               05  QTS860-PRMNAIBUKAIINNO             PIC  X(016).
               05  QTS860-REVHURIKAEKAIINKBN          PIC  X(001).
               05  QTS860-POSSTS                      PIC  X(002).
               05  QTS860-DAISTSKOZA                  PIC  X(004).
               05  QTS860-STS-TBL                OCCURS    20.
                   07  QTS860-STSKOZA                 PIC  X(004).
                   07  QTS860-STSKOZATOROKUYMD        PIC  X(010).
               05  QTS860-STSEDA-TBL1            OCCURS    9.
                   07  QTS860-STSEDA-TBL2        OCCURS    10.
                     09  QTS860-STSEDACARD            PIC  X(004).
                     09  QTS860-STSEDACARDTOROKUYMD   PIC  X(010).
               05  QTS860-CARDKBN                     PIC  X(006).
               05  QTS860-ICMSKBN                     PIC  X(001).
      * DEL  2011/09/01 1006060 IMZ Kobayashi START
      *         05  QTS860-TOKTKURIKOSIPOINT           PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *         05  QTS860-TOKTHASSEIPOINT             PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *         05  QTS860-TOKTHIKIKAEPOINT            PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *         05  QTS860-TOKTTORIKESIPOINT           PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      *         05  QTS860-TOKTZANPOINT                PIC S9(011)
      *                                          SIGN LEADING SEPARATE.
      * DEL  2011/09/01 1006060 IMZ Kobayashi END
