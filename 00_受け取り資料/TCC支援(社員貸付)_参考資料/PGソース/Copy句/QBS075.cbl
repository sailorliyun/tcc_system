      *****************************************************************
      * 受付状況ファイル (QBS075)    レコード長：１６７ＢＹＴＥ
      *****************************************************************
           03  QBS075-SEG.
      * 受付番号
               05  QBS075-A0010              PIC  X(008).
               05  FILLER                    PIC  X(001).
      * 経過日
               05  QBS075-A0020              PIC  X(005).
               05  FILLER                    PIC  X(001).
      * スキャン日
               05  QBS075-A0030              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 入会受付日
               05  QBS075-A0040              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 委託審査判定日
               05  QBS075-A0050              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 審査確定済日
               05  QBS075-A0060              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * マスタ登録日
               05  QBS075-A0070              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 委託先判定
               05  QBS075-A0080              PIC  X(004).
               05  FILLER                    PIC  X(001).
      * 判定保留日
               05  QBS075-A0090              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * キャンセル日
               05  QBS075-A0100              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 金融宛発送日
               05  QBS075-A0110              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 埒ち区分
               05  QBS075-A0120              PIC  X(001).
               05  FILLER                    PIC  X(001).
      * 金融宛戻り日
               05  QBS075-A0130              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 不備手紙発送日
               05  QBS075-A0140              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 戻り理由
               05  QBS075-A0150              PIC  X(002).
               05  FILLER                    PIC  X(001).
      * 不備手紙戻り日
               05  QBS075-A0160              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 不備ＮＧ日
               05  QBS075-A0170              PIC  X(010).
               05  FILLER                    PIC  X(001).
      * 戻り仮登録日
               05  QBS075-A0180              PIC  X(010).
