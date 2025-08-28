      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS110(QTA110)
      ****************************************************************
      *                    ブラックテーブル                          *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   * 
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                          *>ブラックテーブル
             05        ()-PRM.            
               07      ()-PRMBLACKNO        PIC  9(08). *>ブラックＮＯ
             05        ()-TEN.
               07      ()-TENEIGYOUCD       PIC  9(02). *>営業店コード
               07      ()-TENKAKUTOKU       PIC  9(02). *>獲得店
             05        ()-TOUROKU.
               07      ()-TOUROKUYMD        PIC  9(08). *>登録日
               07      ()-TOUROKUKBN        PIC  9(01). *>登録区分
             05        ()-BLACK.         
               07      ()-BLACKRIYU         PIC  9(02). *>ブラック理由
               07      ()-BLACKRIYUTUIKI    PIC  N(10). *>ブラック理由(追記)
             05        ()-UKETSUKENO        PIC  9(08). *>受付番号
             05        ()-KAIINNO           PIC  9(12). *>会員番号
             05        ()-HON.
               07      ()-HONSHIMEI.
                 09    ()-HONSHIMEIKANA     PIC  X(30). *>カナ氏名(法人名)
                 09    ()-HONSHIMEIKAN      PIC  N(15). *>漢字氏名(法人名)
                 09    ()-HONSEINENGAPPI    PIC  9(08). *>生年月日
               07      ()-HONSEX            PIC  9(01). *>性別
               07      ()-YUUBINNO          PIC  X(07). *>郵便番号
               07      ()-CHIBAN            PIC  X(03). *>地番
             05        ()-JTK.                          *>自宅／法人
               07      ()-JTKTEL.                       *>ＴＥＬ 
                 09    ()-JTKTELSHIGAI      PIC  X(07). *>市外局番
                 09    ()-JTKTELKYOKU       PIC  X(04). *>電話局番
                 09    ()-JTKTELNO          PIC  X(04). *>電話番号
               07      ()-JTKJUSHOCD        PIC  9(11). *>住所コード
               07      ()-JTKKANA.                      *>住所カナ
                 09    ()-JTKBANCHIKANA     PIC  X(15). *>番地カナ
                 09    ()-JTKKATAKANA       PIC  X(32). *>方書カナ
               07      ()-JTKKAN.                       *>住所漢字
                 09    ()-JTKBANCHIKAN      PIC  N(15). *>番地漢字
                 09    ()-JTKKATAKAN        PIC  N(32). *>方書漢字
             05        ()-KMS.                          *>勤務先
               07      ()-KMSKBN            PIC  9(01). *>区分
               07      ()-KMSTEL.                       *>ＴＥＬ
                 09    ()-KMSTELSHIGAI      PIC  X(07). *>市外局番
                 09    ()-KMSTELKYOKU       PIC  X(04). *>電話局番
                 09    ()-KMSTELNO          PIC  X(04). *>電話番号
               07      ()-KMSMEI.                       *>名称
                 09    ()-KMSMEIKANA        PIC  X(30). *>名称カナ
                 09    ()-KMSMEIKAN         PIC  N(15). *>名称漢字
               07      ()-KMSJUSHOCD        PIC  9(11). *>住所コード
               07      ()-KMSKANA.                      *>住所カナ 
                 09    ()-KMSBANCHIKANA     PIC  X(15). *>番地カナ
                 09    ()-KMSKATAKANA       PIC  X(32). *>方書カナ
               07      ()-KMSKAN.                       *>住所漢字
                 09    ()-KMSBANCHIKAN      PIC  N(15). *>番地漢字
                 09    ()-KMSKATAKAN        PIC  N(32). *>方書漢字
             05        ()-CIFNO             PIC  9(08). *>ＣＩＦＮＯ
             05        ()-CARDKBN           PIC  9(06). *>カード区分
             05        ()-CDSKNNAME         PIC  X(30). *>コンデンスかな氏名
             05        ()-CDSKNKINNAME      PIC  X(30). *>コンデンス勤務先名
             05        ()-CDSJITAKUTEL      PIC  X(14). *>コンデンス自宅ＴＥＬ
             05        ()-CDSKINTEL         PIC  X(14). *>コンデンス勤務先ＴＥＬ
             05        ()-HOSTSHORIYMD      PIC  X(08). *>ホスト処理日
             05        ()-HOSTSHORITIME     PIC  X(06). *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD     PIC  9(08). *>サーバ更新日
