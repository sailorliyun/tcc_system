      *8...........2.........3.........4.........5........6........7.........8  
      *    QTS150(QTA150)
      ****************************************************************
      *                コードテーブル                                *
      *                             DATA-WRITTEN  99.01.14           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO   修正理由                      担当者   修正日付   *
      *   000001   レイアウト変更の為            FIP      99/03/06   *
      ****************************************************************    
           03          ()-SEG.                        *>コードテーブル
             05        ()-PRM.                        *>エントリーキー
               07      ()-PRMCODEKBN     PIC  X(03).  *>コード区分
               07      ()-PRMCODENO      PIC  X(04).  *>コード番号
             05        ()-MEI            PIC  N(40).  *>名称（日本語） 
             05        ()-SUUCHIBU       PIC  X(60).  *>数値部
             05        ()-CODEMEIKATA    REDEFINES    
                                         ()-SUUCHIBU. *>コード名称長    
               07      ()-KETASUU        PIC  9(03).  *>名称有効桁数
               07      FILLER            PIC  X(57).  *>予備
             05        ()-GND            REDEFINES 
                                         ()-SUUCHIBU. *>限度額テーブル 
               07      ()-GNDSOU         PIC  9(05).  *>総限度額
               07      ()-GNDNOBE        PIC  9(05).  *>述べ払い限度額
               07      ()-GNDQCKIKAN     PIC  9(05).  *>Ｑｶｰﾄﾞ期間与信 
               07      ()-GNDQCGEKKAN    PIC  9(05).  *>Ｑｶｰﾄﾞ月間与信
               07      FILLER            PIC  X(40).  *>予備
             05        ()-KGN            REDEFINES 
                                         ()-SUUCHIBU. *>期限テーブル
               07      ()-KGNYMD         PIC  9(08).  *>期限年月日
               07      FILLER            PIC  X(52).  *>予備
             05        ()-STS            REDEFINES 
                                         ()-SUUCHIBU. *>ステータス情報
               07      ()-STSKANRITANI   PIC  X(01).  *>管理単位
               07      ()-STSS.                       *>ステータス
                 09    ()-STSSYURUI      PIC  9(02).  *>種類
                 09    ()-STSSYOSAI      PIC  9(02).  *>詳細
                 09    ()-STSJYUYOUDO    PIC  9(04).  *>重要度
                 09    ()-STSPOSCD       PIC  9(02).  *>ＰＯＳコード
                 09    ()-STSSOEJIKOZA   PIC  9(02).  *>添字（口座）
                 09    ()-STSSOEJICARD   PIC  9(02).  *>添字（カード）
               07      ()-STSH.                       *>表示ﾒｯｾｰｼﾞ情報
                 09    ()-STSHOST        PIC  N(05).  *>ホスト
               07      FILLER            PIC  X(35).  *>予備
             05        ()-KYK            REDEFINES 
                                         ()-SUUCHIBU. *>顧客手数料率
               07      ()-T0260.                      *>延滞利息
                 09    ()-KYKENTS1       PIC  99V99.  *>Ｓ１回
                 09    ()-KYKENTS2       PIC  99V99.  *>Ｓ２回
                 09    ()-KYKENTB1       PIC  99V99.  *>Ｓボ１
                 09    ()-KYKENTB2       PIC  99V99.  *>Ｓボ２
                 09    ()-KYKENTKAPPU    PIC  99V99.  *>Ｓ割賦
                 09    ()-KYKENTRIVO     PIC  99V99.  *>Ｓリボ
                 09    ()-KYKENTC1       PIC  99V99.  *>Ｃ１回
                 09    ()-KYKENTC2       PIC  99V99.  *>Ｃリボ
               07      FILLER            PIC  X(28).  *>予備
             05        ()-HBT            REDEFINES 
                                         ()-SUUCHIBU. *>ﾘﾎﾞ･ﾊｲﾊﾞﾗﾝｽ情報
               07      ()-HBTTBL         OCCURS  6.   *>ﾊｲﾊﾞﾗﾝｽﾃｰﾌﾞﾙ
                 09    ()-HBTRIPO        PIC  9(05).  *>リボ残高上限
                 09    ()-HBTYAKU        PIC  9(05).  *>約定返済額              
             05        ()-DEN            REDEFINES
                                         ()-SUUCHIBU. *>伝票種別情報
               07      ()-DENSOUSEIKBN   PIC  X(01).  *>伝票創成区分
               07      ()-DENNIKKEIKBN   PIC  X(01).  *>日計表集計区分
               07      FILLER            PIC  X(58).  *>予備
             05        ()-TKS            REDEFINES 
                                         ()-SUUCHIBU. *>店間決済情報
               07      ()-TKSRITU        PIC  99V99   *>手数料率 
                                         OCCURS 10.        
               07      FILLER            PIC  X(20).  *>予備
             05        ()-CSH            REDEFINES 
                                         ()-SUUCHIBU. *>ｷｬｯｼﾝｸﾞ立替
               07      ()-CSHRITU        PIC  99V99.  *>数料率
               07      FILLER            PIC  X(56).  *>予備
             05        ()-TES            REDEFINES 
                                         ()-SUUCHIBU. *>ｷｬｯｼﾝｸﾞ精算情報
               07      ()-TESSIMEBI      PIC  9(02).  *>精算締日
               07      ()-TESRIYOU0      PIC  9(05).  *>利用手数料単価 
               07      ()-TESJIKANGAI    PIC  9(05).  *>時間外手数料単価 
               07      ()-TESTORIATUKAI  PIC  99V99.  *>取扱手数料率 
               07      FILLER            PIC  X(44).  *>予備
             05        ()-ZEI            REDEFINES 
                                         ()-SUUCHIBU. *>消費税情報
               07      ()-ZEIRITU        PIC  99V99.  *>消費税
               07      FILLER            PIC  X(56).  *>予備
             05        ()-HOSTSHORIYMD   PIC  X(08).  *>ホスト処理日
             05        ()-HOSTSHORITIME  PIC  X(06).  *>ホスト処理時刻
             05        ()-SVRKOUSHINYMD  PIC  9(08).  *>サーバ更新日
