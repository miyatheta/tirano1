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
f.originSTR = 100;
f.originDEF = 100;
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
f.TempARS= f.BaseARS;//arouse

f.TempOption = [];
f.TempOption = JSON.stringify(f.BaseOption);
f.TempOption = JSON.parse(f.TempOption);

f.selectOption = [];
f.count = 0;

[endscript]

[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 100;
f.originEnDEF = 100;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 0;//arouse

f.BaseEnHP = f.originEnHP;
f.BaseEnSTR = f.originEnSTR;
f.BaseEnDEF = f.originEnDEF;
f.BaseEnSPD = f.originEnSPD;
f.BaseEnFP = f.originEnFP;
f.BaseEnERO = f.originEnERO;
f.BaseEnARS = f.originEnARS;//arouse

f.TempEnHP = f.BaseEnHP;
f.TempEnSTR = f.BaseEnSTR;
f.TempEnDEF = f.BaseEnDEF;
f.TempEnSPD = f.BaseEnSPD;
f.TempEnFP = f.BaseEnFP;
f.TempEnERO = f.BaseEnERO;
f.TempEnARS = f.BaseEnARS;//arouse

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
[endscript]

*ターン開始
[cm]
[eval exp="f.TempSPD = f.TempSPD - 10"]
[eval exp="f.TempEnSPD = f.TempEnSPD - 10"]
[showStatus]

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
//開示箇所の抽選
tf.Min = 0 + (f.EnCount * 3);
tf.Max = 2 + (f.EnCount * 3);
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.release = tf.dice;
if(tf.release == 0 + (f.EnCount * 3)){
  f.releaseNote = f.enSelectOption[tf.release] + '→？→？';
}else if(tf.release == 1 + (f.EnCount * 3)){
  f.releaseNote = '？→' + f.enSelectOption[tf.release] + '→？';
}else{
  f.releaseNote = '？→？→' + f.enSelectOption[tf.release];
}
//
f.usedNote = [];
if(f.EnCount>0){
  f.usedNote = f.enSelectOption.slice(0, f.EnCount*3);
}
[endscript]
敵の行動は[emb exp="f.EnCount"]巡目[emb exp="f.releaseNote"]です[l][r][cm]


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
2手目・・・・・・・・・[cm]
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
3手目・・・・・・・・・[cm]
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
  勝利１(VP+1)[r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'パー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  勝利２(VP+1)[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'グー'"]
  [eval exp="f.VP = f.VP + 1"]
  [eval exp="f.VB = f.VB + 1"]
  勝利３(VP+1)[r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'パー'"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  敗北１(VP-1)[r]
  [endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'グー'"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  敗北２(VP-1)[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'チョキ'"]
  [eval exp="f.VP = f.VP - 1"]
  [eval exp="f.EnVB = f.EnVB + 1"]
  敗北３(VP-1)[r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'グー' "]
  [eval exp="f.VP = f.VP + 0"]
  相討(VP+0)[r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ' "]
  [eval exp="f.VP = f.VP + 0"]
  相討(VP+0)[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'パー' "]
  [eval exp="f.VP = f.VP + 0"]
  相討(VP+0)[r]
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
    f.VBuff=2.0;
  }else if(f.VB > 1){
    f.VBuff=1.3;
  }else{
    f.VBuff=1.0;
  }
  tf.ATP = Math.floor(f.TempSTR * 1.5 * f.VBuff );
  tf.EnDFP = Math.floor(f.TempEnDEF);
  tf.Damage = tf.ATP - tf.EnDFP;
  if(tf.Damage<0){tf.Damage=0;}
  [endscript]
  敵の体力が[emb exp="tf.Damage"]減少した。[l][cm]
  [eval exp="f.TempEnHP = f.TempEnHP - tf.Damage"]
  [eval exp="f.TempEnFP = f.TempEnFP + 10"]
[else]
  [iscript]
  if(f.EnVB > 2){
    f.EnVBuff=2.0;
  }else if(f.EnVB > 1){
    f.EnVBuff=1.3;
  }else{
    f.EnVBuff=1.0;
  }
  tf.EnATP = Math.floor(f.TempEnSTR * 1.5 * f.EnVBuff);
  tf.DFP = Math.floor(f.TempDEF);
  tf.Damage = tf.EnATP - tf.DFP;
  if(tf.Damage<0){tf.Damage=0;}
  [endscript]
  クヌギの体力が[emb exp="tf.Damage"]減少した。[l][cm]
  [eval exp="f.TempHP = f.TempHP - tf.Damage"]
  [eval exp="f.TempFP = f.TempFP + 10"]
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
[if exp="f.TempSPD<=0"]
  [eval exp="f.TempSPD = f.BaseSPD"]
[endif]
[if exp="f.TempEnSPD<=0"]
  [eval exp="f.TempEnSPD = f.BaseEnSPD"]
[endif]
[jump target="*ターン開始"]

*戦闘終了
[if exp="f.TempEnHP <= 0"]
  敵を倒した！！[l][cm]
[else]
  クヌギは敗北した...[l][cm]
[endif]
[jump target="*スタート"]
