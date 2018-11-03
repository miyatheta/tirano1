*スタート
[iscript]
f.hand;
f.mainOption=[
[0,'グー',0],
[1,'グー',0],
[2,'グー',0],
[3,'チョキ',0],
[4,'チョキ',0],
[5,'チョキ',0],
[6,'パー',0],
[7,'パー',0],
[8,'パー',0]];
f.selectOption=[];
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

[cm]
敵の行動は[emb exp="tf.releaseNote"]です[l][r]
[cm]

*選択１
[iscript]
f.tempOption = f.mainOption.slice(0,f.mainOption.length);;
if(f.return==1){
  f.tempOption[f.selectOption[0][0]][2]=0;
  f.selectOption.pop();
  f.return=0;
}
[endscript]
１手目[l][r][cm]
・・・・[emb exp="f.tempOption[0]"][r]
・・・・[emb exp="f.tempOption[1]"][r]
・・・・[emb exp="f.tempOption[2]"][r]
・・・・[emb exp="f.tempOption[3]"][r]
・・・・[emb exp="f.tempOption[4]"][r]
・・・・[emb exp="f.tempOption[5]"][r]
・・・・[emb exp="f.tempOption[6]"][r]
・・・・[emb exp="f.tempOption[7]"][r]
・・・・[emb exp="f.tempOption[8]"][r]
[glink target="*選択2" text="選択肢1" exp="f.selectOption[0]=f.tempOption[0]" size=15 x=0 y=35]
[glink target="*選択2" text="選択肢2" exp="f.selectOption[0]=f.tempOption[1]" size=15 x=0 y=70]
[glink target="*選択2" text="選択肢3" exp="f.selectOption[0]=f.tempOption[2]" size=15 x=0 y=105]
[glink target="*選択2" text="選択肢4" exp="f.selectOption[0]=f.tempOption[3]" size=15 x=0 y=140]
[glink target="*選択2" text="選択肢5" exp="f.selectOption[0]=f.tempOption[4]" size=15 x=0 y=175]
[glink target="*選択2" text="選択肢6" exp="f.selectOption[0]=f.tempOption[5]" size=15 x=0 y=210]
[glink target="*選択2" text="選択肢7" exp="f.selectOption[0]=f.tempOption[6]" size=15 x=0 y=245]
[glink target="*選択2" text="選択肢8" exp="f.selectOption[0]=f.tempOption[7]" size=15 x=0 y=280]
[glink target="*選択2" text="選択肢9" exp="f.selectOption[0]=f.tempOption[8]" size=15 x=0 y=315]
[s]


*選択2
[iscript]
f.selectOption[0][2]=1;//配列の参照型を利用して選択肢をオンに
if(f.return==1){
  f.tempOption[f.selectOption[1][0]][2]=0;
  f.selectOption.pop();
  f.return=0;
}
[endscript]
選択肢1:[emb exp="f.tempOption[f.selectOption[0][0]]"][r]
2手目[l][cm]
・・・・[emb exp="f.tempOption[0]"][r]
・・・・[emb exp="f.tempOption[1]"][r]
・・・・[emb exp="f.tempOption[2]"][r]
・・・・[emb exp="f.tempOption[3]"][r]
・・・・[emb exp="f.tempOption[4]"][r]
・・・・[emb exp="f.tempOption[5]"][r]
・・・・[emb exp="f.tempOption[6]"][r]
・・・・[emb exp="f.tempOption[7]"][r]
・・・・[emb exp="f.tempOption[8]"][r]
[if exp="f.tempOption[0][2]!=1"]
[glink target="*選択3" text="選択肢1" exp="f.selectOption[1]=f.tempOption[0]" size=15 x=0 y=35][endif]
[if exp="f.tempOption[1][2]!=1"]
[glink target="*選択3" text="選択肢2" exp="f.selectOption[1]=f.tempOption[1]" size=15 x=0 y=70][endif]
[if exp="f.tempOption[2][2]!=1"]
[glink target="*選択3" text="選択肢3" exp="f.selectOption[1]=f.tempOption[2]" size=15 x=0 y=105][endif]
[if exp="f.tempOption[3][2]!=1"]
[glink target="*選択3" text="選択肢4" exp="f.selectOption[1]=f.tempOption[3]" size=15 x=0 y=140][endif]
[if exp="f.tempOption[4][2]!=1"]
[glink target="*選択3" text="選択肢5" exp="f.selectOption[1]=f.tempOption[4]" size=15 x=0 y=175][endif]
[if exp="f.tempOption[5][2]!=1"]
[glink target="*選択3" text="選択肢6" exp="f.selectOption[1]=f.tempOption[5]" size=15 x=0 y=210][endif]
[if exp="f.tempOption[6][2]!=1"]
[glink target="*選択3" text="選択肢7" exp="f.selectOption[1]=f.tempOption[6]" size=15 x=0 y=245][endif]
[if exp="f.tempOption[7][2]!=1"]
[glink target="*選択3" text="選択肢8" exp="f.selectOption[1]=f.tempOption[7]" size=15 x=0 y=280][endif]
[if exp="f.tempOption[8][2]!=1"]
[glink target="*選択3" text="選択肢9" exp="f.selectOption[1]=f.tempOption[8]" size=15 x=0 y=315][endif]
[glink target="*選択１" text="戻る" exp="f.return=1" size=15 x=0 y=350]
[s]

