*発動超必殺技
くぬぎ「受けてみなさい！必殺・八咫からす！！」[wt7]
[macro name="SuperArts"]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;
//残HPボーナス
if(f.HP < f.EnHP){
  f.HPBonus = (f.EnHP - f.HP)/f.EnHP + 1;
}

tf.ATP = Math.floor(f.STR * 5  * f.HPBonus * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[endmacro]
[SuperArts]

敵の体力が[emb exp="tf.Damage"]減少した。[wt7]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.FP = 0"]
[showStatus]
[jump storage="battle.ks" target="*戦闘終了" cond="f.EnHP <= 0"]
[jump storage="battle.ks" target="*戦闘続行" cond="f.EnHP > 0"]


*身代わりの術
「代わり身の術」[wt7]
くぬぎは敵の攻撃を回避した[wt5]
くぬぎは脱衣状態になった[wt5]
くぬぎの淫力が上昇した[wt5]
[eval exp="f.APP = f.APP + 1"]
[eval exp="f.Pary = 0, f.Undress = 1"]
[jump storage="battle.ks" target="*戦闘続行"]
error[s]

*被虐体質
くぬぎは痛みに快感を覚えた[wt7]
[Masochism]
[eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
[showStatus]

[jump storage="battle.ks" target="*戦闘終了" cond="f.HP <= 0"]
[jump storage="battle.ks" ttarget="*戦闘絶頂" cond="f.ERO >= 100"]
[jump storage="battle.ks" target="*戦闘続行" cond="f.HP > 0"]
error[s]


*発動敵超必殺技
[jump target="*敵１超必殺技" cond="f.enemy==1"]
[jump target="*敵２超必殺技" cond="f.enemy==2"]
[jump target="*敵３超必殺技" cond="f.enemy==3"]
error[s]


*敵１超必殺技
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Buff = f.EnVBonus * f.EnVBuff;
tf.DeBuff = (100 - f.CharmBuff) / 100;
if (tf.DeBuff < 0){tf.DeBuff = 0};

//alert('バフは' + tf.Buff + '、デバフは' +tf.DeBuff);

tf.ATP = Math.floor(f.EnSTR * 4.5 * tf.DeBuff * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[eval exp="f.EnFP = 0"]
敵「散れい！小娘！！」[wt7]

[jump target="*身代わりの術" cond="f.Pary > 0"]

[call storage="voicePL.ks" target="*悲鳴"]
くぬぎの体力が[emb exp="tf.Damage"]減少した。[wt7]
[eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
[showStatus]

[jump target="*被虐体質" cond="f.Maso > 0"]

[jump storage="battle.ks" target="*戦闘終了" cond="f.HP <= 0"]
[jump storage="battle.ks" target="*戦闘続行" cond="f.HP > 0"]


*敵２超必殺技
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Buff = f.EnVBonus * f.EnVBuff;
tf.DeBuff = (100 - f.CharmBuff) / 100;
if (tf.DeBuff < 0){tf.DeBuff = 0};

//alert('バフは' + tf.Buff + '、デバフは' +tf.DeBuff);

tf.ATP = Math.floor(f.EnSTR * 4.5 * tf.DeBuff * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[eval exp="f.EnFP = 0"]

敵「散れい！小娘！！」[wt7]

[jump target="*身代わりの術" cond="f.Pary > 0"]

[call storage="voicePL.ks" target="*悲鳴"]
くぬぎの体力が[emb exp="tf.Damage"]減少した。[wt7]
[eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
[showStatus]

[jump target="*被虐体質" cond="f.Maso > 0"]

[jump storage="battle.ks" target="*戦闘終了" cond="f.HP <= 0"]
[jump storage="battle.ks" target="*戦闘続行" cond="f.HP > 0"]


*敵３超必殺技
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Buff = f.EnVBonus * f.EnVBuff;
tf.DeBuff = (100 - f.CharmBuff) / 100;
if (tf.DeBuff < 0){tf.DeBuff = 0};

//alert('バフは' + tf.Buff + '、デバフは' +tf.DeBuff);

tf.ATP = Math.floor(f.EnSTR * 4.5 * tf.DeBuff * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[eval exp="f.EnFP = 0"]

敵「散れい！小娘！！」[wt7]

[jump target="*身代わりの術" cond="f.Pary > 0"]

[call storage="voicePL.ks" target="*悲鳴"]
くぬぎの体力が[emb exp="tf.Damage"]減少した。[wt7]
[eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
[showStatus]

[jump target="*被虐体質" cond="f.Maso > 0"]

[jump storage="battle.ks" target="*戦闘終了" cond="f.HP <= 0"]
[jump storage="battle.ks" target="*戦闘続行" cond="f.HP > 0"]
