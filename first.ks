*スタート
[iscript]
f.hand;
f.mainOption=[
{id:0, hand:'グー', switch:0},
{id:1, hand:'グー', switch:0},
{id:2, hand:'グー', switch:0},
{id:3, hand:'チョキ', switch:0},
{id:4, hand:'チョキ', switch:0},
{id:5, hand:'チョキ', switch:0},
{id:6, hand:'パー', switch:0},
{id:7, hand:'パー', switch:0},
{id:8, hand:'パー', switch:0}];
f.selectOption=[];

f.tempOption=[];
f.tempOption = JSON.stringify(f.mainOption);
f.tempOption = JSON.parse(f.tempOption);

f.count = 0;

[endscript]


*敵抽選
[iscript]
//敵の行動パターン抽選
tf.Min = 0;
tf.Max = 5;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice == 0){
  f.enSelectOption = ['グー','チョキ','チョキ'];
}else if(tf.dice == 1){
  f.enSelectOption = ['グー','パー','グー'];
}else if(tf.dice == 2){
  f.enSelectOption = ['パー','チョキ','グー'];
}else if(tf.dice == 3){
  f.enSelectOption = ['パー','グー','グー'];
}else if(tf.dice == 4){
  f.enSelectOption = ['チョキ','チョキ','グー'];
}else if(tf.dice == 5){
  f.enSelectOption = ['チョキ','グー','チョキ'];
}
//開示箇所の抽選
tf.Min = 0;
tf.Max = 2;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.release = tf.dice;
if(tf.release == 0){
  tf.releaseNote = f.enSelectOption[tf.release] + ',？,？';
}else if(tf.release == 1){
  tf.releaseNote = '？,' + f.enSelectOption[tf.release] + ',？';
}else{
  tf.releaseNote = '？,？,' + f.enSelectOption[tf.release];
}
[endscript]
[emb exp="f.tempOption[0].switch"][l]
[cm]
敵の行動は[emb exp="tf.releaseNote"]です[l][r]
[cm]

*選択１
[iscript]
if(f.return==1){
  f.count--;
  f.tempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}
[endscript]
テスト[emb exp="f.count"][l][r]
１手目[l][r][cm]
・・・・[emb exp="f.tempOption[0].hand"][r]
・・・・[emb exp="f.tempOption[1].hand"][r]
・・・・[emb exp="f.tempOption[2].hand"][r]
・・・・[emb exp="f.tempOption[3].hand"][r]
・・・・[emb exp="f.tempOption[4].hand"][r]
・・・・[emb exp="f.tempOption[5].hand"][r]
・・・・[emb exp="f.tempOption[6].hand"][r]
・・・・[emb exp="f.tempOption[7].hand"][r]
・・・・[emb exp="f.tempOption[8].hand"][r]
[if exp="f.tempOption[0].switch!=1"]
[glink target="*選択2" text="選択肢1" exp="f.selectOption[f.count]=f.tempOption[0]" size=15 x=0 y=35][endif]
[if exp="f.tempOption[1].switch!=1"]
[glink target="*選択2" text="選択肢2" exp="f.selectOption[f.count]=f.tempOption[1]" size=15 x=0 y=70][endif]
[if exp="f.tempOption[2].switch!=1"]
[glink target="*選択2" text="選択肢3" exp="f.selectOption[f.count]=f.tempOption[2]" size=15 x=0 y=105][endif]
[if exp="f.tempOption[3].switch!=1"]
[glink target="*選択2" text="選択肢4" exp="f.selectOption[f.count]=f.tempOption[3]" size=15 x=0 y=140][endif]
[if exp="f.tempOption[4].switch!=1"]
[glink target="*選択2" text="選択肢5" exp="f.selectOption[f.count]=f.tempOption[4]" size=15 x=0 y=175][endif]
[if exp="f.tempOption[5].switch!=1"]
[glink target="*選択2" text="選択肢6" exp="f.selectOption[f.count]=f.tempOption[5]" size=15 x=0 y=210][endif]
[if exp="f.tempOption[6].switch!=1"]
[glink target="*選択2" text="選択肢7" exp="f.selectOption[f.count]=f.tempOption[6]" size=15 x=0 y=245][endif]
[if exp="f.tempOption[7].switch!=1"]
[glink target="*選択2" text="選択肢8" exp="f.selectOption[f.count]=f.tempOption[7]" size=15 x=0 y=280][endif]
[if exp="f.tempOption[8].switch!=1"]
[glink target="*選択2" text="選択肢9" exp="f.selectOption[f.count]=f.tempOption[8]" size=15 x=0 y=315][endif]
[s]


