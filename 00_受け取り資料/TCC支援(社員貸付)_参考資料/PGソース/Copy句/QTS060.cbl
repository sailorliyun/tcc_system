      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS060
      ****************************************************************
      *                利用明細歩引ファイル                          *
      *                             DATA-WRITTEN  99.02.04           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   * 
      *   1006060        商品ｺｰﾄﾞ改定多店舗化    imz吉田  2011/09/01 *
      *                                                              *
      ****************************************************************   
           03          ()-SEG.                         *>利用明細歩引
             05        ()-PRM.                         *>キー
               07      ()-PRMROKE.                     *>ロケーションキー
                 09    ()-PRMKIGYOUCD      PIC  9(04). *>企業コード
                 09    ()-PRMSUBRANGEKEY   PIC  9(04). *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO  PIC  9(08). *>内部会員番号
               07      ()-PRMTORIHIKINO    PIC  9(07). *>取引通番
             05        ()-DENPYOUNO        PIC  X(12). *>伝票ＮＯ
             05        ()-RECKBN           PIC  X(01). *>レコード区分
             05        ()-SAKUJOKBN        PIC  X(01). *>削除区分
             05        ()-DENPYOUSHUBETSU  PIC  9(04). *>伝票種別
             05        ()-BATCHNO          PIC  9(04). *>バッチＮＯ
             05        ()-GNO.                         *>Ｇ－ＮＯ
               07      ()-GNOBATCHNO       PIC  9(04). *>ＧバッチＮＯ
               07      ()-GNODENSEQUENCE   PIC  9(03). *>Ｇ伝票シーケンス
             05        ()-CARDNO           PIC  9(16). *>カード番号
             05        ()-RIYOUBI          PIC  9(08). *>利用日
             05        ()-UKETSUKEBI       PIC  9(08). *>受付日
             05        ()-KEIJYOUBI        PIC  9(08). *>計上日
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-HASSEITEN        PIC  9(02). *>発生店
             05        ()-HASSEITEN        PIC  9(03). *>発生店
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-SIHARAIHOHO      PIC  9(02). *>支払方法  
             05        ()-SEIKYUKANJI      PIC  N(20). *>請求漢字
             05        ()-SHUSEIGAKU       PIC S9(11)  *>歩引額手数料修正額
                                           SIGN LEADING SEPARATE.
             05        ()-BUBIKISHOUHIZEI  PIC S9(09)  *>歩引消費税
                                           SIGN LEADING SEPARATE.
             05        ()-ZEIKBN           PIC  X(01). *>税区分
             05        ()-CHUSHUTUSUMISIGN PIC  X(01). *>請求抽出済サイン
             05        ()-HASSEIROUTE      PIC  9(01). *>発生ルート
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-DENNYURYOKUTEN   PIC  9(02). *>伝票入力店
             05        ()-DENNYURYOKUTEN   PIC  9(03). *>伝票入力店
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-HOSTSHORIYMD     PIC  X(08). *>ホスト処理日
             05        ()-HOSTSHORITIME    PIC  X(06). *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD    PIC  9(08). *>サーバ更新日
      * ADD 2011/09/01 1006060 IMZ YOSHIDA START
             05        ()-URIBAKUKAKU      PIC  X(05). *>売場区画
             05        ()-BUMON            PIC  9(02). *>部門
             05        ()-HINGUNCD         PIC  9(03). *>品群コード
             05        ()-HGCHECKDIGIT     PIC  9(01). *>品群コード・Ｃ／Ｄ
             05        ()-FLOOR            PIC  9(01). *>フロアー
             05        ()-HINMEICD         PIC  9(03). *>品名コード
             05        ()-HMCHECKDIGIT     PIC  9(01). *>品名コード・Ｃ／Ｄ
             05        ()-HINMEISAISAI     PIC  X(04). *>品名細々コード
      * ADD 2011/09/01 1006060 IMZ YOSHIDA END
