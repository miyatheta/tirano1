*スタート
敵に敗れたくぬぎは里まで運ばれ囚われの身となった[lrcm]
調教の内容によって状態異常になります[l]
[glink target="*過敏" text="過敏" color="red" size=15 x=50 y=70]
[glink target="*発情" text="発情" color="red" size=15 x=50 y=100]
[glink target="*射乳" text="射乳" color="red" size=15 x=50 y=130]
[glink target="*被虐" text="被虐" color="red" size=15 x=50 y=160]
[glink target="*淫乱" text="淫乱" color="red" size=15 x=50 y=190]
[glink target="*催淫" text="催淫" color="red" size=15 x=50 y=220]
[s]

*過敏
;//超感度：秘所への攻撃によるダメージ増加。
;毒使いによる薬物投与。
[eval exp="f.Ampl = 1"]
くぬぎは過敏状態になった[lcrm]
[jump target="*終了"]

*発情
;//発情:毎ターン快感度が上昇。
;エロの達人の精液にある効果で発症。
[eval exp="f.Estr = 1"]
くぬぎは発情状態になった[lcrm]
[jump target="*終了"]

*射乳
;//寄生：絶頂時に乳を出す。どこかのタイミングで出産を行うことになる。
;虫使いに蟲の幼生を植え付けられた状態
[eval exp="f.Paras = 1"]
くぬぎは射乳状態になった[lcrm]
[jump target="*終了"]

*被虐
;//被虐：被ダメージ時に快感度上昇。
;力自慢に強引に犯される中で開眼。
[eval exp="f.Maso = 1"]
くぬぎは被虐状態になった[lcrm]
[jump target="*終了"]

*淫乱
;//淫乱：セリフが変化。絶頂すると精神力が回復する。
;堅物系の敵から主導権を取ることで目覚めてしまう。
[eval exp="f.Bitch = 1"]
くぬぎは淫乱状態になった[lcrm]
[jump target="*終了"]

*催淫
;//催淫：房中時に敵に従ってしまう
;幻術使いに催眠をかけられた状態。
[eval exp="f.Hypno = 1"]
くぬぎは催淫状態になった[lcrm]
[jump target="*終了"]

*終了
くぬぎは隙を見て逃げ出した[lrcm]
[jump storage="selectStage.ks" target="*ステージセレクト"]
