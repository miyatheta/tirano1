*スタート
敵に敗れたくぬぎは里まで運ばれ囚われの身となった[lrcm]
調教の内容によって状態異常になります[l]
[glink target="*過敏" text="過敏" color="red" size=15 x=50 y=70]
[glink target="*発情" text="発情" color="red" size=15 x=50 y=100]
[glink target="*寄生" text="寄生" color="red" size=15 x=50 y=130]
[glink target="*被虐" text="被虐" color="red" size=15 x=50 y=160]
[glink target="*淫乱" text="淫乱" color="red" size=15 x=50 y=190]
[glink target="*催淫" text="催淫" color="red" size=15 x=50 y=220]
[s]

*過敏
;//超感度：秘所への攻撃によるダメージ増加。
[eval exp="f.Ampl = 1 , f.countAmpl = 1"]
くぬぎは感度増幅状態になった[lrcm]
[jump target="*終了"]

*発情
;//発情:毎ターン快感度が上昇。
[eval exp="f.Estr = 1 , f.countEstr = 1"]
くぬぎは発情状態になった[lrcm]
[jump target="*終了"]

*寄生
;//蟲憑：３の倍数のターンに気力減少。気力がない場合快感上昇。
[eval exp="f.Paras = 1 , f.countParas = 1"]
くぬぎは寄生蟲に寄生された[lrcm]
[jump target="*終了"]

*被虐
;//被虐：被ダメージ時に快感度上昇。
[eval exp="f.Maso = 1 , f.countMaso = 1"]
くぬぎは被虐状態になった[lrcm]
[jump target="*終了"]

*射乳
;//射乳：胸の感度が上昇。Bitchから変更
[eval exp="f.Boob = 1 , f.countBoob = 1"]
くぬぎは射乳体質になった[lrcm]
[jump target="*終了"]

*催淫
;//催淫：房中時に敵に従ってしまう
[eval exp="f.Hypno = 1 , f.countHypno = 1"]
くぬぎは催淫状態になった[lrcm]
[jump target="*終了"]

*終了
くぬぎは隙を見て逃げ出した[lrcm]
[eval exp="f.stage=1"]
[jump storage="selectStage.ks" target="*ステージセレクト"]
