      *8...........2.........3.........4.........5........6........7..
      *    QTS100(QTA100)
      ****************************************************************
      *                入金分解テーブル                              *
      *                             DATA-WRITTEN  99.01.12           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   * 
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03    ()-SEG.
             05  ()-PRMKIGYOUCD        PIC  9(04).  *>企業コード
             05  ()-PRMSUBRANJIKEY     PIC  9(04).  *>サブレンジキー
             05  ()-PRMNAIBUKAIINNO    PIC  9(08).  *>内部会員番号
             05  ()-PRMNYUKINMEISAI    PIC  9(07).  *>入金明細番号
             05  ()-PRMSHORITUUBAN     PIC  9(09).  *>入金分解通番
             05  ()-TOUZAIKBN          PIC  X(01).  *>東西区分
             05  ()-JIGYOHONBUCD       PIC  X(02).  *>事業本部コード
             05  ()-SAIKENKANRITEN     PIC  X(02).  *>債権管理店
             05  ()-NYUKINHASSEITEN    PIC  X(02).  *>入金発生店
             05  ()-CARDKBN            PIC  9(06).  *>カード区分
             05  ()-ATUKAIBUKAKARI     PIC  X(06).  *>扱部課係
             05  ()-GAIBUKAIINNO       PIC  9(16).  *>外部会員番号
             05  ()-BUNKAIBI           PIC  9(08).  *>分解日
             05  ()-KEIJYOUBI          PIC  9(08).  *>計上日
             05  ()-NYUKINBI           PIC  9(08).  *>入金日
             05  ()-YOSINRANK          PIC  X(01).  *>与信ランク
             05  ()-MINASIFLG          PIC  X(01).  *>見なしフラグ
             05  ()-YUKOUKIGEN         PIC  9(04).  *>有効期限
             05  ()-SHORIBI            PIC  9(08).  *>処理日
             05  ()-NYURYOKUTEN        PIC  X(02).  *>入力店
             05  ()-BUNKAIKBN          PIC  9(02).  *>分解区分
             05  ()-BUNKAIKBNHONYAKU   PIC  N(04).  *>分解区分翻訳値
             05  ()-SEIKYUNENGETU      PIC  9(06).  *>請求年月
             05  ()-SHIHARAIHOHO       PIC  9(02).  *>支払方法
             05  ()-ZANMEISAIDENPYOU   PIC  9(07).  *>残明細伝票番号
             05  ()-JTMGENPON          PIC S9(11)   *>元本
                                       SIGN LEADING SEPARATE.
             05  ()-JTMTESURYO         PIC S9(09)   *>手数料
                                       SIGN LEADING SEPARATE.
             05  ()-JTMJIMTESURYO      PIC S9(09)   *>事務手数料
                                       SIGN LEADING SEPARATE.
             05  ()-JTMMIJYUTORISOKU   PIC S9(09)   *>未充当利息
                                       SIGN LEADING SEPARATE.
             05  ()-JTMNYUKINBI        PIC  9(08).  *>最新入金日
             05  ()-JTJGENPON          PIC S9(11)   *>元本
                                       SIGN LEADING SEPARATE.
             05  ()-JTJTESURYOU76      PIC S9(09)   *>手数料7-6
                                       SIGN LEADING SEPARATE.
             05  ()-JTJTESURYOU16      PIC S9(09)   *>手数料1-6
                                       SIGN LEADING SEPARATE.
             05  ()-JTJJIMTESURYOU     PIC S9(09)   *>事務手数料
                                       SIGN LEADING SEPARATE.
             05  ()-JTJSONGAIKIN       PIC S9(09)   *>遅延損害金
                                       SIGN LEADING SEPARATE.
             05  ()-JTJMODOSIRISOKU    PIC S9(07)   *>戻し利息
                                       SIGN LEADING SEPARATE.
             05  ()-RISOKUZANKIJYUNBI  PIC  9(08).  *>利息計算基準日
             05  ()-LOANKANSUMIKBN     PIC  9(01).  *>ローン完済区分
             05  ()-SSJSOUSAIKAMOKU    PIC  9(03).  *>相殺科目
             05  ()-SSJKNG             PIC S9(09)   *>相殺金額
                                       SIGN LEADING SEPARATE.
             05  ()-DENPYOUSYUBETSU    PIC  X(04).  *>伝票種別
             05  ()-HOUHOUHONYAKUCHI   PIC  N(06).  *>支払方法翻訳値
             05  ()-LOANSHUBETSU       PIC  9(05).  *>ローン種別
             05  ()-GETSUREICD         PIC  9(01).  *>月令コード
             05  ()-HOSTSHORIYMD       PIC  X(08).  *>ホスト処理日
             05  ()-HOSTSHORITIME      PIC  X(06).  *>ホスト処理時刻
             05  ()-SVRKOUSHINYMD      PIC  9(08).  *>サーバ更新日
