      *****************************************************************
      * è∆çáàÀóä
      *****************************************************************
           03  QBS002-ZOKGR                           PIC X(001).
           03  QBS002-EDABAN                          PIC 9(001).
           03  QBS002-EIGYOTEN                        PIC 9(002).
           03  QBS002-KAKUTOKUTEN                     PIC 9(002).
           03  QBS002-KIHONINF.
               05  QBS002-KNNAME                      PIC X(030).
               05  QBS002-BIRTHDAY                    PIC 9(007).
               05  QBS002-SEX                         PIC 9(001).
               05  QBS002-CHIBAN                      PIC X(003).
           03  QBS002-TEL.
               05  QBS002-JITAKU.
                   07  QBS002-HONTEL1                PIC X(007).
                   07  QBS002-HONTEL2                PIC X(004).
                   07  QBS002-HONTEL3                PIC X(004).
               05  QBS002-KINMUSAKI.
                   07  QBS002-KINTEL1                PIC X(007).
                   07  QBS002-KINTEL2                PIC X(004).
                   07  QBS002-KINTEL3                PIC X(004).
           03  QBS002-KINMUKBN                        PIC X(001).
           03  QBS002-KINKNNAME                      PIC X(030).
           03  QBS002-JYUSYO-INF.
               05  QBS002-JYUSYOJITAKU.
                   07  QBS002-HONJUSHOCD             PIC 9(011).
                   07  QBS002-HONYUBINNO             PIC X(008).
                   07  QBS002-JITAKUKANA.
                       09  QBS002-HONKNTODOFUKEN     PIC X(008).
                       09  QBS002-HONKNSHIKCHOSN     PIC X(042).
                   07  QBS002-HONKNBANCHI            PIC X(015).
                   07  QBS002-HONKNKATAGAKI          PIC X(032).
               05  QBS002-KINJYUSYO.
                   07  QBS002-KINJUSHOCD             PIC 9(011).
                   07  QBS002-KINYUBINNO             PIC X(008).
                   07  QBS002-KINKANA.
                       09  QBS002-KINKNTODOFUKEN     PIC X(008).
                       09  QBS002-KINKNSHIKCHOSN     PIC X(042).
                   07  QBS002-KINKNBANCHI            PIC X(015).
                   07  QBS002-KINKNKATAGAKI          PIC X(032).
           03  QBS002-JIFURIKOUZAINF.
               05  QBS002-BANKCODE                    PIC 9(004).
               05  QBS002-BANKNAME                    PIC N(010).
               05  QBS002-SHITENCD                    PIC 9(005).
               05  QBS002-SHITENNAME                  PIC N(010).
               05  QBS002-YOKINSBT                    PIC 9(001).
               05  QBS002-KOUZANO                     PIC 9(008).
               05  QBS002-KOUZANAME                   PIC X(030).
           03  QBS002-CNTLINF.
               05  QBS002-CARDKBN                     PIC X(006).
               05  QBS002-FAMILYNYUKAIKBN             PIC 9(001).
               05  QBS002-CNTLSOUFU.
                   07  QBS002-ELSCARDSOUFU           PIC 9(001).
                   07  QBS002-ELSSEIKYUSOFU          PIC 9(001).
               05  QBS002-CNTLHAKKOU.
                   07  QBS002-ELSCARDHAKKOKBN        PIC 9(001).
                   07  QBS002-ELSCARDYUSOKBN         PIC 9(001).
           03  QBS002-KOUTEICNTL.
               05  QBS002-UKETSUKEDATE                PIC 9(007).
               05  QBS002-KESSAIDATE                  PIC 9(007).
               05  QBS002-STRDATE                     PIC 9(007).
               05  QBS002-ENBSDATE                    PIC 9(007).
               05  QBS002-KESSAIKEKKA                 PIC 9(001).
               05  QBS002-KESSAIRIYU                  PIC 9(002).
               05  QBS002-KESSAIRIYUTUIKI             PIC N(010).
               05  QBS002-KESSAITANTONAME             PIC 9(007).
           03  QBS002-BANGOCNTL.
               05  QBS002-CIFNO                       PIC 9(008).
               05  QBS002-GAIBUKAIINNO                PIC 9(012).
               05  QBS002-BLKNO                      PIC 9(007).
           03  QBS002-KAKUTOKUROUT                    PIC 9(009).
           03  QBS002-CICINQNO                        PIC X(008).
           03  QBS002-SCOREINF.
               05  QBS002-SCOREKBN.
                   07  QBS002-NENREI                  PIC X(001).
                   07  QBS002-FAMILYJYOUKYOU          PIC X(001).
                   07  QBS002-SUMAIKBN                PIC X(001).
                   07  QBS002-SUMAINENSU              PIC X(001).
                   07  QBS002-SHIHONKG                PIC X(001).
                   07  QBS002-JUGYOCNT                PIC X(001).
                   07  QBS002-YAKUSHOKU               PIC X(001).
                   07  QBS002-KINZOKUNENSU            PIC X(001).
                   07  QBS002-NENSHUKBN               PIC X(001).
               05  QBS002-SCRTENSU                    PIC 9(003).
               05  QBS002-YOSINRANK                   PIC X(001).
           03  QBS002-CASHGENDOGAKU                  PIC 9(005).
           03  QBS002-DANTAIINF.
               05  QBS002-AITESAKINO                  PIC X(008).
               05  QBS002-DAIHYOUNO                   PIC 9(012).
           03  QBS002-STRMOTOTANMATSUID               PIC X(008).
           03  QBS002-SESSIONCOUNTER                  PIC 9(008).
           03  QBS002-DKSAKIGRPCD                     PIC 9(007).
           03  QBS002-HENSAIHOHO                      PIC X(001).
           03  QBS002-ELSYUUCHOSAIKBN                 PIC X(001).
           03  QBS002-BUBIKIKBN                       PIC 9(001).
           03  QBS002-FACEKBN                         PIC X(001).
           03  QBS002-TEIKEIKBN                       PIC X(001).
           03  QBS002-CREATEDATE                     PIC 9(008).
           03  QBS002-CREATETIME                     PIC 9(006).
           03  FILLER                                PIC X(022).

