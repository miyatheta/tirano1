*スタート
[eval exp="f.hand"]
[eval exp="f.option=[[0,'グー'],[1,'グー'],[2,'チョキ'],[3,'チョキ'],[4,'パー']]"]
[eval exp="f.selectOption=[]"]

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
f.option1=f.option;
[endscript]
[cm]

;残りの数字は[emb exp="f.option1"][l]
１手目[l]
[glink target="選択２" text="選択肢1" exp="f.selectOption[0]=f.option1[0]" size=20 y=100]
[glink target="選択２" text="選択肢2" exp="f.selectOption[0]=f.option1[1]" size=20 y=150]
[glink target="選択２" text="選択肢3" exp="f.selectOption[0]=f.option1[2]" size=20 y=200]
[glink target="選択２" text="選択肢4" exp="f.selectOption[0]=f.option1[3]" size=20 y=250]
[glink target="選択２" text="選択肢5" exp="f.selectOption[0]=f.option1[4]" size=20 y=300]
[s]


*選択２
[cm]
;あなたの選択肢1は[emb exp="f.selectOption[0]"]です[l][r]

[iscript]
if(f.return!=1){
  f.option2 = f.option1.slice(0,f.option1.length);
  i = f.option2.indexOf(f.selectOption[0]);
  f.option2.splice(i,1);
  f.return=0
}
[endscript]

;残りの数字は[emb exp="f.option2"][l]
2手目[l]
[glink target="選択３" text="選択肢1" exp="f.selectOption[1]=f.option2[0]" size=20 y=100]
[glink target="選択３" text="選択肢2" exp="f.selectOption[1]=f.option2[1]" size=20 y=150]
[glink target="選択３" text="選択肢3" exp="f.selectOption[1]=f.option2[2]" size=20 y=200]
[glink target="選択３" text="選択肢4" exp="f.selectOption[1]=f.option2[3]" size=20 y=250]
[glink target="選択１" text="戻る" exp="f.return=1" size=20 y=300]
[s]

*選択３
;あなたの選択肢2は[emb exp="f.selectOption[1]"]です[l][r]

[iscript]
if(f.return!=1){
  f.option3=f.option2.slice(0,f.option2.length);
  i = f.option3.indexOf(f.selectOption[1]);
  f.option3.splice(i,1);
  f.return=0
}
[endscript]

;残りの数字は[emb exp="f.option3"][l]
3手目[l]
[glink target="確認" text="選択肢1" exp="f.selectOption[2]=f.option3[0]" size=20 y=100]
[glink target="確認" text="選択肢2" exp="f.selectOption[2]=f.option3[1]" size=20 y=150]
[glink target="確認" text="選択肢3" exp="f.selectOption[2]=f.option3[2]" size=20 y=200]
[glink target="選択２" text="戻る" exp="f.return=1" size=20 y=250]
[s]

*確認
;あなたの選択肢3は[emb exp="f.selectOption[2]"]です[l][r]

[iscript]
if(f.return!=1){
  f.option4=f.option3.slice(0,f.option3.length);
  i = f.option4.indexOf(f.selectOption[2]);
  f.option4.splice(i,1);
  f.return=0
}
[endscript]

[cm]
;残りの数字は[emb exp="f.option4"][l]
あなたの選択は[emb exp="f.selectOption"]です[l][r]
[glink target="比較" text="決定" size=20 y=100]
[glink target="選択３" text="戻る" exp="f.return=1" size=20 y=150]
[s]

*比較
あなたの選択は[emb exp="f.selectOption"]です[l][r]
敵の選択は[emb exp="f.enSelectOption"]です[l][r]
[cm]
[iscript]
tf.hand = f.selectOption[0][1];
tf.enHand = f.enSelectOption[0];
[endscript]

[if exp="tf.hand == 'グー' && tf.enHand == 'チョキ'"]
勝利1[l][r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'パー'"]
勝利2[l][r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'グー'"]
勝利3[l][r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'パー'"]
敗北1[l][r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'グー'"]
敗北2[l][r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'チョキ'"]
敗北3[l][r]
[endif]

[if exp="tf.hand == 'グー' && tf.enHand == 'グー'"]
相討1[l][r]
[endif]
[if exp="tf.hand == 'チョキ' && tf.enHand == 'チョキ'"]
相討2[l][r]
[endif]
[if exp="tf.hand == 'パー' && tf.enHand == 'パー'"]
相討3[l][r]
[endif]

*クリア
クリアです。おめでとう。
[jump target="スタート"]