*選択2
[iscript]
if(f.return==1){
  f.count--;
  f.tempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
選択肢1:[emb exp="f.tempOption[f.selectOption[f.count-1].id].hand"][r]
2手目[l][cm]
・・・・[emb exp="f.tempOption[0].hand"][r]
・・・・[emb exp="f.tempOption[1].hand"][r]
・・・・[emb exp="f.tempOption[2].hand"][r]
・・・・[emb exp="f.tempOption[3].hand"][r]
・・・・[emb exp="f.tempOption[4].hand"][r]
・・・・[emb exp="f.tempOption[5].hand"][r]
・・・・[emb exp="f.tempOption[6].hand"][r]
・・・・[emb exp="f.tempOption[7].hand"][r]
・・・・[emb exp="f.tempOption[8].hand"][r]
[if exp="f.tempOption[0].switch!=1"]
[glink target="*選択3" text="選択肢1" exp="f.selectOption[f.count]=f.tempOption[0]" size=15 x=0 y=35][endif]
[if exp="f.tempOption[1].switch!=1"]
[glink target="*選択3" text="選択肢2" exp="f.selectOption[f.count]=f.tempOption[1]" size=15 x=0 y=70][endif]
[if exp="f.tempOption[2].switch!=1"]
[glink target="*選択3" text="選択肢3" exp="f.selectOption[f.count]=f.tempOption[2]" size=15 x=0 y=105][endif]
[if exp="f.tempOption[3].switch!=1"]
[glink target="*選択3" text="選択肢4" exp="f.selectOption[f.count]=f.tempOption[3]" size=15 x=0 y=140][endif]
[if exp="f.tempOption[4].switch!=1"]
[glink target="*選択3" text="選択肢5" exp="f.selectOption[f.count]=f.tempOption[4]" size=15 x=0 y=175][endif]
[if exp="f.tempOption[5].switch!=1"]
[glink target="*選択3" text="選択肢6" exp="f.selectOption[f.count]=f.tempOption[5]" size=15 x=0 y=210][endif]
[if exp="f.tempOption[6].switch!=1"]
[glink target="*選択3" text="選択肢7" exp="f.selectOption[f.count]=f.tempOption[6]" size=15 x=0 y=245][endif]
[if exp="f.tempOption[7].switch!=1"]
[glink target="*選択3" text="選択肢8" exp="f.selectOption[f.count]=f.tempOption[7]" size=15 x=0 y=280][endif]
[if exp="f.tempOption[8].switch!=1"]
[glink target="*選択3" text="選択肢9" exp="f.selectOption[f.count]=f.tempOption[8]" size=15 x=0 y=315][endif]
[glink target="*選択１" text="戻る" exp="f.return=1" size=15 x=0 y=350]
[s]

*選択3
[iscript]
if(f.return==1){
  f.count--;
  f.tempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
選択肢1:[emb exp="f.tempOption[f.selectOption[f.count-2].id].hand"][r]
選択肢2:[emb exp="f.tempOption[f.selectOption[f.count-1].id].hand"][r]
3手目[l][cm]
・・・・[emb exp="f.tempOption[0].hand"][r]
・・・・[emb exp="f.tempOption[1].hand"][r]
・・・・[emb exp="f.tempOption[2].hand"][r]
・・・・[emb exp="f.tempOption[3].hand"][r]
・・・・[emb exp="f.tempOption[4].hand"][r]
・・・・[emb exp="f.tempOption[5].hand"][r]
・・・・[emb exp="f.tempOption[6].hand"][r]
・・・・[emb exp="f.tempOption[7].hand"][r]
・・・・[emb exp="f.tempOption[8].hand"][r]
[if exp="f.tempOption[0].switch!=1"]
[glink target="*確認" text="選択肢1" exp="f.selectOption[f.count]=f.tempOption[0]" size=15 x=0 y=35][endif]
[if exp="f.tempOption[1].switch!=1"]
[glink target="確認" text="選択肢2" exp="f.selectOption[f.count]=f.tempOption[1]" size=15 x=0 y=70][endif]
[if exp="f.tempOption[2].switch!=1"]
[glink target="確認" text="選択肢3" exp="f.selectOption[f.count]=f.tempOption[2]" size=15 x=0 y=105][endif]
[if exp="f.tempOption[3].switch!=1"]
[glink target="確認" text="選択肢4" exp="f.selectOption[f.count]=f.tempOption[3]" size=15 x=0 y=140][endif]
[if exp="f.tempOption[4].switch!=1"]
[glink target="確認" text="選択肢5" exp="f.selectOption[f.count]=f.tempOption[4]" size=15 x=0 y=175][endif]
[if exp="f.tempOption[5].switch!=1"]
[glink target="確認" text="選択肢6" exp="f.selectOption[f.count]=f.tempOption[5]" size=15 x=0 y=210][endif]
[if exp="f.tempOption[6].switch!=1"]
[glink target="確認" text="選択肢7" exp="f.selectOption[f.count]=f.tempOption[6]" size=15 x=0 y=245][endif]
[if exp="f.tempOption[7].switch!=1"]
[glink target="確認" text="選択肢8" exp="f.selectOption[f.count]=f.tempOption[7]" size=15 x=0 y=280][endif]
[if exp="f.tempOption[8].switch!=1"]
[glink target="確認" text="選択肢9" exp="f.selectOption[f.count]=f.tempOption[8]" size=15 x=0 y=315][endif]
[glink target="*選択2" text="戻る" exp="f.return=1" size=15 x=0 y=350]
[s]

*確認
[iscript]
if(f.return==1){
  f.count--;
  f.tempOption[f.selectOption[f.count].id].switch=0;
  f.selectOption.pop();
  f.return=0;
}else{
  f.selectOption[f.count].switch=1;//配列の参照型を利用して選択肢をオンに
  f.count++;
}
[endscript]
[cm]
選択肢1:[emb exp="f.tempOption[f.selectOption[f.count-3].id].hand"][r]
選択肢2:[emb exp="f.tempOption[f.selectOption[f.count-2].id].hand"][r]
選択肢3:[emb exp="f.tempOption[f.selectOption[f.count-1].id].hand"][r]
[glink target="*比較" text="決定" size=20 y=100]
[glink target="*選択3" text="戻る" exp="f.return=1" size=20 y=150]
[s]

*比較
あなたの選択は[r]
選択肢1:[emb exp="f.selectOption[f.count-3].hand"][r]
選択肢2:[emb exp="f.selectOption[f.count-2].hand"][r]
選択肢3:[emb exp="f.selectOption[f.count-1].hand"][r]
敵の選択は[r]
[emb exp="f.enSelectOption[0]"][r]
[emb exp="f.enSelectOption[1]"][r]
[emb exp="f.enSelectOption[2]"][r][l]
[cm]
[iscript]
f.N=f.count-3;
f.VP=0;
[endscript]

*判定
[iscript]
tf.hand = f.selectOption[f.N].hand;
tf.enHand = f.enSelectOption[f.N];
[endscript]

[if exp="tf.hand == 'グー' && tf.enHand == 'チョキ'"]
[eval exp="f.VP = f.VP + 1"]勝利１[r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'パー'"]
[eval exp="f.VP = f.VP + 1"]勝利２[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'グー'"]
[eval exp="f.VP = f.VP + 1"]勝利３[r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'パー'"]
[eval exp="f.VP = f.VP - 1"]敗北１[r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'グー'"]
[eval exp="f.VP = f.VP - 1"]敗北２[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'チョキ'"]
[eval exp="f.VP = f.VP - 1"]敗北３[r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'グー'"]
[eval exp="f.VP = f.VP + 0"]相討１[r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ'"]
[eval exp="f.VP = f.VP + 0"]相討２[r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'パー'"]
[eval exp="f.VP = f.VP + 0"]相討３[r]
[endif]

[if exp="f.N>=2"][jump target="*クリア"]
[else][eval exp="f.N=f.N+1"][jump target="*判定"]
[endif]

*クリア
[cm]
VPは[emb exp="f.VP"]です。[l][r]
クリアです。おめでとう。[l][r]

[iscript]
if(f.selectOption.length>=9){
  f.tempOption = [];
  f.tempOption = JSON.stringify(f.mainOption);
  f.tempOption = JSON.parse(f.tempOption);
  f.selectOption = [];
}
[endscript]

[jump target="敵抽選"]
