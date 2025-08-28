      *8...........2.........3.........4.........5........6........7.........8  
      *    QTA200
      ****************************************************************
      *                  ローン種別テーブル                          *
      *                             DATA-WRITTEN  99.02.05           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   * 
      ****************************************************************
           03          ()-SEG.                         *>ローン種別
             05        ()-PRM.                         *>キー
               07      ()-PRMLOANSHUBETSU  PIC  9(05). *>ローン種別
             05        ()-SHOUHINRANKCD    PIC  X(01). *>商品ランクコード
             05        ()-TRI              OCCURS 5.   *>取扱店情報
               07      ()-TRIMISERANKCD    PIC  X(01). *>取扱店ランクコード
               07      ()-TRIHANBAIRITSU   PIC  99.99. *>販売手数料率
               07      ()-TRIJYUCHURITSU   PIC  99.99. *>受注手数料率
             05        ()-SHO.                         *>商品種別情報
               07      ()-SHOSIHARAIHOHO   PIC  9(02). *>支払方法
               07      ()-SHOYAKUJORIRITSU PIC  99.99. *>約定利率
               07      ()-SHOENTAIRIRITSU  PIC  99.99. *>延滞利率
               07      ()-SHOLOANMEI       PIC  N(20). *>ローン名称
               07      ()-SHOKAISUKAGEN    PIC  9(03). *>支払回数下限
               07      ()-SHOKAISUJOGEN    PIC  9(03). *>支払回数上限
               07      ()-SHOYUSIGAKUTANI  PIC S9(05)  *>融資額単位
                                           SIGN LEADING SEPARATE.
               07      ()-SHOHENSAIGAKU    PIC S9(05)  *>返済額単位
                                           SIGN LEADING SEPARATE.
               07      ()-SHOYUSIGAKUJOGEN PIC S9(05)  *>融資額上限
                                           SIGN LEADING SEPARATE.
               07      ()-SHOBOHEIYOWARIAI PIC  9(03). *>ボーナス併用割合
               07      ()-SHOTORIHIKIKAISI PIC  9(08). *>取扱開始日
             05        ()-HOSTSHORIYMD     PIC  X(08). *>ホスト処理日
             05        ()-HOSTSHORITIME    PIC  X(06). *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD    PIC  9(08). *>サーバ更新日
