*バトルスタート
[position width=960 height=50 top=590 left=0]
[showStatus]
[iscript]
//環境変数
f.turn = 0;
f.BindCount = 0;
f.ClutchTurn = 0;
f.SPD = f.BaseSPD - f.TIR;
if(f.SPD<0){f.SPD=0};
f.para_bar_width = 100;
f.para_bar_width_En = 100;
[endscript]
[jump target="*ターン開始"]
[s]

*ターン開始

[iscript]
f.skill = 0;
if(f.skill1CT > 0){f.skill1CT--;}
if(f.skill2CT > 0){f.skill2CT--;}
if(f.skill3CT > 0){f.skill3CT--;}
if(f.skill4CT > 0){f.skill4CT--;}
if(f.CharmET > 0){
  f.CharmET--;
}else{
  f.CharmBuff = 0;
}
if(f.StanOrga > 0){
  f.StanOrga--;
}
if(f.EnStan > 0){
  f.EnStan--;
}

//ターン数
f.turn++;
tf.dice = 0;

//敵の行動パターン抽選
if(f.EnCount==0){
  tf.Min = 1, tf.Max = 6;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  f.EnSelectPattern = f.EnPattern[tf.dice];
  f.EnSelectOption = [];
  f.EnSelectOption = JSON.stringify(f.EnOption);
  f.EnSelectOption = JSON.parse(f.EnSelectOption);
}

//１手目開示
if(f.EnSelectOption[f.EnSelectPattern[f.EnCount * 3]].hand == "グー"){
    f.openCard = "Card/Card_P.png"
}else if(f.EnSelectOption[f.EnSelectPattern[f.EnCount * 3]].hand == "チョキ"){
    f.openCard = "Card/Card_F.png"
}if(f.EnSelectOption[f.EnSelectPattern[f.EnCount * 3]].hand == "パー"){
    f.openCard = "Card/Card_A.png"
}
f.releaseNote = f.EnSelectOption[f.EnCount * 3] + '→？→？';
//使用済み手札の表示
f.usedNote = [];
if(f.EnCount>0){
  f.usedNote = f.EnSelectOption.slice(0, f.EnCount*3);
}

