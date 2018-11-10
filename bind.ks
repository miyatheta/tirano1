
*組付選択
[showStatus]
[iscript]
tf.Min = 0, tf.Max = 89;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice < 30){
  tf.enHand="グー";
}else if(tf.dice > 60){
  tf.enHand="チョキ";
}else{
  tf.enHand="パー";
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
くぬぎは抵抗した！！[l][cm]
[eval exp="f.TempFP = f.TempFP + 8"]

[if exp="tf.hand == 'グー' && tf.enHand == 'チョキ'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'パー'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'グー'"][eval exp="f.resist=2"][endif]
[if exp="tf.hand == 'グー' && tf.enHand == 'パー'"][eval exp="f.resist=0"][endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'グー'"][eval exp="f.resist=0"][endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'チョキ'"][eval exp="f.resist=0"][endif]
[if exp="tf.hand == 'グー' && tf.enHand == 'グー'"][eval exp="f.resist=1"][endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ'"][eval exp="f.resist=1"][endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'パー'"][eval exp="f.resist=1"][endif]

[if exp="f.resist == 0"]
[jump target="*抵抗失敗"]
[endif]

[if exp="f.resist > 0"]
[jump target="*抵抗成功"]
[endif]

*抵抗失敗
しかし、敵の拘束は緩まなかった[l][cm]
[jump target="*組付攻撃"]

*抵抗成功
[iscript]
tf.Min = 1, tf.Max = 20;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.randomNum = (tf.dice / 100) + 1;
f.resistPower = Math.floor(22 * f.resist * f.randomNum);
f.TempBindPower = f.TempBindPower - f.resistPower;
if(f.TempBindPower < 0){f.TempBindPower = 0;}
[endscript]

[if exp="f.TempBindPower <= 0"]
くぬぎは敵の拘束を振りほどいた[l][cm]
[jump target="*組付終了"]
[endif]

[if exp="f.resist > 1"]
敵の拘束が大きく緩んだ。[l][cm]
[else]
敵の拘束が少し緩んだ。[l][cm]
[endif]

*組付攻撃
[iscript]
tf.Min = 0, tf.Max = 89;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice < 30){
  f.enBindOption=1;
}else if(tf.dice > 60){
  f.enBindOption=2;
}else{
  f.enBindOption=3;
}
[endscript]

[if exp="f.enBindOption==1"]
  敵はくぬぎの胸を揉みしだいた[l][cm]
  くぬぎの興奮度が上昇した[r]
  敵の興奮度が上昇した[l][cm]
  [eval exp="f.TempERO=f.TempERO+10"]
  [eval exp="f.TempEnERO=f.TempEnERO + 5 * f.TempEnARS"]
[endif]

[if exp="f.enBindOption==2"]
  敵はくぬぎを締め上げた[l][cm]
  [iscript]
  tf.Min = 0, tf.Max = 50;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  f.randomNum = (tf.dice / 1000) + 1;

  tf.Damage = Math.floor(f.TempEnSTR * 0.5 * f.randomNum);
  [endscript]
  [eval exp="f.TempHP = f.TempHP - tf.Damage"]
  くぬぎの体力が[emb exp="tf.Damage"]減少した[l][cm]
  [if exp="f.TempEnHP <= 0"][jump storage="battle.ks" target="*戦闘終了"][endif]
[endif]

[if exp="f.enBindOption==3"]
  敵はくぬぎの尻に股間を押し付けてきた[l][cm]
  くぬぎ「ひっ！」[l][cm]
  敵の興奮度が上昇した[l][cm]
  [eval exp="f.TempEnERO=f.TempEnERO + 10 * f.TempEnARS"]
[endif]
[if exp="f.TempEnERO >= 100"][jump target="*敵絶頂組付時"][endif]
[jump target="*組付選択"]

*組付終了
[eval exp="f.Clutch = 0"]
[jump storage="battle.ks" target="*ターン開始"]

*敵絶頂組付時
敵「くそっ！もう堪らん！！」[l][cm]
敵はくぬぎ押し倒した[l][cm]
[jump storage="bochu.ks" target="*房中開始"]
