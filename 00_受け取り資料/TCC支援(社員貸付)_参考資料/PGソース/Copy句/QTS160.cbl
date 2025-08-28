      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS160(QTA160)
      ****************************************************************
      *                     住所マスタ                               *
      *                             DATA-WRITTEN  99.01.13           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   *
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03            ()-SEG.                         *>住所マスタ
             05          ()-PRM.                         *>住所コード
               07        ()-PRMTODOUHUKEN    PIC  X(02). *>都道府県
               07        ()-PRMSHIKUGUN      PIC  X(02). *>市区郡
               07        ()-PRMCHOUSON       PIC  X(03). *>町村
               07        ()-PRMAZACHOUME     PIC  X(02). *>字・丁目
             05          ()-PRMCD            PIC  X(01). *>Ｃ／Ｄ
             05          ()-YUBINNO          PIC  X(07). *>郵便番号
             05          ()-KANA.                        *>カナ住所
               07        ()-KANAKENMEI       PIC  X(08). *>県名
               07        ()-KANAJYUSHOMEI    PIC  X(52). *>カナ住所名
             05          ()-KJJ.                         *>漢字住所
               07        ()-KJJYUKOZENKETA   PIC  9(02). *>有効全桁
               07        ()-KJJTODOHUKENKETA PIC  9(01). *>都道府県桁
               07        ()-KJJSIKUGUNKETA   PIC  9(02). *>市区郡桁
               07        ()-KJJCHOUSONKETA   PIC  9(02). *>町村桁
               07        ()-KJJJYUSHOMEI     PIC  N(25). *>漢字住所名
             05          ()-YUBINMARK        PIC  X(01). *>郵便マーク
             05          ()-TNG.                         *>登録年月日
               07        ()-TNGKANATOUROKU   PIC  X(04). *>カナ登録年月
               07        ()-TNGKANJITOUROKU  PIC  X(04). *>漢字登録年月
             05          ()-CH               PIC  X(01). *>Ｃ／Ｈ
             05          ()-HOSTSHORIYMD     PIC  X(08). *>ホスト処理日
             05          ()-HOSTSHORITIME    PIC  X(06). *>ホスト処理時刻
             05          ()-SVRKOUSHINYMD    PIC  9(08). *>サーバ更新日
