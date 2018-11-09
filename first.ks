*スタート
[macro name="showStatus"]
[iscript]
alert("くぬぎ　\n体力：" + f.TempHP + "　すばやさ：" + f.TempSPD + "　気力：" + f.TempFP + "　興奮度：" + f.TempERO
+ "\n\n敵　　\n体力：" + f.TempEnHP + "　すばやさ：" + f.TempEnSPD + "　気力：" + f.TempEnFP + "　興奮度：" + f.TempEnERO);
[endscript]
[endmacro]

[iscript]
//PL初期設定
f.originHP = 1000;
f.originSTR = 70;
f.originDEF = 70;
f.originSPD = 100;
f.originFP = 0;//force
f.originERO = 0;
f.originARS = 0;//arouse

f.originOption=[
{id:0, hand:'グー', name:'力', switch:0},
{id:1, hand:'グー', name:'力', switch:0},
{id:2, hand:'グー', name:'力', switch:0},
{id:3, hand:'チョキ', name:'技', switch:0},
{id:4, hand:'チョキ', name:'技', switch:0},
{id:5, hand:'チョキ', name:'技', switch:0},
{id:6, hand:'パー', name:'速', switch:0},
{id:7, hand:'パー', name:'速', switch:0},
{id:8, hand:'パー', name:'速', switch:0}];

[endscript]

[iscript]
//PL基準設定
f.BaseHP = f.originHP;
f.BaseSTR = f.originSTR;
f.BaseDEF = f.originDEF;
f.BaseSPD = f.originSPD;
f.BaseFP = f.originFP;//force
f.BaseERO = f.originERO;
f.BaseARS = f.originARS;//arouse

f.BaseOption = [];
f.BaseOption = JSON.stringify(f.originOption);
f.BaseOption = JSON.parse(f.BaseOption);

f.GBuff=1.0;
[endscript]

[iscript]
//PL一時設定
f.TempHP = f.BaseHP;
f.TempSTR = f.BaseSTR;
f.TempDEF = f.BaseDEF;
f.TempSPD = f.BaseSPD;
f.TempFP = f.BaseFP;
f.TempERO = f.BaseERO;
f.TempARS = f.BaseARS;//arouse

f.VBuff = 1.0;
f.HPBonus = 1.0;

f.TempOption = [];
f.TempOption = JSON.stringify(f.BaseOption);
f.TempOption = JSON.parse(f.TempOption);
f.selectOption = [];
f.count = 0;

f.skill1CT = 0, f.skill2CT = 0, f.skill3CT = 0;

f.Pary = 0;

[endscript]

