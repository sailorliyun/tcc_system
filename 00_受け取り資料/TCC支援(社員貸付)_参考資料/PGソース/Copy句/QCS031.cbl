      *8...........2.........3.........4.........5........6........7.........8
      *    QCS031(QTS050)
      ****************************************************************
      *                利用明細ファイル                              *
      *                             DATA-WRITTEN  04.07.15           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   *
      ****************************************************************
      *>利用明細
           03          ()-SEG.
      *>キー
             05        ()-PRM.
      *>ロケーションキー
               07      ()-PRMROKE.
      *>企業コード
                 09    ()-PRMKIGYOUCD       PIC  9(04).
      *>サブレンジキー
                 09    ()-PRMSUBRANGEKEY    PIC  9(04).
      *>内部会員番号
               07      ()-PRMNAIBUKAIINNO   PIC  9(08).
      *>取引通番
               07      ()-PRMTORIHIKINO     PIC  9(07).
      *>伝票ＮＯ
             05        ()-DENPYOUNO         PIC  X(12).
      *>レコード区分
             05        ()-RECKBN            PIC  X(01).
      *>解除区分
             05        ()-KAIJYOKBN         PIC  X(01).
      *>赤黒非表示区分
             05        ()-AKAKUROKBN        PIC  X(01).
      *>請求保留区分
             05        ()-SEIKYUHORYUKBN    PIC  X(01).
      *>伝票種別
             05        ()-DENPYOUSHUBETSU   PIC  9(04).
      *>バッチＮＯ
             05        ()-BATCHNO           PIC  9(04).
      *>Ｇ－ＮＯ
             05        ()-GNO.
      *>ＧバッチＮＯ
               07      ()-GNOBATCHNO        PIC  9(04).
      *>Ｇ伝票シーケンス
               07      ()-GNOSEQUENCE       PIC  9(03).
      *>カード番号
             05        ()-CARDNO            PIC  9(16).
      *>利用日
             05        ()-RIYOUBI           PIC  9(08).
      *>受付日
             05        ()-UKETSUKEBI        PIC  9(08).
      *>計上日
             05        ()-KEIJYOUBI         PIC  9(08).
      *>発生店
             05        ()-HASSEITEN         PIC  9(02).
      *>加盟店ＮＯ
             05        ()-KAMEITENNO        PIC  X(10).
      *>ＰＯＳ端末情報
             05        ()-POS.
      *>ＰＯＳレジＮＯ
               07      ()-POSREGNO          PIC  9(04).
      *>ＰＯＳ取引ＮＯ
               07      ()-POSTORIHIKINO     PIC  9(05).
      *>ＣＤ端末情報
             05        ()-TANMATSU          PIC  X(09).
      *>課係
             05        ()-KAK.
      *>扱課
               07      ()-KAKA.
      *>扱
                 09    ()-KAKAKAATSUKAI     PIC  9(02).
      *>課
                 09    ()-KAKAKAKA          PIC  9(02).
      *>係
               07      ()-KAKKKAKARIKAKARI  PIC  9(02).
      *>催コード
             05        ()-SAICD             PIC  9(03).
      *>提携売上通番
             05        ()-TKURIAGETUUBAN    PIC  9(13).
      *>行数
             05        ()-GYOUSU            PIC  9(02).
      *>行Ｎｏ
             05        ()-GYOUNO            PIC  9(02).
      *>合計行
             05        ()-GKG.
      *>支払方法 
               07      ()-GKGSHIHARAIHOHO   PIC  9(02).
      *>ローン種別
               07      ()-GKGLOANSHUBETSU   PIC  9(05).
      *>利用金額
               07      ()-GKGRIYOUKNG       PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>商品代金
               07      ()-GKGSHOUHINDAIKIN  PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>歩引率
               07      ()-GKGBUBIKIRITSU    PIC  9(02).
      *>歩引額
               07      ()-GKGBUBIKIGAKU     PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>歩引対象額合計
               07      ()-GKGBUBIKITAISHOU  PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>歩引除外額合計
               07      ()-GKGBUBIKIJYOGAI   PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>承認番号
               07      ()-GKGSHOUNINNO      PIC  9(07).
      *>分割回数
               07      ()-GKGBUNKATSUKAISU  PIC  9(03).
      *>ボーナス回数
               07      ()-GKGBONUSKAISU     PIC  9(02).
      *>ボーナス加算額
               07      ()-GKGBONUSKASAN     PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>歩引前消費税
               07      ()-GKGMAESHOUHIZEI   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>歩引後消費税
               07      ()-GKGATOSHOUHIZEI   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>頭金
               07      ()-GKGATAMAKIN       PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>手数料率
               07      ()-GKGTESURYOURITSU  PIC  99.99.
      *>手数料額
               07      ()-GKGTESURYOUGAKU   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>請求抽出済サイン
               07      ()-GKGCHUSYUTSUSUMI  PIC  X(01).
      *>ポ１計上区分
               07      ()-GKGPO1KEIJYOUKBN  PIC  X(01).
      *>利用者コード
               07      ()-GKGRIYOUSHACD     PIC  X(01).
      *>現地価格
               07      ()-GKGGENTIKAKAKU    PIC  9(10).9(03).
      *>換算レート
               07      ()-GKGKANSANRATE     PIC  9(06).9(07).
      *>換算日
               07      ()-GKGKANSANBI       PIC  9(08).
      *>国内海外識別
               07      ()-GKGKOKUNAIKAIGAI  PIC  9(01).
      *>入金手数料計算済サイン
             05        ()-GKGKEISANSUMISIGN PIC  X(01).
      *>振替会員番号
             05        ()-GKGHURIKAEKAIINNO PIC  9(16).
      *>発生ルート
             05        ()-GKGHASSEIROUTO    PIC  9(01).
      *>加盟店手数料
             05        ()-KAMEITENTESURYO   PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>団契手数料
             05        ()-DANKEITESURYOU    PIC S9(09)
                                            SIGN LEADING SEPARATE.
      *>伝票無フラグ
             05        ()-DENPYOUUMUFLG     PIC  X(01).
      *>移動計上区分
             05        ()-IDUKEIJYOUKBN     PIC  X(01).
             05        ()-CASH.
      *>キャッシング分解処理通番
               07      ()-CASHINGBUNKAI     PIC  9(05).
      *>振替区分
             05        ()-HURIKAEKBN        PIC  X(01).
      *>社員ＮＯ有無区分
             05        ()-SHAINNOUMUKBN     PIC  X(01).
      *>伝票入力店
             05        ()-DENNYURYOKUTEN    PIC  9(02).
      *>代引伝票区分
             05        ()-DAIHIKIDENPYOKBN  PIC  X(01).
      *>歩引ポイント識別区分
             05        ()-POINTSHKIBETSU    PIC  9(01).
      *>合計ポイント
             05        ()-GKP.
      *>通常合計ポイント
               07      ()-GKPTSUJYOUGOUKEI  PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>ボーナス合計ポイント
               07      ()-GKPBONUSGOUKEI    PIC S9(11)
                                            SIGN LEADING SEPARATE.
      *>様態コード
             05        ()-YOUTAICD          PIC  X(02).
      *>係計上売帳区分
             05        ()-KEIJYOUURICHOUKBN PIC  X(01).
      *>税率区分
             05        ()-ZEIRITUKBN        PIC  X(01).
      *>ホスト処理日
             05        ()-HOSTSHORIYMD      PIC  X(08).
      *>ホスト処理時刻
             05        ()-HOSTSHORITIME     PIC  X(06).
      *>サーバ更新日
             05        ()-SVRKOUSHINYMD     PIC  9(08).
      *>ISO通貨単位
             05        ()-ISOTUUKA          PIC  X(03).
      *>一部返品区分
             05        ()-ITIBUHENPINKBN    PIC  X(01).
      *>自動振替区分
             05        ()-JIDOUFURIKAEKBN   PIC  X(01).
      *>除外内金
             05        ()-JYOGAIUTIKIN      PIC S9(13)
                                            SIGN LEADING SEPARATE.
