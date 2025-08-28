      *8...........2.........3.........4.........5........6........7.........8
      *    QTS011
      ****************************************************************
      *                カード更新インターフェース                    *
      *                             DATA-WRITTEN  99.01.16           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   * 
      ****************************************************************    
           03          ()-SEG.                              *>カード更新
             05        ()-PRM.                              *>エントリーキー
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>企業コード
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>内部会員番号
             05        ()-RECKBN               PIC  9(01).  *>レコード区分
             05        ()-ZANDAKAKANRIKBN      PIC  9(01).  *>残高管理区分
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
               07      ()-TRSC.                            *>キャシング
                 09    ()-TRSCREVOLVING        PIC  9(01).  *>リボルビング
                 09    ()-TRSCYOKU1            PIC  9(01).  *>翌１回払
             05        ()-REV.                              *>リボ定額
               07      ()-REVS.                             *>ショッピング
                 09    ()-REVSMAITSUKI         PIC  9(01).  *>毎月分
                 09    ()-REVSBONUS            PIC  9(02).  *>ボーナス分
               07      ()-REVC.                             *>キャシング
                 09    ()-REVCMAITSUKI         PIC  9(01).  *>毎月分
                 09    ()-REVCBONUS            PIC  9(02).  *>ボーナス分
             05        ()-ANS.                              *>暗証番号情報
               07      ()-ANSGEN               PIC  9(04).  *>暗証番号
               07      ()-ANSKYUU              PIC  9(04).  *>旧暗証番号
               07      ()-ANSHENKOUYMD         PIC  9(08).  *>変更日
             05        ()-YUKOKIGEN            PIC  9(06).  *>有効期限
             05        ()-YSN.                              *>与信情報
               07      ()-YSNRANK              PIC  X(01).  *>与信ランク
               07      ()-YSNSOUGENDO          PIC  9(05).  *>総限度額
               07      ()-YSNNOBEGENDO         PIC  9(05).  *>延払限度額
               07      ()-YSNYOBIGENDO         PIC  9(05).  *>予備限度額
               07      ()-YSNCASHGENDO         PIC  9(05).  *>ｷｬｯｼﾝｸﾞ限度額
               07      ()-YSNIKKATSUGENDO      PIC  9(05).  *>一時一括限度額 
               07      ()-YSNKAPPUGENDO        PIC  9(05).  *>一時割賦限度額
               07      ()-YSNBONUSGENDO        PIC  9(05).  *>一時ﾎﾞｰﾅｽ限度額
               07      ()-YSNYUKOKAISHI        PIC  9(08).  *>有効期限開始
               07      ()-YSNYUKOOWARI         PIC  9(08).  *>有効期限終了
             05        ()-HON.                              *>本人情報
               07      ()-HONSHIMEI.                        *>氏名
                 09    ()-HONSHIMEIKANA        PIC  X(30).  *>氏名カナ
                 09    ()-HONSHIMEIROMA        PIC  X(30).  *>氏名ローマ字
                 09    ()-HONSHIMEIKAN         PIC  N(15).  *>氏名漢字
               07      ()-HONSEINENGAPPI       PIC  9(08).  *>生年月日
               07      ()-HONSEX               PIC  9(01).  *>性別
             05        ()-STS.                              *>ステータス情報
               07      ()-STSK.                             *>口座ステータス
                 09    ()-STSKOZATOROKUYMD     PIC  9(08).  *>登録日
                 09    ()-STSKOZA              PIC  9(04).  *>ステータス
               07      ()-STSC.                             *>カードステータス
                 09    ()-STSCARDTOROKUYMD     PIC  9(08).  *>登録日
                 09    ()-STSCARD              PIC  9(04).  *>ステータス
             05        ()-SAISHURIYOU          PIC  9(01).  *>最終利用者コード
             05        ()-KIK.                              *>口座移管情報
               07      ()-KIKYMD               PIC  9(08).  *>移管日
               07      ()-KIKKYUUNO            PIC  9(12).  *>旧会員番号
               07      ()-KIK10KETANO          PIC  9(10).  *>10桁会員番号
             05        ()-PNT.                              *>ポイント管理情報
               07      ()-PNTKBN               PIC  9(01).  *>歩引／ポイント区分
               07      ()-PNTCARDFACE          PIC  X(01).  *>カードフェース
               07      ()-PNTTEIKEIKBN         PIC  X(01).  *>提携区分
               07      ()-PNTMAECARDKBN        PIC  9(06).  *>移管前カード区分
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>ホスト処理日
             05        ()-HOSTSHORITIME        PIC  X(06).  *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>サーバ更新日
