      *8...........2.........3.........4.........5........6........7.........8  
      *    QCS011(QTS010(QTA010))
      ****************************************************************
      *                会員マスタ                                    *
      *                             DATA-WRITTEN  04.08.04           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   * 
      ****************************************************************    
           03          ()-SEG.                              *>会員マスタ
             05        ()-PRM.                              *>エントリーキー
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>企業コード
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>内部会員番号
               07      ()-PRMRIYOUSHACD        PIC  X(01).  *>本人／家族識別
             05        ()-TKSCARDNO            PIC  X(16).  *>ＣＳＴカード番号
             05        ()-KIKKYUUNO            PIC  9(12).  *>即発ＣＳＴカード番号
             05        ()-NYKUKETSUKENO        PIC  9(08).  *>受付番号
             05        ()-CARDKBN              PIC  9(06).  *>カード区分
             05        ()-HON.                              *>顧客属性情報
               07      ()-HONSHIMEIKAN         PIC  N(10).  *>漢字氏名
               07      ()-HONSHIMEIKANA        PIC  X(30).  *>カナ氏名
               07      ()-HONSEX               PIC  X(01).  *>性別
               07      ()-HONSEINENGAPPI       PIC  9(08).  *>生年月日
               07      ()-YUKOKIGEN            PIC  9(06).  *>有効期限
               07      ()-NYKKESSAIYMD         PIC  9(08).  *>登録年月日（入会日）
             05        ()-JTK.                              *>自宅情報
               07      ()-JTKYUUBINNO          PIC  X(07).  *>郵便番号
               07      ()-JTKJUSHOCD           PIC  9(11).  *>住所コード
               07      ()-JTKKAN.                           *>漢字住所
                 09    ()-JTKJUSHOKAN          PIC  N(25).  *>都道府県名～字丁目漢字
                 09    ()-JTKBANCHIKAN         PIC  N(15).  *>番地漢字
                 09    ()-JTKKATAKAN           PIC  N(30).  *>方書漢字
               07      ()-JTKKANA.                          *>漢字住所
                 09    ()-JTKKENKANA           PIC  X(08).  *>都道府県名カナ
                 09    ()-JTKJUSHOKANA         PIC  X(42).  *>市区郡～字丁目カナ
                 09    ()-JTKBANCHIKANA        PIC  X(15).  *>番地カナ
                 09    ()-JTKKATAKANA          PIC  X(32).  *>方書カナ
               07      ()-JTKTEL.                           *>電話番号
                 09    ()-JTKTELSHIGAI         PIC  X(07).  *>市外局番
                 09    ()-JTKTELKYOKU          PIC  X(04).  *>局番
                 09    ()-JTKTELNO             PIC  X(04).  *>番号
               07      ()-HONKEITAITEL         PIC  X(11).  *>携帯電話番号
             05        ()-SEKYU.                            *>請求書送付先住所
               07      ()-SEKYUYUUBINNO        PIC  X(08).  *>郵便番号
               07      ()-SEKYUKENKAN          PIC  N(04).  *>都道府県名
               07      ()-SEKYUJUSHOKAN        PIC  N(50).  *>市区郡～字丁目
               07      ()-SEKYUBANCHIKAN       PIC  N(30).  *>番地・方書
             05        ()-PNT.                              *>交換番号情報
               07      ()-PNTSHINNO            PIC  9(04).  *>交換番号
               07      ()-PNTKYUUNO            PIC  9(04).  *>旧交換番号
               07      ()-PNTHENKOUYMD         PIC  9(08).  *>交換番号登録／変更日
             05        ()-TENKANRI             PIC  X(02).  *>管理店
             05        ()-TENKAKUTOKU          PIC  X(02).  *>獲得店
             05        ()-TENDM                PIC  X(02).  *>ＤＭ店
             05        ()-DMKBN                PIC  X(01).  *>ＤＭ発送拒否区分
             05        ()-DMKBNHENKOUYMD       PIC  9(08).  *>DM発送拒否区分設定日
             05        ()-ATU.                              *>獲得者情報
               07      ()-ATUKAKARI            PIC  X(09).  *>獲得者・部課
               07      ()-KTKSHOUKAISHACD      PIC  X(08).  *>担当者コード
             05        ()-STS.                              *>ＣＳステータステーブル
               07      ()-STSKBN               PIC  9(01).  *>ＣＳステータス
               07      ()-STSKBNTOROKUYMD      PIC  9(08).  *>ＣＳステータス設定日
             05        ()-CIFNO                PIC  9(08).  *>ＣＩＦ番号
             05        ()-SHIKIBETSUNO         PIC  9(09).  *>・島屋識別番号
             05        ()-KOKYOKU              PIC  X(02).  *>顧客区分
             05        ()-TOUYMD               PIC  9(08).  *>作成日
             05        ()-KOUYMD               PIC  9(08).  *>更新日
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>ホスト処理日
             05        ()-HOSTSHORITIME        PIC  X(06).  *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>サーバ更新日
