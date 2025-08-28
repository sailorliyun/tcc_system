      *8...........2.........3.........4.........5........6........7.........8  
      *    QTA170
      ****************************************************************
      *                     処理コントロールファイル                 *
      *                             DATA-WRITTEN  99.01.14           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   * 
      ****************************************************************    
           03            ()-SEG.                         *>処理コントロール
             05          ()-PRM.                         *>エントリーキー
               07        ()-PRMRRECKBN       PIC  X(01). *>レコード区分
             05          ()-SKN.                         *>請求年月
               07        ()-SKNSEIKYUNEN     PIC  9(04). *>年
               07        ()-SKNSEIKYUTSUKI   PIC  9(02). *>月
             05          ()-SMN.                         *>締年月日
               07        ()-SMNSIMENEN       PIC  9(04). *>年
               07        ()-SMNSIMETSUKI     PIC  9(02). *>月
               07        ()-SMNSIMEBI        PIC  9(02). *>日
             05          ()-SYN.                         *>処理年月日
               07        ()-SYNSYORINEN      PIC  9(04). *>年
               07        ()-SYNSYORITSUKI    PIC  9(02). *>月
               07        ()-SYNSYORIBI       PIC  9(02). *>日
             05          ()-SYORIYOUBI       PIC  9(01). *>処理日曜日
             05          ()-KENN.                        *>計上年月日
               07        ()-KENKEIJOUNEN     PIC  9(04). *>年
               07        ()-KENKEIJOUTSUKI   PIC  9(02). *>月
               07        ()-KENKEIJOUBI      PIC  9(02). *>日
             05          ()-URI.                         *>売掛金締年
               07        ()-URISIMENEN       PIC  9(04). *>年
               07        ()-URISIMETSUKI     PIC  9(02). *>月
             05          ()-TAT.                         *>立替締年月日
               07        ()-TATSIMENEN       PIC  9(04). *>年
               07        ()-TATSIMETSUKI     PIC  9(02). *>月
               07        ()-TATSIMEBI        PIC  9(02). *>日
             05          ()-SEIKYUJOTAIFLG   PIC  X(01). *>請求状態フラグ
             05          ()-HOSTSHORIYMD     PIC  X(08). *>ホスト処理日
             05          ()-HOSTSHORITIME    PIC  X(06). *>ホスト処理時刻
             05          ()-SVRKOUSHINYMD    PIC  9(08). *>サーバ更新日
