*スタート
[eval exp="f.hand"]
[eval exp="f.option=['0','1','2','3','4']"]
[eval exp="f.selectOption=[]"]

*選択１
[iscript]
f.option1=f.option;
[endscript]

残りの数字は[emb exp="f.option1"][l]
[glink target="選択２" text="選択肢1" exp="f.selectOption[0]=f.option1[0]" size=20 y=100]
[glink target="選択２" text="選択肢2" exp="f.selectOption[0]=f.option1[1]" size=20 y=150]
[glink target="選択２" text="選択肢3" exp="f.selectOption[0]=f.option1[2]" size=20 y=200]
[glink target="選択２" text="選択肢4" exp="f.selectOption[0]=f.option1[3]" size=20 y=250]
[glink target="選択２" text="選択肢5" exp="f.selectOption[0]=f.option1[4]" size=20 y=300]
[s]


*選択２
[cm]
あなたの選択肢1は[emb exp="f.selectOption[0]"]です[l][r]

[iscript]
f.option2 = f.option1;
i = f.option2.indexOf(f.selectOption[0]);
f.option2.splice(i,1);
[endscript]

残りの数字は[emb exp="f.option2"][l]
[glink target="選択３" text="選択肢1" exp="f.selectOption[1]=f.option2[0]" size=20 y=100]
[glink target="選択３" text="選択肢2" exp="f.selectOption[1]=f.option2[1]" size=20 y=150]
[glink target="選択３" text="選択肢3" exp="f.selectOption[1]=f.option2[2]" size=20 y=200]
[glink target="選択３" text="選択肢4" exp="f.selectOption[1]=f.option2[3]" size=20 y=250]
[glink target="選択１" text="戻る" size=20 y=300]
[s]

*選択３
あなたの選択肢2は[emb exp="f.selectOption[1]"]です[l][r]

[iscript]
f.option3=f.option2;
i = f.option3.indexOf(f.selectOption[1]);
f.option3.splice(i,1);
[endscript]

残りの数字は[emb exp="f.option3"][l]
[glink target="確認" text="選択肢1" exp="f.selectOption[2]=f.option3[0]" size=20 y=100]
[glink target="確認" text="選択肢2" exp="f.selectOption[2]=f.option3[1]" size=20 y=150]
[glink target="確認" text="選択肢3" exp="f.selectOption[2]=f.option3[2]" size=20 y=200]
[glink target="選択２" text="戻る" size=20 y=250]
[s]

*確認
あなたの選択肢3は[emb exp="f.selectOption[2]"]です[l][r]

[iscript]
f.option4=f.option3;
i = f.option4.indexOf(f.selectOption[2]);
f.option4.splice(i,1);
[endscript]

[cm]
残りの数字は[emb exp="f.option4"][l]
[glink target="クリア" text="決定" size=20 y=100]
[glink target="選択３" text="戻る" size=20 y=150]
[s]

*クリア

あなたの選択肢は[emb exp="f.selectOption"].です[l][r]
クリアです。おめでとう。
[jump target="スタート"]
