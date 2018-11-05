*スタート
[macro name="showStatus"]
[iscript]
alert("クヌギ　\n体力：" + f.TempHP + "　すばやさ：" + f.TempSPD + "　気力：" + f.TempFP + "　興奮度：" + f.TempERO
+ "\n\n敵　　\n体力：" + f.TempEnHP + "　すばやさ：" + f.TempEnSPD + "　気力：" + f.TempEnFP + "　興奮度：" + f.TempEnERO);
[endscript]
[endmacro]

[iscript]
//PL初期設定
f.originHP = 1000;
f.originSTR = 50;
f.originDEF = 50;
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

f.TempOption = [];
f.TempOption = JSON.stringify(f.BaseOption);
f.TempOption = JSON.parse(f.TempOption);

f.selectOption = [];
f.count = 0;

[endscript]

[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 50;
f.originEnDEF = 50;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 0;//arouse
f.originBindPower = 100;

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

f.EnVBuff = 1.0;

f.EnCount = 0;
[endscript]

[iscript]
//環境変数
f.turn = 0;
f.BindCount=0;
[endscript]

*ターン開始
[cm]
[eval exp="f.TempSPD = f.TempSPD - 10"]
[eval exp="f.TempEnSPD = f.TempEnSPD - 10"]

[if exp="f.TempSPD < 0"]
  [eval exp="f.TempSPD = f.BaseSPD"]
  すばやさ回復[cm]
[endif]
[if exp="f.TempEnSPD < 0"]
  [eval exp="f.TempEnSPD = f.BaseEnSPD"]
  すばやさ回復[cm]
[endif]

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
  tf.Min = 0;
  tf.Max = 5;
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
tf.Min = 0;
tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice < 20){
  f.Clutch = 1;
}else{
  f.Clutch = 0;
}
[endscript]

[if exp="f.Clutch == 1"]
[jump target="組付判定"]
[endif]

