      *8.1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
      *    QXS010
      ****************************************************************
      *            提携先加盟店情報ファイル   DATA-WRITTEN  00.06.15 *
      *--------------------------------------------------------------*
      *            修  正  履  歴                                    *
      *    管理NO            修正理由              担当者  修正日付  *
      *    XX-XXX  ＮＮＮＮＮＮＮＮＮＮＮＮＮＮＮ  ＮＮＮ 9999.99.99 *
      *    XX-XXX  ＩＣカード用レイアウト変更対応  上　原 2002.08.01 *
      ****************************************************************
           03  QXS010-HOSTKAMEITENDATA.
               05  QXS010-DATAKBN                     PIC X(001).
               05  QXS010-UPDKBN                      PIC X(001).
               05  QXS010-TANMATUNO.
                   07  QXS010-CREDITKAISHACD          PIC X(005).
                   07  QXS010-MAKERCD                 PIC X(002).
                   07  QXS010-KISHUCD                 PIC X(001).
                   07  QXS010-TERMTUBAN               PIC X(005).
               05  QXS010-KEIYAKUSHA.
                   07  QXS010-KEIYAKUSHAKANA          PIC X(030).
                   07  QXS010-KEIYAKUSHAKANJI         PIC X(050).
               05  QXS010-SECHITEN.
                   07  QXS010-SECHITENKANA            PIC X(030).
                   07  QXS010-SECHITENKANJI           PIC X(050).
                   07  QXS010-URIAGEINJMEI            PIC X(030).
                   07  QXS010-SECHITENZIPCODE         PIC X(007).
                   07  QXS010-ADDR.
                       09  QXS010-SECHITENADDR1       PIC X(040).
                       09  QXS010-SECHITENADDR2       PIC X(040).
                   07  QXS010-CHIKUCODE               PIC X(002).
      *20020801SＩＣカード用レイアウト変更対応
      *            07  QXS010-SETUZOKUTELNO           PIC X(012).
      *            07  QXS010-NAISENNO                PIC X(004).
      *            07  QXS010-KANYUKEIYAKUSHA         PIC X(050).
      *            07  QXS010-RENRAKUSAKITELNO        PIC X(012).
                   07  QXS010-SETUZOKUTELNO           PIC X(014).
                   07  QXS010-KANYUKEIYAKUSHA         PIC X(050).
                   07  QXS010-RENRAKUSAKITELNO        PIC X(014).
      *20020801E
                   07  QXS010-TANTOUSHA               PIC X(014).
                   07  QXS010-GYOUSHU                 PIC X(001).
                   07  QXS010-TORISHOHIN1             PIC X(003).
                   07  QXS010-TORISHOHIN2             PIC X(003).
                   07  QXS010-SHOHINCDINPKBN          PIC X(001).
                   07  QXS010-TORIGYOUMUKBN           PIC X(001).
                   07  QXS010-DNPTORIKBN              PIC X(001).
                   07  QXS010-USEURIAGEDNPKBN         PIC X(001).
                   07  QXS010-KIDINF                  PIC X(570).
                   07  QXS010-HICHIKANTERMNO          PIC X(013).
                   07  QXS010-MANUALINPKBN            PIC X(001).
                   07  QXS010-ZEISORYOKBN             PIC X(001).
      *20020801SＩＣカード用レイアウト変更対応
      *            07  QXS010-FLORELIMIT              PIC X(002).
                   07  QXS010-FLORELIMIT              PIC X(003).
      *20020801E
                   07  QXS010-FUZUIKINO               PIC X(002).
                   07  QXS010-TOKKIJIKO               PIC X(050).
      *20020801SＩＣカード用レイアウト変更対応
      *        05  QXS010-CENTERREGDATE               PIC X(006).
      *        05  QXS010-KANRIUKETUKEBI              PIC X(006).
               05  QXS010-CENTERREGDATE               PIC X(008).
               05  QXS010-KANRIUKETUKEBI              PIC X(008).
      *20020801E
               05  QXS010-ZEIOTHERINP                 PIC X(001).
               05  QXS010-PSWPAD                      PIC X(001).
      *20020801SＩＣカード用レイアウト変更対応
               05  QXS010-ICINF.
                   07  QXS010-ICJYOKYO                PIC X(001).
                   07  QXS010-SHOHINCDINPUMU          PIC X(001).
                   07  QXS010-KYOSEIONLINE            PIC X(001).
                   07  QXS010-NEGACHECK               PIC X(001).
                   07  QXS010-BRANDAPLI.
                       09  QXS010-VSDC                PIC X(001).
                       09  QXS010-MCHIP               PIC X(001).
                       09  QXS010-JSMART              PIC X(001).
                       09  QXS010-AEIPS               PIC X(001).
                       09  QXS010-DN                  PIC X(001).
                       09  QXS010-APLIKYO             PIC X(001).
                       09  QXS010-VSDCBASE            PIC X(001).
                       09  QXS010-MCHIPBASE           PIC X(001).
                       09  QXS010-JSMARTBASE          PIC X(001).
                       09  QXS010-YOBI1               PIC X(001).
                       09  QXS010-YOBI2               PIC X(001).
                       09  QXS010-YOBI3               PIC X(001).
               05  FILLER                             PIC X(029).
               05  FILLER                             PIC X(001).
      *20020801E
