      *8...........2.........3.........4.........5.........6.........7..
      ****************************************************************
      *   コピー句名称　       :  手紙データ                         *
      ****************************************************************
      *文書番号
           03  ()-PRMBUNSYONO      PIC  X(08).
      *作成日
           03  ()-PRMSAKUSEIYMD    PIC  X(08).
      *受付番号
           03  ()-PRMUKETUKENO     PIC  X(16).
      *連番
           03  ()-PRMRENBAN        PIC  X(04).
      *企業コード
           03  ()-KIGYOCD          PIC  X(04).
      *サブレンジキー
           03  ()-SUBRNG           PIC  X(04).
      *内部会員番号
           03  ()-NAIBUKAIIN       PIC  X(08).
      *東西区分
           03  ()-TOUZAIKBN        PIC  X(01).
      *送付先区分
           03  ()-SOUFUKBN         PIC  X(01).
      *漢字氏名
           03  ()-SHIMEIKAN        PIC  X(30).
      *勤務先漢字名称
           03  ()-KMSMEIKAN        PIC  X(60).
      *自宅住所変更区分
           03  ()-JTKUPDATEKBN     PIC  X(01).
      *自宅郵便番号
           03  ()-JTKYUUBINNO      PIC  X(08).
      *自宅住所１
           03  ()-JTKJUSHO1        PIC  X(28).
      *自宅住所２
           03  ()-JTKJUSHO2        PIC  X(40).
      *自宅住所３
           03  ()-JTKJUSHO3        PIC  X(40).
      *自宅住所４
           03  ()-JTKJUSHO4        PIC  X(40).
      *自宅電話番号
           03  ()-JTKTELNO         PIC  X(15).
      *勤務先住所変更区分
           03  ()-KMSUPDATEKBN     PIC  X(01).
      *勤務先郵便番号
           03  ()-KMSYUUBINNO      PIC  X(08).
      *勤務先住所１
           03  ()-KMSJUSHO1        PIC  X(28).
      *勤務先住所２
           03  ()-KMSJUSHO2        PIC  X(40).
      *勤務先住所３
           03  ()-KMSJUSHO3        PIC  X(40).
      *勤務先住所４
           03  ()-KMSJUSHO4        PIC  X(40).
      *勤務先電話番号
           03  ()-KMSTELNO         PIC  X(15).
      *add 2000/05/27
      *勤務先宛名
           03  ()-KMSATENA         PIC  X(30).
      *その他郵便番号
           03  ()-SONOTAYUUBINNO   PIC  X(08).
      *その他住所１
           03  ()-SONOTAJUSHO1     PIC  X(28).
      *その他住所２
           03  ()-SONOTAJUSHO2     PIC  X(40).
      *その他住所３
           03  ()-SONOTAJUSHO3     PIC  X(40).
      *その他住所４
           03  ()-SONOTAJUSHO4     PIC  X(40).
      *その他宛名
           03  ()-SONOTAATENA      PIC  X(30).
      *発送予定日
           03  ()-HASSOUYOTEIYMD   PIC  X(08).
      *返却予定日
           03  ()-HENKYAKUYOTEIYMD PIC  X(08).
      *返却日
           03  ()-HENKYAKUYMD      PIC  X(08).
      *返却理由コード
           03  ()-HENKYAKURIYUUCD  PIC  X(01).
      *利用情報　利用カード
           03  ()-RIYOUCARDNO      PIC  X(16).
      *利用情報　利用日
           03  ()-RIYOUBI          PIC  X(06).
      *利用情報　利用金額
           03  ()-RIYOUKNG         PIC  -(8)9.
      *整理番号s
           03  ()-SEIRINO          PIC  X(17).
      *add 2000/06/01
      *有効期限
           03  ()-YUKOKIGEN        PIC  X(04).
      *印刷フラグ
           03  ()-PRINTFLG         PIC  X(01).
      *更新担当者コード
           03  ()-KOUSHINTANTOCD   PIC  X(08).
      *更新担当者名
           03  ()-KOUSHINTANTOMEI  PIC  X(12).
      *更新日時
           03  ()-KOUSHINDATETIME  PIC  X(14).
      *登録担当者コード
           03  ()-TOUROKUTANTOCD   PIC  X(08).
      *登録担当者名
           03  ()-TOUROKUTANTOMEI  PIC  X(12).
      *登録日時
           03  ()-TOUROKUDATETIME  PIC  X(14).
