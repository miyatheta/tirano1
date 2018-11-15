*組付選択
[if exp="f.StanOrga==1"]
くぬぎは絶頂の余韻から復帰した[lrcm]
[eval exp="f.StanOrga=0"][showStatus]
[endif]

[showStatus]
[iscript]
tf.Min = 0, tf.Max = 89;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice < 30){
  tf.EnHand="グー";
}else if(tf.dice > 60){
  tf.EnHand="チョキ";
}else{
  tf.EnHand="パー";
}
[endscript]
[glink text="暴れる" exp="tf.hand='グー'" target="*組付比較" color="red" size=15 x=0 y=50]
[glink text="頭突き" exp="tf.hand='チョキ'" target="*組付比較" color="red" size=15 x=0 y=100]
[glink text="引っ掻く" exp="tf.hand='パー'" target="*組付比較" color="red" size=15 x=0 y=150]
[glink text="振りほどく" exp="tf.hand='グー'" target="*組付比較" color="red" size=15 x=150 y=50]
[glink text="噛み付く" exp="tf.hand='チョキ'" target="*組付比較" color="red" size=15 x=150 y=100]
[glink text="身を捩る" exp="tf.hand='パー'" target="*組付比較" color="red" size=15 x=150 y=150]
[s]

*組付比較
くぬぎは敵に拘束されている！[lrcm]
くぬぎの敏捷が減少した[lrcm]
[eval exp="f.SPD = f.SPD - 1"][eval exp="f.SPD = 0" cond="f.SPD < 0"]
[showStatus]
くぬぎ「このっ!離しなさいよ！」[l][r]
くぬぎは抵抗した！！[lrcm]

[if exp="tf.hand == 'グー' && tf.EnHand == 'チョキ'"][eval exp="f.resist=5"][endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'パー'"][eval exp="f.resist=5"][endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'グー'"][eval exp="f.resist=5"][endif]
[if exp="tf.hand == 'グー' && tf.EnHand == 'パー'"][eval exp="f.resist=1"][endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'グー'"][eval exp="f.resist=1"][endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'チョキ'"][eval exp="f.resist=1"][endif]
[if exp="tf.hand == 'グー' && tf.EnHand == 'グー'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'チョキ'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'パー'"][eval exp="f.resist=2"][endif]


*抵抗成功
[iscript]
tf.Min = 1, tf.Max = 20;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 100) + 1;
f.resistPower = Math.floor(9 * f.resist * tf.randomNum);
f.BindPower = f.BindPower - f.resistPower;
if(f.BindPower < 0){f.BindPower = 0;}
[endscript]

[if exp="f.BindPower <= 0"]
くぬぎは敵の拘束を振りほどいた[lrcm]
[jump target="*組付終了"]
[endif]

[if exp="f.resist > 2"]
敵の拘束が大きく緩んだ。[lrcm]
[elsif exp="f.resist > 1"]
敵の拘束が少し緩んだ。[lrcm]
[else]
しかし、敵の拘束は緩まなかった[lrcm]
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
  f.ERO = f.ERO + Math.floor(10 * f.ARS);
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
[jump target="*敵絶頂組付時" cond="f.EnERO >= 100"]
[jump target="*組付選択"]

*拘束絶頂
[cm]
くぬぎ「あっ・・・・！」[lrcm]
くぬぎ（嫌っ・・・こんな、ところで・・・・！！）[lrcm]
くぬぎ（でも、もう我慢出来ない・・・・！！）[lrcm]
くぬぎ「イクッ・・・・！！」[lrcm]
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

*組付終了
[eval exp="f.Clutch = 0"]
[jump storage="battle.ks" target="*ターン開始"]

*敵絶頂組付時
敵「くそっ！もう堪らん！！」[lrcm]
敵はくぬぎ押し倒した[lrcm]
[jump storage="bochu.ks" target="*房中開始"]
