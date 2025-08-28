      *8...........2.........3.........4.........5........6........7..
      *    QTS090(QTA090)
      ****************************************************************
      *                入金計上テーブル                              *
      *                             DATA-WRITTEN  99.01.12           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   * 
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03    ()-SEG.
             05  ()-PRMKIGYOUCD        PIC  9(04).  *>企業コード
             05  ()-PRMSUBRANJEKEY     PIC  9(04).  *>サブレンジキー
             05  ()-PRMNAIBUKAIINNO    PIC  9(08).  *>内部会員番号
             05  ()-PRMMEISAINO        PIC  9(07).  *>入金明細番号
             05  ()-PRMKEIJYOUTUUBAN   PIC  9(09).  *>入金計上通番
             05  ()-ROGSEQUENCE        PIC  9(03).  *>ログシーケンス
             05  ()-TOUZAIKBN          PIC  X(01).  *>東西区分
             05  ()-JIGYOUHONBUCD      PIC  X(02).  *>事業本部コード
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
             05  ()-NYUKINHASSEIRIYU   PIC  X(01).  *>入金発生理由
             05  ()-NYUKINKEIRO        PIC  X(01).  *>入金経路
             05  ()-DENPYOUSHUBETSU    PIC  X(04).  *>伝票種別
             05  ()-BATCHNO            PIC  9(04).  *>バッチ№
             05  ()-GNOBATCHNO         PIC  9(04).  *>バッチ№
             05  ()-GNOSEQUENCE        PIC  9(03).  *>伝票シーケンス
             05  ()-DENPYOUNO          PIC  9(11).  *>伝票番号
             05  ()-AZUKARIKINBETU     PIC  X(01).  *>預り金種別
             05  ()-KNG                PIC S9(11)   *>金額
                                       SIGN LEADING SEPARATE.
             05  ()-SOUSAIKAMOKU       PIC  9(03).  *>相殺科目
             05  ()-TKZJIGYOUHONBUCD   PIC  9(02).  *>事業本部コード
             05  ()-TKZKANRITEN        PIC  9(02).  *>債権管理店
             05  ()-TKZETOKUTEN        PIC  9(02).  *>獲得店
             05  ()-TKZCARDKBN         PIC  9(06).  *>カード区分
             05  ()-TKZGAIBUKAIINNO    PIC  9(16).  *>外部会員番号
             05  ()-NKEERRRIYU         PIC  N(10).  *>エラー理由
             05  ()-NKEERRKAIINNO      PIC  9(16).  *>入力時会員番号
             05  ()-SOHUSAKIRYUCHI     PIC  9(02).  *>伝票送付先留置区分
             05  ()-KEIROHONYAKUCHI    PIC  N(05).  *>入金経路翻訳値
             05  ()-HOSTSHORIYMD       PIC  X(08).  *>ホスト処理日
             05  ()-HOSTSHORITIME      PIC  X(06).  *>ホスト処理時刻
             05  ()-SVRKOUSHINYMD      PIC  9(08).  *>サーバ更新日
