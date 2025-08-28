      *8...........2.........3.........4.........5........6........7.........8
      *    QXCS03
      ****************************************************************
      *                利用可能額審査会員マスタファイル              *
      *                             DATA-WRITTEN  05.09.30           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   *
      ****************************************************************
            03        ()-SEG.                              *>集計マスタ
              05      ()-PRM.                              *>エントリーキー
                07    ()-PRMSHINSAYM         PIC  9(06).   *>審査年月
                07    ()-KUGIRI01            PIC  X(01).   *>項目区切用エリア
                07    ()-PRMKIGYOUCD         PIC  9(04).   *>企業コード
                07    ()-KUGIRI02            PIC  X(01).   *>項目区切用エリア
                07    ()-PRMSUBRANGEKEY      PIC  9(04).   *>サブレンジ
                07    ()-KUGIRI03            PIC  X(01).   *>項目区切用エリア
                07    ()-PRMNAIBUKAIINNO     PIC  9(08).   *>内部会員番号
                07    ()-KUGIRI04            PIC  X(01).   *>項目区切用エリア
              05      ()-PARTITIONNO         PIC  9(02).   *>パーテーション番号
              05      ()-KUGIRI05            PIC  X(01).   *>項目区切用エリア
              05      ()-TENSAIKENKANRI      PIC  9(02).   *>管理店
              05      ()-KUGIRI06            PIC  X(01).   *>項目区切用エリア
              05      ()-CARDKBN             PIC  X(06).   *>カード区分
              05      ()-KUGIRI07            PIC  X(01).   *>項目区切用エリア
              05      ()-KAIINNO             PIC  9(16).   *>会員番号
              05      ()-KUGIRI08            PIC  X(01).   *>項目区切用エリア
              05      ()-SHIMEIKANC.                       *>漢字氏名キャラ
                07    ()-SHIMEIKAN           PIC  X(30).   *>漢字氏名
              05      ()-KUGIRI09            PIC  X(01).   *>項目区切用エリア
              05      ()-STSDAIHYO           PIC  9(04).   *>代表ステータス
              05      ()-KUGIRI10            PIC  X(01).   *>項目区切用エリア
              05      ()-YSNRANK             PIC  X(01).   *>審査前与信ランク
              05      ()-KUGIRI11            PIC  X(01).   *>項目区切用エリア
              05      ()-YSNSOUGENDO         PIC  9(05).   *>審査前総限度額
              05      ()-KUGIRI12            PIC  X(01).   *>項目区切用エリア
              05      ()-YSNNOBEGENDO        PIC  9(05).   *>審査前延払限度額
              05      ()-KUGIRI13            PIC  X(01).   *>項目区切用エリア
              05      ()-YSNCASHGENDO        PIC  9(05).   *>審査前キャッ限度額
              05      ()-KUGIRI14            PIC  X(01).   *>項目区切用エリア
              05      ()-NYKYM               PIC  9(06).   *>入会年月
              05      ()-KUGIRI15            PIC  X(01).   *>項目区切用エリア
              05      ()-RIBSP               PIC  9(01).   *>リボ定額ショッ
              05      ()-KUGIRI16            PIC  X(01).   *>項目区切用エリア
              05      ()-RIBCS               PIC  9(01).   *>リボ定額キャッ
              05      ()-KUGIRI17            PIC  X(01).   *>項目区切用エリア
              05      ()-STSPOS              PIC  9(02).   *>ＰＯＳステータス
              05      ()-KUGIRI18            PIC  X(01).   *>項目区切用エリア
              05      ()-YUKOKIGEN           PIC  9(06).   *>有効期限
              05      ()-KUGIRI19            PIC  X(01).   *>項目区切用エリア
              05      ()-STSSONOTA           PIC  9(04).   *>その他ステータス
              05      ()-KUGIRI20            PIC  X(01).   *>項目区切用エリア
              05      ()-NENKAIHIDOUI        PIC  X(01).   *>年会費同意フラグ
              05      ()-KUGIRI21            PIC  X(01).   *>項目区切用エリア
              05      ()-LASTRIYOUYM         PIC  9(06).   *>最新利用年月
              05      ()-KUGIRI22            PIC  X(01).   *>項目区切用エリア
              05      ()-1KAIRIYOUCNT        PIC  9(02).   *>１回払い利用月数
              05      ()-KUGIRI23            PIC  X(01).   *>項目区切用エリア
              05      ()-1KAIRIYOUGK1        PIC  9(07).   *>１回払利用額平均１
              05      ()-KUGIRI24            PIC  X(01).   *>項目区切用エリア
              05      ()-1KAIRIYOUGK2        PIC  9(07).   *>１回払利用額平均２
              05      ()-KUGIRI25            PIC  X(01).   *>項目区切用エリア
              05      ()-ZENRIYOUGK          PIC  9(07).   *>全利用額
              05      ()-KUGIRI26            PIC  X(01).   *>項目区切用エリア
              05      ()-NOBERIYOUGK         PIC  9(07).   *>延払い利用額
              05      ()-KUGIRI27            PIC  X(01).   *>項目区切用エリア
              05      ()-CSRIYOUGK           PIC  9(07).   *>キャッシング利用額
              05      ()-KUGIRI28            PIC  X(01).   *>項目区切用エリア
              05      ()-JIFURICNT           PIC  9(02).   *>自振引回直１２ヶ月
              05      ()-KUGIRI29            PIC  X(01).   *>項目区切用エリア
              05      ()-FUNOUCNT1           PIC  9(02).   *>引落不能回直１２回
              05      ()-KUGIRI30            PIC  X(01).   *>項目区切用エリア
              05      ()-FUNOUCNT2           PIC  9(02).   *>引落不能回直６ヶ月
              05      ()-KUGIRI31            PIC  X(01).   *>項目区切用エリア
              05      ()-ZENNYUKINGK         PIC  9(07).   *>全入金額
              05      ()-KUGIRI32            PIC  X(01).   *>項目区切用エリア
              05      ()-JIFURIGAINYUKINGK   PIC  9(07).   *>引落以外入金額
              05      ()-KUGIRI33            PIC  X(01).   *>項目区切用エリア
              05      ()-KOUGAKNYUKINCNT     PIC  9(02).   *>高額入金回引落以外
              05      ()-KUGIRI34            PIC  X(01).   *>項目区切用エリア
              05      ()-ZENZANDAKA          PIC  9(07).   *>全残高
              05      ()-KUGIRI35            PIC  X(01).   *>項目区切用エリア
              05      ()-NOBEZANDAKA         PIC  9(07).   *>延払い残高
              05      ()-KUGIRI36            PIC  X(01).   *>項目区切用エリア
              05      ()-SPRIBOZANDAKA       PIC  9(07).   *>Ｓリボ払い残高
              05      ()-KUGIRI37            PIC  X(01).   *>項目区切用エリア
              05      ()-CSRIBOZANDAKA       PIC  9(07).   *>Ｃリボ払い残高
              05      ()-KUGIRI38            PIC  X(01).   *>項目区切用エリア
              05      ()-HOSTSHORIYMD        PIC  9(08).   *>ホスト処理日
              05      ()-KUGIRI39            PIC  X(01).   *>項目区切用エリア
              05      ()-SVTOUROKUDATE       PIC  9(14).   *>作成日時
              05      ()-KUGIRI40            PIC  X(01).   *>項目区切用エリア
              05      FILLER                 PIC  X(15).   *>
              05      ()-CR                  PIC  X(01).   *>改行コード
