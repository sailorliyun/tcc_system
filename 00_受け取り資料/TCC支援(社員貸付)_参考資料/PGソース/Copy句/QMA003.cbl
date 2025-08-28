      *8...........2.........3.........4.........5........6........7.........8
      *    QMA003
      ****************************************************************
      *                抽出条件ファイル                              *
      *                             DATA-WRITTEN  06.02.07           *
      *--------------------------------------------------------------*
      *                  修  正  履  歴                              *
      *   管理NO            修正理由             担当者   修正日付   *
      ****************************************************************
            03        ()-SEG.                               *>
              05      ()-JYOKENDATA.                        *>抽出条件Ｔ情報
                07    ()-PRMRENBAN           PIC  9(001).   *>処理連番
                07    ()-PRMPCANID1          PIC  X(002).   *>キャンペンID１
                07    ()-PRMPCANID2          PIC  X(003).   *>キャンペンID２
                07    ()-PRMOYOKORENBAN      PIC  9(001).   *>親子連番
                07    ()-PCANMEI             PIC  X(060).   *>キャンペン名称
                07    ()-SYUKEIKBN           PIC  X(001).   *>集計期間区分
                07    ()-SYUKEIFROM          PIC  X(008).   *>集計期間FROM
                07    ()-SYUKEITO            PIC  X(008).   *>集計期間TO
                07    ()-RIYOUKNG            PIC  9(013).   *>利用額
                07    ()-RIYOKAISU           PIC  9(005).   *>利用回数
                07    ()-ENTRYKBN            PIC  X(001).   *>エントリ区分
                07    ()-REVSMAITSUKI        PIC  9(003).   *>リボS毎月分 
                07    ()-PFUTANKBN           PIC  X(001).   *>ポ負担区分
                07    ()-PFUTANRITSU         PIC  9(003).   *>ポ負担割合
                07    ()-POINTMEI            PIC  N(020).   *>ポ名称
                07    ()-PFUYOTSUKI          PIC  X(006).   *>ポ付与月
                07    ()-CHUSENNINSU01       PIC  9(007).   *>抽選人数０１
                07    ()-FUYOPOINT01         PIC  9(009).   *>付与ポ０１
                07    ()-CHUSENNINSU02       PIC  9(007).   *>抽選人数０２
                07    ()-FUYOPOINT02         PIC  9(009).   *>付与ポ０２
                07    ()-CHUSENNINSU03       PIC  9(007).   *>抽選人数０３
                07    ()-FUYOPOINT03         PIC  9(009).   *>付与ポ０３
              05      FILLER                 PIC  X(015).   *>予備
              05      ()-CR                  PIC  X(001).   *>改行コード
