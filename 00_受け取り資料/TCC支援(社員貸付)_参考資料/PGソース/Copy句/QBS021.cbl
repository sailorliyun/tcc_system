      *****************************************************************
      * 会員登録ＩＦ(QBS021)      レコード長：１７００Ｂｙｔｅ
      *****************************************************************
            03  QBS021-TABANO                          PIC 9(006).
            03  QBS021-UKETSUKENO                      PIC 9(008).
            03  QBS021-CTLKAISHATEN                    PIC 9(002).
            03  QBS021-CTLKANRITEN                     PIC 9(002).
            03  QBS021-EIGYOTEN                        PIC 9(002).
            03  QBS021-CTLDMTEN                        PIC 9(002).
            03  QBS021-CTLJIGYOTEN                     PIC 9(002).
            03  QBS021-KAKUTOKUTEN                     PIC 9(002).
            03  QBS021-CARDKBN                         PIC 9(006).
            03  QBS021-HENSAIHOHO                      PIC 9(001).
            03  QBS021-PASSWORD                        PIC 9(004).
            03  QBS021-UKETSUKEDATE                    PIC 9(007).
            03  QBS021-KESSAIDATE                      PIC 9(007).
            03  QBS021-KAKUTOKUROUT                    PIC 9(009).
            03  QBS021-SHOKAISHACD                     PIC 9(008).
            03  QBS021-YOSINRANK                       PIC X(001).
            03  QBS021-CASHGENDOGAKU                   PIC 9(005).
            03  QBS021-NOCIFNO                         PIC 9(008).
            03  QBS021-NOCICINQNO                      PIC X(008).
            03  QBS021-KAIINNO                         PIC X(016).
            03  QBS021-HONINF.
              05  QBS021-HONSHIMEI.
                07  QBS021-HONKNNAME                   PIC X(030).
                07  QBS021-HONRM-NAME                  PIC X(030).
                07  QBS021-HONKJ-NAME                  PIC N(015).
              05  QBS021-BIRTHDAY                      PIC 9(007).
              05  QBS021-SEX                           PIC 9(001).
            03  QBS021-HONJITAKU.
              05  QBS021-HONTEL.
                07  QBS021-HONTEL1                     PIC X(007).
                07  QBS021-HONTEL2                     PIC X(004).
                07  QBS021-HONTEL3                     PIC X(004).
              05  QBS021-HONJUSHO.
                07  QBS021-HONJUSHOCD                  PIC 9(011).
                07  QBS021-HONYUBINNO                  PIC X(007).
                07  QBS021-HONKANA.
                  09  QBS021-HONKN.
                    11  QBS021-HONKNTODOFUKEN          PIC X(008).
                    11  QBS021-HONKNSHIKCHOSN          PIC X(042).
                    11  QBS021-HONKNBANCHI             PIC X(015).
                    11  QBS021-HONKNKATAGAKI           PIC X(032).
                07  QBS021-HONKANJI.
                  09  QBS021-HONKJ.
                    11  QBS021-HONKJJUSHO              PIC N(025).
                    11  QBS021-HONKJBANCHI             PIC N(015).
                    11  QBS021-HONKJKATAGAKI           PIC N(032).
            03  QBS021-JIFURI.
              05  QBS021-BANKINF.
                07  QBS021-BANKCD                      PIC 9(004).
                07  QBS021-BANKNAME                    PIC N(010).
                07  QBS021-SHITENCD                    PIC 9(005).
                07  QBS021-SHITENNAME                  PIC N(010).
                07  QBS021-YOKINSBT                    PIC 9(001).
                07  QBS021-KOUZABANGO                  PIC 9(008).
                07  QBS021-KOUZANAME                   PIC X(030).
            03  QBS021-CLUBCD                          PIC 9(002).
            03  QBS021-SOFUSAKI.
              05  QBS021-SFSCARD                       PIC 9(001).
              05  QBS021-SFSSEIKYUSYO                  PIC 9(001).
            03  QBS021-CARDHAKKOU.
              05  QBS021-CARDHAKKOUKBN                 PIC 9(001).
              05  QBS021-CARDYUSOKBN                   PIC 9(001).
            03  QBS021-KESSAIINF.
              05  QBS021-JFRINF.
                07  QBS021-JFRKESSAIKEKKA              PIC X(001).
              05  QBS021-FKMINF.
                07  QBS021-FKMKESSAIKEKKA              PIC X(001).
            03  QBS021-CARD-KSSHIJI.
              05  QBS021-JDSSHINSAKEKKA                PIC 9(001).
              05  QBS021-JINISHINSAKEKKA               PIC 9(001).
            03  QBS021-ATSUKAIBUKA                     PIC X(006).
            03  QBS021-YUCHOSAIHAKKOUSU                PIC X(001).
            03  QBS021-BUBIKIPOINTKBN                  PIC 9(001).
            03  QBS021-CARDFACEKBN                     PIC 9(001).
            03  QBS021-TEIKEIKBN                       PIC X(001).
            03  QBS021-FUNYUSKB                        PIC X(004).
            03  QBS021-KINMUINF.
              05  QBS021-KINMUKBN                      PIC X(001).
              05  QBS021-KINNAME.
                07  QBS021-KINKNNAME                   PIC X(030).
                07  QBS021-KINKJNAME                   PIC N(030).
              05  QBS021-SYOZOKUBUKA                   PIC N(015).
              05  QBS021-KINTEL.
                07  QBS021-KINTEL1                     PIC X(007).
                07  QBS021-KINTEL2                     PIC X(004).
                07  QBS021-KINTEL3                     PIC X(004).
              05  QBS021-KINJUSHO.
                07  QBS021-KINJUSHOCD                  PIC 9(011).
                07  QBS021-KINYUBINNO                  PIC X(008).
                07  QBS021-KINKANA.
                  09  QBS021-KNJUSHO.
                    11  QBS021-KINKNTODOFUKEN          PIC X(008).
                    11  QBS021-KINKNSHIKCHOSN          PIC X(042).
                  09  QBS021-KINKNBANCHI               PIC X(015).
                  09  QBS021-KINKNKATAGAKI             PIC X(032).
                07  QBS021-KINKANJI.
                  09  QBS021-KJJUSHO.
                    11  QBS021-KINKJJUSHO              PIC N(025).
                  09  QBS021-KINKJBANCHI               PIC N(015).
                  09  QBS021-KINKJKATAGAKI             PIC N(032).
            03  QBS021-KAZOKUINF                       OCCURS  5.
              05  QBS021-SETTEIKBN                     PIC 9(001).
              05  QBS021-EDABAN                        PIC 9(001).
              05  QBS021-RIYOSHACD                     PIC 9(001).
              05  QBS021-NYUKAIDATE                    PIC 9(007).
              05  QBS021-KZKNAME.
                07  QBS021-KNSHIMEI                    PIC X(015).
                07  QBS021-RMSHIMEI                    PIC X(030).
                07  QBS021-KJSHIMEI                    PIC N(015).
              05  QBS021-KZKBIRTHDAY                   PIC 9(007).
              05  QBS021-KZKSEX                        PIC 9(001).
              05  QBS021-ZOKGARA                       PIC 9(001).
              05  QBS021-KZKCARDHAKKOUKBN              PIC 9(001).
              05  QBS021-NOINF.
                07  QBS021-KZKCIFNO                    PIC 9(008).
              05  QBS021-KZKPASSWORD                   PIC 9(004).
              05  QBS021-KZKCLUBCD                     PIC 9(002).
      * 2001/08/01 カードローン対応　申込書Ｔ項目追加  SQT.SATOU -->
      *     03  FILLER                                 PIC X(169).
            03  QBS021-HENSAIKNG                       PIC 9(001).
            03  QBS021-BOUNASKNG                       PIC 9(002).
            03  FILLER                                 PIC X(166).
      * 2001/08/01 カードローン対応　申込書Ｔ項目追加  SQT.SATOU <--