[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 60;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1;//arouse
f.originBindPower = 100;

f.ClutchRate = 20;//組付初期値

f.BaseEnHP = f.originEnHP;
f.BaseEnSTR = f.originEnSTR;
f.BaseEnDEF = f.originEnDEF;
f.BaseEnSPD = f.originEnSPD;
f.BaseEnFP = f.originEnFP;
f.BaseEnERO = f.originEnERO;
f.BaseEnARS = f.originEnARS;//arouse
f.BaseBindPower = f.originBindPower;

f.TempEnHP = f.BaseEnHP;
f.TempEnSTR = f.BaseEnSTR;
f.TempEnDEF = f.BaseEnDEF;
f.TempEnSPD = f.BaseEnSPD;
f.TempEnFP = f.BaseEnFP;
f.TempEnERO = f.BaseEnERO;
f.TempEnARS = f.BaseEnARS;//arouse
f.TempBindPower = f.BaseBindPower;

f.originEnOption=[
{id:0, hand:'グー', name:'力', switch:0},
{id:1, hand:'グー', name:'力', switch:0},
{id:2, hand:'グー', name:'力', switch:0},
{id:3, hand:'チョキ', name:'技', switch:0},
{id:4, hand:'チョキ', name:'技', switch:0},
{id:5, hand:'チョキ', name:'技', switch:0},
{id:6, hand:'パー', name:'速', switch:0},
{id:7, hand:'パー', name:'速', switch:0},
{id:8, hand:'パー', name:'速', switch:0}];

f.BaseEnOption = JSON.stringify(f.originEnOption);
f.BaseEnOption = JSON.parse(f.BaseEnOption);
f.TempEnOption = JSON.stringify(f.BaseEnOption);
f.TempEnOption = JSON.parse(f.TempEnOption);

f.EnCount = 0;

f.EnVBuff = 1.0;
f.EnStan = 0;
[endscript]

[iscript]
//環境変数
f.turn = 0;
f.BindCount = 0;
f.ClutchTurn = 0
[endscript]

*ターン開始
[iscript]
if(f.TempSPD < 0){
  f.TempSPD = f.BaseSPD;
}
if(f.TempEnSPD < 0){
  f.TempEnSPD = f.BaseEnSPD;
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
[endscript]

[showStatus]

[iscript]
//ターン数
f.turn++;
[endscript]
[emb exp="f.turn"]合目[l][r][cm]

*敵抽選
[cm]
[iscript]
//敵の行動パターン抽選
if(f.EnCount==0){
  tf.Min = 0, tf.Max = 5;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  if(tf.dice == 0){
    f.enSelectOption = ['グー','チョキ','チョキ','パー','パー','グー','グー','パー','チョキ'];
  }else if(tf.dice == 1){
    f.enSelectOption = ['グー','パー','グー','チョキ','パー','グー','チョキ','チョキ','パー'];
  }else if(tf.dice == 2){
    f.enSelectOption = ['パー','チョキ','グー','チョキ','パー','グー','パー','チョキ','グー'];
  }else if(tf.dice == 3){
    f.enSelectOption = ['チョキ','グー','グー','チョキ','パー','チョキ','パー','パー','グー'];
  }else if(tf.dice == 4){
    f.enSelectOption = ['チョキ','チョキ','グー','チョキ','パー','グー','グー','パー','パー'];
  }else if(tf.dice == 5){
    f.enSelectOption = ['チョキ','グー','チョキ','パー','パー','グー','グー','パー','チョキ'];
  }
}

//１手目開示
f.releaseNote = f.enSelectOption[f.EnCount * 3] + '→？→？';
//使用済み手札の表示
f.usedNote = [];
if(f.EnCount>0){
  f.usedNote = f.enSelectOption.slice(0, f.EnCount*3);
}

//組付判定
tf.Min = 0, tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.Rate = f.ClutchRate + f.TempEnERO/2  + f.ClutchTurn*5;
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
[if exp="f.TempFP >= 100"]
[glink target="*発動超必殺技" text="超必殺" color="red" size=30 x=150 y=35]
[s]
[endif]
[if exp="f.TempEnFP >= 100"]
[jump target="*発動敵超必殺技"]
[endif]

*組付
[if exp="f.Clutch == 1"]
[jump target="組付判定"]
[endif]

*選択1
[iscript]
if(f.return==1){
  f.count--;
  f.TempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}
[endscript]
[emb exp="f.TempOption[0].hand"][r]
[emb exp="f.TempOption[1].hand"][r]
[emb exp="f.TempOption[2].hand"][r]
[emb exp="f.TempOption[3].hand"][r]
[emb exp="f.TempOption[4].hand"][r]
[emb exp="f.TempOption[5].hand"][r]
[emb exp="f.TempOption[6].hand"][r]
[emb exp="f.TempOption[7].hand"][r]
[emb exp="f.TempOption[8].hand"][r][r]
敵行動：[emb exp="f.releaseNote"]/使用済み：[emb exp="f.usedNote"]
[if exp="f.TempOption[0].switch!=1"]
[glink target="*選択2" text="選択肢1" exp="f.selectOption[f.count]=f.TempOption[0]" color="red" size=15 x=150 y=35][endif]
[if exp="f.TempOption[1].switch!=1"]
[glink target="*選択2" text="選択肢2" exp="f.selectOption[f.count]=f.TempOption[1]" color="red" size=15 x=150 y=70][endif]
[if exp="f.TempOption[2].switch!=1"]
[glink target="*選択2" text="選択肢3" exp="f.selectOption[f.count]=f.TempOption[2]" color="red" size=15 x=150 y=105][endif]
[if exp="f.TempOption[3].switch!=1"]
[glink target="*選択2" text="選択肢4" exp="f.selectOption[f.count]=f.TempOption[3]" color="red" size=15 x=150 y=140][endif]
[if exp="f.TempOption[4].switch!=1"]
[glink target="*選択2" text="選択肢5" exp="f.selectOption[f.count]=f.TempOption[4]" color="red" size=15 x=150 y=175][endif]
[if exp="f.TempOption[5].switch!=1"]
[glink target="*選択2" text="選択肢6" exp="f.selectOption[f.count]=f.TempOption[5]" color="red" size=15 x=150 y=210][endif]
[if exp="f.TempOption[6].switch!=1"]
[glink target="*選択2" text="選択肢7" exp="f.selectOption[f.count]=f.TempOption[6]" color="red" size=15 x=150 y=245][endif]
[if exp="f.TempOption[7].switch!=1"]
[glink target="*選択2" text="選択肢8" exp="f.selectOption[f.count]=f.TempOption[7]" color="red" size=15 x=150 y=280][endif]
[if exp="f.TempOption[8].switch!=1"]
[glink target="*選択2" text="選択肢9" exp="f.selectOption[f.count]=f.TempOption[8]" color="red" size=15 x=150 y=315][endif]
[glink target="*スキル選択" text="技　能" color="blue" size=15 x=150 y=350]
[s]


*選択2
[iscript]
if(f.return==1){
  f.count--;
  f.TempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
[emb exp="f.TempOption[0].hand"][r]
[emb exp="f.TempOption[1].hand"][r]
[emb exp="f.TempOption[2].hand"][r]
[emb exp="f.TempOption[3].hand"][r]
[emb exp="f.TempOption[4].hand"][r]
[emb exp="f.TempOption[5].hand"][r]
[emb exp="f.TempOption[6].hand"][r]
[emb exp="f.TempOption[7].hand"][r]
[emb exp="f.TempOption[8].hand"][r][r]
選択済：[emb exp="f.TempOption[f.selectOption[f.count-1].id].hand"][r]
敵行動：[emb exp="f.releaseNote"]/使用済み：[emb exp="f.usedNote"]
[if exp="f.TempOption[0].switch!=1"]
[glink target="*選択3" text="選択肢1" exp="f.selectOption[f.count]=f.TempOption[0]" color="red" size=15 x=150 y=35][endif]
[if exp="f.TempOption[1].switch!=1"]
[glink target="*選択3" text="選択肢2" exp="f.selectOption[f.count]=f.TempOption[1]" color="red" size=15 x=150 y=70][endif]
[if exp="f.TempOption[2].switch!=1"]
[glink target="*選択3" text="選択肢3" exp="f.selectOption[f.count]=f.TempOption[2]" color="red" size=15 x=150 y=105][endif]
[if exp="f.TempOption[3].switch!=1"]
[glink target="*選択3" text="選択肢4" exp="f.selectOption[f.count]=f.TempOption[3]" color="red" size=15 x=150 y=140][endif]
[if exp="f.TempOption[4].switch!=1"]
[glink target="*選択3" text="選択肢5" exp="f.selectOption[f.count]=f.TempOption[4]" color="red" size=15 x=150 y=175][endif]
[if exp="f.TempOption[5].switch!=1"]
[glink target="*選択3" text="選択肢6" exp="f.selectOption[f.count]=f.TempOption[5]" color="red" size=15 x=150 y=210][endif]
[if exp="f.TempOption[6].switch!=1"]
[glink target="*選択3" text="選択肢7" exp="f.selectOption[f.count]=f.TempOption[6]" color="red" size=15 x=150 y=245][endif]
[if exp="f.TempOption[7].switch!=1"]
[glink target="*選択3" text="選択肢8" exp="f.selectOption[f.count]=f.TempOption[7]" color="red" size=15 x=150 y=280][endif]
[if exp="f.TempOption[8].switch!=1"]
[glink target="*選択3" text="選択肢9" exp="f.selectOption[f.count]=f.TempOption[8]" color="red" size=15 x=150 y=315][endif]
[glink target="*選択1" text="戻る" exp="f.return=1" color="red" size=15 x=150 y=350]
[s]

*選択3
[iscript]
if(f.return==1){
  f.count--;
  f.TempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
[emb exp="f.TempOption[0].hand"][r]
[emb exp="f.TempOption[1].hand"][r]
[emb exp="f.TempOption[2].hand"][r]
[emb exp="f.TempOption[3].hand"][r]
[emb exp="f.TempOption[4].hand"][r]
[emb exp="f.TempOption[5].hand"][r]
[emb exp="f.TempOption[6].hand"][r]
[emb exp="f.TempOption[7].hand"][r]
[emb exp="f.TempOption[8].hand"][r][r]
選択済：[emb exp="f.TempOption[f.selectOption[f.count-2].id].hand"]→[emb exp="f.TempOption[f.selectOption[f.count-1].id].hand"][r]
敵行動：[emb exp="f.releaseNote"]/使用済み：[emb exp="f.usedNote"]
[if exp="f.TempOption[0].switch!=1"]
[glink target="*確認" text="選択肢1" exp="f.selectOption[f.count]=f.TempOption[0]" color="red" size=15 x=150 y=35][endif]
[if exp="f.TempOption[1].switch!=1"]
[glink target="確認" text="選択肢2" exp="f.selectOption[f.count]=f.TempOption[1]" color="red" size=15 x=150 y=70][endif]
[if exp="f.TempOption[2].switch!=1"]
[glink target="確認" text="選択肢3" exp="f.selectOption[f.count]=f.TempOption[2]" color="red" size=15 x=150 y=105][endif]
[if exp="f.TempOption[3].switch!=1"]
[glink target="確認" text="選択肢4" exp="f.selectOption[f.count]=f.TempOption[3]" color="red" size=15 x=150 y=140][endif]
[if exp="f.TempOption[4].switch!=1"]
[glink target="確認" text="選択肢5" exp="f.selectOption[f.count]=f.TempOption[4]" color="red" size=15 x=150 y=175][endif]
[if exp="f.TempOption[5].switch!=1"]
[glink target="確認" text="選択肢6" exp="f.selectOption[f.count]=f.TempOption[5]" color="red" size=15 x=150 y=210][endif]
[if exp="f.TempOption[6].switch!=1"]
[glink target="確認" text="選択肢7" exp="f.selectOption[f.count]=f.TempOption[6]" color="red" size=15 x=150 y=245][endif]
[if exp="f.TempOption[7].switch!=1"]
[glink target="確認" text="選択肢8" exp="f.selectOption[f.count]=f.TempOption[7]" color="red" size=15 x=150 y=280][endif]
[if exp="f.TempOption[8].switch!=1"]
[glink target="確認" text="選択肢9" exp="f.selectOption[f.count]=f.TempOption[8]" color="red" size=15 x=150 y=315][endif]
[glink target="*選択2" text="戻る" exp="f.return=1" color="red" size=15 x=150 y=350]
[s]

*確認
[iscript]
if(f.return==1){
  f.count--;
  f.TempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
[cm]
選択済:[emb exp="f.TempOption[f.selectOption[f.count-3].id].hand"]→
[emb exp="f.TempOption[f.selectOption[f.count-2].id].hand"]→
[emb exp="f.TempOption[f.selectOption[f.count-1].id].hand"][r]
敵行動：[emb exp="f.releaseNote"]
[glink target="*比較" text="決定" color="red" size=15 x=50 y=100]
[glink target="*選択3" text="戻る" exp="f.return=1" color="red" size=15 x=150 y=100]
[s]

*比較
[iscript]
f.N=0;
f.H=f.count-3;
f.VP=0;
f.VB=0;
f.EnVB=0;
[endscript]

[if exp="f.EnStan > 0"]
くぬぎの手札は[r]
[emb exp="f.selectOption[f.count-3].hand"]→
[emb exp="f.selectOption[f.count-2].hand"]→
[emb exp="f.selectOption[f.count-1].hand"][r][r]
敵は行動不能に陥っている[r][l][cm]
[jump target="*敵行動不能"]
[endif]

くぬぎの手札は[r]
[emb exp="f.selectOption[f.count-3].hand"]→
[emb exp="f.selectOption[f.count-2].hand"]→
[emb exp="f.selectOption[f.count-1].hand"][r][r]
敵の手札は[r]
[emb exp="f.enSelectOption[0 + (f.EnCount * 3)]"]→
[emb exp="f.enSelectOption[1 + (f.EnCount * 3)]"]→
[emb exp="f.enSelectOption[2 + (f.EnCount * 3)]"][r][l][cm]

*判定
[iscript]
tf.hand = f.selectOption[f.H].hand;
tf.enHand = f.enSelectOption[f.N + (f.EnCount * 3)];
[endscript]

[if exp="tf.hand == 'グー' && tf.enHand == 'チョキ'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.VBuff = f.VBuff + 0.1"]
  勝利(VP+1)　くぬぎの攻撃力上昇[r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'パー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.TempFP = f.TempFP + 5"]
  勝利(VP+1)　くぬぎの気力上昇[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'グー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.TempSPD = f.TempSPD + 5"]
  勝利(VP+1)　くぬぎのすばやさ上昇[r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'パー'"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnVBuff = 1.1"]
  敗北(VP-1)　敵の攻撃力上昇[r]
  [endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'グー'"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.TempEnFP = f.TempEnFP + 5"]
  敗北(VP-1)　敵の気力上昇[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'チョキ'"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.TempEnSPD = f.TempEnSPD + 5"]
  敗北(VP-1)　敵のすばやさ上昇[r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'グー' && f.TempSPD >= f.TempEnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.TempSPD = f.TempSPD -10"]
  相討(VP+1)　くぬぎのすばやさ低下[r]
[elsif exp="tf.hand == 'グー' && tf.enHand == 'グー' && f.TempSPD < f.TempEnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.TempEnSPD = f.TempEnSPD - 10"]
  相討(VP-1)　敵のすばやさ低下[r]
[endif]

[if exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ' && f.TempSPD >= f.TempEnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.TempSPD = f.TempSPD - 10"]
  相討(VP+1)　くぬぎのすばやさ低下[r]
[elsif exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ' && f.TempSPD < f.TempEnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.TempEnSPD = f.TempEnSPD - 10"]
  相討(VP-1)　敵のすばやさ低下[r]
[endif]

[if exp="tf.hand == 'パー' && tf.enHand == 'パー' && f.TempSPD >= f.TempEnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.TempSPD = f.TempSPD - 10"]
  相討(VP+1)　くぬぎのすばやさ低下[r]
[elsif exp="tf.hand == 'パー' && tf.enHand == 'パー' && f.TempSPD < f.TempEnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.TempEnSPD = f.TempEnSPD - 10"]
  相討(VP-1)　敵のすばやさ低下[r]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"][jump target="*判定"]
[endif]

[l][cm]
[if exp="f.VP>0"]
  くぬぎの攻撃![l][cm]
  [jump target="*ダメージ計算"]
[else]
  敵の攻撃![l][cm]
  [jump target="*敵ダメージ計算"]
[endif]

*敵行動不能
[iscript]
tf.hand = f.selectOption[f.H].hand;
[endscript]

[if exp="tf.hand == 'グー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.VBuff = f.VBuff + 0.1"]
  勝利(VP+1)　くぬぎの攻撃力上昇[r]
[endif]
[if exp="tf.hand == 'チョキ'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.TempFP = f.TempFP + 5"]
  勝利(VP+1)　くぬぎの気力上昇[r]
[endif]
[if exp="tf.hand == 'パー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.TempSPD = f.TempSPD + 5"]
  勝利(VP+1)　くぬぎのすばやさ上昇[r]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"][jump target="*敵行動不能"]
[endif]

[l][cm]
くぬぎの攻撃![l][cm]
[jump target="*ダメージ計算"]

*ダメージ計算
[iscript]
if(f.VB > 2){
  f.VBonus = 1.3;
}else if(f.VB > 1){
  f.VBonus = 1.2;
}else{
  f.VBonus = 1.1;
}

tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(f.TempSTR * 1.8 * f.VBonus * f.VBuff * f.randomNum);
tf.EnDFP = Math.floor(f.TempEnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}

f.VBuff = 1.0;
[endscript]
敵の体力が[emb exp="tf.Damage"]減少した。[l][cm]
[eval exp="f.TempEnHP = f.TempEnHP - tf.Damage"]
[eval exp="f.TempEnFP = f.TempEnFP + 20"]

[if exp="f.TempEnHP <= 0"][jump target="*戦闘終了"][endif]
[jump target="*戦闘続行"]

*敵ダメージ計算
[iscript]
if(f.EnVB > 2){
  f.EnVBonus = 1.3;
}else if(f.EnVB > 1){
  f.EnVBonus = 1.2;
}else{
  f.EnVBonus = 1.1;
}

tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.randomNum = (tf.dice / 1000) + 1;

tf.EnATP = Math.floor(f.TempEnSTR * 1.8 * f.EnVBonus * f.EnVBuff * f.randomNum);
tf.DFP = Math.floor(f.TempDEF);
tf.Damage = tf.EnATP - tf.DFP;
if(tf.Damage<0){tf.Damage=0;}

f.EnVBuff = 1.0;
[endscript]
くぬぎの体力が[emb exp="tf.Damage"]減少した。[l][cm]
[eval exp="f.TempHP = f.TempHP - tf.Damage"]
[eval exp="f.TempFP = f.TempFP + 20"]

[if exp="f.TempHP <= 0"][jump target="*戦闘終了"][endif]
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
[eval exp="f.TempSPD = f.TempSPD - 10"]
[eval exp="f.TempEnSPD = f.TempEnSPD - 10"]

[if exp="f.EnStan == 1"]
敵は行動不能から復帰した[l][cm]
[eval exp="f.EnStan=0"]
[endif]

[jump target="*ターン開始"]

*組付判定
敵が組み付いてきた！[l][cm]
[iscript]
tf.Min = 0, tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(f.TempSPD < f.TempEnSPD){
  f.Clutch = 1;
}else if(tf.dice > f.TempSPD - f.TempEnSPD){
  f.Clutch = 1;
}else{
  f.Clutch = 0;
}
[endscript]

[if exp="f.Clutch==0"]
;組み付き失敗
くぬぎは敵の組付を回避した![l][cm]
[jump target="*選択1"]
[endif]
;組み付き成功
くぬぎ「きゃあっ！！」[l][cm]
くぬぎは敵に押し倒された[l][cm]

[iscript]
f.BindCount++;
f.TempBindPower = Math.floor(f.BaseBindPower * (f.BindCount/100 + 1));
[endscript]
[jump storage="bind.ks" target="*組付選択"]


*発動超必殺技
くぬぎ「受けてみなさい！忍法・鳴神の舞」[l][r]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.randomNum = (tf.dice / 1000) + 1;
//残HPボーナス
if(f.TempHP < f.TempEnHP){
  f.HPBonus = (f.TempEnHP - f.TempHP)/f.TempEnHP + 1;
}

tf.ATP = Math.floor(300 * f.HPBonus * f.randomNum);
tf.EnDFP = Math.floor(f.TempEnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[emb exp="tf.ATP"],[emb exp="f.randomNum"],[emb exp="tf.EnDFP"],[emb exp="f.HPBonus"][l]
敵の体力が[emb exp="tf.Damage"]減少した。[l][cm]
[eval exp="f.TempEnHP = f.TempEnHP - tf.Damage"]
[eval exp="f.TempFP = 0"]
[if exp="f.TempEnHP <= 0"][jump target="*戦闘終了"][endif]

[jump target="*ターン開始"]

*発動敵超必殺技
敵「散れい！小娘！！」[l][r]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.randomNum = (tf.dice / 1000) + 1;

tf.ATP = Math.floor(350 * f.randomNum);
tf.EnDFP = Math.floor(f.TempEnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
くぬぎの体力が[emb exp="tf.Damage"]減少した。[l][cm]
[eval exp="f.TempHP = f.TempHP - tf.Damage"]
[eval exp="f.TempEnFP = 0"]
[if exp="f.TempHP <= 0"][jump target="*戦闘終了"][endif]

[jump target="*ターン開始"]


*スキル選択
[emb exp="f.skill1CT"][r]
[emb exp="f.skill2CT"][r]
[emb exp="f.skill3CT"][r]

[if exp="f.skill1CT == 0"]
[glink target="*スキル1使用" text="代わり身の術" color="red" size=15 x=50 y=35]
[endif]
[glink text="代わり身の術" color="black" size=15 x=50 y=35]

[if exp="f.skill2CT == 0"]
[glink target="*スキル2使用" text="目眩ましの術" color="red" size=15 x=50 y=70]
[endif]
[glink text="目眩ましの術" color="black" size=15 x=50 y=70]

[if exp="f.skill3CT == 0"]
[glink target="*スキル3使用" text="魅了の術" color="red" size=15 x=50 y=105]
[endif]
[glink text="魅了の術" color="black" size=15 x=50 y=105]

[glink target="*選択1" text="戻　る" color="red" size=15 x=50 y=140]
[s]

*スキル1使用
スキル1使用[l][cm]
くぬぎは代わり身の術を使った[l][cm]
１回だけ敵の攻撃を回避します[l][cm]
[eval exp="f.Pary = 1"]
[eval exp="f.skill1CT = 6"]
[jump target="*選択1"]

*スキル2使用
スキル2使用[l][cm]
くぬぎは目眩ましの術を使った[l][cm]
敵「ぬうっ！」[l][cm]
敵がひるんでいる間にくぬぎは体勢を整えた[l][cm]
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
スキル3使用[l][cm]
くぬぎは魅了の術を使った[l][cm]
敵の興奮度が上がった[l][cm]

[iscript]
tf.Min = 0, tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice > 60){
  f.EnStan = 1;
}
[endscript]
[if exp="f.EnStan==1"]
敵は行動不能に陥った[l][cm]
[endif]

[eval exp="f.skill3CT = 6"]
[jump target="*選択1"]

*戦闘終了
[if exp="f.TempEnHP <= 0"]
  敵を倒した！！[l][cm]
[else]
  くぬぎは敗北した...[l][cm]
[endif]
[jump target="*スタート"]
