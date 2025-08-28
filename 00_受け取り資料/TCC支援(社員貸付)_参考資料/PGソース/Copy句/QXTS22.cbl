      *****************************************************************
      * ランク変更／停止依頼ファイル（依頼対象外時も同様のレイアウト）
      *****************************************************************
           03  QXTS22-UPDRANK.
               05  QXTS22-KEY-INFO.
                   07  QXTS22-TABANO            PIC X(05).
                   07  QXTS22-KIGYOUCD          PIC X(04).
                   07  QXTS22-SUBRANGEKEY       PIC X(04).
                   07  QXTS22-NAIBUKAIINNO      PIC X(08).
               05  QXTS22-UPD-INFO.
                   07  QXTS22-HIRAISTATUS       PIC X(01).
                   07  QXTS22-HOST-UPDBEF-INFO.
                       09  QXTS22-HPOSSTATUS    PIC X(02).
                       09  QXTS22-HDAIHYOSTATUS PIC X(04).
                       09  QXTS22-HYOSINRANK    PIC X(01).
                       09  QXTS22-HCASHLIMIT    PIC X(05).
                   07  QXTS22-SERVER-IRAI-INFO.
                       09  QXTS22-SRVIRAIUMU    PIC X(01).
                       09  QXTS22-ENDYOSINRANK  PIC X(01).
                       09  QXTS22-ENDCASHLIMIT  PIC X(05).
                       09  QXTS22-SRVHANTEI     PIC X(01).
                       09  QXTS22-ENDTANTOID    PIC X(08).
                       09  QXTS22-ENDSHORIDATE  PIC X(08).
                       09  QXTS22-ENDSHORITIME  PIC X(06).
               05  QXTS22-HOST-KEKKA-INFO.
                   07  QXTS22-UPDKBN            PIC X(01).
                   07  QXTS22-NGSYUBETU         PIC X(02).
                   07  QXTS22-UPDDATE           PIC X(08).
                   07  QXTS22-UPDTIME           PIC X(06).
               05  QXTS22-NORMAL-PROC-INFO.
                   07  QXTS22-BUNSHOUMU         PIC X(01).
                   07  QXTS22-BUNSHOKANRINO     PIC X(04).
               05  QXTS22-SEND-INFO.
                   07  QXTS22-STRDATE           PIC X(08).
                   07  QXTS22-STRTIME           PIC X(06).
               05  QXTS22-JUSIN-INFO.
                   07  QXTS22-CREATEDATE        PIC X(08).
                   07  QXTS22-CREATETIME        PIC X(06).
               05  FILLER                       PIC X(06).
