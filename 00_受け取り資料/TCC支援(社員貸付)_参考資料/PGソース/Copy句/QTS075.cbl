      *8.1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
      *    QTS075
      ****************************************************************
      *            加盟店属性テーブル         DATA-WRITTEN  99.07.15 *
      *--------------------------------------------------------------*
      *            修  正  履  歴                                    *
      *    管理NO            修正理由              担当者  修正日付  *
      *    XX-XXX  ＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮ  ＮＮＮ 9999.99.99 *
      *    XX-XXX  郵便番号７桁化対応              上　原 2001.08.03 *
      ****************************************************************
           03        ()-SEG.                           *>加盟店属性テーブル
             05      ()-ENTRYKEY.                      *>エントリーキー
               07    ()-PRMNAIBUNO         PIC  9(07). *>内部加盟店番号
             05      ()-KAKUCHOIDX.                    *>拡張インデックスキー
               07    ()-KANAMEISHO         PIC  X(10). *>検索カナ名称
             05      ()-GAIBUNO.                       *>外部加盟店番号
               07    ()-KAISHACD           PIC  X(05). *>会社コード
               07    ()-HANBAITENCD        PIC  X(04). *>販売店コード
               07    ()-CHECKDIGIT         PIC  X(01). *>チェックディジット
             05      ()-SIHARAISAKINO      PIC  9(07). *>内部支払先番号
             05      ()-KAMEIYMD           PIC  9(08). *>加盟年月日
             05      ()-TORIKESIBI         PIC  9(08). *>取消日
             05      ()-KAMEITENKBN        PIC  X(01). *>加盟店区分
             05      ()-KAMEITENKAKU       PIC  X(01). *>加盟店格
             05      ()-KAKUTOKUTEN        PIC  X(02). *>獲得店
             05      ()-GYOSHUCDG.                     *>業種コード
               07    ()-GYOSHUCD           PIC  X(02). *>コード
               07    ()-GYOSHURENBAN       PIC  9(03). *>連番
             05      ()-KAISHAMEISHOCD.                *>会社名称コード
               07    ()-MEISHOATAMA        PIC  X(02). *>頭
               07    ()-MEISHOSHITA        PIC  X(02). *>下
             05      ()-KAISHAMEI.                     *>会社名
               07    ()-SHAMEIKANA         PIC  X(30). *>カナ
               07    ()-SHAMEIKAN          PIC  N(20). *>漢字
             05      ()-DAIHYOSHAMEI.                  *>代表者名
               07    ()-DAIHYOSHAKANA      PIC  X(30). *>カナ
               07    ()-DAIHYOSHAKAN       PIC  N(20). *>漢字
             05      ()-SHOZAICHI.                     *>所在地
               07    ()-JUSHOCD            PIC  X(10). *>住所コード
               07    ()-YUBIN.                         *>郵便番号
                 09  ()-YUBIN1             PIC  X(03). *>郵便番号１
                 09  ()-YUBIN2             PIC  X(02). *>郵便番号２
               07    ()-JUSHO.                         *>住所
                 09  ()-JUSHOKAN1          PIC  N(20). *>住所１
                 09  ()-JUSHOKAN2          PIC  N(20). *>住所２
               07    ()-BANCHIKAN          PIC  N(10). *>番地
               07    ()-KATAKAN            PIC  N(20). *>方書
               07    ()-DAIHYOTELNO        PIC  X(15). *>代表電話番号
             05      ()-RENRAKUSAKI.                   *>連絡先
               07    ()-RENTANTOBUKA       PIC  N(10). *>担当部課
               07    ()-RENTANTOSHA        PIC  N(10). *>担当者
               07    ()-RENTELNO           PIC  X(15). *>電話番号
               07    ()-RENNAISEN          PIC  X(04). *>内線
             05      ()-MUKOHYOBUSUU       PIC  9(03). *>無効通知票部数
             05      ()-KYUUJITU           PIC  9(01). *>休日
             05      ()-MEMOJOHO           PIC  N(30). *>メモ情報
             05      ()-KAISHAJOHO.                    *>会社情報
               07    ()-KIGYOUCD           PIC  X(09). *>企業コード
             05      ()-HANBAITENJOHO.                 *>販売店情報
               07    ()-HANSEIKYUKANA      PIC  X(15). *>請求書カナ
               07    ()-HANHINBAN          PIC  X(06). *>品番
               07    ()-HANATENAKAN        PIC  N(20). *>宛名
               07    ()-HANCATTERMUMU      PIC  X(01). *>ＣＡＴ端末有無
               07    ()-HANEIGYOTIME       PIC  9(08). *>営業時間
               07    ()-HANRANK            PIC  X(01). *>自動オーソリランク
               07    ()-HANKAKUTOKUTEN     PIC  X(02). *>獲得店コード
               07    ()-HANKAKUTOKUSHA     PIC  X(07). *>獲得者コード
               07    ()-HANHIBAIHINUMU     PIC  X(01). *>非販売商品有無
               07    ()-HANMITOROKUFLG     PIC  X(01). *>販売店情報未登録フラグ
             05      ()-HOSTSHORIYMD       PIC  X(08). *>ホスト処理日
             05      ()-HOSTSHORITIME      PIC  X(06). *>ホスト処理時刻
             05      ()-SVRKOUSHINYMD      PIC  9(08). *>サーバ更新日
      ***20010803START 郵便番号７桁化対応***
             05      ()-NEWYUBIN.                      *>新郵便番号
               07    ()-NEWYUBIN1          PIC  X(03). *>新郵便番号１
               07    ()-NEWYUBIN2          PIC  X(04). *>新郵便番号２
      ***20010803 END  郵便番号７桁化対応***
