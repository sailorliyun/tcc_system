      *****************************************************************
      * CICâÒìöèÓïÒ
      *****************************************************************
           03  QXTS01-DATA.
               05  QXTS01-COMMON.
                     07  QXTS01-INQNO                        PIC  9(06).
                     07  QXTS01-USER2                        PIC  X(10).
                     07  QXTS01-APPLHEADER.
                         09  QXTS01-KWSID                    PIC  X(08).
                         09  QXTS01-USER                     PIC  X(19).
                         09  QXTS01-KAITO                    PIC  X(01).
                         09  QXTS01-MADCD                    PIC  X(03).
                         09  QXTS01-KIKAN                    PIC  X(02).
                     07  QXTS01-SHOKAIDATA.
                         09  QXTS01-CICSRV                   PIC  X(02).
                         09  QXTS01-NETSRV                   PIC  X(02).
                         09  QXTS01-NAME                     PIC  X(30).
                         09  QXTS01-HJNAME                   PIC  X(30).
                         09  QXTS01-SYMD                     PIC  9(07).
                         09  QXTS01-YUBIN                    PIC  9(05).
                         09  QXTS01-TEL                      PIC  X(14).
                         09  QXTS01-TEL2                     PIC  X(14).
                         09  QXTS01-CHIBAN                   PIC  X(03).
                         09  QXTS01-HHOSYO                   PIC  X(01).
                         09  QXTS01-KYKBN                    PIC  X(02).
                         09  QXTS01-SHOHIN                   PIC  X(03).
                         09  QXTS01-YUSHI                    PIC  S9(6).
                         09  QXTS01-HARAI                    PIC  S9(3).
                         09  QXTS01-HJCODE                   PIC  X(10).
                         09  QXTS01-CHIIKI                   PIC  X(05).
                         09  QXTS01-CHOU                     PIC  X(11).
                         09  QXTS01-CHIG                     PIC  X(08).
                         09  QXTS01-HEYAG                    PIC  X(04).
                         09  QXTS01-MUNEG                    PIC  X(04).
                         09  QXTS01-DUMMY1                   PIC  X(03).
                         09  QXTS01-KAIIN                    PIC  X(06).
                     07  QXTS01-Misiyo                       PIC  X(03).
                     07  QXTS01-SEQNO                        PIC  9(18).
                 05  QXTS01-KYOKU1                           PIC  X(20).
                 05  QXTS01-KYOKU2                           PIC  X(20).
                 05  QXTS01-CHIKU                            PIC  X(20).
                 05  QXTS01-HH                               PIC  9(02).
                 05  QXTS01-MM                               PIC  9(02).
                 05  QXTS01-SS                               PIC  9(02).
                 05  QXTS01-ERR                              PIC  X(46).
                 05  QXTS01-SRERR                            PIC  X(20).
                 05  QXTS01-SRSBT                            PIC  X(02).
                 05  QXTS01-DUMMY3                           PIC  X(18).
                 05  QXTS01-DUMMY4                           PIC  X(40).
                 05  QXTS01-KAITOU-FLG.
                     07  QXTS01-ANSFLG                       PIC  X(01).
                     07  QXTS01-KMSFLG                       PIC  X(01).
                     07  QXTS01-CREFLG                       PIC  X(01).
                     07  QXTS01-HOJFLG                       PIC  X(01).
                     07  QXTS01-KSCFLG                       PIC  X(01).
                     07  QXTS01-JICFLG                       PIC  X(01).
                     07  QXTS01-TELFLG                       PIC  X(01).
                     07  QXTS01-MAPFLG                       PIC  X(01).
                     07  QXTS01-DUMMY5                       PIC  X(04).
                 05  QXTS01-KAITOU-DATASBT.
                     07  QXTS01-ANSSBT                       PIC  X(02).
                     07  QXTS01-KMSSBT                       PIC  X(02).
                     07  QXTS01-CRESBT                       PIC  X(02).
                     07  QXTS01-HOJSBT                       PIC  X(02).
                     07  QXTS01-KSCSBT                       PIC  X(02).
                     07  QXTS01-JICSBT                       PIC  X(02).
                     07  QXTS01-TELSBT                       PIC  X(02).
                     07  QXTS01-MAPSBT                       PIC  X(02).
                     07  QXTS01-DUMMY6                       PIC  X(08).
                 05  QXTS01-DB-INDEX.
                     07  QXTS01-ANSIX                        PIC  9(06).
                     07  QXTS01-KMSIX                        PIC  9(06).
                     07  QXTS01-CREIX                        PIC  9(06).
                     07  QXTS01-HOJIX                        PIC  9(06).
                     07  QXTS01-KSCIX                        PIC  9(06).
                     07  QXTS01-JICIX                        PIC  9(06).
                     07  QXTS01-TELIX                        PIC  9(06).
                     07  QXTS01-MAPIX                        PIC  9(06).
                     07  QXTS01-DUMMY7                       PIC  X(24).
                 05  FILLER                                  PIC  X(10).