*選択１
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
[glink target="*選択2" text="選択肢1" exp="f.selectOption[f.count]=f.TempOption[0]" size=15 x=150 y=35][endif]
[if exp="f.TempOption[1].switch!=1"]
[glink target="*選択2" text="選択肢2" exp="f.selectOption[f.count]=f.TempOption[1]" size=15 x=150 y=70][endif]
[if exp="f.TempOption[2].switch!=1"]
[glink target="*選択2" text="選択肢3" exp="f.selectOption[f.count]=f.TempOption[2]" size=15 x=150 y=105][endif]
[if exp="f.TempOption[3].switch!=1"]
[glink target="*選択2" text="選択肢4" exp="f.selectOption[f.count]=f.TempOption[3]" size=15 x=150 y=140][endif]
[if exp="f.TempOption[4].switch!=1"]
[glink target="*選択2" text="選択肢5" exp="f.selectOption[f.count]=f.TempOption[4]" size=15 x=150 y=175][endif]
[if exp="f.TempOption[5].switch!=1"]
[glink target="*選択2" text="選択肢6" exp="f.selectOption[f.count]=f.TempOption[5]" size=15 x=150 y=210][endif]
[if exp="f.TempOption[6].switch!=1"]
[glink target="*選択2" text="選択肢7" exp="f.selectOption[f.count]=f.TempOption[6]" size=15 x=150 y=245][endif]
[if exp="f.TempOption[7].switch!=1"]
[glink target="*選択2" text="選択肢8" exp="f.selectOption[f.count]=f.TempOption[7]" size=15 x=150 y=280][endif]
[if exp="f.TempOption[8].switch!=1"]
[glink target="*選択2" text="選択肢9" exp="f.selectOption[f.count]=f.TempOption[8]" size=15 x=150 y=315][endif]
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
[glink target="*選択3" text="選択肢1" exp="f.selectOption[f.count]=f.TempOption[0]" size=15 x=150 y=35][endif]
[if exp="f.TempOption[1].switch!=1"]
[glink target="*選択3" text="選択肢2" exp="f.selectOption[f.count]=f.TempOption[1]" size=15 x=150 y=70][endif]
[if exp="f.TempOption[2].switch!=1"]
[glink target="*選択3" text="選択肢3" exp="f.selectOption[f.count]=f.TempOption[2]" size=15 x=150 y=105][endif]
[if exp="f.TempOption[3].switch!=1"]
[glink target="*選択3" text="選択肢4" exp="f.selectOption[f.count]=f.TempOption[3]" size=15 x=150 y=140][endif]
[if exp="f.TempOption[4].switch!=1"]
[glink target="*選択3" text="選択肢5" exp="f.selectOption[f.count]=f.TempOption[4]" size=15 x=150 y=175][endif]
[if exp="f.TempOption[5].switch!=1"]
[glink target="*選択3" text="選択肢6" exp="f.selectOption[f.count]=f.TempOption[5]" size=15 x=150 y=210][endif]
[if exp="f.TempOption[6].switch!=1"]
[glink target="*選択3" text="選択肢7" exp="f.selectOption[f.count]=f.TempOption[6]" size=15 x=150 y=245][endif]
[if exp="f.TempOption[7].switch!=1"]
[glink target="*選択3" text="選択肢8" exp="f.selectOption[f.count]=f.TempOption[7]" size=15 x=150 y=280][endif]
[if exp="f.TempOption[8].switch!=1"]
[glink target="*選択3" text="選択肢9" exp="f.selectOption[f.count]=f.TempOption[8]" size=15 x=150 y=315][endif]
[glink target="*選択１" text="戻る" exp="f.return=1" size=15 x=150 y=350]
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
[glink target="*確認" text="選択肢1" exp="f.selectOption[f.count]=f.TempOption[0]" size=15 x=150 y=35][endif]
[if exp="f.TempOption[1].switch!=1"]
[glink target="確認" text="選択肢2" exp="f.selectOption[f.count]=f.TempOption[1]" size=15 x=150 y=70][endif]
[if exp="f.TempOption[2].switch!=1"]
[glink target="確認" text="選択肢3" exp="f.selectOption[f.count]=f.TempOption[2]" size=15 x=150 y=105][endif]
[if exp="f.TempOption[3].switch!=1"]
[glink target="確認" text="選択肢4" exp="f.selectOption[f.count]=f.TempOption[3]" size=15 x=150 y=140][endif]
[if exp="f.TempOption[4].switch!=1"]
[glink target="確認" text="選択肢5" exp="f.selectOption[f.count]=f.TempOption[4]" size=15 x=150 y=175][endif]
[if exp="f.TempOption[5].switch!=1"]
[glink target="確認" text="選択肢6" exp="f.selectOption[f.count]=f.TempOption[5]" size=15 x=150 y=210][endif]
[if exp="f.TempOption[6].switch!=1"]
[glink target="確認" text="選択肢7" exp="f.selectOption[f.count]=f.TempOption[6]" size=15 x=150 y=245][endif]
[if exp="f.TempOption[7].switch!=1"]
[glink target="確認" text="選択肢8" exp="f.selectOption[f.count]=f.TempOption[7]" size=15 x=150 y=280][endif]
[if exp="f.TempOption[8].switch!=1"]
[glink target="確認" text="選択肢9" exp="f.selectOption[f.count]=f.TempOption[8]" size=15 x=150 y=315][endif]
[glink target="*選択2" text="戻る" exp="f.return=1" size=15 x=150 y=350]
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
[glink target="*比較" text="決定" size=15 x=50 y=100]
[glink target="*選択3" text="戻る" exp="f.return=1" size=15 x=150 y=100]
[s]

*比較
クヌギの手札は[r]
[emb exp="f.selectOption[f.count-3].hand"]→
[emb exp="f.selectOption[f.count-2].hand"]→
[emb exp="f.selectOption[f.count-1].hand"][r][r]
敵の手札は[r]
[emb exp="f.enSelectOption[0 + (f.EnCount * 3)]"]→
[emb exp="f.enSelectOption[1 + (f.EnCount * 3)]"]→
[emb exp="f.enSelectOption[2 + (f.EnCount * 3)]"][r][l][cm]

[iscript]
f.N=0;
f.H=f.count-3;
f.VP=0;
f.VB=0;
f.EnVB=0;
[endscript]

*判定
[iscript]
tf.hand = f.selectOption[f.H].hand;
tf.enHand = f.enSelectOption[f.N + (f.EnCount * 3)];
[endscript]

