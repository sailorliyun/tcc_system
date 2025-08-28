      *8...........2.........3.........4.........5........6........7.........8
      *    QTA210
      ****************************************************************
      *                プレミアム会員マスタ                          *
      *                             DATA-WRITTEN  2005.03.17         *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   *
      ****************************************************************
           03        ()-SEG.                          *>会員マスタ
             05      ()-PRM.                          *>エントリーキー
               07    ()-PRMKIGYOUCD       PIC  X(04). *>主キー・企業コード
               07    ()-PRMSUBRANGEKEY    PIC  X(04). *>主キー・サブレンジキー
               07    ()-PRMNAIBUKAIINNO   PIC  X(08). *>主キー・内部会員番号
               07    ()-PRMSYUKEINENGETU  PIC  X(06). *>集計年月
             05      ()-KAIIN-INF.                    *>会員情報
               07    ()-KANRITEN          PIC  X(02). *>管理店
               07    ()-CARDKBN           PIC  X(06). *>カード区分
               07    ()-SYUKEICYU.                    *>集計中項目
                 09  ()-SYUKEICYUNENDO    PIC  X(04). *>集計中年度
                 09  ()-RUISEKIGAKU       PIC S9(13). *>累積額
                 09  ()-RAITENNISSU       PIC  9(03). *>来店日数
                 09  ()-RIYOUKENSUU       PIC  9(05). *>利用件数
             05      ()-HANTEIRIREKI1.                *>判定履歴１
               07    ()-PUREMIAMUKBN1     PIC  X(01). *>プレミアム区分１
               07    ()-RUISEKIGAKU1      PIC S9(13). *>累積額１
               07    ()-RAITENNISSU1      PIC  9(03). *>来店日数１
               07    ()-RIYOUKENSUU1      PIC  9(05). *>利用件数１
               07    ()-HANTEISTATUS1     PIC  X(04). *>判定時ステータス１
               07    ()-HANTEIBI1         PIC  X(08). *>判定日１
             05      ()-HANTEIRIREKI2.                *>判定履歴２
               07    ()-PUREMIAMUKBN2     PIC  X(01). *>プレミアム区分２
               07    ()-RUISEKIGAKU2      PIC S9(13). *>累積額２
               07    ()-RAITENNISSU2      PIC  9(03). *>来店日数２
               07    ()-RIYOUKENSUU2      PIC  9(05). *>利用件数２
               07    ()-HANTEISTATUS2     PIC  X(04). *>判定時ステータス２
               07    ()-HANTEIBI2         PIC  X(08). *>判定日２
             05      ()-HANTEIRIREKI3.                *>判定履歴３
               07    ()-PUREMIAMUKBN3     PIC  X(01). *>プレミアム区分３
               07    ()-RUISEKIGAKU3      PIC S9(13). *>累積額３
               07    ()-RAITENNISSU3      PIC  9(03). *>来店日数３
               07    ()-RIYOUKENSUU3      PIC  9(05). *>利用件数３
               07    ()-HANTEISTATUS3     PIC  X(04). *>判定時ステータス３
               07    ()-HANTEIBI3         PIC  X(08). *>判定日３
             05      ()-HANTEIRIREKI4.                *>判定履歴４
               07    ()-PUREMIAMUKBN4     PIC  X(01). *>プレミアム区分４
               07    ()-RUISEKIGAKU4      PIC S9(13). *>累積額４
               07    ()-RAITENNISSU4      PIC  9(03). *>来店日数４
               07    ()-RIYOUKENSUU4      PIC  9(05). *>利用件数４
               07    ()-HANTEISTATUS4     PIC  X(04). *>判定時ステータス４
               07    ()-HANTEIBI4         PIC  X(08). *>判定日４
             05      ()-HANTEIRIREKI5.                *>判定履歴５
               07    ()-PUREMIAMUKBN5     PIC  X(01). *>プレミアム区分５
               07    ()-RUISEKIGAKU5      PIC S9(13). *>累積額５
               07    ()-RAITENNISSU5      PIC  9(03). *>来店日数５
               07    ()-RIYOUKENSUU5      PIC  9(05). *>利用件数５
               07    ()-HANTEISTATUS5     PIC  X(04). *>判定時ステータス５
               07    ()-HANTEIBI5         PIC  X(08). *>判定日５
             05      ()-KANRIINF.                     *>管理情報
               07    ()-HOSTSAKUSEIDATE   PIC  X(08). *>ＨＯＳＴ作成日
               07    ()-HOSTKOUSINDATE    PIC  X(08). *>ＨＯＳＴ更新日
               07    ()-SERVERKOUSINDATE  PIC  X(08). *>サーバ更新日
             05      FILLER               PIC  X(11).
