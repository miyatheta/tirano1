
*組付選択
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
くぬぎ「このっ!離しなさいよ！」[l][r]
くぬぎは抵抗した！！[l][r][cm]
[eval exp="f.FP = f.FP + 8"]

[if exp="tf.hand == 'グー' && tf.EnHand == 'チョキ'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'パー'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'グー'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'グー' && tf.EnHand == 'パー'"][eval exp="f.resist=0"][endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'グー'"][eval exp="f.resist=0"][endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'チョキ'"][eval exp="f.resist=0"][endif]
[if exp="tf.hand == 'グー' && tf.EnHand == 'グー'"][eval exp="f.resist=1"][endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'チョキ'"][eval exp="f.resist=1"][endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'パー'"][eval exp="f.resist=1"][endif]

[if exp="f.resist == 0"]
[jump target="*抵抗失敗"]
[endif]

[if exp="f.resist > 0"]
[jump target="*抵抗成功"]
[endif]

*抵抗失敗
しかし、敵の拘束は緩まなかった[l][r][cm]
[jump target="*組付攻撃"]

*抵抗成功
[iscript]
tf.Min = 1, tf.Max = 20;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 100) + 1;
f.resistPower = Math.floor(22 * f.resist * tf.randomNum);
f.BindPower = f.BindPower - f.resistPower;
if(f.BindPower < 0){f.BindPower = 0;}
[endscript]

[if exp="f.BindPower <= 0"]
くぬぎは敵の拘束を振りほどいた[l][r][cm]
[jump target="*組付終了"]
[endif]

[if exp="f.resist > 1"]
敵の拘束が大きく緩んだ。[l][r][cm]
[else]
敵の拘束が少し緩んだ。[l][r][cm]
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
  敵はくぬぎの胸を揉みしだいた[l][r][cm]
  くぬぎの快感度が上昇した[r]
  敵の興奮度が上昇した[l][r][cm]
  [eval exp="f.ERO=f.ERO+10"]
  [eval exp="f.EnERO=f.EnERO + 5 * f.EnARS"]
[endif]

[if exp="f.EnBindOption==2"]
  敵はくぬぎを締め上げた[l][r][cm]
  [iscript]
  tf.Min = 0, tf.Max = 50;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  tf.randomNum = (tf.dice / 1000) + 1;

  tf.Damage = Math.floor(f.EnSTR * 0.3 * tf.randomNum);
  [endscript]
  [eval exp="f.HP = f.HP - tf.Damage"]
  くぬぎの体力が[emb exp="tf.Damage"]減少した[l][r][cm]
  [if exp="f.EnHP <= 0"][jump storage="battle.ks" target="*戦闘終了"][endif]
[endif]

[if exp="f.EnBindOption==3"]
  敵はくぬぎの尻に股間を押し付けてきた[l][r][cm]
  くぬぎ「ひっ！」[l][r][cm]
  敵の興奮度が上昇した[l][r][cm]
  [eval exp="f.EnERO=f.EnERO + 10 * f.EnARS"]
[endif]
[if exp="f.EnERO >= 100"][jump target="*敵絶頂組付時"][endif]
[jump target="*組付選択"]

*組付終了
[eval exp="f.Clutch = 0"]
[jump storage="battle.ks" target="*ターン開始"]

*敵絶頂組付時
敵「くそっ！もう堪らん！！」[l][r][cm]
敵はくぬぎ押し倒した[l][r][cm]
[jump storage="bochu.ks" target="*房中開始"]
