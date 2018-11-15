*バトルスタート
[iscript]
//環境変数
f.turn = 0;
f.Priority = 0;
f.BindCount = 0;
f.ClutchTurn = 0;
f.SPD = f.SPD - f.TIR;
if(f.SPD<0){f.SPD=0};
[endscript]

[macro name="EnDamage"]
[iscript]
if(f.EnVB > 2){
  f.EnVBonus = 1.4;
}else if(f.EnVB > 1){
  f.EnVBonus = 1.2;
}else{
  f.EnVBonus = 1.1;
}

tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Buff = f.EnVBonus * f.EnVBuff;
tf.DeBuff = (100 - f.CharmBuff) / 100;
if (tf.DeBuff < 0){tf.DeBuff = 0};

//alert('バフは' + tf.Buff + '、デバフは' +tf.DeBuff);

tf.EnATP = Math.floor(f.EnSTR * 1.8 * tf.Buff * tf.DeBuff * tf.randomNum);
tf.DFP = Math.floor(f.DEF * 1.2);
tf.Damage = tf.EnATP - tf.DFP;
if(tf.Damage<0){tf.Damage=0;}

f.EnVBuff = 1.0;
[endscript]
[endmacro]

[macro name="EnSuperArts"]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Buff = f.EnVBonus * f.EnVBuff;
tf.DeBuff = (100 - f.CharmBuff) / 100;
if (tf.DeBuff < 0){tf.DeBuff = 0};

//alert('バフは' + tf.Buff + '、デバフは' +tf.DeBuff);