*選択3
[iscript]
f.selectOption[1][2]=1;//配列の参照型を利用して選択肢をオンに
if(f.return==1){
  f.tempOption[f.selectOption[2][0]][2]=0;
  f.selectOption.pop();
  f.return=0;
}
[endscript]
選択肢1:[emb exp="f.tempOption[f.selectOption[0][0]]"][r]
選択肢2:[emb exp="f.tempOption[f.selectOption[1][0]]"][r]
3手目[l][cm]
・・・・[emb exp="f.tempOption[0]"][r]
・・・・[emb exp="f.tempOption[1]"][r]
・・・・[emb exp="f.tempOption[2]"][r]
・・・・[emb exp="f.tempOption[3]"][r]
・・・・[emb exp="f.tempOption[4]"][r]
・・・・[emb exp="f.tempOption[5]"][r]
・・・・[emb exp="f.tempOption[6]"][r]
・・・・[emb exp="f.tempOption[7]"][r]
・・・・[emb exp="f.tempOption[8]"][r]
[if exp="f.tempOption[0][2]!=1"]
[glink target="*確認" text="選択肢1" exp="f.selectOption[2]=f.tempOption[0]" size=15 x=0 y=35][endif]
[if exp="f.tempOption[1][2]!=1"]
[glink target="確認" text="選択肢2" exp="f.selectOption[2]=f.tempOption[1]" size=15 x=0 y=70][endif]
[if exp="f.tempOption[2][2]!=1"]
[glink target="確認" text="選択肢3" exp="f.selectOption[2]=f.tempOption[2]" size=15 x=0 y=105][endif]
[if exp="f.tempOption[3][2]!=1"]
[glink target="確認" text="選択肢4" exp="f.selectOption[2]=f.tempOption[3]" size=15 x=0 y=140][endif]
[if exp="f.tempOption[4][2]!=1"]
[glink target="確認" text="選択肢5" exp="f.selectOption[2]=f.tempOption[4]" size=15 x=0 y=175][endif]
[if exp="f.tempOption[5][2]!=1"]
[glink target="確認" text="選択肢6" exp="f.selectOption[2]=f.tempOption[5]" size=15 x=0 y=210][endif]
[if exp="f.tempOption[6][2]!=1"]
[glink target="確認" text="選択肢7" exp="f.selectOption[2]=f.tempOption[6]" size=15 x=0 y=245][endif]
[if exp="f.tempOption[7][2]!=1"]
[glink target="確認" text="選択肢8" exp="f.selectOption[2]=f.tempOption[7]" size=15 x=0 y=280][endif]
[if exp="f.tempOption[8][2]!=1"]
[glink target="確認" text="選択肢9" exp="f.selectOption[2]=f.tempOption[8]" size=15 x=0 y=315][endif]
[glink target="*選択2" text="戻る" exp="f.return=1" size=15 x=0 y=350]
[s]

*確認
[iscript]
f.selectOption[2][2]=1;//配列の参照型を利用して選択肢をオンに
if(f.return==1){
  f.selectOption.pop();
  f.return=0;
}
[endscript]
[cm]
選択肢1:[emb exp="f.tempOption[f.selectOption[0][0]]"][r]
選択肢2:[emb exp="f.tempOption[f.selectOption[1][0]]"][r]
選択肢3:[emb exp="f.tempOption[f.selectOption[2][0]]"][r]
[glink target="*比較" text="決定" size=20 y=100]
[glink target="*選択3" text="戻る" exp="f.return=1" size=20 y=150]
[s]

*比較
あなたの選択は[r]
選択肢1:[emb exp="f.selectOption[0][1]"][r]
選択肢2:[emb exp="f.selectOption[1][1]"][r]
選択肢3:[emb exp="f.selectOption[2][1]"][r]
敵の選択は[r]
[emb exp="f.enSelectOption[0]"][r]
[emb exp="f.enSelectOption[1]"][r]
[emb exp="f.enSelectOption[2]"][r][l]
[cm]
[iscript]
f.N=0;
f.VP=0;
[endscript]

*判定
[iscript]
tf.hand = f.selectOption[f.N][1];
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
[l][cm]
VPは[emb exp="f.VP"]です。[l][r]
クリアです。おめでとう。
[jump target="スタート"]
