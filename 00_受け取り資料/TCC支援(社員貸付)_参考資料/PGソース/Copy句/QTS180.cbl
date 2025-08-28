      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS180(QTA180)
      ****************************************************************
      *                     店テーブル                               *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   *
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03            ()-SEG.                         *>店テーブル 
             05          ()-PRM.                         *>店テーブルキー   
               07        ()-PRMKIGYOUCD      PIC  X(04). *>企業コード
               07        ()-PRMEIGYOUTENCD   PIC  X(02). *>営業店コード
               07        ()-PRMYU.                       *>有効期間
                 09      ()-PRMYUKOKAISI     PIC  9(08). *>開始日
                 09      ()-PRMYUKOOWARI     PIC  9(08). *>終了日
             05          ()-ETN.                         *>店テーブル情報領域
               07        ()-ETNMEI.                      *>営業店名称
                 09      ()-ETNMEIKANA       PIC  X(20). *>カナ
                 09      ()-ETNMEIKAN        PIC  N(20). *>漢字
               07        ()-CDKBN            OCCURS 10.  *>カード区分情報
                 09      ()-KTN.                         *>会社店情報
                   11    ()-KTNCODE          PIC  X(02). *>会社店コード
                   11    ()-KTNMEI.                      *>会社店名称
                     13  ()-KTNMEIKANA       PIC  X(20). *>カナ
                     13  ()-KTNMEIKAN        PIC  N(20). *>漢字
                 09      ()-CTN.                         *>管理店情報
                   11    ()-CTNCODE          PIC  X(02). *>管理店コード
                   11    ()-CTNMEI.                      *>管理店名称
                     13  ()-CTNMEIKANA       PIC  X(20). *>カナ
                     13  ()-CTNMEIKAN        PIC  N(20). *>漢字
                 09      ()-JHB.                         *>事業本部
                   11    ()-JHBCODE          PIC  X(02). *>事業本部コード
                   11    ()-JHBMEI.                      *>事業本部名称
                     13  ()-JHBMEIKANA       PIC  X(20). *>カナ
                     13  ()-JHBMEIKAN        PIC  N(20). *>漢字
               07        ()-SKZNO.                       *>集約口座情報
                 09      ()-SKZNO1           PIC  X(16). *>集約口座番号１
                 09      ()-SKZNO2           PIC  X(16). *>集約口座番号２
                 09      ()-SKZNO3           PIC  X(16). *>集約口座番号３
                 09      ()-SKZNO4           PIC  X(16). *>集約口座番号４
                 09      ()-SKZNO5           PIC  X(16). *>集約口座番号５
                 09      ()-SKZNO6           PIC  X(16). *>集約口座番号６
                 09      ()-SKZNO7           PIC  X(16). *>集約口座番号７
                 09      ()-SKZNO8           PIC  X(16). *>集約口座番号８
                 09      ()-SKZNO9           PIC  X(16). *>集約口座番号９
                 09      ()-SKZNO10          PIC  X(16). *>集約口座番号１０
             05          ()-TOUZAIKBN        PIC  X(01). *>東西区分
             05          ()-KIG.                         *>企業コード情報領域
                 07      ()-KIGYOUCD         PIC  X(04)  *>企業コード
                                             OCCURS  6.  *>(採番用:ｶｰﾄﾞ区分毎) 
             05          ()-SHOKUSAIBANKBN   PIC  X(02). *>職員採番用区分
             05          ()-JSH.                         *>住所
               07        ()-JSHCODE          PIC  X(11). *>住所コード
               07        ()-JSHYUBINNO       PIC  X(05). *>郵便番号
               07        ()-JSHYUBINNOYOBI   PIC  X(03). *>郵便番号予備
               07        ()-JSHKANA                    . *>カナ
                 09      ()-JSHMEIKANA                 . *>住所
                   11    ()-JSHKENMEIKANA    PIC  X(08). *>県名
                   11    ()-JSHCHOUMEKANA    PIC  X(42). *>市区郡～字丁目
                   11    ()-JSHBANCHIKANA    PIC  X(15). *>番地
                   11    ()-JSHKATAGAKIKANA  PIC  X(32). *>方書
               07        ()-JSHKAN.                      *>漢字
                 09      ()-JSHMEIKAN.                   *>住所
                   11    ()-JSHJUSHOMEIKAN   PIC  N(25). *>県名～字丁目
                   11    ()-JSHBANCHIKAN     PIC  N(15). *>番地
                   11    ()-JSHKATAGAKIKAN   PIC  N(32). *>方書
             05          ()-TEL.                         *>電話番号
               07        ()-TELSHIGAI        PIC  X(07). *>市外局番
               07        ()-TELKYOKUBAN      PIC  X(04). *>局番
               07        ()-TELNO            PIC  X(04). *>番号
               07        ()-TELCHOKUTSU      PIC  X(01). *>直通区分
               07        ()-MISESHUBETSU     PIC  X(01). *>店種別
               07        ()-ZANDAKASOUFU     PIC  N(10). *>残高確認書送付先
             05          ()-SHJ.                         *>許可番号
               07        ()-SHJZAIMUKYOKU    PIC  N(02). *>財務局名
               07        ()-SHJKOUSINKAISU   PIC  9(01). *>更新回数
               07        ()-SHJKYOKANO       PIC  X(05). *>番号
             05          ()-SHJM.                        *>請求書表示情報
               07        ()-SHJMISEMEI       PIC  N(12). *>店名
               07        ()-SHJMISERYAKU     PIC  N(03). *>店略称
             05          ()-TES                        . *>ﾛｰﾝ手数料関連情報
               07        ()-TESUURYOUKBN     PIC  X(01). *>手数料基本料金支払区分
             05          ()-HOSTSHORIYMD     PIC  X(08). *>ホスト処理日
             05          ()-HOSTSHORITIME    PIC  X(06). *>ホスト処理時刻
             05          ()-SVRKOUSHINYMD    PIC  9(08). *>サーバ更新日
