      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS080  
      ****************************************************************
      *                ポイント管理マスタ                            *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   * 
      ****************************************************************    
           03          ()-SEG.                          *>ポイントレコード
             05        ()-PRM.                          *>エントリーキー
               07      ()-PRMROKE.                      *>ロケーションキー
                 09    ()-PRMKIGYOUCD       PIC  9(04). *>企業コード
                 09    ()-PRMSUBRANGEKEY    PIC  9(04). *>サブレンジ
               07      ()-PRMNAIBUKAIINNO   PIC  9(08). *>内部会員番号
               07      ()-PRMRECKBN         PIC  9(01). *>内部会員番号
             05        ()-ZOK.                          *>属性情報
               07      ()-ZOKTUMITATEYUKO   PIC  9(08). *>当期積立有効期限
               07      ()-ZOKHIKIKAEYUKO    PIC  9(08). *>当期引換有効期限
               07      ()-ZOKTORIKESITUUBAN PIC  9(07). *>引換／取消通番
             05        ()-TOK.                          *>当期ポイント情報
               07      ()-TOKT.                         *>当月ポイント情報
                 09    ()-TOKTKURIKOSIPOINT PIC S9(11)  *>前月繰越ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTHASSEIPOINT   PIC S9(11)  *>発生ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTHIKIKAEPOINT  PIC S9(11)  *>引換ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTTORIKESIPOINT PIC S9(11)  *>引換取消ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKTZANPOINT      PIC S9(11)  *>残ポイント
                                            SIGN LEADING SEPARATE.
               07      ()-TOKS.                         *>締後情報
                 09    ()-TOKSHASSEIPOINT   PIC S9(11)  *>発生ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKSHIKIKAEPOINT  PIC S9(11)  *>引換ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKSTORIKESIPOINT PIC S9(11)  *>引換取消ポイント
                                            SIGN LEADING SEPARATE.
               07      ()-TOKR.                         *>累計情報
                 09    ()-TOKRHASSEIPOINT   PIC S9(11)  *>当期発生ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-TOKRHIKIKAEPOINT  PIC S9(11)  *>当期引換ポイント
                                            SIGN LEADING SEPARATE.
             05        ()-KIG.                          *>期限切れポイント情報
               07      ()-KIGM.                         *>前年情報
                 09    ()-KIGMKIGENGIREFLG  PIC  X(01). *>期限切れフラグ
                 09    ()-KIGMTUMITATEYUKO  PIC  9(08). *>積立有効期限
                 09    ()-KIGMHIKIKAEYUKO   PIC  9(08). *>引換有効期限
                 09    ()-KIGMKIGENGIREPOINT PIC S9(11)  *>期限切れポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-KIGMHIKIKAEPOINT  PIC S9(11)  *>引換ポイント
                                            SIGN LEADING SEPARATE.
                 09    ()-KIGMTORIKESIPOINT PIC S9(11)  *>引換取消ポイント
                                            SIGN LEADING SEPARATE.
             05        ()-HIK.                          *>引換暗証番号情報
               07      ()-HIKIKAEANSYOUNO   PIC  9(04). *>引換暗証番号
             05        ()-SEIKYUNENGETU     PIC  9(06). *>請求年月
             05        ()-HOSTSHORIYMD      PIC  X(08). *>ホスト処理日
             05        ()-HOSTSHORITIME     PIC  X(06). *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>サーバ更新日
