      ****************************************************************
      *    会員家族属性ファイル 　            ID:QTS810              *
      *          RL：250Byte                  DATA-WRITTEN  03.01.10 *
      *--------------------------------------------------------------*
      *            修  正  履  歴                                    *
      *    管理NO            修正理由              担当者  修正日付  *
      *   1102086  会員家族属性Ｆのﾚｲｱｳﾄ変更    FIP.江里口 20110522  *
      ****************************************************************
            03  QTS810-REC.
                05  QTS810-PRMNAIBUKAIINNO        PIC  X(016).
                05  QTS810-PRMRIYOUSHACD          PIC  X(001).
                05  QTS810-EDABAN                 PIC  X(001).
                05  QTS810-CDHHAKKOUKBN           PIC  X(001).
                05  QTS810-KZKZOKUGARA            PIC  X(001).
      *DEL 20110522 1102086 FIP ERIGUCHI START
      *         05  QTS810-KZKSHIMEIKANA          PIC  X(030).
      *         05  QTS810-KZKSHIMEIKAN           PIC  N(015).
      *DEL 20110522 1102086 FIP ERIGUCHI END
                05  QTS810-KZKSEINENGAPPI         PIC  X(010).
                05  QTS810-KZKSEX                 PIC  X(001).
      *MOD 20110522 1102086 FIP ERIGUCHI START
      *         05  QTS810-CARD        OCCURS  10.   
      *             07  QTS810-STSCARD            PIC  X(004).
      *             07  QTS810-STSCARDTOROKUYMD   PIC  X(010).
                05  QTS810-CARD        OCCURS   4.   
                    07  QTS810-STSCARD            PIC  X(004).
                    07  QTS810-STSCARDTOROKUYMD   PIC  X(010).
      *MOD 20110522 1102086 FIP ERIGUCHI END
                05  QTS810-SYORIYMD               PIC  X(010).
      *         05  FILLER                        PIC  X(000).
