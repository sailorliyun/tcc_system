      *****************************************************************
      * ÇeÇcÇrèàóùåãâ ÉtÉ@ÉCÉã
      *****************************************************************
           03  QXS002-FDSRESULT.
               05  QXS002-FDSSCORE                    PIC 9(004).
               05  QXS002-KAIINZOKUSEI.
                   07  QXS002-CARDNO                  PIC X(016).
                   07  QXS002-CARDSKB                 PIC X(006).
                   07  QXS002-SEX                     PIC X(001).
                   07  QXS002-BIRTHDAY                PIC X(010).
                   07  QXS002-AGE                     PIC 9(004).
                   07  QXS002-AGEKBN                  PIC X(002).
                   07  QXS002-NYUKAIYMD               PIC X(010).
                   07  QXS002-KEIKATUKISU             PIC 9(004).
                   07  QXS002-LOSTDATE                PIC X(010).
                   07  QXS002-YOSHIN                  PIC 9(011).
                   07  QXS002-CASHINGSEIKYUKAISU      PIC 9(004).
                   07  QXS002-CASHINGSEIKYUKINGAKU    PIC 9(004).
                   07  QXS002-RIYOUKINGAKU            PIC 9(011).
                   07  QXS002-RIYOUTIMEZONE           PIC X(002).
                   07  QXS002-SHIHARAIKBN             PIC X(002).
                   07  QXS002-RIYOUWD                 PIC X(001).
                   07  QXS002-CURRENTRIYOUDATETIME    PIC X(014).
                   07  QXS002-TERMSKB                 PIC X(001).
                   07  QXS002-NEWSHOHINCODE           PIC X(001).
                   07  QXS002-HUSEITAHATUTENFLG       PIC X(001).
               05  QXS002-RUISEKIKAISU.
                   07  QXS002-SUMKAISU168H            PIC X(011).
                   07  QXS002-SUMKAISU72H             PIC X(011).
                   07  QXS002-SUMKAISU48H             PIC X(011).
                   07  QXS002-SUMKAISU24H             PIC X(011).
                   07  QXS002-SUMKAISU12H             PIC X(011).
                   07  QXS002-SUMKAISU8H              PIC X(011).
                   07  QXS002-SUMKAISU6H              PIC X(011).
                   07  QXS002-SUMKAISU4H              PIC X(011).
                   07  QXS002-SUMKAISU2H              PIC X(011).
                   07  QXS002-SUMKAISU1H              PIC X(011).
                   07  QXS002-SUMKAISU30M             PIC X(011).
                   07  QXS002-SUMKAISU20M             PIC X(011).
                   07  QXS002-SUMKAISU10M             PIC X(011).
               05  QXS002-RUISEKIKINGAKU.
                   07  QXS002-SUMKINGAKU168H          PIC X(011).
                   07  QXS002-SUMKINGAKU72H           PIC X(011).
                   07  QXS002-SUMKINGAKU48H           PIC X(011).
                   07  QXS002-SUMKINGAKU24H           PIC X(011).
                   07  QXS002-SUMKINGAKU12H           PIC X(011).
                   07  QXS002-SUMKINGAKU8H            PIC X(011).
                   07  QXS002-SUMKINGAKU6H            PIC X(011).
                   07  QXS002-SUMKINGAKU4H            PIC X(011).
                   07  QXS002-SUMKINGAKU2H            PIC X(011).
                   07  QXS002-SUMKINGAKU1H            PIC X(011).
                   07  QXS002-SUMKINGAKU30M           PIC X(011).
                   07  QXS002-SUMKINGAKU20M           PIC X(011).
                   07  QXS002-SUMKINGAKU10M           PIC X(011).
               05  QXS002-RUISEKIOTHER.
                   07  QXS002-SUM1D48KAISU            PIC X(011).
                   07  QXS002-SUM1D24KAISU            PIC X(011).
                   07  QXS002-SUM1D24KINGAKU          PIC X(011).
               05  QXS002-TRANTIMEDIF                 PIC X(011).
               05  QXS002-KINGAKUSCALE                PIC X(011).
               05  QXS002-RUISEKID3.
                   07  QXS002-SUMKINGAKU1D3           PIC X(011).
                   07  QXS002-SUMKINGAKU2D3           PIC X(011).
                   07  QXS002-SUMKINGAKU4D3           PIC X(011).
                   07  QXS002-SUMKINGAKU6D3           PIC X(011).
                   07  QXS002-SUMKINGAKU8D3           PIC X(011).
                   07  QXS002-SUMKINGAKU12D3          PIC X(011).
                   07  QXS002-SUMKINGAKU24D3          PIC X(011).
                   07  QXS002-SUMKINGAKU48D3          PIC X(011).
                   07  QXS002-SUMKINGAKU72D3          PIC X(011).
                   07  QXS002-SUMKINGAKU168D3         PIC X(011).
               05  QXS002-RUISEKID6.
                   07  QXS002-SUMKINGAKU1D6           PIC X(011).
                   07  QXS002-SUMKINGAKU2D6           PIC X(011).
                   07  QXS002-SUMKINGAKU4D6           PIC X(011).
                   07  QXS002-SUMKINGAKU6D6           PIC X(011).
                   07  QXS002-SUMKINGAKU8D6           PIC X(011).
                   07  QXS002-SUMKINGAKU12D6          PIC X(011).
                   07  QXS002-SUMKINGAKU24D6          PIC X(011).
                   07  QXS002-SUMKINGAKU48D6          PIC X(011).
                   07  QXS002-SUMKINGAKU72D6          PIC X(011).
                   07  QXS002-SUMKINGAKU168D6         PIC X(011).
                   07  QXS002-SUMRANGE1D6             PIC X(011).
                   07  QXS002-SUMRANGE2D6             PIC X(011).
                   07  QXS002-SUMRANGE4D6             PIC X(011).
                   07  QXS002-SUMRANGE6D6             PIC X(011).
                   07  QXS002-SUMRANGE8D6             PIC X(011).
                   07  QXS002-SUMRANGE12D6            PIC X(011).
                   07  QXS002-SUMRANGE24D6            PIC X(011).
                   07  QXS002-SUMRANGE48D6            PIC X(011).
                   07  QXS002-SUMRANGE72D6            PIC X(011).
                   07  QXS002-SUMRANGE168D6           PIC X(011).
               05  QXS002-RUISEKID12.
                   07  QXS002-SUMKINGAKU1D12          PIC X(011).
                   07  QXS002-SUMKINGAKU2D12          PIC X(011).
                   07  QXS002-SUMKINGAKU4D12          PIC X(011).
                   07  QXS002-SUMKINGAKU6D12          PIC X(011).
                   07  QXS002-SUMKINGAKU8D12          PIC X(011).
                   07  QXS002-SUMKINGAKU12D12         PIC X(011).
                   07  QXS002-SUMKINGAKU24D12         PIC X(011).
                   07  QXS002-SUMKINGAKU48D12         PIC X(011).
                   07  QXS002-SUMKINGAKU72D12         PIC X(011).
                   07  QXS002-SUMKINGAKU168D12        PIC X(011).
                   07  QXS002-SUMRANGE1D12            PIC X(011).
                   07  QXS002-SUMRANGE2D12            PIC X(011).
                   07  QXS002-SUMRANGE4D12            PIC X(011).
                   07  QXS002-SUMRANGE6D12            PIC X(011).
                   07  QXS002-SUMRANGE8D12            PIC X(011).
                   07  QXS002-SUMRANGE12D12           PIC X(011).
                   07  QXS002-SUMRANGE24D12           PIC X(011).
                   07  QXS002-SUMRANGE48D12           PIC X(011).
                   07  QXS002-SUMRANGE72D12           PIC X(011).
                   07  QXS002-SUMRANGE168D12          PIC X(011).
               05  QXS002-RUISEKIERRKAISU.
                   07  QXS002-SUMERRKAISU168          PIC X(011).
                   07  QXS002-SUMERRKAISU72           PIC X(011).
                   07  QXS002-SUMERRKAISU48           PIC X(011).
                   07  QXS002-SUMERRKAISU24           PIC X(011).
                   07  QXS002-SUMERRKAISU12           PIC X(011).
                   07  QXS002-SUMERRKAISU8            PIC X(011).
                   07  QXS002-SUMERRKAISU6            PIC X(011).
                   07  QXS002-SUMERRKAISU4            PIC X(011).
                   07  QXS002-SUMERRKAISU2            PIC X(011).
                   07  QXS002-SUMERRKAISU1            PIC X(011).
                   07  QXS002-SUMERRKAISU30M          PIC X(011).
                   07  QXS002-SUMERRKAISU20M          PIC X(011).
                   07  QXS002-SUMERRKAISU10M          PIC X(011).
               05  QXS002-RIYOUKINGAKUTOTAL.
                   07  QXS002-RIYOUKINGAKU3M          PIC X(011).
                   07  QXS002-RIYOUKINGAKU6M          PIC X(011).
                   07  QXS002-RIYOUKINGAKU12M         PIC X(011).
               05  QXS002-RIYOUKINGAKUAVE6M           PIC X(011).
               05  QXS002-NODE                        PIC 9(004).
               05  QXS002-ERR                         PIC 9(004).
               05  QXS002-RULE                        PIC 9(004).

