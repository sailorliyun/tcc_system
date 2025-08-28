      *****************************************************************
      * CICâÒìöèÓïÒ
      *****************************************************************
           03  QBS003-DATA.
               05  QBS003-COMMON.
                     07  QBS003-INQNO                        PIC  9(06).
                     07  QBS003-USER2                        PIC  X(10).
                     07  QBS003-APPLHEADER.
                         09  QBS003-KWSID                    PIC  X(08).
                         09  QBS003-USER                     PIC  X(19).
                         09  QBS003-KAITO                    PIC  X(01).
                         09  QBS003-MADCD                    PIC  X(03).
                         09  QBS003-KIKAN                    PIC  X(02).
                     07  QBS003-SHOKAIDATA.
                         09  QBS003-CICSRV                   PIC  X(02).
                         09  QBS003-NETSRV                   PIC  X(02).
                         09  QBS003-NAME                     PIC  X(30).
                         09  QBS003-HJNAME                   PIC  X(30).
                         09  QBS003-SYMD                     PIC  9(07).
                         09  QBS003-YUBIN                    PIC  9(05).
                         09  QBS003-TEL                      PIC  X(14).
                         09  QBS003-TEL2                     PIC  X(14).
                         09  QBS003-CHIBAN                   PIC  X(03).
                         09  QBS003-HHOSYO                   PIC  X(01).
                         09  QBS003-KYKBN                    PIC  X(02).
                         09  QBS003-SHOHIN                   PIC  X(03).
                         09  QBS003-YUSHI                    PIC  S9(6).
                         09  QBS003-HARAI                    PIC  S9(3).
                         09  QBS003-HJCODE                   PIC  X(10).
                         09  QBS003-CHIIKI                   PIC  X(05).
                         09  QBS003-CHOU                     PIC  X(11).
                         09  QBS003-CHIG                     PIC  X(08).
                         09  QBS003-HEYAG                    PIC  X(04).
                         09  QBS003-MUNEG                    PIC  X(04).
                         09  QBS003-DUMMY1                   PIC  X(03).
                         09  QBS003-KAIIN                    PIC  X(06).
                     07  QBS003-Misiyo                       PIC  X(03).
                     07  QBS003-SEQNO                        PIC  9(18).
                 05  QBS003-KYOKU1                           PIC  X(20).
                 05  QBS003-KYOKU2                           PIC  X(20).
                 05  QBS003-CHIKU                            PIC  X(20).
                 05  QBS003-HH                               PIC  9(02).
                 05  QBS003-MM                               PIC  9(02).
                 05  QBS003-SS                               PIC  9(02).
                 05  QBS003-ERR                              PIC  X(46).
                 05  QBS003-SRERR                            PIC  X(20).
                 05  QBS003-SRSBT                            PIC  X(02).
                 05  QBS003-DUMMY3                           PIC  X(18).
                 05  QBS003-DUMMY4                           PIC  X(40).
                 05  QBS003-KAITOU-FLG.
                     07  QBS003-ANSFLG                       PIC  X(01).
                     07  QBS003-KMSFLG                       PIC  X(01).
                     07  QBS003-CREFLG                       PIC  X(01).
                     07  QBS003-HOJFLG                       PIC  X(01).
                     07  QBS003-KSCFLG                       PIC  X(01).
                     07  QBS003-JICFLG                       PIC  X(01).
                     07  QBS003-TELFLG                       PIC  X(01).
                     07  QBS003-MAPFLG                       PIC  X(01).
                     07  QBS003-DUMMY5                       PIC  X(04).
                 05  QBS003-KAITOU-DATASBT.
                     07  QBS003-ANSSBT                       PIC  X(02).
                     07  QBS003-KMSSBT                       PIC  X(02).
                     07  QBS003-CRESBT                       PIC  X(02).
                     07  QBS003-HOJSBT                       PIC  X(02).
                     07  QBS003-KSCSBT                       PIC  X(02).
                     07  QBS003-JICSBT                       PIC  X(02).
                     07  QBS003-TELSBT                       PIC  X(02).
                     07  QBS003-MAPSBT                       PIC  X(02).
                     07  QBS003-DUMMY6                       PIC  X(08).
                 05  QBS003-DB-INDEX.
                     07  QBS003-ANSIX                        PIC  9(06).
                     07  QBS003-KMSIX                        PIC  9(06).
                     07  QBS003-CREIX                        PIC  9(06).
                     07  QBS003-HOJIX                        PIC  9(06).
                     07  QBS003-KSCIX                        PIC  9(06).
                     07  QBS003-JICIX                        PIC  9(06).
                     07  QBS003-TELIX                        PIC  9(06).
                     07  QBS003-MAPIX                        PIC  9(06).
                     07  QBS003-DUMMY7                       PIC  X(24).
                 05  FILLER                                  PIC  X(10).
