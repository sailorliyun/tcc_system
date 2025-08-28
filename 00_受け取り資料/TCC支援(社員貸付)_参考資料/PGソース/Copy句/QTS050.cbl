      *8...........2.........3.........4.........5........6........7.........8
      *    QTS050
      ****************************************************************
      *                利用明細ファイル                              *
      *                             DATA-WRITTEN  99.02.16           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   *
      * 0001   項目追加対応               ＮＢＣ   2002/08/05        *
      *                                                              *
      * 0002   リボ利用促進システム対応   ＮＢＣ   2003/01/20        *
      *          自動振替区分追加                                    *
      *                                                              *
      * 0003   項目追加対応               下田     2005/04/01        *
      *          除外内金　　　　　　　　　　　　　　　　　　　　　　*
      * 1006060 商品ｺｰﾄﾞ改定多店舗化      imz吉田  2011/09/01        *
      *                                                              *
      ****************************************************************    
           03          ()-SEG.                          *>利用明細
             05        ()-PRM.                          *>キー
               07      ()-PRMROKE.                      *>ロケーションキー
                 09    ()-PRMKIGYOUCD       PIC  9(04). *>企業コード
                 09    ()-PRMSUBRANGEKEY    PIC  9(04). *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO   PIC  9(08). *>内部会員番号
               07      ()-PRMTORIHIKINO     PIC  9(07). *>取引通番
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
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-HASSEITEN         PIC  9(02). *>発生店
             05        ()-HASSEITEN         PIC  9(03). *>発生店
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
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
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-SAICD             PIC  9(03). *>催コード
             05        ()-SAICD             PIC  9(04). *>催コード
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-TKURIAGETUUBAN    PIC  9(13). *>提携売上通番
             05        ()-GYOUSU            PIC  9(02). *>行数
             05        ()-GYOUNO            PIC  9(02). *>行Ｎｏ
             05        ()-GKG.                          *>合計行
               07      ()-GKGSHIHARAIHOHO   PIC  9(02). *>支払方法 
               07      ()-GKGLOANSHUBETSU   PIC  9(05). *>ローン種別
               07      ()-GKGRIYOUKNG       PIC S9(11)  *>利用金額
                                            SIGN LEADING SEPARATE.
               07      ()-GKGSHOUHINDAIKIN  PIC S9(11)  *>商品代金
                                            SIGN LEADING SEPARATE.
               07      ()-GKGBUBIKIRITSU    PIC  9(02). *>歩引率
               07      ()-GKGBUBIKIGAKU     PIC S9(11)  *>歩引額
                                            SIGN LEADING SEPARATE.
               07      ()-GKGBUBIKITAISHOU  PIC S9(11)  *>歩引対象額合計
                                            SIGN LEADING SEPARATE.
               07      ()-GKGBUBIKIJYOGAI   PIC S9(11)  *>歩引除外額合計
                                            SIGN LEADING SEPARATE.
               07      ()-GKGSHOUNINNO      PIC  9(07). *>承認番号
               07      ()-GKGBUNKATSUKAISU  PIC  9(03). *>分割回数
               07      ()-GKGBONUSKAISU     PIC  9(02). *>ボーナス回数
               07      ()-GKGBONUSKASAN     PIC S9(11)  *>ボーナス加算額
                                            SIGN LEADING SEPARATE.
               07      ()-GKGMAESHOUHIZEI   PIC S9(09)  *>歩引前消費税  
                                            SIGN LEADING SEPARATE.
               07      ()-GKGATOSHOUHIZEI   PIC S9(09)  *>歩引後消費税
                                            SIGN LEADING SEPARATE.
               07      ()-GKGATAMAKIN       PIC S9(11)  *>頭金
                                            SIGN LEADING SEPARATE.
               07      ()-GKGTESURYOURITSU  PIC  99.99. *>手数料率 
               07      ()-GKGTESURYOUGAKU   PIC S9(09)  *>手数料額
                                            SIGN LEADING SEPARATE.
               07      ()-GKGCHUSYUTSUSUMI  PIC  X(01). *>請求抽出済サイン
               07      ()-GKGPO1KEIJYOUKBN  PIC  X(01). *>ポ１計上区分
               07      ()-GKGRIYOUSHACD     PIC  X(01). *>利用者コード
               07      ()-GKGGENTIKAKAKU    PIC  9(10).9(03). *>現地価格
               07      ()-GKGKANSANRATE     PIC  9(06).9(07). *>換算レート
               07      ()-GKGKANSANBI       PIC  9(08). *>換算日
               07      ()-GKGKOKUNAIKAIGAI  PIC  9(01). *>国内海外識別
             05        ()-GKGKEISANSUMISIGN PIC  X(01). *>入金手数料計算済サイン
             05        ()-GKGHURIKAEKAIINNO PIC  9(16). *>振替会員番号
             05        ()-GKGHASSEIROUTO    PIC  9(01). *>発生ルート
             05        ()-KAMEITENTESURYO   PIC S9(09)  *>加盟店手数料
                                            SIGN LEADING SEPARATE.
             05        ()-DANKEITESURYOU    PIC S9(09)  *>団契手数料
                                            SIGN LEADING SEPARATE.
             05        ()-DENPYOUUMUFLG     PIC  X(01). *>伝票無フラグ
             05        ()-IDUKEIJYOUKBN     PIC  X(01). *>移動計上区分
             05        ()-CASH.                      
               07      ()-CASHINGBUNKAI     PIC  9(05). *>キャッシング分解処理通番
             05        ()-HURIKAEKBN        PIC  X(01). *>振替区分
             05        ()-SHAINNOUMUKBN     PIC  X(01). *>社員ＮＯ有無区分
      * MOD 2011/09/01 1006060 IMZ YOSHIDA START
      *       05        ()-DENNYURYOKUTEN    PIC  9(02). *>伝票入力店
             05        ()-DENNYURYOKUTEN    PIC  9(03).  *>伝票入力店
      * MOD 2011/09/01 1006060 IMZ YOSHIDA END
             05        ()-DAIHIKIDENPYOKBN  PIC  X(01). *>代引伝票区分
             05        ()-POINTSHKIBETSU    PIC  9(01). *>歩引ポイント識別区分
             05        ()-GKP.                          *>合計ポイント
               07      ()-GKPTSUJYOUGOUKEI  PIC S9(11)  *>通常合計ポイント
                                            SIGN LEADING SEPARATE.
               07      ()-GKPBONUSGOUKEI    PIC S9(11)  *>ボーナス合計ポイント
                                            SIGN LEADING SEPARATE.
             05        ()-YOUTAICD          PIC  X(02). *>様態コード
             05        ()-KEIJYOUURICHOUKBN PIC  X(01). *>係計上売帳区分
             05        ()-ZEIRITUKBN        PIC  X(01). *>税率区分
             05        ()-HOSTSHORIYMD      PIC  X(08). *>ホスト処理日
             05        ()-HOSTSHORITIME     PIC  X(06). *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>サーバ更新日
             05        ()-ISOTUUKA          PIC  X(03). *>ISO通貨単位
             05        ()-ITIBUHENPINKBN    PIC  X(01). *>一部返品区分
             05        ()-JIDOUFURIKAEKBN   PIC  X(01). *>自動振替区分
             05        ()-JYOGAIUTIKIN      PIC S9(13)  *>除外内金
                                            SIGN LEADING SEPARATE.
