      *8...........2.........3.........4.........5........6........7.........8  
      *    QXB250
      ****************************************************************
      *                計上時ステ－タスファイル                      *
      *                             DATA-WRITTEN  05.05.01           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   * 
      ****************************************************************    
           03          ()-SEG.                          *>計上時ステ－タス
             05        ()-PRM.                          *>キ－項目
               07      ()-PRMROKE.                      *>ロケ－ションキ－
                 09    ()-PRMKIGYOUCD       PIC  X(04). *>企業コ－ド
                 09    ()-PRMSUBRANGEKEY    PIC  X(04). *>サブレンジキ－
               07      ()-PRMNAIBUKAIINNO   PIC  X(08). *>内部会員番号
               07      ()-PRMTORIHIKINO     PIC  9(07). *>取引通番
             05        ()-GAIBUKAIINNO.                 *>会員情報
               07      ()-POSSTATUS         PIC  X(02). *>ＰＯＳステ－タス
               07      ()-DAIHYOSTATUS      PIC  X(04). *>代表ステ－タス
               07      ()-KEIJYOSTATUS.                 *>計上ステ－タステ－ブル
                 09    ()-KEIJYOTOUROKUBI01 PIC  9(08). *>計上ステータス登録日０１
                 09    ()-KEIJYOSTATUS01    PIC  X(04). *>計上ステ－ﾀｽ０１
                 09    ()-KEIJYOTOUROKUBI02 PIC  9(08). *>計上ステータス登録日０２
                 09    ()-KEIJYOSTATUS02    PIC  X(04). *>計上ステ－ﾀｽ０２
                 09    ()-KEIJYOTOUROKUBI03 PIC  9(08). *>計上ステータス登録日０３
                 09    ()-KEIJYOSTATUS03    PIC  X(04). *>計上ステ－ﾀｽ０３
                 09    ()-KEIJYOTOUROKUBI04 PIC  9(08). *>計上ステータス登録日０４
                 09    ()-KEIJYOSTATUS04    PIC  X(04). *>計上ステ－ﾀｽ０４
                 09    ()-KEIJYOTOUROKUBI05 PIC  9(08). *>計上ステータス登録日０５
                 09    ()-KEIJYOSTATUS05    PIC  X(04). *>計上ステ－ﾀｽ０５
             05        ()-NEGAJYOUHO.                   *>ネガ情報
               07      ()-NEGACODE          PIC  X(04). *>ネガコ－ド
               07      ()-NEGAJIKOBI        PIC  9(08). *>事故日
             05        ()-SEIGYOJYOUHO.                 *>制御情報
               07      ()-SEIGYOSIKIBETUKUBUN  PIC  X(01).  *>識別区分
               07      ()-TEIKEITORIHIKITUUBAN PIC  9(13). *>提携取引通番
               07      ()-HOSTSHORIYMD      PIC  X(08). *>計上処理日
               07      ()-HOSTSHORITIME     PIC  X(06). *>計上処理時刻
             05        ()-FILLER            PIC  X(06). *>予備                                                          
             05        ()-SVRKKOUSHINYMD    PIC  9(08). *>サ－バ更新日
             
