      *8...........2.........3.........4.........5........6........7.........8  
      *    QTA140
      ****************************************************************
      *                       銀行マスタ                             *
      *                             DATA-WRITTEN  99.01.18           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   *
      ****************************************************************
           03        ()-SEG.                          *>銀行マスタ
             05      ()-PRM.                          *>主キー
               07    ()-PRMKIKANCD       PIC  9(04).  *>金融機関コード
               07    ()-PRMSHITENCD      PIC  9(03).  *>支店コード
               07    ()-PRMHUKACD        PIC  X(01).  *>付加コード
             05      ()-KNM.                          *>銀行名称カナ
               07    ()-KNMKINYUKIKAN    PIC  X(15).  *>金融機関名カナ
               07    ()-KNMSHITEN        PIC  X(15).  *>支店名カナ
             05      ()-YUBINNO          PIC  X(07).  *>郵便番号
             05      ()-KIKANSHUBETSU    PIC  9(03).  *>金融機関種別
             05      ()-KNJ.                          *>店舗所在地Ａカナ
               07    ()-KNJTODOFUKENA    PIC  X(08).  *>カナ都道府県名
               07    ()-KNJSHIKUGUNA     PIC  X(52).  *>カナ市区郡以降
             05      ()-KNJKATA.                      *>店舗所在地方書カナ
               07    ()-KNJKATAGAKI1     PIC  X(15).  *>方書カナ１
               07    ()-KNJKATAGAKI2     PIC  X(25).  *>方書カナ２
             05      ()-KATAGAKIKETA     PIC  9(02).  *>方書桁数
             05      ()-KUKAKUCD         PIC  9(09).  *>国土行政区画コード
             05      ()-MASTERCH         PIC  X(01).  *>マスタＣＨ
             05      ()-JUSHOCDJIS       PIC  9(06).  *>ＪＩＳ住所コード
             05      ()-TEL              PIC  X(12).  *>電話番号
             05      ()-TEGATAKOUKANSHO  PIC  9(04).  *>手形交換所
             05      ()-NMKJ.                         *>銀行名称漢字
               07    ()-KINYUKIKANNMKJ   PIC  N(15).  *>金融機関名漢字
               07    ()-SITENNMKJ        PIC  N(15).  *>支店名漢字
             05      ()-KJJ.                          *>店舗所在地Ａ漢字桁数
               07    ()-KJJAKETA         PIC  9(02).  *>Ａ漢字全桁数
               07    ()-KJJAKENKETA      PIC  9(01).  *>Ａ漢字都道府県桁数
               07    ()-KJJAGUNKETA      PIC  9(02).  *>Ａ漢字市区郡桁数
               07    ()-KJJAMURAKETA     PIC  9(02).  *>Ａ漢字町村桁数
             05      ()-KJJBKETA         PIC  9(02).  *>店舗所在地Ｂ漢字桁数
             05      ()-KJJTENPO         PIC  N(25).  *>店舗所在地Ａ漢字
             05      ()-KJJB.                         *>店舗所在地Ｂ方書漢字
               07    ()-KJJBKATAGAKI1    PIC  N(15).  *>Ｂ方書漢字１
               07    ()-KJJBKATAGAKI2    PIC  N(25).  *>Ｂ方書漢字２
             05      ()-ZENGINKAMEICH    PIC  9(01).  *>全銀加盟ＣＨ
             05      ()-DATATOUROKUYMD   PIC  9(08).  *>データ登録年月日
 	     05      ()-KINKYUSHUSEIYMD  PIC  9(08).  *>緊急修正年月日
             05      ()-DATASHUBETSU     PIC  9(01).  *>データ種別
             05      ()-HOSTSHORIYMD     PIC  X(08).  *>ホスト処理日
             05      ()-HOSTSHORITIME    PIC  X(06).  *>ホスト処理時刻
             05      ()-SVRKOUSHINYMD    PIC  9(08).  *>サーバ更新日
