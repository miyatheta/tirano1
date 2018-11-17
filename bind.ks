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
くぬぎは敵に拘束されている！[lrcm]
くぬぎの敏捷が減少した[lrcm]
[eval exp="f.SPD = f.SPD - 1"][eval exp="f.SPD = 0" cond="f.SPD < 0"]
[showStatus]

[if exp="f.StanOrga==1"]
  くぬぎは絶頂の余韻から復帰した[lrcm]
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
  くぬぎ「このっ!離しなさいよ！」[l][r]
  くぬぎは抵抗した！！[lrcm]

[elsif exp="tf.Select<=3"]
  くぬぎ「このっ!離しなさいよ！」[l][r]
  くぬぎは抵抗した！！[lrcm]
  [iscript]
  tf.Min = 0, tf.Max = 50;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  tf.randomNum = (tf.dice / 1000) + 1;
  tf.Damage = Math.floor(f.STR * 0.3 * tf.randomNum);
  [endscript]
  敵の体力が[emb exp="tf.Damage"]減少した。[lrcm]
  [eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
  [eval exp="f.EnFP = f.EnFP + 10"]
  [showStatus]
  [jump storage="battle.ks" target="*戦闘終了" cond="f.EnHP <= 0"]

[elsif exp="tf.Select==4"]
  くぬぎ「ああんっ！・・・」[l][r]
  くぬぎは痛がるように甘い声を上げてみせた[lrcm]
  敵♡[lrcm]
  [eval exp="f.EnARS = f.EnARS + 0.05"]

[elsif exp="tf.Select==5"]
  くぬぎは敵に体を密着させるようにしなだれかかった[lrcm]
  敵♡[lrcm]
  [eval exp="f.EnARS = f.EnARS + 0.05"]
[endif]

[jump target="*組付終了" cond="f.BindPower <= 0"]

[if exp="f.ResistPower == 45"]
  敵の拘束が大きく緩んだ。[lrcm]
[elsif exp="f.ResistPower == 28"]
  敵の拘束が少し緩んだ。[lrcm]
[elsif exp="f.ResistPower == 19"]
  しかし、敵の拘束は緩まなかった[lrcm]
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

[if exp="f.EnBindOption==1"]
  [iscript]
  amp = f.Ampl + 1;
  f.ERO = f.ERO + Math.floor(10 * f.ARS * amp);
  f.EnERO = f.EnERO + Math.floor(5 * f.EnARS);
  [endscript]
  敵はくぬぎの胸を揉みしだいた[lrcm]
  くぬぎの快感度が上昇した[r]
  敵の興奮度が上昇した[lrcm]
  [showStatus]
  [jump target="*拘束絶頂" cond="f.ERO >= 100"]
[endif]

[if exp="f.EnBindOption==2"]
  [iscript]
  tf.Min = 0, tf.Max = 50;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  tf.randomNum = (tf.dice / 1000) + 1;
  tf.Damage = Math.floor(f.EnSTR * 0.3 * tf.randomNum);
  [endscript]
  敵はくぬぎを締め上げた[lrcm]
  [eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
  くぬぎの体力が[emb exp="tf.Damage"]減少した[lrcm]
  [eval exp="f.FP = f.FP + 10"]
  [showStatus]
  [jump storage="battle.ks" target="*戦闘終了" cond="f.EnHP <= 0"]
  [jump target="*被虐趣味" cond="f.Maso > 0"]
[endif]

[if exp="f.EnBindOption==3"]
  [iscript]
  f.EnERO = f.EnERO + Math.floor(10 * f.EnARS);
  [endscript]
  敵はくぬぎの尻に股間を押し付けてきた[lrcm]
  くぬぎ「ひっ！」[lrcm]
  敵の興奮度が上昇した[lrcm]
  [showStatus]
[endif]

[jump target="*組付継続"]


*被虐趣味
くぬぎは痛みに快感を感じた[lrcm]
[iscript]
amp = f.Ampl + 1;
tf.Damage = Math.floor(2 * f.ARS * amp);
[endscript]
[eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
[showStatus]
[jump target="*拘束絶頂" cond="f.ERO >= 100"]
[jump target="*組付継続"]


*組付継続
[if exp="f.Estr > 0"]
  発情しているくぬぎは快感を覚えた[lrcm]
  [iscript]
  amp = f.Ampl + 1;
  tf.Damage = Math.floor(2 * f.ARS * amp);
  [endscript]
  [eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
[endif]
[jump target="*拘束絶頂" cond="f.ERO >= 100"]
[jump target="*敵絶頂組付時" cond="f.EnERO >= 100"]
[jump target="*組付選択"]


*組付終了
くぬぎは敵の拘束を振りほどいた[lrcm]
[eval exp="f.Clutch = 0"]
[jump storage="battle.ks" target="*ターン開始"]


*拘束絶頂
[cm]
くぬぎ「あっ・・・・！」[lrcm]
くぬぎ（嫌っ・・・こんなことで・・・・！！）[lrcm]
くぬぎ（でも、もう・・・耐えられない！！！）[lrcm]
くぬぎ「もうっ・・・ダメェ！！」[lrcm]
くぬぎ「イクッ・・・・！！いくううううう！！」[lrcm]
くぬぎは絶頂を迎えた。[lrcm]
[eval exp="f.ERO = 0"][showStatus]
くぬぎの感度が上昇した。[lrcm]
[eval exp="f.ARS = f.ARS + 0.1"][showStatus]
[wait time=500]
;組付選択等割愛
くぬぎ「はぁ・・・・はぁ・・・・」[lrcm]
絶頂の余韻でくぬぎは動けない！！[lrcm]
[eval exp="f.StanOrga=1"][showStatus]
[jump target="*組付攻撃"]


*敵絶頂組付時
敵「くそっ！もう堪らん！！」[lrcm]
敵はくぬぎ押し倒した[lrcm]
[jump storage="bochu.ks" target="*房中開始"]