//組付判定
tf.Min = 0, tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.Lead = 0;
if(f.SPD > f.EnSPD){f.Lead = f.SPD - f.EnSPD;}
f.Rate = f.ClutchRate + f.Lead + f.ClutchTurn*5;
if(tf.dice < f.Rate && f.ClutchTurn > 1){
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
;敵のパターン：[emb exp="f.EnSelectPattern"][l]

[showStatus]
[emb exp="f.turn"]合目[wt5]
[if exp="f.StanOrga > 0"]
  くぬぎ「ん・・・ぁう・・・・」[wt7]
  くぬぎは絶頂の余韻で行動ができない！！[wt7]
  [jump target="*比較"]
[endif]

*特殊行動
;超必殺技
[if exp="f.FP >= 100"]
  [glink storage="SuperArts.ks" target="*発動超必殺技" text="超必殺" color="red" size=20 x=150 y=100]
  [s]
[endif]
  [if exp="f.EnFP >= 100"]
  [jump storage="SuperArts.ks" target="*発動敵超必殺技"]
[endif]
;組付
[jump target="*組付判定" cond="f.Clutch == 1"]


*選択1
[freeimage layer=5]
[freeimage layer=3]
[iscript]
if(f.return==1){
  f.count--;
  f.Option[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}
[endscript]
[deffont]
[image layer=2 width=75 left=480 top=105 visible="true" folder="image" storage="&f.openCard"]
[image layer=2 width=75 left=480 top=205 visible="true" folder="image" storage="Card/Card_Close.png"]
[image layer=2 width=75 left=480 top=305 visible="true" folder="image" storage="Card/Card_Close.png"]

[button target="*選択2" exp="f.selectOption[f.count]=f.Option[0]" width=50 x=50 y=105 cond="f.Option[0].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[1]" width=50 x=100 y=105 cond="f.Option[1].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[2]" width=50 x=150 y=105 cond="f.Option[2].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[3]" width=50 x=50 y=205 cond="f.Option[3].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[4]" width=50 x=100 y=205 cond="f.Option[4].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[5]" width=50 x=150 y=205 cond="f.Option[5].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[6]" width=50 x=50 y=305 cond="f.Option[6].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[7]" width=50 x=100 y=305 cond="f.Option[7].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択2" exp="f.selectOption[f.count]=f.Option[8]" width=50 x=150 y=305 cond="f.Option[8].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]

[glink target="*スキル選択" text="技　能" color="blue" size=15 x=50 y=420 cond="f.skill == 0"]
[s]

*選択2
[cm]
[freeimage layer=3]
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
f.PictHand1 = "Card/Card_" + f.selectOption[f.count-1].suit + ".png";
[endscript]
[image layer=3 folder="image" storage="&f.PictHand1" width="75" top="105" left="380" visible="true"]

[button target="*選択3" exp="f.selectOption[f.count]=f.Option[0]" width=50 x=50 y=105 cond="f.Option[0].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択1" exp="f.return=1" width=50 x=50 y=105 cond="f.Option[0].switch == 1" graphic="Card/Card_Pu.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[1]" width=50 x=100 y=105 cond="f.Option[1].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択1" exp="f.return=1" width=50 x=100 y=105 cond="f.Option[1].switch == 1" graphic="Card/Card_Pu.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[2]" width=50 x=150 y=105 cond="f.Option[2].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択1" exp="f.return=1" width=50 x=150 y=105 cond="f.Option[2].switch == 1" graphic="Card/Card_Pu.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[3]" width=50 x=50 y=205 cond="f.Option[3].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択1" exp="f.return=1" width=50 x=50 y=205 cond="f.Option[3].switch == 1" graphic="Card/Card_Fu.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[4]" width=50 x=100 y=205 cond="f.Option[4].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択1" exp="f.return=1" width=50 x=100 y=205 cond="f.Option[4].switch == 1" graphic="Card/Card_Fu.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[5]" width=50 x=150 y=205 cond="f.Option[5].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択1" exp="f.return=1" width=50 x=150 y=205 cond="f.Option[5].switch == 1" graphic="Card/Card_Fu.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[6]" width=50 x=50 y=305 cond="f.Option[6].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択1" exp="f.return=1" width=50 x=50 y=305 cond="f.Option[6].switch == 1" graphic="Card/Card_Au.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[7]" width=50 x=100 y=305 cond="f.Option[7].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択1" exp="f.return=1" width=50 x=100 y=305 cond="f.Option[7].switch == 1" graphic="Card/Card_Au.png"]
[button target="*選択3" exp="f.selectOption[f.count]=f.Option[8]" width=50 x=150 y=305 cond="f.Option[8].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択1" exp="f.return=1" width=50 x=150 y=305 cond="f.Option[8].switch == 1" graphic="Card/Card_Au.png"]

[glink target="*選択1" text="戻る" exp="f.return=1" color="red" size=15 x=50 y=420]

[s]

*選択3
[cm]
[freeimage layer=3]
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
f.PictHand1 = "Card/Card_" + f.selectOption[f.count-2].suit + ".png";
f.PictHand2 = "Card/Card_" + f.selectOption[f.count-1].suit + ".png";
[endscript]
[image layer=3 folder="image" storage="&f.PictHand1" width="75" top="105" left="380" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand2" width="75" top="205" left="380" visible="true"]

[button target="*確認" exp="f.selectOption[f.count]=f.Option[0]" width=50 x=50 y=105 cond="f.Option[0].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択2" exp="f.return=1" width=50 x=50 y=105 cond="f.Option[0].switch == 1" graphic="Card/Card_Pu.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[1]" width=50 x=100 y=105 cond="f.Option[1].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択2" exp="f.return=1" width=50 x=100 y=105 cond="f.Option[1].switch == 1" graphic="Card/Card_Pu.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[2]" width=50 x=150 y=105 cond="f.Option[2].switch == 0" graphic="Card/Card_P.png" enterimg="Card/Card_Pc.png" clickimg="Card/Card_Pc.png"]
[button target="*選択2" exp="f.return=1" width=50 x=150 y=105 cond="f.Option[2].switch == 1" graphic="Card/Card_Pu.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[3]" width=50 x=50 y=205 cond="f.Option[3].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択2" exp="f.return=1" width=50 x=50 y=205 cond="f.Option[3].switch == 1" graphic="Card/Card_Fu.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[4]" width=50 x=100 y=205 cond="f.Option[4].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択2" exp="f.return=1" width=50 x=100 y=205 cond="f.Option[4].switch == 1" graphic="Card/Card_Fu.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[5]" width=50 x=150 y=205 cond="f.Option[5].switch == 0" graphic="Card/Card_F.png" enterimg="Card/Card_Fc.png" clickimg="Card/Card_Fc.png"]
[button target="*選択2" exp="f.return=1" width=50 x=150 y=205 cond="f.Option[5].switch == 1" graphic="Card/Card_Fu.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[6]" width=50 x=50 y=305 cond="f.Option[6].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択2" exp="f.return=1" width=50 x=50 y=305 cond="f.Option[6].switch == 1" graphic="Card/Card_Au.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[7]" width=50 x=100 y=305 cond="f.Option[7].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択2" exp="f.return=1" width=50 x=100 y=305 cond="f.Option[7].switch == 1" graphic="Card/Card_Au.png"]
[button target="*確認" exp="f.selectOption[f.count]=f.Option[8]" width=50 x=150 y=305 cond="f.Option[8].switch == 0" graphic="Card/Card_A.png" enterimg="Card/Card_Ac.png" clickimg="Card/Card_Ac.png"]
[button target="*選択2" exp="f.return=1" width=50 x=150 y=305 cond="f.Option[8].switch == 1" graphic="Card/Card_Au.png"]

[glink target="*選択2" text="戻る" exp="f.return=1" color="red" size=15 x=50 y=420]

[s]

*確認
[cm][deffont]
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
f.PictHand1 = "Card/Card_" + f.selectOption[f.count-3].suit + ".png";
f.PictHand2 = "Card/Card_" + f.selectOption[f.count-2].suit + ".png";
f.PictHand3 = "Card/Card_" + f.selectOption[f.count-1].suit + ".png";
[endscript]

[image layer=3 folder="image" storage="&f.PictHand1" width="75" top="105" left="380" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand2" width="75" top="205" left="380" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand3" width="75" top="305" left="380" visible="true"]

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

f.PictHand1 = "Card/Card_" + f.selectOption[f.count-3].suit + ".png";
f.PictHand2 = "Card/Card_" + f.selectOption[f.count-2].suit + ".png";
f.PictHand3 = "Card/Card_" + f.selectOption[f.count-1].suit + ".png";
f.PictHand4 = "Card/Card_" + f.EnSelectOption[f.EnSelectPattern[0 + f.EnCount * 3]].suit + ".png";
f.PictHand5 = "Card/Card_" + f.EnSelectOption[f.EnSelectPattern[1 + f.EnCount * 3]].suit + ".png";
f.PictHand6 = "Card/Card_" + f.EnSelectOption[f.EnSelectPattern[2 + f.EnCount * 3]].suit + ".png";
[endscript]

[freeimage layer=2]
[freeimage layer=3]

[if exp="f.StanOrga > 0"]
  [image layer=3 folder="image" storage="hand/停止.png" width="75" top="105" left="380" visible="true"]
  [image layer=3 folder="image" storage="hand/停止.png" width="75" top="205" left="380" visible="true"]
  [image layer=3 folder="image" storage="hand/停止.png" width="75" top="305" left="380" visible="true"]
  [image layer=3 folder="image" storage="&f.PictHand4" width="75" top="105" left="480" visible="true"]
  [image layer=3 folder="image" storage="&f.PictHand5" width="75" top="205" left="480" visible="true"]
  [image layer=3 folder="image" storage="&f.PictHand6" width="75" top="305" left="480" visible="true"]
  [jump target="*行動不能"]
[endif]

[if exp="f.EnStan > 0"]
  [image layer=3 folder="image" storage="&f.PictHand1" width="75" top="105" left="380" visible="true"]
  [image layer=3 folder="image" storage="&f.PictHand2" width="75" top="205" left="380" visible="true"]
  [image layer=3 folder="image" storage="&f.PictHand3" width="75" top="305" left="380" visible="true"]
  [image layer=3 folder="image" storage="hand/停止.png" width="75" top="105" left="480" visible="true"]
  [image layer=3 folder="image" storage="hand/停止.png" width="75" top="205" left="480" visible="true"]
  [image layer=3 folder="image" storage="hand/停止.png" width="75" top="305" left="480" visible="true"]
  [jump target="*敵行動不能"]
[endif]

[image layer=3 folder="image" storage="&f.PictHand1" width="75" top="105" left="380" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand2" width="75" top="205" left="380" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand3" width="75" top="305" left="380" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand4" width="75" top="105" left="480" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand5" width="75" top="205" left="480" visible="true"]
[image layer=3 folder="image" storage="&f.PictHand6" width="75" top="305" left="480" visible="true"]
[wait time=1500]


*勝敗判定
[iscript]
tf.Hand = f.selectOption[f.H].hand;
tf.EnHand = f.EnSelectOption[f.EnSelectPattern[f.N + f.EnCount * 3]].hand;
tf.Hight =  f.N * 100 + 125;
[endscript]

[if exp="tf.Hand == 'グー' && tf.EnHand == 'チョキ'"]
  ;勝利(VP+1)　くぬぎの攻撃力上昇[r]
  [eval exp="f.VP = f.VP + 3"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.VBuff = f.VBuff + 0.1"]
  [image layer=4 storage="hand/マル.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="480" visible="true"]
  [image layer=4 storage="buff/STRup.png" width="75" top="&tf.Hight" left="280" visible="true"]
[endif]
[if exp="tf.Hand == 'チョキ' && tf.EnHand == 'パー'"]
  ;勝利(VP+1)　くぬぎの気力上昇[r]
  [eval exp="f.VP = f.VP + 3"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.FP = f.FP + 5"][eval exp="f.FP = 100" cond="f.FP > 100"]
  [image layer=4 storage="hand/マル.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="480" visible="true"]
  [image layer=4 storage="buff/FPup.png" width="75" top="&tf.Hight" left="280" visible="true"]
[endif]
[if exp="tf.Hand == 'パー' && tf.EnHand == 'グー'"]
  ;勝利(VP+1)　くぬぎの敏捷上昇[r]
  [eval exp="f.VP = f.VP + 3"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.SPD = f.SPD + 3" cond="f.SPD < f.BaseSPD"]
  [image layer=4 storage="hand/マル.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="480" visible="true"]
  [image layer=4 storage="buff/SPDup.png" width="75" top="&tf.Hight" left="280" visible="true"]
[endif]

[if exp="tf.Hand == 'グー' && tf.EnHand == 'パー'"]
  ;敗北(VP-1)　敵の敏捷上昇[r]
  [eval exp="f.VP = f.VP - 3"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnSPD = f.EnSPD + 3" cond="f.EnSPD < f.BaseEnSPD"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/マル.png" width="75" top="&tf.Hight" left="480" visible="true"]
  [image layer=4 storage="buff/SPDup.png" width="75" top="&tf.Hight" left="580" visible="true"]
  [endif]
[if exp="tf.Hand == 'チョキ' && tf.EnHand == 'グー'"]
  ;敗北(VP-1)　敵の攻撃力上昇[r]
  [eval exp="f.VP = f.VP - 3"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnVBuff = f.EnVBuff + 0.1"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/マル.png" width="75" top="&tf.Hight" left="480" visible="true"]
  [image layer=4 storage="buff/STRup.png" width="75" top="&tf.Hight" left="580" visible="true"]
[endif]
[if exp="tf.Hand == 'パー' && tf.EnHand == 'チョキ'"]
  ;敗北(VP-1)　敵の気力上昇[r]
  [eval exp="f.VP = f.VP - 3"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnFP = f.EnFP + 5"][eval exp="f.EnFP = 100" cond="f.EnFP > 100"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/マル.png" width="75" top="&tf.Hight" left="480" visible="true"]
  [image layer=4 storage="buff/FPup.png" width="75" top="&tf.Hight" left="580" visible="true"]
[endif]

[if exp="tf.Hand == 'グー' && tf.EnHand == 'グー' && f.SPD > f.EnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [image layer=4 storage="hand/ウエ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="480" visible="true"]
[elsif exp="tf.Hand == 'グー' && tf.EnHand == 'グー' && f.SPD <= f.EnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/ウエ.png" width="75" top="&tf.Hight" left="480" visible="true"]
[endif]

[if exp="tf.Hand == 'チョキ' && tf.EnHand == 'チョキ' && f.SPD > f.EnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [image layer=4 storage="hand/ウエ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="480" visible="true"]
[elsif exp="tf.Hand == 'チョキ' && tf.EnHand == 'チョキ' && f.SPD <= f.EnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [image layer=4  storage="hand/バツ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4  storage="hand/ウエ.png" width="75" top="&tf.Hight" left="480" visible="true"]
[endif]

[if exp="tf.Hand == 'パー' && tf.EnHand == 'パー' && f.SPD > f.EnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [image layer=4 storage="hand/ウエ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="480" visible="true"]
[elsif exp="tf.Hand == 'パー' && tf.EnHand == 'パー' && f.SPD <= f.EnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [image layer=4 storage="hand/バツ.png" width="75" top="&tf.Hight" left="380" visible="true"]
  [image layer=4 storage="hand/ウエ.png" width="75" top="&tf.Hight" left="480" visible="true"]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"]
  [jump target="*勝敗判定"]
[endif]

[eval exp="f.SPD = 0" cond="f.SPD < 0"]
[eval exp="f.EnSPD = 0" cond="f.EnSPD < 0"]
[wt7][wait time="500"]
[showStatus]
[wait time="1000"]
[jump target="*コマンド判定"]
[s]


*コマンド判定
[iscript]
f.Comand = 0;
if(f.selectOption[f.count-3].hand == "グー" && f.selectOption[f.count-2].hand == "グー" && f.selectOption[f.count-1].hand == "グー"){
  f.Comand = 1;
}
if(f.selectOption[f.count-3].hand == "チョキ" && f.selectOption[f.count-2].hand == "チョキ" && f.selectOption[f.count-1].hand == "チョキ"){
  f.Comand = 2;
}
if(f.selectOption[f.count-3].hand == "パー" && f.selectOption[f.count-2].hand == "パー" && f.selectOption[f.count-1].hand == "パー"){
  f.Comand = 3;
}
[endscript]
[if exp="f.VP>0"]
  [freeimage layer=3][freeimage layer=4]
  くぬぎの攻撃![wt5]
  [jump target="*コマンド技1" cond="f.Comand == 1"]
  [jump target="*コマンド技2" cond="f.Comand == 2"]
  [jump target="*通常攻撃"]
[else]
  [freeimage layer=3][freeimage layer=4]
  [EnName]の攻撃![wt5]
  [jump target="*コマンド技3" cond="f.Comand == 3"]
  [jump target="*敵通常攻撃"]
[endif]
error[s]


*通常攻撃
[call storage="voicePL.ks" target="*かけ声"]
[Damage]
[EnName]の体力が[emb exp="tf.Damage"]減少した。[wt7]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.EnFP = f.EnFP + 20"][eval exp="f.EnFP = 100" cond="f.EnFP > 100"]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]


*敵通常攻撃
[EnDamage]

[if exp="f.Pary > 0"]
  「代わり身の術」[wt7]
  くぬぎは[EnName]の攻撃を回避した[wt5]
  [chara_mod name="kunugi" face="battle_stand_nude"]
  くぬぎは脱衣状態になった[wt5]
  くぬぎの色気が上昇した[wt5]
  [eval exp="f.APP = f.APP + 2"]
  [eval exp="f.Pary = 0, f.Undress = 1"]
  [jump target="*戦闘続行" cond="f.HP > 0"]
[endif]


くぬぎの体力が[emb exp="tf.Damage"]減少した。[wt7]
[eval exp="f.HP = f.HP - tf.Damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
[jump target="*戦闘終了" cond="f.HP <= 0"]
[call storage="voicePL.ks" target="*悲鳴"]
[eval exp="f.FP = f.FP + 20"][eval exp="f.FP = 100" cond="f.FP > 100"]
[showStatus]

[if exp="f.Maso > 0"]
  くぬぎは痛みに快感を感じた[wt7]
  [Masochism]
  [eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
  [showStatus]
[endif]


[jump target="*戦闘絶頂" cond="f.ERO >= 100"]
[jump target="*戦闘続行" cond="f.HP > 0"]

*房中帰り
[chara_show name="kunugi" ]
[chara_show name="&f.Enemy.ID"]
[position width=960 height=50 top=590 left=0]
[showStatus]
房中術により[wt7]
くぬぎの体力が回復した[wt7]
くぬぎの疲労度が回復した[wt7]
くぬぎの敏捷度が上昇した[wt7]
くぬぎの攻撃力が上昇した[wt7]
くぬぎの防御力が上昇した[wt7]
[eval exp="f.HP = f.HP + 300 , f.TIR = 0 , f.STR = f.STR + 40 , f.DEF = f.DEF + 40 , f.SPD = f.SPD + 60"]
[eval exp="f.SPD = 100" cond="f.SPD > 100"]
[eval exp="f.HP = 1000" cond="f.HP > 1000"]
[jump target="*戦闘続行"]

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

[eval exp="f.SPD = f.SPD - 6"][eval exp="f.SPD = 0" cond="f.SPD < 0"]
[eval exp="f.EnSPD = f.EnSPD - 6"][eval exp="f.EnSPD = 0" cond="f.EnSPD < 0"]
[showStatus]

[if exp="f.EnStan == 1"]
  [EnName]は行動不能から復帰した[lrcm]
  [eval exp="f.EnStan = 0"]
[endif]

[if exp="f.StanOrga == 1"]
  くぬぎは絶頂の余韻から復帰した[lrcm]
  [eval exp="f.StanOrga = 0"]
[endif]

[if exp="f.Bitch > 0"]
  淫乱状態のくぬぎは淫らさが上昇した[lrcm]
  [eval exp="f.ARS = f.ARS + 2"]
  [showStatus]
[endif]

[if exp="f.Estr > 0 && f.turn%3 == 0"]
  くぬぎ「はぁ・・・、はぁ・・・・」[wt7]
  発情しているくぬぎは快感度が上昇した[lrcm]
  [Estrus]
  [eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
  [showStatus]
[endif]

[if exp="f.Paras > 0 && f.turn%5 == 0 && f.FP >= 0"]
  くぬぎの胎内で蟲が蠢いた[wt7]
  くぬぎ「んっ・・・！」[wt7]
  くぬぎは蟲に気力を吸収された[lrcm]
  [eval exp="f.FP = f.FP - 25 , f.countParas++"]
  [eval exp="f.FP = 0" cond="f.FP < 0"]
  [showStatus]
[elsif exp="f.Paras > 0 && f.turn%5 == 0 && f.FP < 10"]
  くぬぎの胎内で蟲が蠢いた[wt7]
  くぬぎ「ああん！！」[wt7]
  くぬぎ（普段より激しい！！気力が吸えないから？）
  気力を吸えなかった蟲はいつもより激しく暴れた[wt7]
  くぬぎの快感度が上昇した[lrcm]
  [Parasite]
  [eval exp="f.ERO = f.ERO + tf.Damage"][eval exp="f.ERO = 100" cond="f.ERO > 100"]
  [showStatus]
[endif]

[jump target="*戦闘絶頂" cond="f.ERO >= 100"]
[jump target="*ターン開始"]


*コマンド技1
;グーX３、単純物理
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(f.STR * 1.8 * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - (tf.EnDFP * 0);
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.EnFP = f.EnFP + 20"][eval exp="f.EnFP = 100" cond="f.EnFP > 100"]
「忍法・すずめ刺し！」[wt7]
[EnName]の体力が[emb exp="tf.Damage"]減少した。[wt5]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]


*コマンド技2
;チョキX3、興奮度上昇
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(f.STR * 2.5 * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[eval exp="f.value = 15"][HDamage]
[eval exp="f.EnERO = f.EnERO + tf.HDamage"][eval exp="f.EnERO = 100" cond="f.EnERO >= 100"]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.EnFP = f.EnFP + 20"][eval exp="f.EnFP = 100" cond="f.EnFP > 100"]
「忍法・よだか落とし！」[wt7]
[EnName]の体力が[emb exp="tf.Damage"]減少した。[wt5]
[EnName]の興奮度[emb exp="tf.HDamage"]が上昇した[wt5]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]


*コマンド技3
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(f.STR * 2.5 * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[eval exp="f.EnHP = f.EnHP - tf.Damage"][eval exp="f.EnHP = 0" cond="f.EnHP < 0"]
[eval exp="f.EnSPD = f.EnSPD - 10"][eval exp="f.EnSPD = 0" cond="f.EnSPD < 0"]
[eval exp="f.EnFP = f.EnFP + 20"][eval exp="f.FP = 100" cond="f.FP > 100"]
くぬぎ「甘い！」[wt7]
「忍法・つばめ返り！」[wt7]
[EnName]の体力が[emb exp="tf.Damage"]減少した。[wt5]
[showStatus]
[jump target="*戦闘終了" cond="f.EnHP <= 0"]
[jump target="*戦闘続行" cond="f.EnHP > 0"]


*スキル選択
[eval exp="f.skill = 1"]

[iscript]
f.skill1CTdigit = "UI/number/white/" + f.skill1CT + ".png";
f.skill2CTdigit = "UI/number/white/" + f.skill2CT + ".png";
f.skill3CTdigit = "UI/number/white/" + f.skill3CT + ".png";
[endscript]
[image layer=5 storage="&f.skill1CTdigit" width="20" top="75" left="25" visible="true"]
[image layer=5 storage="&f.skill2CTdigit" width="20" top="110" left="25" visible="true"]
[image layer=5 storage="&f.skill3CTdigit" width="20" top="145" left="25" visible="true"]

[glink target="*スキル1使用" text="代わり身の術" color="red" size=15 x=50 y=70 cond="f.skill1CT == 0 && f.Undress == 0"]
[glink target="*スキル選択" text="代わり身の術" color="black" size=15 x=50 y=70 cond="f.skill1CT != 0 || f.Undress != 0"]
[glink target="*スキル2使用" text="目眩ましの術" color="red" size=15 x=50 y=105 cond="f.skill2CT == 0"]
[glink target="*スキル選択" text="目眩ましの術" color="black" size=15 x=50 y=105 cond="f.skill2CT != 0"]
[glink target="*スキル3使用" text="魅了の術" color="red" size=15 x=50 y=140 exp="f.skill3CT == 0"]
[glink target="*スキル選択" text="魅了の術" color="black" size=15 x=50 y=140 cond="f.skill3CT != 0"]
[glink target="*選択1" text="戻　る" color="red" size=15 x=50 y=175 exp="f.skill = 0"]
[glink storage="bochu.ks" target="*房中開始" text="房中に入る" color="red" size=15 x=50 y=210]
[glink storage="prison.ks" target="*スタート" text="降参する" color="red" size=15 x=50 y=245]
[s]


*スキル1使用
[freeimage layer=5]
スキル1使用[wt5]
くぬぎは代わり身の術を使った[wt5]
１回だけ敵の攻撃を回避します[wt7]
[eval exp="f.Pary = 1"]
[eval exp="f.skill1CT = 6"]
[jump target="*選択1"]

*スキル2使用
[freeimage layer=5]
スキル2使用[wt7]
くぬぎは目眩ましの術を使った[wt7]
敵「ぬうっ！」[wt7]
[if exp="f.Undress == 0"]
  [EnName]がひるんでいる間にくぬぎは体勢を整えた[wt7]
[elsif exp="f.Undress != 0"]
  [EnName]がひるんでいる間にくぬぎは忍装束を纏った[wt7]
  [chara_mod name="kunugi" face="default"]
  [eval exp="f.Undress = 0"]
[endif]
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
[freeimage layer=5]
[eval exp="f.APP = f.APP + 10"]
[eval exp="f.value = 80"][HDamage]
[eval exp="f.EnERO = f.EnERO + tf.HDamage"][eval exp="f.EnERO = 100" cond="f.EnERO >= 100"]
[eval exp="f.CharmBuff = 25 , f.CharmET = 3"]
スキル3使用[wt5]
くぬぎは魅了の術を使った[wt5]
くぬぎの色気が上昇した[wt5]
[EnName]の興奮度が[emb exp="tf.HDamage"]上がった[wt5]
[EnName]の攻撃力が低下した[wt7]
[showStatus]
[jump target="*敵絶頂戦闘時" cond="f.EnERO >= 100"]
[endif]

[eval exp="f.skill3CT = 6"]
[jump target="*選択1"]


*組付判定
[EnName]が組み付いてきた！[wt7]
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
  くぬぎは[EnName]の組付を回避した[wt7]
  [jump target="*選択1"]
[endif]

[if exp="f.Pary > 0"]
  ;組付を代わり身で回避
  「代わり身の術」[wt7]
  くぬぎは[EnName]の攻撃を回避した[wt5]
  [chara_mod name="kunugi" face="battle_stand_nude"]
  くぬぎは脱衣状態になった[wt5]くぬぎの色気が上昇した[wt5]
  [eval exp="f.APP = f.APP + 2"]
  [eval exp="f.Pary = 0, f.Undress = 1"]
  [jump target="*戦闘続行" cond="f.HP > 0"]
[endif]

;組み付き成功
くぬぎ「きゃあっ！！」[wt7]
くぬぎは敵に押し倒された[wt7]

[iscript]
f.BindCount++;
f.BindPower = Math.floor(f.BaseBindPower * (f.BindCount/100 + 1));
[endscript]
[jump storage="bind.ks" target="*組付開始"]


*行動不能
[iscript]
tf.EnHand = f.EnSelectOption[f.N + (f.EnCount * 3)];
tf.Hight =  f.N * 150 + 50;
[endscript]

[if exp="tf.EnHand == 'グー'"]
  [eval exp="f.EnVP = f.EnVP + 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnVBuff = f.EnVBuff + 0.1"]
  [image layer=0 storage="buff/STRup.png" width="75" top="&tf.Hight" left="480" visible="true"]
  ;勝利(VP+1)　くぬぎの攻撃力上昇[r]
[endif]
[if exp="tf.EnHand == 'チョキ'"]
  [eval exp="f.EnVP = f.EnVP + 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnFP = f.EnFP + 5"][eval exp="f.EnFP = 100" cond="f.EnFP > 100"]
  [image layer=0 storage="buff/FPup.png" width="75" top="&tf.Hight" left="480" visible="true"]
  ;勝利(VP+1)　くぬぎの気力上昇[r]
[endif]
[if exp="tf.EnHand == 'パー'"]
  [eval exp="f.EnVP = f.EnVP + 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnSPD = f.EnSPD + 3"]
  [image layer=0 storage="buff/SPDup.png" width="75" top="&tf.Hight" left="480" visible="true"]
  ;勝利(VP+1)　くぬぎの敏捷上昇[r]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"][jump target="*行動不能"]
[endif]

[wt7][wait time="500"]
[showStatus]
[freeimage layer=0]
[EnName]の攻撃![wt5]
[jump target="*敵通常攻撃"]


*敵行動不能
[iscript]
tf.Hand = f.selectOption[f.H].hand;
[endscript]

[if exp="tf.Hand == 'グー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.VBuff = f.VBuff + 0.1"]
  [image layer=0 storage="buff/STRup.png" width="75" top="&tf.Hight" left="280" visible="true"]
  ;勝利(VP+1)　くぬぎの攻撃力上昇[r]
[endif]
[if exp="tf.Hand == 'チョキ'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.FP = f.FP + 5"][eval exp="f.FP = 100" cond="f.FP > 100"]
  [image layer=0 storage="buff/FPup.png" width="75" top="&tf.Hight" left="280" visible="true"]
  ;勝利(VP+1)　くぬぎの気力上昇[r]
[endif]
[if exp="tf.Hand == 'パー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.SPD = f.SPD + 5"]
  [image layer=0 storage="buff/SPDup.png" width="75" top="&tf.Hight" left="280" visible="true"]
  ;勝利(VP+1)　くぬぎの敏捷上昇[r]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"][jump target="*敵行動不能"]
[endif]

[wt7][wait time="500"]
[showStatus]
[freeimage layer=0]
くぬぎの攻撃![wt5]
[jump target="*コマンド判定"]


*戦闘絶頂
[cm]
くぬぎ「あっ・・・・！」[wt7]
くぬぎ（嫌っ・・・こんなことで・・・・！！）[wt7]
くぬぎ（でも、もう・・・耐えられない！！！）[wt7]
くぬぎ「もうっ・・・ダメェ！！」[wt7]
くぬぎ「イクッ・・・・！！いくううううう！！」[wt7]
くぬぎは絶頂を迎えた[wt7]
[eval exp="f.ERO = 0"][showStatus]
くぬぎの快感への抵抗が低下した[wt7]
[eval exp="f.SEN = f.SEN + 20"][showStatus]
[wait time=500]
;組付選択等割愛
くぬぎ「はぁ・・・・はぁ・・・・」[wt7]
絶頂の余韻でくぬぎは動けない！！[wt7]
[eval exp="f.StanOrga = 2"][showStatus]
[jump target="*戦闘終了" cond="f.HP <= 0"]
[jump target="*戦闘続行" cond="f.HP > 0"]


*敵絶頂戦闘時
[freeimage layer=5]
敵「くそっ！もう堪らん！！」[wt7]
[EnName]はくぬぎ押し倒した[wt7]
[jump storage="bochu.ks" target="*房中開始"]


*戦闘終了
[if exp="f.EnHP > 0"]
[showStatus]
[call storage="voicePL.ks" target="*悲鳴敗北"]
  くぬぎは敗北した...[wt7]

[jump storage="prison.ks" target="*スタート"]
[else]
  敵を倒した！！[wt7]
  疲労度が上昇した[wt7]
  [eval exp="f.TIR = f.TIR + f.turn"][eval exp="f.TIR = 100" cond="f.TIR > 100 "]
  快感度が減少した[wt7]
  [eval exp="f.ERO = f.ERO - 20"][eval exp="f.ERO = 0" cond="f.ERO < 0 "]
[endif]
[showStatus]
;戦闘終了処理
[battleEND]
[jump storage="selectStage.ks" target="*ステージセレクト"]
