*組付開始
[macro name="Resist"]
[iscript]
array = [5,5,4,4,3,3];
tf.RRate = [];
for(i = 0; i < 6; i++){
  tf.dice = Math.floor(Math.random() * array.length);
  tf.RRate[i] = array.splice(tf.dice, 1);
}

P = tf.Resist * tf.RRate[tf.Select];
if(P>=30){
  f.ResistPower = 45;
}else if(P>=10){
  f.ResistPower = 28;
}else{
  f.ResistPower = 19;
}

f.BindPower = f.BindPower - f.ResistPower;
if(f.BindPower < 0){f.BindPower = 0;}
[endscript]
[endmacro]


*組付選択
くぬぎは敵に拘束されている！[wt7]
くぬぎの敏捷が減少した[wt5]
[eval exp="f.SPD = f.SPD - 5"][eval exp="f.SPD = 0" cond="f.SPD < 0"]
[showStatus]

[if exp="f.StanOrga==1"]
  くぬぎは絶頂の余韻から復帰した[wt5]
  [eval exp="f.StanOrga=0"]
  [showStatus]
[endif]

[glink exp="tf.Select=0,tf.Resist=9" target="*抵抗判定" text="振りはらう" color="red" size=15 x=0 y=50]
[glink exp="tf.Select=1,tf.Resist=9" target="*抵抗判定" text="押しのける" color="red" size=15 x=200 y=50]
[glink exp="tf.Select=2,tf.Resist=6" target="*抵抗判定" text="肘打ちする" color="red" size=15 x=0 y=100]
[glink exp="tf.Select=3,tf.Resist=6" target="*抵抗判定" text="暴れる" color="red" size=15 x=200 y=100]
[glink exp="tf.Select=4,tf.Resist=2" target="*抵抗判定" text="甘い声を上げる" color="red" size=15 x=0 y=150]
[glink exp="tf.Select=5,tf.Resist=2" target="*抵抗判定" text="しなだれかかる" color="red" size=15 x=200 y=150]
[s]


*抵抗判定
[Resist]

[if exp="tf.Select<=1"]
  くぬぎ「このっ!離しなさいよ！」[wt5]
  くぬぎは抵抗した！！[wt5]

[elsif exp="tf.Select<=3"]
  くぬぎ「このっ!離しなさいよ！」[wt5]
  くぬぎは抵抗した！！[wt5]
  [iscript]
  tf.Min = 0, tf.Max = 50;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  tf.randomNum = (tf.dice / 1000) + 1;
  tf.Damage = Math.floor(f.STR * 0.3 * tf.randomNum);
  [endscript]
  敵の体力が[emb exp="tf.Damage"]減少した。[wt5]
  [eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
  [eval exp="f.EnFP = f.EnFP + 10"]
  [showStatus]
  [jump storage="battle.ks" target="*戦闘終了" cond="f.EnHP <= 0"]

[elsif exp="tf.Select==4"]
  くぬぎ「ああんっ！・・・」[wt7]
  くぬぎは甘い声を上げてみせた[wt7]
  くぬぎの淫力が上昇した[wt5]
  [eval exp="f.APP= f.APP+ 2"]

[elsif exp="tf.Select==5"]
  くぬぎは敵に体を密着させるようにしなだれかかった[wt7]
  くぬぎの淫力が上昇した[wt5]
  [eval exp="f.APP= f.APP+ 2"]
[endif]

[jump target="*組付終了" cond="f.BindPower <= 0"]

[if exp="f.ResistPower == 45"]
  敵の拘束が大きく緩んだ。[wt5]
[elsif exp="f.ResistPower == 28"]
  敵の拘束が少し緩んだ。[wt5]
[elsif exp="f.ResistPower == 19"]
  しかし、敵の拘束は緩まなかった[wt5]
[else]
  エラー[s]
[endif]


*組付攻撃
[iscript]
tf.Min = 0, tf.Max = 89;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice < 30){
  f.EnBindOption=1;
}else if(tf.dice > 60){
  f.EnBindOption=2;
}else{
  f.EnBindOption=3;
}
[endscript]
[jump target="*組付攻撃A" cond="f.EnBindOption == 1"]
[jump target="*組付攻撃B" cond="f.EnBindOption == 2"]
[jump target="*組付攻撃C" cond="f.EnBindOption == 3"]
エラー[s]

