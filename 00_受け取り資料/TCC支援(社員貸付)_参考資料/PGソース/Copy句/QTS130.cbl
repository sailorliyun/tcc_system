      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS130(QTA130)
      ****************************************************************
      *                カード管理テーブル                            *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   *
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      *   000002   レイアウト変更の為 (ICMSKBN)  FIP      02/08/20   *
      ****************************************************************    
           03          ()-SEG.                          *>カード管理
             05        ()-G0010.                        *>エントリーキー
               07      ()-PRMCARDKBN       PIC  9(06).  *>カード区分
             05        ()-CDKMEI           PIC  N(10).  *>カード名称
             05        ()-G0030.                        *>取扱商品
               07      ()-T0030.                        *>ショッピング
                 09    ()-TRSSYOKU1        PIC  9(01).  *>翌１回払
                 09    ()-TRSSYOKU2        PIC  9(01).  *>翌２回払
                 09    ()-TRSSBONUS1       PIC  9(01).  *>ボーナス１回払
                 09    ()-TRSSBONUS2       PIC  9(01).  *>ボーナス２回払
                 09    ()-TRSSKAPPU        PIC  9(01).  *>割賦
                 09    ()-TRSSREVOLVING    PIC  9(01).  *>リボルビング
                 09    ()-TRSSGENURI       PIC  9(01).  *>職員現売
                 09    ()-TRSSKAKEURI      PIC  9(01).  *>職員掛売
               07      ()-T0110.                        *>キャシング
                 09    ()-TRSCREVOLVING    PIC  9(01).  *>リボルビング
                 09    ()-TRSCYOKU1        PIC  9(01).  *>翌１回払
             05        ()-HESHOUHOU        PIC  9(01).  *>返済方法
             05        ()-HESYOTEIYMD      PIC  9(02).  *>支払予定日
             05        ()-G0201.                        *>リボ定額
               07      ()-T0201.                        *>ショッピング
                 09    ()-REVSMAITSUKI     PIC  9(01).  *>毎月分
                 09    ()-REVSBONUS        PIC  9(02).  *>ボーナス分
               07      ()-T0203.                        *>キャシング
                 09    ()-REVCMAITSUKI     PIC  9(01).  *>毎月分  
                 09    ()-REVCBONUS        PIC  9(02).  *>ボーナス分  
             05        ()-CDHHAKKOUKBN     PIC  9(01).  *>カード発行区分
             05        ()-CDHYUSOKBN       PIC  9(01).  *>郵送区分               
             05        ()-CDHSHIJIKBN      PIC  9(01).  *>発行指示区分
             05        ()-G0240.                        *>カード情報
               07      ()-CDHUMU           PIC  9(01).  *>カード発行有無
               07      ()-CDHIRO           PIC  9(02).  *>色
               07      ()-CDHGARA          PIC  9(02).  *>柄
             05        ()-G0270.                        *>会費
               07      ()-NENKAIHI         PIC  9(09).  *>年会費
             05        ()-BBKSHUBETSU      PIC  9(01).  *>歩引種別
             05        ()-G0280.                        *>歩引率
               07      ()-BBK1KAIRITSU     PIC  9(02).  *>１回払い歩引率
               07      ()-BBK1BONUSRITSU   PIC  9(02).  *>ﾎﾞｰﾅｽ１回払い歩引率 
             05        ()-BBKSHOKUINRITSU  PIC  9(02).  *>職員月賦歩引率
             05        ()-YUKOKIKAN        PIC  9(02).  *>有効期限
             05        ()-G0320.                        *>処理区分    
               07      ()-UKETOUROKUKBN    PIC  9(01).  *>受付登録区分
               07      ()-KAIINNOKBN       PIC  9(01).  *>会員番号区分
               07      ()-KAZOKUHAKKENKAHI PIC  9(01).  *>家族カード発券可否
               07      ()-YOSHINSHINKYUU   PIC  9(01).  *>与信限度額 新旧区分
               07      ()-10OR16KETAKBN    PIC  9(01).  *>10桁16桁区分
               07      ()-AUTOSCORING      PIC  9(01).  *>オートスコアリング
               07      ()-YSNCASHGENDO     PIC  9(01).  *>ｷｬｯｼﾝｸﾞ限度額
               07      ()-YSNZANKANRI      PIC  9(01).  *>残高管理
             05        ()-G0371.                        *>与信限度額（職員）
               07      ()-YSNSHOKUINGENDO  PIC  9(05).  *>職員総合与信限度額
               07      ()-YSNKAKEURIGENDO  PIC  9(05).  *>内掛売与信限度額
             05        ()-G0380.                        *>スコアリングﾃｰﾌﾞﾙ
               07      ()-P0380      OCCURS 10.         *>配点表 
                 09    ()-SCRBAIRITSU      PIC  9(01).  *>倍率 
                 09    ()-Q0390      OCCURS  6.         *>配点表２
                   11  ()-SCRHAITEN        PIC  9(02).  *>配点
               07      ()-T0400      OCCURS 20.         *>初期予信ランク情報 
                 09    ()-SYS              PIC  9(03).  *>初期予信ランク
             05        ()-G0410.                        *>五八定義データ
               07      ()-GHTKBN           PIC  9(02).  *>五八区分
               07      ()-GHTBUNRUI        PIC  9(02).  *>五八分類
               07      ()-GHTTEIKEIKBN     PIC  9(01).  *>提携区分
               07      ()-GHTKAKAKARI      PIC  9(06).  *>扱課係
               07      ()-GHTGINKOCD       PIC  9(04).  *>銀行コード
               07      ()-GHTSITENCD       PIC  9(03).  *>支店コード
             05        ()-KIGYOUCDBUNRUI   PIC  9(01).  *>企業コード分類
             05        ()-MISECDINDEX      PIC  9(01).  *>店コードＩＤＸ
             05        ()-SAIBANCARDKBN    PIC  9(06).  *>採番用カード区分
             05        ()-G0500.                        *>与信限度額名称区分
               07      ()-YSNKYUUCARDMEI   PIC  X(01).  *>旧カード
               07      ()-YSNSHINCARDMEI   PIC  X(01).  *>新カード
             05        ()-SEIKYUSYO        PIC  X(01).  *>請求書種別
             05        ()-G0530            OCCURS  2.   *>キャッシング
               07      ()-CAHYAKUJO        PIC  99.99.  *>約定利率
             05        ()-G0540            OCCURS  2.   *>キャッシング
               07      ()-CAHENTAI         PIC  99.99.  *>延滞利率
             05        ()-G0550.                        *>ユニット管理情報
               07      ()-DOFUBUTSUGROUP   PIC  X(01).  *>同封物グループ
               07      ()-HUTOSHUBETSU     PIC  X(01).  *>封筒種別
               07      ()-RYUCHIKBN        PIC  X(01).  *>留置区分
               07      ()-BUBIKIKBN        PIC  9(01).  *>歩引／ポイント区分
               07      ()-NYUKAIKANRIKBN   PIC  9(01).  *>サーバ入会管理区分
             05        ()-HOSTSHORIYMD     PIC  X(08).  *>ホスト処理日
             05        ()-HOSTSHORITIME    PIC  X(06).  *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD    PIC  9(08).  *>サーバ更新日
             05        ()-ICMSKBN          PIC  X(01).  *>ＩＣ／ＭＳ区分
