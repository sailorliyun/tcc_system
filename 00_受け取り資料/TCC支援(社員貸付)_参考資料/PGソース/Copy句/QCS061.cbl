      *8...........2.........3.........4.........5........6........7.........8
      *    QCS061
      ****************************************************************
      *                CS利用請求記載ファイル                        *
      *                             DATA-WRITTEN  04.08.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   *
      *   000001   ポイントのサインを付与        高橋     06.02.15   *
      ****************************************************************
           03          ()-SEG.                              *>会員マスタ
             05        ()-PRM.                              *>エントリーキー
               07      ()-PRMKIGYOUCD          PIC  9(004). *>企業コード
               07      ()-PRMSUBRANGEKEY       PIC  9(004). *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO      PIC  9(008). *>内部会員番号
               07      ()-PRMSHIMEYMD          PIC  9(006). *>締年月日
             05        ()-CARDKBN              PIC  9(006). *>カード区分
             05        ()-TOUZAIKBN            PIC  X(001). *>東西区分
             05        ()-KANRITEN             PIC  X(002). *>管理店
             05        ()-KAKUTOKUTEN          PIC  X(002). *>獲得店
             05        ()-NONEMASTERFLAG       PIC  X(001). *>ノンマスタフラグ
             05        ()-FUSEIGOUFLAG         PIC  X(001). *>不整合識別フラグ
             05        ()-KISAISKB             PIC  X(001). *>請求記載データ識別フラグ
             05        ()-NYUKAIJIPOINT        PIC  9(011). *>入会時ポイント
             05        ()-BONUSPOINT           PIC  9(011). *>ボーナスポイント
             05        ()-POINTSBTFLAG         PIC  X(001). *>ポイント識別フラグ
             05        ()-SEIKYUTENNAI         PIC  9(011). *>請求額（店内）
             05        ()-SEIKYUCS             PIC  9(011). *>請求額（CS加盟店）
             05        ()-DATAREC.                          *>データレコード
               07      ()-RECORDKBN            PIC  X(001). *>レコード区分
               07      ()-KEY.                              *>キー項目
                 09    ()-TAKASHIMAYANO        PIC  X(009). *>高島屋管理番号
                 09    ()-CARDNO               PIC  X(016). *>カード番号
               07      ()-POINTINFO.                        *>ポイント情報
                 09    ()-TAKASHIMAYA.                      *>高島屋編集項目
                   11  ()-SHIMEYMD             PIC  9(008). *>締年月日
                   11  ()-TUMITATEKGN          PIC  9(006). *>積立期限
                   11  ()-KOUKANKGN            PIC  9(006). *>交換期限
                   11  ()-KOUKANMAIZEN         PIC  9(003). *>交換枚数（前期）
                   11  ()-ZENGETUZANP          PIC S9(011)  *>前月残ポイント
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-TOUGETUKOUP          PIC S9(011)  *>当月交換ポイント
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-TENNAIHASSEIP        PIC S9(011)  *>店内発生ポイント
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-TUIKAPKUBUN          PIC  X(002). *>追加ポイント区分
                   11  ()-TUIKAPOINT           PIC S9(011)  *>追加ポイント
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-BONUSRUIKEI          PIC S9(013)  *>ボーナス累計額
                                SIGN IS LEADING SEPARATE CHARACTER.
                 09    ()-CSHENSYU.                         *>クレディセゾン編集項目
                   11  ()-KOUKANNO             PIC  9(004). *>交換番号
                   11  ()-KOUKANMAISUU         PIC  9(003). *>交換枚数（合計）
                   11  ()-KAMEITENHP           PIC S9(011)  *>加盟店発生ポイント
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-GENZAIHOYUUP         PIC S9(011)  *>現在保有ポイント
                                SIGN IS LEADING SEPARATE CHARACTER.
                   11  ()-RIYOUKINGOUKEI       PIC S9(011)  *>利用金額合計
                                SIGN IS LEADING SEPARATE CHARACTER.
               07      ()-KANRIINFO.                        *>管理情報
                 09    ()-SEIDO                PIC  X(002). *>制度
                 09    ()-KOKYAKUKBN           PIC  X(002). *>顧客区分
             05        ()-HOSTSHORIYMD         PIC  X(008). *>ホスト処理日
             05        ()-HOSTSHORITIME        PIC  X(006). *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD        PIC  9(008). *>サーバ更新日
