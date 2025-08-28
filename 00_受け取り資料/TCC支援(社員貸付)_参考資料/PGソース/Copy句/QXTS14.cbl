      *****************************************************************
      * 限度額昇降データ会員マスタ
      *****************************************************************
              03  QXTS14-DATA.
                  05  QXTS14-KEY-INFO.
                     07  QXTS14-PRMTABANO                   PIC  X(05).
                     07  QXTS14-PRMKIGYOUCD                 PIC  X(04).
                     07  QXTS14-PRMSUBRANGEKEY              PIC  X(04).
                     07  QXTS14-PRMNAIBUKAIINNO             PIC  X(08).
                     07  QXTS14-HIRAISTATUS                 PIC  X(01).
                  05  QXTS14-HOSTKAIN-INFO.
                     07  QXTS14-CARDKBN                     PIC  X(06).
                     07  QXTS14-KAIINNO                     PIC  X(16).
                     07  QXTS14-SIMEI                       PIC  N(15).
                     07  QXTS14-REVSMAITSUKI                PIC  X(01).
                     07  QXTS14-REVSBONUS                   PIC  9(02).
                     07  QXTS14-REVCMAITSUKI                PIC  X(01).
                     07  QXTS14-REVCBONUS                   PIC  9(02).
                     07  QXTS14-KANRITEN                    PIC  9(02).
                     07  QXTS14-NYKAIYMD                    PIC  X(08).
                  05  QXTS14-HOSTSINSA-INFO.
                     07  QXTS14-CTLHONKNNAME                PIC  X(30).
                     07  QXTS14-HALFORONEKBN                PIC  X(01).
                     07  QXTS14-BIRTHDAY                    PIC  X(08).
                  05  QXTS14-HENSAI-INFO.
                     07  QXTS14-JIFURIKAISU                 PIC  9(02).
                     07  QXTS14-JIFURINGKAISU               PIC  9(02).
                     07  QXTS14-TEL1                        PIC  X(07).
                     07  QXTS14-TEL2                        PIC  X(04).
                     07  QXTS14-TEL3                        PIC  X(04).
                  05  QXTS14-KINMU-INFO.
                     07  QXTS14-KINKINMUKBN                 PIC  X(01).
                     07  QXTS14-KINKNNAME                   PIC  X(30).
                     07  QXTS14-KINTEL1                     PIC  X(07).
                     07  QXTS14-KINTEL2                     PIC  X(04).
                     07  QXTS14-KINTEL3                     PIC  X(04).
                  05  QXTS14-JITAKU-TEL.
                     07  QXTS14-HPOSSTATUS                  PIC  9(02).
                     07  QXTS14-HDAIHYOSTATUS               PIC  9(04).
                     07  QXTS14-HYOSINRANK                  PIC  X(01).
                     07  QXTS14-HCASHLIMIT                  PIC  9(05).
                  05  QXTS14-CRTDATE.
                     07  QXTS14-CRTDATE-YMD                 PIC  X(08).
                     07  QXTS14-CRTDATE-HMS                 PIC  X(06).
                  05  FILLER                                PIC  X(28).
