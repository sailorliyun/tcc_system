      *8...........2.........3.........4.........5........6........7.........8
      *    QCS041(QTS055)
      ****************************************************************
      *                利用明細行ファイル                            *
      *                             DATA-WRITTEN  99.02.16           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   * 
      ****************************************************************    
           03          ()-SEG.                          *>利用明細
             05        ()-PRM.                          *>キー
               07      ()-PRMROKE.                      *>ロケーションキー
                 09    ()-PRMKIGYOUCD       PIC  9(04). *>企業コード
                 09    ()-PRMSUBRANGEKEY    PIC  9(04). *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO   PIC  9(08). *>内部会員番号
               07      ()-PRMTORIHIKINO     PIC  9(07). *>取引通番
               07      ()-PRMGYOUNO         PIC  9(02). *>行Ｎｏ
             05        ()-DENPYOUNO         PIC  X(12). *>伝票ＮＯ
             05        ()-RECKBN            PIC  X(01). *>レコード区分
             05        ()-KAIJYOKBN         PIC  X(01). *>解除区分
             05        ()-AKAKUROKBN        PIC  X(01). *>赤黒非表示区分
             05        ()-SEIKYUHORYUKBN    PIC  X(01). *>請求保留区分
             05        ()-DENPYOUSHUBETSU   PIC  9(04). *>伝票種別
             05        ()-BATCHNO           PIC  9(04). *>バッチＮＯ
             05        ()-GNO.                          *>Ｇ－ＮＯ
               07      ()-GNOBATCHNO        PIC  9(04). *>ＧバッチＮＯ
               07      ()-GNOSEQUENCE       PIC  9(03). *>Ｇ伝票シーケンス
             05        ()-CARDNO            PIC  9(16). *>カード番号
             05        ()-RIYOUBI           PIC  9(08). *>利用日
             05        ()-UKETSUKEBI        PIC  9(08). *>受付日
             05        ()-KEIJYOUBI         PIC  9(08). *>計上日
             05        ()-HASSEITEN         PIC  9(02). *>発生店
             05        ()-KAMEITENNO        PIC  X(10). *>加盟店ＮＯ
             05        ()-POS.                          *>ＰＯＳ端末情報
               07      ()-POSREGNO          PIC  9(04). *>ＰＯＳレジＮＯ
               07      ()-POSTORIHIKINO     PIC  9(05). *>ＰＯＳ取引ＮＯ
             05        ()-TANMATSU          PIC  X(09). *>ＣＤ端末情報
             05        ()-KAK.                          *>課係
               07      ()-KAKA.                         *>扱課
                 09    ()-KAKAKAATSUKAI     PIC  9(02). *>扱
                 09    ()-KAKAKAKA          PIC  9(02). *>課
               07      ()-KAKKKAKARIKAKARI  PIC  9(02). *>係
             05        ()-SAICD             PIC  9(03). *>催コード
             05        ()-TKURIAGETUUBAN    PIC  9(13). *>提携売上通番
             05        ()-GYOUSU            PIC  9(02). *>行数
             05        ()-GYOUMEISAI.                   *>行明細
               07      ()-GMSHINGUNCDG.                 *>品群コード
                 09    ()-GMSBUMON          PIC  9(02). *>部門
                 09    ()-GMSHINGUNCD       PIC  9(03). *>品群
                 09    ()-GMSHGCHECKDIGIT   PIC  9(01). *>Ｃ／Ｄ
               07      ()-GMSHINMEICDG.                 *>品名コード
                 09    ()-GMSFLOOR          PIC  9(01). *>フロアー
                 09    ()-GMSHINMEICD       PIC  9(03). *>コード
                 09    ()-GMSHMCHECKDIGIT   PIC  9(01). *>Ｃ／Ｄ
               07      ()-GMSSEIKYUKANJI    PIC  N(20). *>請求漢字
               07      ()-GMSHINMEISAISAI   PIC  X(04). *>品名細々コード
               07      ()-GMSSEIKYUSAKUIN   PIC  X(01). *>請求索引コード
               07      ()-GMSSURYOU         PIC  9(07).9(02). *>数量
               07      ()-GMSTANKA          PIC S9(07)  *>単価
                                            SIGN LEADING SEPARATE.
               07      ()-GMSKNG            PIC S9(11)  *>金額
                                            SIGN LEADING SEPARATE.
               07      ()-GMSJYOGAIKBN      PIC  X(01). *>歩引除外区分
               07      ()-GMSBUBIKIGAKU     PIC S9(09)  *>歩引額
                                            SIGN LEADING SEPARATE.
               07      ()-GMSZEIKBN         PIC  X(01). *>税区分
               07      ()-GMSKANKINKBN      PIC  X(01). *>換金区分
               07      ()-GMSGETSUREICD     PIC  X(01). *>月令コード
               07      ()-GMSMAESHOUHIZEI   PIC S9(09)  *>歩引前消費税
                                            SIGN LEADING SEPARATE.
               07      ()-GMSPOINT.                     *>歩引ポイント情報
                 09    ()-GMSTSUUJYOU.                  *>通常分
                   11  ()-GMSPOINTRITSU     PIC  99.99. *>歩引ポイント率
                   11  ()-GMSGAKUPOINTSU    PIC S9(11)  *>歩引額ポイント数
                                            SIGN LEADING SEPARATE.
                 09    ()-GMSBONASU.                    *>ボーナス分 
                   11  ()-GMSBOPOINTRITSU   PIC  99.99. *>歩引ポイント率 
                   11  ()-GMSBOGAKUPOINTSU  PIC S9(11)  *>歩引額ポイント数
                                            SIGN LEADING SEPARATE.
             05        ()-HOSTSHORIYMD      PIC  X(08). *>ホスト処理日
             05        ()-HOSTSHORITIME     PIC  X(06). *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>サーバ更新日
             05        ()-JGIANBUNGAKU      PIC S9(11)  *>除外按分額
                                            SIGN LEADING SEPARATE.
             05        ()-SHJANBUNJUNI      PIC  9(02). *>除外按分順位



