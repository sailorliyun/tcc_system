      *****************************************************************
      * オーソリログファイル
      *****************************************************************
           03  QXS001-AUTHORILOG.
               05  QXS001-CAFISKEY.
                   07  QXS001-CENTERID                PIC X(002).
                   07  QXS001-CAFISTUBAN              PIC X(006).
                   07  QXS001-CENTERSKB               PIC X(002).
                   07  QXS001-TORIHIKIKBN             PIC X(001).
                   07  QXS001-SHORIYMD                PIC X(006).
                   07  QXS001-JYUSHINTIME             PIC X(006).
               05  QXS001-KAIINM-KEY.
                   07  QXS001-KIGYOUCD                PIC X(004).
                   07  QXS001-SUBRANGEKEY             PIC X(004).
                   07  QXS001-NAIBUKAIINNO            PIC X(008).
               05  QXS001-LOG.
                   07  QXS001-YOKYUDENBUNSBT          PIC X(004).
                   07  QXS001-OUTOUDENBUNSBT          PIC X(004).
                   07  QXS001-DENBUNSOSHINKBN         PIC X(001).
                   07  QXS001-CARDNO                  PIC X(016).
                   07  QXS001-YUKOKIGEN               PIC X(004).
                   07  QXS001-KAMEITENNO              PIC X(013).
                   07  QXS001-KAISHACODE              PIC X(007).
                   07  QXS001-SHIMUKEKAISHA           PIC X(011).
                   07  QXS001-SHONINNO                PIC X(007).
                   07  QXS001-CARDENTDEV              PIC X(001).
                   07  QXS001-KINGAKU                 PIC 9(008).
                   07  QXS001-ZEISOURYOU              PIC 9(007).
                   07  QXS001-SHOHINCODE              PIC X(007).
                   07  QXS001-ENCODE                  PIC X(069).
                   07  QXS001-SHIHARAIKBN             PIC X(002).
                   07  QXS001-ERRCODE                 PIC X(003).
                   07  QXS001-TERMSKB                 PIC X(001).
               05  QXS001-AUTHORIMSTITEM.
                   07  QXS001-KOZASTS                 PIC X(004).
                   07  QXS001-CARDSTS                 PIC X(004).
                   07  QXS001-MSTYUKOKIGEN            PIC X(004).
                   07  QXS001-SOZANDAKA               PIC 9(005).
                   07  QXS001-NOBEZANDAKA             PIC 9(005).
                   07  QXS001-CASHINGZANDAKA          PIC 9(005).