*組付攻撃A
[iscript]
sexAppeal = 1 + (f.APP - 50) / 100;
f.EnDamage = Math.floor(6 * sexAppeal);
f.EnERO = f.EnERO + f.EnDamage;
[endscript]
敵はくぬぎの尻に股間を押し付けてきた[wt5]
くぬぎ「ひっ！」[wt7]
敵の興奮度が[emb exp="f.EnDamage"]上昇した[wt5]
[showStatus]
[if exp="f.Hypno > 0"]
くぬぎ（アァ・・・ソレヲ・・・イレテェ）[wt7]
くぬぎ「！」[wt7]
くぬぎ（いけない、流されちゃダメ！）[wt7]
催淫状態のくぬぎは快楽への誘惑に抵抗した[wt7]
くぬぎの精神力が減少した[wt7]
[eval exp="f.MND = f.MND - 3"]
[showStatus]
[endif]
[jump target="*組付継続"]
[s]

*組付攻撃B
[iscript]
tf.Damage = Math.floor(6 * f.SEN / 100);
f.ERO = f.ERO + tf.Damage;
sexAppeal = 1 + (f.APP - 50) / 100;
f.EnDamage = Math.floor(3 * sexAppeal);
f.EnERO = f.EnERO + f.EnDamage;
[endscript]
敵はくぬぎの胸を揉みしだいた[wt5]
くぬぎの快感度が[emb exp="tf.Damage"]上昇した[wt5]
敵の興奮度が[emb exp="f.EnDamage"]上昇した[wt5]
[showStatus]
[if exp="f.Hypno > 0"]
くぬぎ（キモチイイ・・・モット・・・）[wt7]
くぬぎ「！」[wt7]
くぬぎ（いけない、流されちゃダメ！）[wt7]
催淫状態のくぬぎは快楽への誘惑に抵抗した[wt7]
くぬぎの精神力が減少した[wt7]
[eval exp="f.MND = f.MND - 3"]
[showStatus]
[endif]
[jump target="*拘束絶頂" cond="f.ERO >= 100"]
[jump target="*組付継続"]
[s]

*組付攻撃C
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;
tf.Damage = Math.floor(f.EnSTR * 0.3 * tf.randomNum);
[endscript]
敵はくぬぎを締め上げた[wt5]
[eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
くぬぎの体力が[emb exp="tf.Damage"]減少した[wt5]
[eval exp="f.FP = f.FP + 10"]
[showStatus]
[jump storage="battle.ks" target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*被虐趣味" cond="f.Maso > 0"]
[jump target="*組付継続"]
[s]


*被虐趣味
くぬぎは被虐の快感を感じた[wt5]
[Masochism]
[eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
[showStatus]
[jump target="*拘束絶頂" cond="f.ERO >= 100"]
[jump target="*組付継続"]


*組付継続
[if exp="f.Estr > 0"]
  発情状態のくぬぎは快感度が上昇した[wt5]
  [Estrus]
  [eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
  [showStatus]
[endif]
[if exp="f.Bitch > 0"]
  淫乱状態のくぬぎは淫力が上昇した[wt5]
  [eval exp="f.APP = f.APP + 2"]
  [showStatus]
[endif]
[jump target="*拘束絶頂" cond="f.ERO >= 100"]
[jump target="*敵絶頂組付時" cond="f.EnERO >= 100"]
[jump target="*組付選択"]


*組付終了
[if exp="tf.Select >= 4"]
  敵は思わずくぬぎを掴む手を緩めた[wt7]その隙を突いて
[endif]
くぬぎは敵の拘束を振りほどいた[wt7]
[eval exp="f.Clutch = 0"]
[jump storage="battle.ks" target="*ターン開始"]


*拘束絶頂
[cm]
くぬぎ「あっ・・・・！」[wt7]
くぬぎ（嫌っ・・・こんなことで・・・・！！）[wt7]
くぬぎ（でも、もう・・・耐えられない！！！）[wt7]
くぬぎ「もうっ・・・ダメェ！！」[wt7]
くぬぎ「イクッ・・・・！！いくううううう！！」[wt7]
くぬぎは絶頂を迎えた。[wt5]
[eval exp="f.ERO = 0"][showStatus]
くぬぎの快感への抵抗が低下した[wt5]
[eval exp="f.SEN = f.SEN + 20"][showStatus]
[wait time=500]
;組付選択等割愛
くぬぎ「はぁ・・・・はぁ・・・・」[wt7]
絶頂の余韻でくぬぎは動けない！！[wt5]
[eval exp="f.StanOrga=1"][showStatus]
[jump target="*組付攻撃"]


*敵絶頂組付時
敵「くそっ！もう堪らん！！」[wt7]
敵はくぬぎ押し倒した[wt7]
[jump storage="bochu.ks" target="*房中開始"]
