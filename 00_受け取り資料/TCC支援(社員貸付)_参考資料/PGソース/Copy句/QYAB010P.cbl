      *8...........2.........3.........4.........5.........6.........7..
      ****************************************************************
      *   コピー句名称　       :  オーソリログファイル               *
      ****************************************************************
      *センタＩＤ
           03  ()-CENTERID         PIC  X(02).
      *ＣＡＦＩＳ処理通番
           03  ()-CAFISTUBAN       PIC  X(06).
      *センタ識別
           03  ()-CENTERSIKIBETU   PIC  X(02).
      *取引区分
           03  ()-TORIHIKIKBN      PIC  X(01).
      *処理日
           03  ()-SYORIDATE        PIC  X(06).
      *受信時刻
           03  ()-JYUSINTIME       PIC  X(06).
      *企業コード
           03  ()-KIGYOCD          PIC  X(04).
      *サブレンジキー
           03  ()-SUBRNG           PIC  X(04).
      *内部会員番号
           03  ()-NAIBUKAIIN       PIC  X(08).
      *要求電文種別
           03  ()-YOKYUDENBUN      PIC  X(04).
      *応答電文種別
           03  ()-OUTOUDENBUN      PIC  X(04).
      *電文送信区分
           03  ()-DENBUNSOSINKBN   PIC  X(01).
      *券面番号
           03  ()-KENMENBANGO      PIC  X(16).
      *有効期限
           03  ()-YUKOKIGEN        PIC  X(04).
      *加盟店番号
           03  ()-KAMEITENNO       PIC  X(13).
      *会社コード
           03  ()-KAISYACODE       PIC  X(07).
      *仕向会社
           03  ()-SIKOKAISYA       PIC  X(11).
      *承認番号
           03  ()-SYONINNO         PIC  X(07).
      *カード入力方法（カード区分）
           03  ()-CARDKBN          PIC  X(01).
      *金額
           03  ()-KINGAKU          PIC  S9(08).
      *税送料等
           03  ()-ZEISORYOTOU      PIC  S9(07).
      *商品コード
           03  ()-SYOUHINCODE      PIC  9(07).
      *エンコード内容
           03  ()-ENCODENAIYOU     PIC  X(69).
      *支払区分
           03  ()-SIHARAIKBN       PIC  X(02).
      *エラーコード
           03  ()-ERRCODE          PIC  X(03).
