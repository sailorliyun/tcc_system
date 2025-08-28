      *8...........2.........3.........4.........5........6........7.........8
      *    QTA110
      ****************************************************************
      *                プレミアム会員集計情報                        *
      *                             DATA-WRITTEN  2005.03.17         *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   *
      ****************************************************************
           03        ()-SEG.                              *>集計マスタ
             05      ()-PRM.                              *>エントリーキー
               07    ()-PRMKIGYOUCD         PIC  X(04).   *>主キー・企業コード
               07    ()-PRMSUBRANGEKEY      PIC  X(04).   *>主キー・サブレンジキー
               07    ()-PRMNAIBUKAIINNO     PIC  X(08).   *>主キー・内部会員番号
               07    ()-PRMSYUKEINENGETU    PIC  X(06).   *>集計年月
             05      ()-MONTH.                            *>毎月集計情報
               07    ()-JYOUTAIFLAG         PIC  X(01).   *>状態フラグ
               07    ()-SUM.                              *>累計額内訳
                 09  ()-SOUGAKU             PIC S9(13).   *>総額
                 09  ()-TAISYOUSYOUHIN      PIC S9(13).   *>対象商品
                 09  ()-TAISYOUGAISYOUHIN   PIC S9(13).   *>対象外商品
                 09  ()-SYOUHIZEI           PIC S9(13).   *>消費税
                 09  ()-ATAMAKIN            PIC S9(13).   *>頭金
                 09  ()-RIYOUKENSUU         PIC  9(05).   *>利用件数
                 09  ()-RAITENNISSU         PIC  9(03).   *>来店日数
               07    ()-SUMKEY.                           *>集計用項目
                 09  ()-HASSEITEN           PIC  X(02).   *>発生店
                 09  ()-KEIJYOUDATE         PIC  X(08).   *>計上日
                 09  ()-SHIHARAIHOUHOU      PIC  X(02).   *>支払方法
             05      ()-CNTL-INF.                         *>管理情報
               07    ()-HOSTSAKUSEIDATE     PIC  X(08).   *>作成日
               07    ()-SVRKOUSHINYMD       PIC  X(08).   *>更新日
             05      FILLER                 PIC  X(16).
