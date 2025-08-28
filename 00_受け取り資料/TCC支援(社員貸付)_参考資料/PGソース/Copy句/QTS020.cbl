      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS020(QTA020)
      ****************************************************************
      *                会員家族ファイル                              *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   *
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                              *>会員家族 
             05        ()-PRM.                              *>エントリーキー
               07      ()-PRMKIGYOUCD          PIC  9(04).  *>企業コード
               07      ()-PRMSUBRANGEKEY       PIC  9(04).  *>サブレンジキー
               07      ()-PRMNAIBUKAIINNO      PIC  9(08).  *>内部会員番号  
               07      ()-PRMRIYOUSHACD        PIC  9(01).  *>利用者コード 
             05        ()-NYUKAIYMD            PIC  9(08).  *>入会年月日
             05        ()-KZK.                              *>家族基本情報
               07      ()-KZKSIMEI.                         *>氏名 
                 09    ()-KZKSHIMEIKANA        PIC  X(15).  *>カナ
                 09    ()-KZKSHIMEIROMA        PIC  X(30).  *>ローマ字
                 09    ()-KZKSHIMEIKAN         PIC  N(15).  *>漢字
               07      ()-KZKSEINENGAPPI       PIC  9(08).  *>生年月日
               07      ()-KZKSEX               PIC  9(01).  *>性別
               07      ()-KZKZOKUGARA          PIC  9(01).  *>続柄
             05        ()-CDH.                              *>カード発券情報
               07      ()-CDHHAKKOUKBN         PIC  9(01).  *>カード発行区分
               07      ()-CDHYMD               PIC  9(08).  *>カード発券日
             05        ()-CIFNO                PIC  9(08).  *>ＣＩＦ番号
             05        ()-EDABAN               PIC  9(01).  *>枝番
             05        ()-TKS.                              *>提携先情報
               07      ()-TKSHENREIYMD         PIC  9(08).  *>返戻日
               07      ()-TKSRIYUCD            PIC  X(03).  *>理由コード
               07      ()-TKSCARDNO            PIC  9(16).  *>カード番号
             05        ()-ANS.                              *>暗証番号情報
               07      ()-ANSGEN               PIC  9(04).  *>暗証番号
               07      ()-ANSKYUU              PIC  9(04).  *>旧暗証番号
               07      ()-ANSHENKOUYMD         PIC  9(08).  *>変更日
             05        ()-CLUBCD               PIC  9(02).  *>クラブコード
             05        ()-STSG.                             *>ステータス情報
               07      ()-STSTOUROKUYMD        PIC  9(08).  *>登録日
               07      ()-STS                  PIC  9(04).  *>ステータス
             05        ()-HOSTSHORIYMD         PIC  X(08).  *>ホスト処理日
             05        ()-HOSTSHORITIME        PIC  X(06).  *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD        PIC  9(08).  *>サーバ更新日
