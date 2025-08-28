      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS010(QTA010)
      ****************************************************************
      *                会員マスタ                                    *
      *                             DATA-WRITTEN  99.01.12           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   * 
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                              *>会員マスタ
             05        ()-PRM.                              *>エントリーキー
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>企業コード
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>内部会員番号
             05        ()-RECKBN               PIC  9(01).  *>レコード区分
             05        ()-ZANDAKAKANRIKBN      PIC  9(01).  *>残高管理区分
             05        ()-KAIJOKBN             PIC  9(01).  *>解除区分
             05        ()-10TO16KBN            PIC  9(01).  *>10桁16桁区分
             05        ()-GKN.                              *>外部会員番号
               07      ()-GKNSHIKIBETSUNO      PIC  9(12).  *>会員識別番号
               07      ()-GKNEDABAN            PIC  9(01).  *>本人枝番
             05        ()-TEN.                              *>店
               07      ()-TENKAISHA            PIC  9(02).  *>会社店
               07      ()-TENSAIKENKANRI       PIC  9(02).  *>債権管理店
               07      ()-TENEIGYOU            PIC  9(02).  *>営業店
               07      ()-TENDM                PIC  9(02).  *>ＤＭ店
               07      ()-TENJIGYOHONBU        PIC  9(02).  *>事業本部コード
               07      ()-TENKAKUTOKU          PIC  9(02).  *>獲得店
             05        ()-CARDKBN              PIC  9(06).  *>カード区分
             05        ()-TRS.                              *>取扱商品情報
               07      ()-TRSS.                             *>ショッピング
                 09    ()-TRSSYOKU1            PIC  9(01).  *>翌１回払
                 09    ()-TRSSYOKU2            PIC  9(01).  *>翌２回払
                 09    ()-TRSSBONUS1           PIC  9(01).  *>ボーナス１回払
                 09    ()-TRSSBONUS2           PIC  9(01).  *>ボーナス２回払
 	         09    ()-TRSSKAPPU            PIC  9(01).  *>割賦
                 09    ()-TRSSREVOLVING        PIC  9(01).  *>リボルビング
                 09    ()-TRSSHANBAI           PIC  9(01).  *>職員現売
                 09    ()-TRSSKAKEURI          PIC  9(01).  *>職員掛売
               07      ()-TRSC.                             *>キャシング
                 09    ()-TRSCREVOLVING        PIC  9(01).  *>リボルビング
                 09    ()-TRSCYOKU1            PIC  9(01).  *>翌１回払
             05        ()-CARDLOANUSEKBN       PIC  9(01).  *>ｶｰﾄﾞﾛｰﾝ使用区分
             05        ()-HENSAIHOUHOU         PIC  9(01).  *>返済方法
             05        ()-SIHARAIYOTEIBI       PIC  9(02).  *>支払予定日
             05        ()-REV.                              *>リボ定額
               07      ()-REVS.                             *>ショッピング
                 09    ()-REVSMAITSUKI         PIC  9(01).  *>毎月分
                 09    ()-REVSBONUS            PIC  9(02).  *>ボーナス分
               07      ()-REVC.                             *>キャシング
                 09    ()-REVCMAITSUKI         PIC  9(01).  *>毎月分
                 09    ()-REVCBONUS            PIC  9(02).  *>ボーナス分
             05        ()-BBK.                              *>歩引
               07      ()-BBKSHUBETSU          PIC  9(01).  *>種別
               07      ()-BBKRITSU             PIC  9(02).  *>率
             05        ()-ANS.                              *>暗証番号情報
               07      ()-ASNGEN               PIC  9(04).  *>暗証番号
               07      ()-ANSKYUU              PIC  9(04).  *>旧暗証番号
               07      ()-ANSHENKOUYMD         PIC  9(08).  *>変更日
             05        ()-NYK.                              *>入会情報
               07      ()-NYKUKETSUKENO        PIC  9(08).  *>受付番号
               07      ()-NYKUKETSUKEYMD       PIC  9(08).  *>受付日
               07      ()-NYKKESSAIYMD         PIC  9(08).  *>決裁日
             05        ()-YUKOKIGEN            PIC  9(06).  *>有効期限
             05        ()-KTK.                              *>獲得情報
               07      ()-KTKROUTE             PIC  9(09).  *>獲得ルート
               07      ()-KTKSHOUKAISHACD      PIC  9(08).  *>紹介者コード
             05        ()-YSN.                              *>与信情報
               07      ()-YSNRANK              PIC  X(01).  *>与信ランク
               07      ()-YSNSOUGENDO          PIC  9(05).  *>総限度額
               07      ()-YSNNOBEGENDO         PIC  9(05).  *>延払限度額
               07      ()-YSNKYUBONUSGENDO     PIC  9(05).  *>旧ﾎﾞｰﾅｽ限度額
               07      ()-YSNCASHGENDO         PIC  9(05).  *>ｷｬｯｼﾝｸﾞ限度額
               07      ()-YSNIKKATSUGENDO      PIC  9(05).  *>一時一括限度額
               07      ()-YSNKAPPUGENDO        PIC  9(05).  *>一時割賦限度額
               07      ()-YSNBONUSGENDO        PIC  9(05).  *>一時ﾎﾞｰﾅｽ限度額
               07      ()-YSNYUKOKAISHI        PIC  9(08).  *>有効期限開始
               07      ()-YSNYUKOOWARI         PIC  9(08).  *>有効期限終了
             05        ()-CIF.                              *>番号情報
               07      ()-CIFDOUITSUNINNO      PIC  9(07).  *>同一人番号
               07      ()-CIFNO                PIC  9(08).  *>ＣＩＦ番号
               07      ()-CIFSHOUKAINO         PIC  9(18).  *>ＣＩＣ照会番号
             05        ()-HON.                              *>本人情報
               07      ()-HONSHIMEI.                        *>氏名
                 09    ()-HONSHIMEIKANA        PIC  X(30).  *>氏名カナ
                 09    ()-HONSHIMEIROMA        PIC  X(30).  *>氏名ローマ字
                 09    ()-HONSHIMEIKAN         PIC  N(15).  *>氏名漢字
               07      ()-HONSEINENGAPPI       PIC  9(08).  *>生年月日
               07      ()-HONSEX               PIC  9(01).  *>性別
             05        ()-JTK.                              *>自宅情報 
               07      ()-JTKTEL.                           *>電話番号
                 09    ()-JTKTELSHIGAI         PIC  X(07).  *>市外局番
                 09    ()-JTKTELKYOKU          PIC  X(04).  *>電話局番
                 09    ()-JTKTELNO             PIC  X(04).  *>電話番号
               07      ()-JTKJUSHOCD           PIC  9(11).  *>住所コード
               07      ()-JTKYUUBINNO          PIC  X(07).  *>郵便番号
               07      ()-JTKKANA.                          *>カナ住所
                 09    ()-JTKKENKANA           PIC  X(08).  *>県名
                 09    ()-JTKJUSHOKANA         PIC  X(42).  *>住所名
                 09    ()-JTKBANCHIKANA        PIC  X(15).  *>番地
                 09    ()-JTKKATAKANA          PIC  X(32).  *>方書
               07      ()-JTKKAN.                           *>漢字住所
                 09    ()-JTKJUSHOKAN          PIC  N(25).  *>住所名
                 09    ()-JTKBANCHIKAN         PIC  N(15).  *>番地
                 09    ()-JTKKATAKAN           PIC  N(32).  *>方書
             05        ()-KOZ.                              *>自振口座情報
               07      ()-KOZHENKOUYMD         PIC  9(08).  *>登録変更日
               07      ()-KOZGS.                            *>銀行情報
                 09    ()-KOZGINKOUCD          PIC  9(04).  *>銀行コード
                 09    ()-KOZGINKOUMEI         PIC  N(10).  *>銀行名
                 09    ()-KOZSHITENCD          PIC  9(05).  *>支店コード
                 09    ()-KOZSHITENMEI         PIC  N(10).  *>支店名
                 09    ()-KOZSHUMOKU           PIC  9(01).  *>預金種目
                 09    ()-KOZNO                PIC  9(08).  *>口座番号      
                 09    ()-KOZMEIGI             PIC  X(30).  *>口座名義
             05        ()-CLUBCD               PIC  9(02).  *>クラブコード
             05        ()-STS.                              *>ステータス情報
               07      ()-STSKOZAG.                         *>口座ステータス
                 09    ()-STSKOZATOROKUYMD     PIC  9(08).  *>登録日
                 09    ()-STSKOZA              PIC  9(04).  *>ステータス
               07      ()-STSCARDG.                         *>カードステータス
                 09    ()-STSCARDTOROKUYMD     PIC  9(08).  *>登録日
                 09    ()-STSCARD              PIC  9(04).  *>ステータス
             05        ()-EDJ.                              *>枝番情報
               07      ()-EDJ1.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD1       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD1          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO1       PIC  9(04).  *>カード状況１
               07      ()-EDJ2.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD2       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD2          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO2       PIC  9(04).  *>カード状況１
               07      ()-EDJ3.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD3       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD3          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO3       PIC  9(04).  *>カード状況１
               07      ()-EDJ4.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD4       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD4          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO4       PIC  9(04).  *>カード状況１
               07      ()-EDJ5.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD5       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD5          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO5       PIC  9(04).  *>カード状況１
               07      ()-EDJ6.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD6       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD6          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO6       PIC  9(04).  *>カード状況１
               07      ()-EDJ7.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD7       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD7          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO7       PIC  9(04).  *>カード状況１
               07      ()-EDJ8.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD8       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD8          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO8       PIC  9(04).  *>カード状況１
               07      ()-EDJ9.                             *>枝番状況１
                 09    ()-EDJRIYOUSHACD9       PIC  9(01).  *>利用者コード１
                 09    ()-EDJJIKOYMD9          PIC  9(08).  *>事故発生日１
                 09    ()-EDJCARDJYOKYO9       PIC  9(04).  *>カード状況１
             05        ()-SOH.                              *>送付先情報
               07      ()-SOHCARD              PIC  9(01).  *>カード
               07      ()-SOHSEIKYU            PIC  9(01).  *>請求書
             05        ()-CDH.                              *>カード発券情報
               07      ()-CDHHAKKOUKBN         PIC  9(01).  *>発行区分
               07      ()-CDHYUSOKBN           PIC  9(01).  *>郵送区分
               07      ()-CDHYMD               PIC  9(08).  *>カード発券日
               07      ()-CDHYUCHOSAIHATU      PIC  X(01).  *>郵貯再発行回数
             05        ()-KIK.                              *>口座移管情報
               07      ()-KIKYMD               PIC  9(08).  *>移管日
               07      ()-KIKKYUUNO            PIC  9(12).  *>旧会員番号
               07      ()-KIK10KETANO          PIC  9(10).  *>10桁会員番号
             05        ()-TKS.                              *>提携先情報
               07      ()-TKSHENREIYMD         PIC  9(08).  *>返戻日
               07      ()-TKSCARDNO            PIC  9(16).  *>提携先カード番号
               07      ()-TKSKEKKACD           PIC  9(01).  *>結果コード
               07      ()-TKSRIYUCD            PIC  X(03).  *>理由コード
             05        ()-EDB.                              *>枝番情報
               07      ()-EDBSAISHURIYOU       PIC  9(01).  *>最終利用者コード
               07      ()-EDBYUKOMUKO1         PIC  X(01).  *>有効無効区分１
               07      ()-EDBYUKOMUKO2         PIC  X(01).  *>有効無効区分２
               07      ()-EDBYUKOMUKO3         PIC  X(01).  *>有効無効区分３
               07      ()-EDBYUKOMUKO4         PIC  X(01).  *>有効無効区分４
               07      ()-EDBYUKOMUKO5         PIC  X(01).  *>有効無効区分５
               07      ()-EDBYUKOMUKO6         PIC  X(01).  *>有効無効区分６
               07      ()-EDBYUKOMUKO7         PIC  X(01).  *>有効無効区分７
               07      ()-EDBYUKOMUKO8         PIC  X(01).  *>有効無効区分８
               07      ()-EDBYUKOMUKO9         PIC  X(01).  *>有効無効区分９
             05        ()-ATU.                              *>扱部課係情報
               07      ()-ATUKAKARI            PIC  X(06).  *>扱部課係
               07      ()-ATUKOUSHINMAE        PIC  X(06).  *>更新前扱部課係
               07      ()-ATUHENKOUYMD         PIC  9(08).  *>変更日
             05        ()-PNT.                              *>交換番号情報
               07      ()-PNTSHINNO            PIC  9(04).  *>新交換番号
               07      ()-PNTKYUUNO            PIC  9(04).  *>旧交換番号
               07      ()-PNTHENKOUYMD         PIC  9(08).  *>交換番号変更日
               07      ()-PNTKBN               PIC  9(01).  *>区分
               07      ()-PNTCARDFACE          PIC  X(01).  *>カードフェース
               07      ()-PNTTEIKEIKBN         PIC  X(01).  *>提携区分
             05        ()-IKANMAECARDKBN       PIC  9(06).  *>移管前カード区分
             05        ()-KMS.                              *>勤務先情報
               07      ()-KMSKBN               PIC  9(01).  *>区分
               07      ()-KMSMEI.                           *>勤務先名
                 09    ()-KMSMEIKANA           PIC  X(30).  *>カナ
                 09    ()-KMSMEIKAN            PIC  N(30).  *>漢字
               07      ()-KMSBUKA              PIC  N(15).  *>所属部課
               07      ()-KMSTEL.                           *>電話番号
                 09    ()-KMSTELSHIGAI         PIC  X(07).  *>市外局番
                 09    ()-KMSTELKYOKU          PIC  X(04).  *>電話局番
                 09    ()-KMSTELNO             PIC  X(04).  *>電話番号
               07      ()-KMSJUSHOCD           PIC  9(11).  *>住所コード
               07      ()-KMSYUUBINNO          PIC  X(07).  *>郵便番号
               07      ()-KMSKANA.                          *>カナ住所
                 09    ()-KMSKENKANA           PIC  X(08).  *>県名
                 09    ()-KMSJUSHOKANA         PIC  X(42).  *>住所名
                 09    ()-KMSBANCHIKANA        PIC  X(15).  *>番地
                 09    ()-KMSKATAKANA          PIC  X(32).  *>方書
               07      ()-KMSKAN.                           *>漢字住所
                 09    ()-KMSJUSHOKAN          PIC  N(25).  *>住所名
                 09    ()-KMSBANCHIKAN         PIC  N(15).  *>番地
                 09    ()-KMSKATAKAN           PIC  N(32).  *>方書
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>ホスト処理日
             05        ()-HOSTSHORITIME        PIC  X(06).  *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>サーバ更新日
