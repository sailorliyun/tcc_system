      *8...........2.........3.........4.........5........6........7.........8  
      *    QCS021(QTS040(QTA040))
      ****************************************************************
      *                外内変換ファイル                              *
      *                             DATA-WRITTEN  04.08.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   *
      ****************************************************************    
           03        ()-SEG.                         *>外内変換
             05      ()-PRM.                         *>エントリーキー
               07    ()-PRMCSTCARDNO     PIC  X(16). *>ＣＳＴカード番号
             05      ()-NKN.                         *>内部会員番号
               07    ()-NKNROKE.                     *>ロケーションキー
                 09  ()-NKNKIGYOUCD      PIC  9(04). *>企業コード 
                 09  ()-NKNSUBRANGEKEY   PIC  9(04). *>サブレンジキー
               07    ()-NKNNO            PIC  9(08). *>内部会員番号
             05      ()-SOKUAHTU.                    *>即発ＣＳＴカード番号 
               07    ()-NYKUKETSUKENO    PIC  9(08). *>受付番号
               07    ()-KIKKYUUNO        PIC  X(16). *>即発ＣＳＴカード番号 
             05      ()-IKN.                         *>移管情報 
               07    ()-IKNKBN           PIC  9(01). *>移管済フラグ
               07    ()-IKNKOUZAYMD      PIC  9(08). *>切替年月日移管日
               07    ()-IKNSAKIKAIINNO   PIC  X(16). *>切替先ＣＳＴカード番号
             05      ()-CARDKBN          PIC  9(06). *>カード区分
             05      ()-HONSHIMEIKANA    PIC  X(30). *>氏名（カナ）
             05      ()-RIYOUSHACD       PIC  X(01). *>家族区分
             05      ()-YUKOKIGEN        PIC  9(06). *>有効期限
             05      ()-TENKANRI         PIC  X(02). *>管理店
             05      ()-TENKAKUTOKU      PIC  X(02). *>獲得店
             05      ()-STS.                         *>ステータス
               07    ()-STSKBN           PIC  9(01). *>ＣＳステータス
               07    ()-STSKBNTOROKUYMD  PIC  9(08). *>ＣＳステータス設定日
             05      ()-PNT.                         *>交換番号情報
               07    ()-PNTSHINNO        PIC  9(04). *>交換番号
               07    ()-PNTKYUUNO        PIC  9(04). *>旧交換番号
               07    ()-PNTHENKOUYMD     PIC  9(08). *>交換番号登録／変更日
             05      ()-TOUYMD           PIC  9(08). *>作成日
             05      ()-KOUYMD           PIC  9(08). *>更新日
             05      ()-HOSTSHORIYMD     PIC  X(08). *>ホスト作成日
             05      ()-HOSTSHORITIME    PIC  X(06). *>ホスト作成時間
             05      ()-SVRKOUSHINYMD    PIC  9(08). *>サーバ登録日
