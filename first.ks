*スタート
[eval exp="f.hand"]
[eval exp="f.option=['0','1','2','3','4']"]

[eval exp="f.option1=f.option"]

[emb exp="f.option1"][l]
[glink target="選択１" text="選択肢1" exp="f.selectOption1=f.option1[0]" size=20 y=100]
[glink target="選択１" text="選択肢2" exp="f.selectOption1=f.option1[1]" size=20 y=150]
[glink target="選択１" text="選択肢3" exp="f.selectOption1=f.option1[2]" size=20 y=200]
[glink target="選択１" text="選択肢4" exp="f.selectOption1=f.option1[3]" size=20 y=250]
[glink target="選択１" text="選択肢5" exp="f.selectOption1=f.option1[4]" size=20 y=300]
[s]


*選択１
[cm]
あなたの選択肢1は[emb exp="f.selectOption1"].です[l][r]

[iscript]
f.option2=f.option1;
f.option2.splice(f.selectOption1,1);
[endscript]

[emb exp="f.option2"][l]
[glink target="クリア" text="選択肢1" exp="f.selectOption2=f.option2[0]" size=20 y=100]
[glink target="クリア" text="選択肢2" exp="f.selectOption2=f.option2[1]" size=20 y=150]
[glink target="クリア" text="選択肢3" exp="f.selectOption2=f.option2[2]" size=20 y=200]
[glink target="クリア" text="選択肢4" exp="f.selectOption2=f.option2[3]" size=20 y=250]
[s]


*クリア
あなたの選択肢2は[emb exp="f.selectOption2"].です[l][r]
クリアです。おめでとう。