[if exp="tf.hand == 'グー' && tf.enHand == 'チョキ'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.VBuff = 1.2"]
  勝利(VP+1)　クヌギの攻撃力上昇[r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'パー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.TempFP = f.TempFP + 5"]
  勝利(VP+1)　クヌギの気力上昇[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'グー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  [eval exp="f.TempSPD = f.TempSPD + 5"]
  勝利(VP+1)　クヌギのすばやさ上昇[r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'パー'"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  [eval exp="f.EnVBuff = 1.2"]
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
  相討(VP+1)　クヌギのすばやさ低下[r]
[elsif exp="tf.hand == 'グー' && tf.enHand == 'グー' && f.TempSPD < f.TempEnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.TempEnSPD = f.TempEnSPD - 10"]
  相討(VP-1)[r]
[endif]

[if exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ' && f.TempSPD >= f.TempEnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.TempSPD = f.TempSPD - 10"]
  相討(VP+1)　クヌギのすばやさ低下[r]
[elsif exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ' && f.TempSPD < f.TempEnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.TempEnSPD = f.TempEnSPD - 10"]
  相討(VP-1)[r]
[endif]

[if exp="tf.hand == 'パー' && tf.enHand == 'パー' && f.TempSPD >= f.TempEnSPD"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.TempSPD = f.TempSPD - 10"]
  相討(VP+1)　クヌギのすばやさ低下[r]
[elsif exp="tf.hand == 'パー' && tf.enHand == 'パー' && f.TempSPD < f.TempEnSPD"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.TempEnSPD = f.TempEnSPD - 10"]
  相討(VP-1)[r]
[endif]

[if exp="f.N<2"]
  [eval exp="f.N=f.N+1,f.H=f.H+1"][jump target="*判定"]
[endif]

[l][cm]
[if exp="f.VP>0"]
  クヌギの攻撃![l][cm]
[elsif exp="f.VP==0 && f.TempSPD >= f.TempEnSPD"]
  [eval exp="f.VP = f.VP + 0.5"]
  すばやさ:[eval exp="f.TempSPD"]対[eval exp="f.TempEnSPD"][l][cm]
  クヌギの攻撃![l][cm]
[elsif exp="f.VP==0 && f.TempSPD < f.TempEnSPD"]
  [eval exp="f.VP = f.VP - 0.5"]
  すばやさ:[eval exp="f.TempSPD"]対[eval exp="f.TempEnSPD"][l][cm]
  敵の攻撃![l][cm]
[else]
  敵の攻撃![l][cm]
[endif]

*ダメージ計算
[if exp="f.VP>=0"]
  [iscript]
  if(f.VB > 2){
    f.VBonus = 1.5;
  }else if(f.VB > 1){
    f.VBonus = 1.2;
  }else{
    f.VBonus = 1.0;
  }

  tf.Min = 1;
  tf.Max = 9;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  f.randomNum = (tf.dice / 100) + 1;

  tf.ATP = Math.floor(f.TempSTR * 2.0 * f.VBonus * f.VBuff * f.randomNum);
  tf.EnDFP = Math.floor(f.TempEnDEF);
  tf.Damage = tf.ATP - tf.EnDFP;
  if(tf.Damage<0){tf.Damage=0;}

  f.VBuff = 1.0;
  [endscript]
  敵の体力が[emb exp="tf.Damage"]減少した。[l][cm]
  [eval exp="f.TempEnHP = f.TempEnHP - tf.Damage"]
  [eval exp="f.TempEnFP = f.TempEnFP + 20"]
[else]
  [iscript]
  if(f.EnVB > 2){
    f.EnVBonus = 1.5;
  }else if(f.EnVB > 1){
    f.EnVBonus = 1.2;
  }else{
    f.EnVBonus = 1.0;
  }

  tf.Min = 1;
  tf.Max = 9;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  f.randomNum = (tf.dice / 100) + 1;

  tf.EnATP = Math.floor(f.TempEnSTR * 2.0 * f.EnVBonus * f.EnVBuff * f.randomNum);
  tf.DFP = Math.floor(f.TempDEF);
  tf.Damage = tf.EnATP - tf.DFP;
  if(tf.Damage<0){tf.Damage=0;}

  f.EnVBuff = 1.0;
  [endscript]
  クヌギの体力が[emb exp="tf.Damage"]減少した。[l][cm]
  [eval exp="f.TempHP = f.TempHP - tf.Damage"]
  [eval exp="f.TempFP = f.TempFP + 20"]
[endif]

[if exp="f.TempEnHP <= 0"][jump target="*戦闘終了"][endif]
[if exp="f.TempHP <= 0"][jump target="*戦闘終了"][endif]

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
[jump target="*ターン開始"]

*組付判定
敵が組み付いてきた！[l][cm]
[iscript]
tf.Min = 0;
tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(f.TempSPD < f.TempEnSPD){
  f.Clutch=1;
}else if(tf.dice > f.TempSPD - f.TempEnSPD){
  f.Clutch=1;
}else{
  f.Clutch=0;
}
[endscript]

[if exp="f.Clutch==0"]
;組み付き失敗
クヌギは組付を回避した![l][cm]
[jump target="*ターン開始"]
[endif]
;組み付き成功
クヌギ「きゃあ！！」[l][cm]
クヌギは敵に組み敷かれた[l][cm]

[iscript]
f.BindCount++;
f.TempBindPower = f.BaseBindPower * f.BindCount;
[endscript]

*組付選択
[showStatus]
[iscript]
tf.Min = 0;
tf.Max = 89;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice < 30){
  tf.enHand="グー";
}else if(tf.dice > 60){
  tf.enHand="チョキ";
}else{
  tf.enHand="パー";
}
[endscript]
[glink text="グー" exp="tf.hand='グー'" target="*組付比較" size=15 x=0 y=50]
[glink text="チョキ" exp="tf.hand='チョキ'" target="*組付比較" size=15 x=0 y=100]
[glink text="パー" exp="tf.hand='パー'" target="*組付比較" size=15 x=0 y=150]
[s]

*組付比較
クヌギ「離しなさいよ！」[l]
クヌギは抵抗した！！[l][cm]
[eval exp="f.TempFP = f.TempFP + 5"]

[if exp="tf.hand == 'グー' && tf.enHand == 'チョキ'"][eval exp="f.resist=2"]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'パー'"][eval exp="f.resist=2"]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'グー'"][eval exp="f.resist=2"]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'パー'"][eval exp="f.resist=0"]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'グー'"][eval exp="f.resist=0"]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'チョキ'"][eval exp="f.resist=0"]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'グー'"][eval exp="f.resist=1"]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ'"][eval exp="f.resist=1"]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'パー'"][eval exp="f.resist=1"]
[endif]

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
tf.Min = 1;
tf.Max = 20;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
f.randomNum = (tf.dice / 100) + 1;
f.resistPower = Math.floor(22 * f.resist * f.randomNum);
f.TempBindPower = f.TempBindPower - f.resistPower;
if(f.TempBindPower < 0){f.TempBindPower = 0;}
[endscript]

[if exp="f.TempBindPower <= 0"]
クヌギは敵の拘束を振りほどいた[l][cm]
[jump target="*組付終了"]
[endif]

[if exp="f.resist > 1"]
敵の拘束が大きく緩んだ。[l][cm]
[else]
敵の拘束が緩んだ。[l][cm]
[endif]

*組付攻撃
[iscript]
tf.Min = 0;
tf.Max = 89;
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
  敵はクヌギの胸を揉みしだいた[l][cm]
  クヌギの興奮度が上昇した[l][cm]
  [eval exp="f.TempERO=f.TempERO+10"]
[endif]

[if exp="f.enBindOption==2"]
  敵はクヌギを締め上げた[l][cm]
  [iscript]
  tf.Min = 1;
  tf.Max = 9;
  tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
  f.randomNum = (tf.dice / 100) + 1;

  tf.Damage = Math.floor(f.TempEnSTR * 0.9 * f.randomNum);
  [endscript]
  [eval exp="f.TempHP = f.TempHP - tf.Damage"]
  クヌギの体力が[emb exp="tf.Damage"]減少した[l][cm]
[endif]

[if exp="f.enBindOption==3"]
  敵はクヌギの尻に股間を押し付けた[l][cm]
  敵の興奮度が上昇した[l][cm]
  [eval exp="f.TempEnERO=f.TempEnERO+10"]
[endif]

[jump target="*組付選択"]

*組付終了
[eval exp="f.Clutch=0"]
[jump target="*ターン開始"]


*戦闘終了
[if exp="f.TempEnHP <= 0"]
  敵を倒した！！[l][cm]
[else]
  クヌギは敗北した...[l][cm]
[endif]
[jump target="*スタート"]