tf.ATP = Math.floor(350 * tf.DeBuff * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[endmacro]


*ターン開始
[position width=960 height=480 top=0 left=0]

[iscript]
if(f.SPD < 0){
  f.SPD = f.BaseSPD;
}
if(f.EnSPD < 0){
  f.EnSPD = f.BaseEnSPD;
}
if(f.EnStan > 0){
  f.EnStan--;
}
if(f.skill1CT>0){
  f.skill1CT--;
}
if(f.skill2CT>0){
  f.skill2CT--;
}
if(f.skill3CT>0){
  f.skill3CT--;
}
if(f.CharmET > 0){
  f.CharmET--;
}else{
  f.CharmBuff = 0;
}
[endscript]
[iscript]
//ターン数
f.turn++;
[endscript]

[showStatus]
[emb exp="f.turn"]合目[lrcm]

*敵抽選
[cm]
[iscript]
//敵の行動パターン抽選
if(f.EnCount==0){
  tf.Min = 1, tf.Max = 6;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  f.EnSelectOption = [];
  f.EnSelectOption = JSON.stringify(f.originEnOption[tf.dice]);
  f.EnSelectOption = JSON.parse(f.EnSelectOption);
}

//１手目開示
f.releaseNote = f.EnSelectOption[f.EnCount * 3] + '→？→？';
//使用済み手札の表示
f.usedNote = [];
if(f.EnCount>0){
  f.usedNote = f.EnSelectOption.slice(0, f.EnCount*3);
}

//組付判定
tf.Min = 0, tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.Rate = f.ClutchRate + f.EnERO/2  + f.ClutchTurn*5;
if(tf.dice < f.Rate && f.ClutchTurn != 0){
  f.Clutch = 1, f.ClutchTurn = 0;
}else{
  f.Clutch = 0, f.ClutchTurn++;
}
if(f.turn == 0){f.Clutch = 0;}

//麻痺時
if(f.EnStan>0){
  f.releaseNote = '行動不能に陥っている';
}
[endscript]

*超必殺技
[if exp="f.FP >= 100"]
[glink target="*発動超必殺技" text="超必殺" color="red" size=30 x=150 y=35]
[s]
[endif]
[if exp="f.EnFP >= 100"]
[jump target="*発動敵超必殺技"]
[endif]

*組付
[jump target="組付判定" cond="f.Clutch == 1"]

*選択1
[iscript]
if(f.return==1){
  f.count--;
  f.Option[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}
[endscript]
[deffont]
敵行動：[emb exp="f.releaseNote"]/使用済み：[emb exp="f.usedNote"]
[font face="KozGoPro-Bold"]
[glink target="*選択2" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[0]" color="red" size=15 x=50 y=105 cond="f.Option[0].switch == 0"]
[glink target="*選択2" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[1]" color="red" size=15 x=50 y=140 cond="f.Option[1].switch == 0"]
[glink target="*選択2" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[2]" color="red" size=15 x=50 y=175 cond="f.Option[2].switch == 0"]
[glink target="*選択2" text="・チョキ" exp="f.selectOption[f.count]=f.Option[3]" color="red" size=15 x=50 y=210 cond="f.Option[3].switch == 0"]
[glink target="*選択2" text="・チョキ" exp="f.selectOption[f.count]=f.Option[4]" color="red" size=15 x=50 y=245 cond="f.Option[4].switch == 0"]
[glink target="*選択2" text="・チョキ" exp="f.selectOption[f.count]=f.Option[5]" color="red" size=15 x=250 y=105 cond="f.Option[5].switch == 0"]
[glink target="*選択2" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[6]" color="red" size=15 x=250 y=140 cond="f.Option[6].switch == 0"]
[glink target="*選択2" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[7]" color="red" size=15 x=250 y=175 cond="f.Option[7].switch == 0"]
[glink target="*選択2" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[8]" color="red" size=15 x=250 y=210 cond="f.Option[8].switch == 0"]
[glink target="*スキル選択" text="技　能" color="blue" size=15 x=250 y=245]
[s]

*選択2
[iscript]
if(f.return==1){
  f.count--;
  f.Option[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
[deffont]
選択済：[emb exp="f.Option[f.selectOption[f.count-1].id].hand"][r]
敵行動：[emb exp="f.releaseNote"]/使用済み：[emb exp="f.usedNote"]
[font face="KozGoPro-Bold"]
[glink target="*選択3" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[0]" color="red" size=15 x=50 y=105 cond="f.Option[0].switch == 0"]
[glink target="*選択1" exp="f.return=1" text="・グ　ー" color="black" size=15 x=50 y=105 cond="f.Option[0].switch == 1"]

[glink target="*選択3" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[1]" color="red" size=15 x=50 y=140 cond="f.Option[1].switch == 0"]
[glink target="*選択1" text="・グ　ー" exp="f.return=1" color="black" size=15 x=50 y=140 cond="f.Option[1].switch == 1"]

[glink target="*選択3" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[2]" color="red" size=15 x=50 y=175 cond="f.Option[2].switch == 0"]
[glink target="*選択1" text="・グ　ー" exp="f.return=1" color="black" size=15 x=50 y=175 cond="f.Option[2].switch == 1"]

[glink target="*選択3" text="・チョキ" exp="f.selectOption[f.count]=f.Option[3]" color="red" size=15 x=50 y=210 cond="f.Option[3].switch == 0"]
[glink target="*選択1" text="・チョキ" exp="f.return=1" color="black" size=15 x=50 y=210 cond="f.Option[3].switch == 1"]

[glink target="*選択3" text="・チョキ" exp="f.selectOption[f.count]=f.Option[4]" color="red" size=15 x=50 y=245 cond="f.Option[4].switch == 0"]
[glink target="*選択1" text="・チョキ" exp="f.return=1" color="black" size=15 x=50 y=245 cond="f.Option[4].switch == 1"]

[glink target="*選択3" text="・チョキ" exp="f.selectOption[f.count]=f.Option[5]" color="red" size=15 x=250 y=105 cond="f.Option[5].switch == 0"]
[glink target="*選択1" text="・チョキ" exp="f.return=1" color="black" size=15 x=250 y=105 cond="f.Option[5].switch == 1"]

[glink target="*選択3" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[6]" color="red" size=15 x=250 y=140 cond="f.Option[6].switch == 0"]
[glink target="*選択1" text="・パ　ー" exp="f.return=1" color="black" size=15 x=250 y=140 cond="f.Option[6].switch == 1"]

[glink target="*選択3" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[7]" color="red" size=15 x=250 y=175 cond="f.Option[7].switch == 0"]
[glink target="*選択1" text="・パ　ー" exp="f.return=1" color="black" size=15 x=250 y=175 cond="f.Option[7].switch == 1"]

[glink target="*選択3" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[8]" color="red" size=15 x=250 y=210 cond="f.Option[8].switch == 0"]
[glink target="*選択1" text="・パ　ー" exp="f.return=1" color="black" size=15 x=250 y=210 cond="f.Option[8].switch == 1"]

[glink target="*選択1" text="戻る" exp="f.return=1" color="red" size=15 x=250 y=245]
[s]

*選択3
[iscript]
if(f.return==1){
  f.count--;
  f.Option[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
[deffont]
選択済：[emb exp="f.Option[f.selectOption[f.count-2].id].hand"]→[emb exp="f.Option[f.selectOption[f.count-1].id].hand"][r]
敵行動：[emb exp="f.releaseNote"]/使用済み：[emb exp="f.usedNote"]
[font face="KozGoPro-Bold"]
[glink target="*確認" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[0]" color="red" size=15 x=50 y=105 cond="f.Option[0].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・グ　ー" color="black" size=15 x=50 y=105 cond="f.Option[0].switch == 1"]

[glink target="確認" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[1]" color="red" size=15 x=50 y=140 cond="f.Option[1].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・グ　ー" color="black" size=15 x=50 y=140 cond="f.Option[1].switch == 1"]

[glink target="確認" text="・グ　ー" exp="f.selectOption[f.count]=f.Option[2]" color="red" size=15 x=50 y=175 cond="f.Option[2].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・グ　ー" color="black" size=15 x=50 y=175 cond="f.Option[2].switch == 1"]

[glink target="確認" text="・チョキ" exp="f.selectOption[f.count]=f.Option[3]" color="red" size=15 x=50 y=210 cond="f.Option[3].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・チョキ" color="black" size=15 x=50 y=210 cond="f.Option[3].switch == 1"]

[glink target="確認" text="・チョキ" exp="f.selectOption[f.count]=f.Option[4]" color="red" size=15 x=50 y=245 cond="f.Option[4].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・チョキ" color="black" size=15 x=50 y=245 cond="f.Option[4].switch == 1"]

[glink target="確認" text="・チョキ" exp="f.selectOption[f.count]=f.Option[5]" color="red" size=15 x=250 y=105 cond="f.Option[5].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・チョキ" color="black" size=15 x=250 y=105 cond="f.Option[5].switch == 1"]

[glink target="確認" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[6]" color="red" size=15 x=250 y=140 cond="f.Option[6].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・パ　ー" color="black" size=15 x=250 y=140 cond="f.Option[6].switch == 1"]

[glink target="確認" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[7]" color="red" size=15 x=250 y=175 cond="f.Option[7].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・パ　ー" color="black" size=15 x=250 y=175 cond="f.Option[7].switch == 1"]

[glink target="確認" text="・パ　ー" exp="f.selectOption[f.count]=f.Option[8]" color="red" size=15 x=250 y=210 cond="f.Option[8].switch == 0"]
[glink target="*選択2" exp="f.return=1" text="・パ　ー" color="black" size=15 x=250 y=210 cond="f.Option[8].switch == 1"]

[glink target="*選択2" text="戻る" exp="f.return=1" color="red" size=15 x=250 y=245]
[s]

*確認
[iscript]
if(f.return==1){
  f.count--;
  f.Option[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
[cm]
[deffont]
選択済:[emb exp="f.Option[f.selectOption[f.count-3].id].hand"]→
[emb exp="f.Option[f.selectOption[f.count-2].id].hand"]→
[emb exp="f.Option[f.selectOption[f.count-1].id].hand"][r]
敵行動：[emb exp="f.releaseNote"]
[glink target="*比較" text="決定" color="red" size=15 x=50 y=100]
[glink target="*選択3" text="戻る" exp="f.return=1" color="red" size=15 x=150 y=100]
[s]

*比較
[iscript]
f.selectOption[f.count-3].switch=2;//配列の参照型を利用して選択肢をオンに
f.selectOption[f.count-2].switch=2;
f.selectOption[f.count-1].switch=2;

f.N=0;
f.H=f.count-3;
f.VP=0;
f.VB=0;
f.EnVB=0;
if(f.SPD > f.EnSPD){f.Priority = 1;} else {f.Priority = 0;}

f.PictHand1 = "hand/PL" + f.selectOption[f.count-3].hand + ".png";
f.PictHand2 = "hand/PL" + f.selectOption[f.count-2].hand + ".png";
f.PictHand3 = "hand/PL" + f.selectOption[f.count-1].hand + ".png";
f.PictHand4 = "hand/EN" + f.EnSelectOption[0 + (f.EnCount * 3)] + ".png";
f.PictHand5 = "hand/EN" + f.EnSelectOption[1 + (f.EnCount * 3)] + ".png";
f.PictHand6 = "hand/EN" + f.EnSelectOption[2 + (f.EnCount * 3)] + ".png";
[endscript]

[if exp="f.EnStan > 0"]
[image layer=0 storage="&f.PictHand1" width="100" top="50" left="380" visible="true"]
[image layer=0 storage="&f.PictHand2" width="100" top="200" left="380" visible="true"]
[image layer=0 storage="&f.PictHand3" width="100" top="350" left="380" visible="true"]
[image layer=0 storage="hand/停止.png" width="100" top="50" left="480" visible="true"]
[image layer=0 storage="hand/停止.png" width="100" top="200" left="480" visible="true"]
[image layer=0 storage="hand/停止.png" width="100" top="350" left="480" visible="true"]
[jump target="*敵行動不能"]
[endif]

[image layer=0 storage="&f.PictHand1" width="100" top="50" left="380" visible="true"]
[image layer=0 storage="&f.PictHand2" width="100" top="200" left="380" visible="true"]
[image layer=0 storage="&f.PictHand3" width="100" top="350" left="380" visible="true"]
[image layer=0 storage="&f.PictHand4" width="100" top="50" left="480" visible="true"]
[image layer=0 storage="&f.PictHand5" width="100" top="200" left="480" visible="true"]
[image layer=0 storage="&f.PictHand6" width="100" top="350" left="480" visible="true"]
[lrcm]

*判定
[iscript]
tf.hand = f.selectOption[f.H].hand;
tf.EnHand = f.EnSelectOption[f.N + (f.EnCount * 3)];
tf.Hight =  f.N * 150 + 50;
[endscript]

[if exp="tf.hand == 'グー' && tf.EnHand == 'チョキ'"]
  ;勝利(VP+1)　くぬぎの攻撃力上昇[r]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.VBuff = f.VBuff + 0.1"]
  [image layer=0 storage="hand/マル.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  [image layer=0 storage="buff/STRup.png" width="100" top="&tf.Hight" left="280" visible="true"]
[endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'パー'"]
  ;勝利(VP+1)　くぬぎの気力上昇[r]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.FP = f.FP + 5"]
  [image layer=0 storage="hand/マル.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  [image layer=0 storage="buff/FPup.png" width="100" top="&tf.Hight" left="280" visible="true"]
[endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'グー'"]
  ;勝利(VP+1)　くぬぎの敏捷上昇[r]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.SPD = f.SPD + 5" cond="f.SPD < f.BaseSPD"]
  [image layer=0 storage="hand/マル.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  [image layer=0 storage="buff/SPDup.png" width="100" top="&tf.Hight" left="280" visible="true"]
[endif]

[if exp="tf.hand == 'グー' && tf.EnHand == 'パー'"]
  ;敗北(VP-1)　敵の敏捷上昇[r]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnSPD = f.EnSPD + 5" cond="f.EnSPD < f.BaseEnSPD"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/マル.png" width="100" top="&tf.Hight" left="480" visible="true"]
  [image layer=0 storage="buff/SPDup.png" width="100" top="&tf.Hight" left="580" visible="true"]
  [endif]
[if exp="tf.hand == 'チョキ' && tf.EnHand == 'グー'"]
  ;敗北(VP-1)　敵の攻撃力上昇[r]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnVBuff = f.EnVBuff + 0.1"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/マル.png" width="100" top="&tf.Hight" left="480" visible="true"]
  [image layer=0 storage="buff/STRup.png" width="100" top="&tf.Hight" left="580" visible="true"]
[endif]
[if exp="tf.hand == 'パー' && tf.EnHand == 'チョキ'"]
  ;敗北(VP-1)　敵の気力上昇[r]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnFP = f.EnFP + 5"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/マル.png" width="100" top="&tf.Hight" left="480" visible="true"]
  [image layer=0 storage="buff/FPup.png" width="100" top="&tf.Hight" left="580" visible="true"]
[endif]

[if exp="tf.hand == 'グー' && tf.EnHand == 'グー' && f.Priority == 1"]
  ;相討(VP+1)　くぬぎの敏捷低下[r]
  [eval exp="f.VP = f.VP + 1"]
  ;[eval exp="f.SPD = f.SPD - 20"]
  [image layer=0 storage="hand/ウエ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  ;[image layer=0 storage="buff/SPDdown.png" width="100" top="&tf.Hight" left="280" visible="true"]
[elsif exp="tf.hand == 'グー' && tf.EnHand == 'グー' && f.Priority != 1"]
  ;相討(VP-1)　敵の敏捷低下[r]
  [eval exp="f.VP = f.VP - 1"]
  ;[eval exp="f.EnSPD = f.EnSPD - 20"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/ウエ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  ;[image layer=0 storage="buff/SPDdown.png" width="100" top="&tf.Hight" left="580" visible="true"]
[endif]

[if exp="tf.hand == 'チョキ' && tf.EnHand == 'チョキ' && f.Priority == 1"]
  ;相討(VP+1)　くぬぎの敏捷低下[r]
  [eval exp="f.VP = f.VP + 1"]
  ;[eval exp="f.SPD = f.SPD - 20"]
  [image layer=0 storage="hand/ウエ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  ;[image layer=0 storage="buff/SPDdown.png" width="100" top="&tf.Hight" left="280" visible="true"]
[elsif exp="tf.hand == 'チョキ' && tf.EnHand == 'チョキ' && f.Priority != 1"]
  ;相討(VP-1)　敵の敏捷低下[r]
  [eval exp="f.VP = f.VP - 1"]
  ;[eval exp="f.EnSPD = f.EnSPD - 20"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/ウエ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  ;[image layer=0 storage="buff/SPDdown.png" width="100" top="&tf.Hight" left="580" visible="true"]
[endif]

[if exp="tf.hand == 'パー' && tf.EnHand == 'パー' && f.Priority == 1"]
  ;相討(VP+1)　くぬぎの敏捷低下[r]
  [eval exp="f.VP = f.VP + 1"]
  ;[eval exp="f.SPD = f.SPD - 20"]
  [image layer=0 storage="hand/ウエ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  ;[image layer=0 storage="buff/SPDdown.png" width="100" top="&tf.Hight" left="280" visible="true"]
[elsif exp="tf.hand == 'パー' && tf.EnHand == 'パー' && f.Priority != 1"]
  ;相討(VP-1)　敵の敏捷低下[r]
  [eval exp="f.VP = f.VP - 1"]
  ;[eval exp="f.EnSPD = f.EnSPD - 20"]
  [image layer=0 storage="hand/バツ.png" width="100" top="&tf.Hight" left="380" visible="true"]
  [image layer=0 storage="hand/ウエ.png" width="100" top="&tf.Hight" left="480" visible="true"]
  ;[image layer=0 storage="buff/SPDdown.png" width="100" top="&tf.Hight" left="580" visible="true"]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"]
  [jump target="*判定"]
[endif]

[eval exp="f.SPD = 0" cond="f.SPD < 0"]
[eval exp="f.EnSPD = 0" cond="f.EnSPD < 0"]
[lrcm][wait time="500"]
[showStatus]
[if exp="f.VP>0"]
  [freeimage layer=0]
  くぬぎの攻撃![lrcm]
  [jump target="*コマンド判定"]
[else]
  [freeimage layer=0]
  敵の攻撃![lrcm]
  [jump target="*敵通常攻撃"]
[endif]

*敵行動不能
[iscript]
tf.hand = f.selectOption[f.H].hand;
[endscript]

[if exp="tf.hand == 'グー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.VBuff = f.VBuff + 0.1"]
  [image layer=0 storage="buff/STRup.png" width="100" top="&tf.Hight" left="280" visible="true"]
  ;勝利(VP+1)　くぬぎの攻撃力上昇[r]
[endif]
[if exp="tf.hand == 'チョキ'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.FP = f.FP + 5"]
  [image layer=0 storage="buff/FPup.png" width="100" top="&tf.Hight" left="280" visible="true"]
  ;勝利(VP+1)　くぬぎの気力上昇[r]
[endif]
[if exp="tf.hand == 'パー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.SPD = f.SPD + 5"]
  [image layer=0 storage="buff/SPDup.png" width="100" top="&tf.Hight" left="280" visible="true"]
  ;勝利(VP+1)　くぬぎの敏捷上昇[r]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"][jump target="*敵行動不能"]
[endif]

[lrcm][wait time="500"]
[showStatus]
[freeimage layer=0]
くぬぎの攻撃![lrcm]
[jump target="*コマンド判定"]

*コマンド判定
[iscript]
f.Comand = 0;
if(f.selectOption[f.count-3].hand == "グー" && f.selectOption[f.count-2].hand == "チョキ" && f.selectOption[f.count-1].hand == "パー"){
  f.Comand = 1;
}
if(f.selectOption[f.count-3].hand == "パー" && f.selectOption[f.count-2].hand == "グー" && f.selectOption[f.count-1].hand == "チョキ"){
  f.Comand = 2;
}
if(f.selectOption[f.count-3].hand == "チョキ" && f.selectOption[f.count-2].hand == "パー" && f.selectOption[f.count-1].hand == "グー"){
  f.Comand = 3;
}
[endscript]
[if exp="f.Comand == 1"]
[jump target="*通常攻撃" cond="f.SPD < 10"]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(f.STR * 3.3 * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
「忍法・旋風！」[lrcm]
敵の体力が[emb exp="tf.Damage"]減少した。[lrcm]
くぬぎの敏捷が減少した[lrcm]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.SPD = f.SPD - 10"][eval exp="f.SPD = 0" cond="f.SPD < 0"]
;[eval exp="f.TIR = f.TIR + 3"][eval exp="f.TIR = 100" cond="f.TIR > 100"]
[eval exp="f.EnFP = f.EnFP + 20"]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]

[elsif exp="f.Comand == 2"]
[jump target="*通常攻撃" cond="f.SPD < 10"]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(f.STR * 3.3 * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
「忍法・陽炎！」[lrcm]
敵の体力が[emb exp="tf.Damage"]減少した。[lrcm]
くぬぎの敏捷が減少した[lrcm]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.SPD = f.SPD - 10"][eval exp="f.SPD = 0" cond="f.SPD < 0"]
;[eval exp="f.TIR = f.TIR + 3"][eval exp="f.TIR = 100" cond="f.TIR > 100"]
[eval exp="f.EnFP = f.EnFP + 20"]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]

[elsif exp="f.Comand == 3"]
[jump target="*通常攻撃" cond="f.SPD < 10"]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(f.STR * 3.3 * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
「忍法・五月雨！」[lrcm]
敵の体力が[emb exp="tf.Damage"]減少した。[lrcm]
くぬぎの敏捷が減少した[lrcm]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.SPD = f.SPD - 10"][eval exp="f.SPD = 0" cond="f.SPD < 0"]
;[eval exp="f.TIR = f.TIR + 3"][eval exp="f.TIR = 100" cond="f.TIR > 100"]
[eval exp="f.EnFP = f.EnFP + 20"]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]

[endif]

*通常攻撃
[Damage]
敵の体力が[emb exp="tf.Damage"]減少した。[lrcm]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.EnFP = f.EnFP + 20"]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]

*敵通常攻撃
[EnDamage]

[if exp="f.Pary > 0"]
くぬぎは敵の攻撃を回避した[lrcm]
[eval exp="f.Pary = 0 , f.Undress = 1"]
[else]

くぬぎの体力が[emb exp="tf.Damage"]減少した。[lrcm]
[eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
[eval exp="f.FP = f.FP + 20"]
[showStatus]
[endif]

[jump target="*戦闘終了" cond="f.HP <= 0"]
[jump target="*戦闘続行" cond="f.HP > 0"]

*戦闘続行
[iscript]
if(f.selectOption.length>=9){
  for(i=0; i<f.selectOption.length; i++){
    f.selectOption[i].switch=0
  }
  f.selectOption = [];
  f.count=0;
}
f.EnCount++;
if(f.EnCount>2){
  f.EnCount=0;
}
[endscript]

[if exp="f.EnStan == 1"]
敵は行動不能から復帰した[lrcm]
[eval exp="f.EnStan=0"]
[endif]

[jump target="*ターン開始"]

*組付判定
敵が組み付いてきた！[lrcm]
[iscript]
tf.Min = 0, tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(f.SPD < f.EnSPD){
  f.Clutch = 1;
}else if(tf.dice > f.SPD - f.EnSPD){
  f.Clutch = 1;
}else{
  f.Clutch = 0;
}
[endscript]

[if exp="f.Clutch==0"]
;組み付き失敗
くぬぎは敵の組付を回避した![lrcm]
[jump target="*選択1"]
[endif]
;組み付き成功
くぬぎ「きゃあっ！！」[lrcm]
くぬぎは敵に押し倒された[lrcm]

[iscript]
f.BindCount++;
f.BindPower = Math.floor(f.BaseBindPower * (f.BindCount/100 + 1));
[endscript]
[jump storage="bind.ks" target="*組付選択"]


*発動超必殺技
くぬぎ「受けてみなさい！必殺・鳴神の舞」[l][r]
[SuperArts]

敵の体力が[emb exp="tf.Damage"]減少した。[lrcm]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.FP = 0"]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]

*発動敵超必殺技
敵「散れい！小娘！！」[l][r]
[EnSuperArts]

[if exp="f.Pary > 0"]
くぬぎは敵の攻撃を回避した[lrcm]
くぬぎは脱衣状態になった[lrcm]
[eval exp="f.Pary = 0 , f.Undress = 1"]
[else]

くぬぎの体力が[emb exp="tf.Damage"]減少した。[lrcm]
[eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
[showStatus]
[endif]

[eval exp="f.EnFP = 0"]
[jump target="*戦闘終了" cond="f.HP <= 0"]
[jump target="*戦闘続行" cond="f.HP > 0"]


*スキル選択
[emb exp="f.skill1CT"][r]
[emb exp="f.skill2CT"][r]
[emb exp="f.skill3CT"][r]

[glink target="*スキル1使用" text="代わり身の術" color="red" size=15 x=50 y=35 cond="f.skill1CT == 0"]
[glink target="*スキル選択" text="代わり身の術" color="black" size=15 x=50 y=35 cond="f.skill1CT != 0"]
[glink target="*スキル2使用" text="目眩ましの術" color="red" size=15 x=50 y=70 cond="f.skill2CT == 0"]
[glink target="*スキル選択" text="目眩ましの術" color="black" size=15 x=50 y=70 cond="f.skill2CT != 0"]
[glink target="*スキル3使用" text="魅了の術" color="red" size=15 x=50 y=105 exp="f.skill3CT == 0"]
[glink target="*スキル選択" text="魅了の術" color="black" size=15 x=50 y=105 cond="f.skill3CT != 0"]
[glink target="*選択1" text="戻　る" color="red" size=15 x=50 y=140]
[s]

*スキル1使用
スキル1使用[lrcm]
くぬぎは代わり身の術を使った[lrcm]
１回だけ敵の攻撃を回避します[lrcm]
[eval exp="f.Pary = 1"]
[eval exp="f.skill1CT = 6"]
[jump target="*選択1"]

*スキル2使用
スキル2使用[lrcm]
くぬぎは目眩ましの術を使った[lrcm]
敵「ぬうっ！」[lrcm]
敵がひるんでいる間にくぬぎは体勢を整えた[lrcm]
[iscript]
for(i=0; i<f.selectOption.length; i++){
  f.selectOption[i].switch=0
}
f.selectOption = [];
f.count=0;
[endscript]
[eval exp="f.skill2CT = 6"]
[jump target="*選択1"]

*スキル3使用
スキル3使用[lrcm]
くぬぎは魅了の術を使った[lrcm]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(10 * f.ARS * f.EnARS * tf.randomNum);
tf.EnDFP = (100 - f.EnEND) / 100;
tf.Damage = Math.floor(tf.ATP * tf.EnDFP);
if(tf.Damage<0){tf.Damage=0;}
f.ARS = f.ARS + 0.1;
[endscript]
[eval exp="f.EnERO = f.EnERO + tf.Damage"]
[eval exp="f.CharmBuff = 25 , f.CharmET = 3"]
敵の興奮度が[emb exp="tf.Damage"]上がった[lrcm]
敵の攻撃力が低下した[lrcm]
[showStatus]
[endif]

[eval exp="f.skill3CT = 6"]
[jump target="*選択1"]

*戦闘終了
[if exp="f.EnHP > 0"]
  くぬぎは敗北した...[lrcm]
[else]
  敵を倒した！！[lrcm]
  疲労度が上昇した[lrcm]
  [eval exp="f.TIR = f.TIR + (f.turn * 3)"][eval exp="f.TIR = 100" cond="f.TIR > 100 "]
[endif]
[showStatus]
;戦闘終了処理
[iscript]
for(i=0; i<f.selectOption.length; i++){
  f.selectOption[i].switch=0
}
f.selectOption = [];
f.count=0;
f.EnCount=0;
f.stage++;
[endscript]
[jump storage="selectStage.ks" target="*ステージセレクト"]
