*房中開始
房中です[lrcm]
[iscript]
f.EnERO = 100
tf.React = 0;
tf.n=0;
tf.loop = 0;
tf.Step = 0;
tf.Orga = 0;
[endscript]
[eval exp="f.APP=200,f.SEN=150"]
[showStatus]

*敵発言分岐
[if exp="tf.n == 0"]
[eval exp="tf.Min=1,tf.Max=3"][dice]
[eval exp="tf.n = tf.dice"]
[elsif exp="tf.n >= 3"]
[eval exp="tf.n = 1"]
[endif]

[jump target="*導入1" cond="tf.Step == 0"]
[jump target="*導入2" cond="tf.Step == 1 && tf.loop > 1 && f.EnERO > 133"]
[jump target="*導入3" cond="tf.Step == 2 && tf.loop > 1 && f.EnERO > 166"]

[jump target="*敵発言1A" cond="tf.n == 1 && tf.Step==1"]
[jump target="*敵発言1B" cond="tf.n == 2 && tf.Step==1"]
[jump target="*敵発言1C" cond="tf.n == 3 && tf.Step==1"]

[jump target="*敵発言2A" cond="tf.n == 1 && tf.Step==2"]
[jump target="*敵発言2B" cond="tf.n == 2 && tf.Step==2"]
[jump target="*敵発言2C" cond="tf.n == 3 && tf.Step==2"]

[jump target="*敵発言2A" cond="tf.n == 1 && tf.Step==3"]
[jump target="*敵発言2B" cond="tf.n == 2 && tf.Step==3"]
[jump target="*敵発言2C" cond="tf.n == 3 && tf.Step==3"]
エラー[s]

*導入1
敵は装束を脱ぎ捨ててマラを取り出すと[r]くぬぎの腰を掴み、その秘所に荒々しく挿入した[lrcm]
くぬぎ「あうっ！！」[lrcm]
[eval exp="tf.Step = 1 , tf.loop = 0"][jump target="*敵発言分岐 "]

*敵発言1A
敵「フハハハ！！どうだ俺の愚息の味は！！たまらんだろう！？」[lrcm]
[eval exp="tf.act='A'"]
[jump target="*返事選択通常"]

*敵発言1B
敵「さすがくノ一！アソコも鍛えているな！！俺のデカマラをしっかりくわえ込みやがった！！」[lrcm]
[eval exp="tf.act='B'"]
[jump target="*返事選択通常"]

*敵発言1C
敵「ホラホラ！！もっと気合入れてアソコを締めろ！！」[lrcm]
[eval exp="tf.act='C'"]
[jump target="*返事選択通常"]


*導入2
[if exp="tf.Orga > 1"]
条件によって描写と台詞が変わります（１回以上絶頂している）[lrcm]
敵「なんだぁ？ずいぶんと感じやすいんだなぁ？」[lrcm]
くぬぎ「う、うるさい！んっ。だまれぇ！あんっ！」[lrcm]
敵「おうおう！まだ元気そうだな？じゃあ、もっと激しくいくぜ！」[lrcm]
[elsif exp="f.ERO > 50"]
条件によって描写と台詞が変わります（快感50以上）[lrcm]
敵「へっへっへっ・・・良い感じに濡れてきやがったな？」[lrcm]
敵「これならもっと激しくやっても良さそうだなぁ？」[lrcm]
[else]
条件によって描写と台詞が変わります（快感50未満）[lrcm]
敵「へっ、この俺の責めによく耐えてやがるな」[lrcm]
敵「戦いだけじゃなく、こっちの技もよく仕込まれるってわけか」[lrcm]
敵「だが、ここからが本番だぜ？」
[endif]
敵はそう言うと体勢を変えた[lrcm]

[eval exp="tf.Step = 2 , tf.loop = 0"]
[jump target="*敵発言分岐"]

*敵発言2A
敵「オラァオラァ！鳴きやがれ！！」[lrcm]
[eval exp="tf.act='A'"]
[jump target="*返事選択通常"]

*敵発言2B
敵「さすがくノ一！アソコも鍛えているな！！俺のデカマラをしっかりくわえ込みやがった！」[lrcm]
[eval exp="tf.act='B'"]
[jump target="*返事選択通常"]

*敵発言2C
敵「ホラホラ！！もっと気合入れてアソコを締めろ！！」[lrcm]
[eval exp="tf.act='C'"]
[jump target="*返事選択通常"]


*導入3
[if exp="tf.Orga > 2"]
条件によって描写と台詞が変わります（２回以上絶頂している）[lrcm]
敵「なんだぁ、さっきまでの威勢の良さはどこに行ったんだ？」[lrcm]
敵「もうドロドロじゃねえか」[lrcm]
敵「まぁいい。俺様もそろそろ限界だ。最後は盛大にイキ散らかせや！！」[lrcm]
[elsif exp="f.Orga > 1"]
条件によって描写と台詞が変わります（絶頂回数２回未満）[lrcm]
敵「なかなか気持ちよさそうじゃねえか」[lrcm]
敵「だが、まだまだ楽しませてもらうぜ」[lrcm]
[else]
条件によって描写と台詞が変わります（絶頂０回）[lrcm]
敵「ちっ、この俺の責めにここまで耐えやがるとは」[lrcm]
敵「だがな。こいつには耐えられねえだろ」[lrcm]
[endif]
敵はそう言うと体勢を変えた[lrcm]

[eval exp="tf.Step = 3 , tf.loop = 0"]
[jump target="*敵発言分岐"]

*敵発言3A
敵「うおおおお、込み上げてきたぜぇっ！！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='A'"]
[jump target="*返事選択通常"]

*敵発言3B
敵「イクぞ！オラァ！オラァ！オラァ！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='B'"]
[jump target="*返事選択通常"]

*敵発言3C
敵「ウオオオおお！！出すぞっ！！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='C'"]
[jump target="*返事選択通常"]


*返事選択通常
[jump target="*返事屈服" cond="f.MND<=0"]
[jump target="*返事絶頂" cond="f.StanOrga > 0"]
くぬぎは・・・[lrcm]
[glink target="*返事分岐" text="反抗する" exp="tf.res=1" size=15 x=100 y=50]
[glink target="*返事分岐" text="挑発する" exp="tf.res=2" size=15 x=100 y=100]
[glink target="*返事分岐" text="おだてる" exp="tf.res=3" size=15 x=100 y=150]
[glink target="*返事分岐" text="無反応" exp="tf.res=4" size=15 x=100 y=200]
[s]
*返事分岐
[eval exp="tf.tag='*返事' + tf.Step + tf.act + tf.res"]
[jump target="&tf.tag"]
エラー[s]

*返事1A1
くぬぎ「ふざけないで！んっ！あなたのものなんて最悪よっ！！」[lrcm]
くぬぎは強気に敵を罵った[lrcm]
[jump target="*敵反応"]

*返事1A2
くぬぎ「はっ！この程度で大きい？わ、笑わせないでっ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事1A3
くぬぎ「す、すごいぃ！！こんなの！初めてぇっ！」[lrcm]
くぬぎは悦ぶフリをした[lrcm]
[jump target="*敵反応"]

*返事1A4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に沈黙を貫いた[lrcm]
[jump target="*敵反応"]


*返事1B1
くぬぎ「ふざけないで！んっ！あなたのものなんて最悪よっ！！」[lrcm]
くぬぎは口汚く言い捨てた[lrcm]
[jump target="*敵反応"]

*返事1B2
くぬぎ「このっ！程度の大きさ！んっ！大したことないわ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事1B3
くぬぎ「あんっ！だ、だめぇ！！おおきすぎぃっ！」[lrcm]
くぬぎは敵のブツの大きさを褒めそやした[lrcm]
[jump target="*敵反応"]

*返事1B4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に沈黙を返した[lrcm]
[jump target="*敵反応"]


*返事1C1
くぬぎ「あなたの！言うことなんてぇ！聞かないわ！！」[lrcm]
くぬぎは敵の言葉に反抗的に言い返した[lrcm]
[jump target="*敵反応"]

*返事1C2
くぬぎ「ふっ！そういうあなたこそぉ！もっと激しく来なさいよ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事1C3
くぬぎ「はいぃ！せいいっぱい、締めますぅ！！」[lrcm]
くぬぎは敵の言葉に従順なフリをした[lrcm]
[jump target="*敵反応"]

*返事1C4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵に冷たい視線を向けた[lrcm]
[jump target="*敵反応"]


*返事2A1
くぬぎ「ふざけないで！んっ！あなたのものなんて最悪よっ！！」[lrcm]
くぬぎは強気に敵を罵った[lrcm]
[jump target="*敵反応"]

*返事2A2
くぬぎ「はっ！この程度で大きい？わ、笑わせないでっ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事2A3
くぬぎ「す、すごいぃ！！こんなの！初めてぇっ！」[lrcm]
くぬぎは悦ぶフリをした[lrcm]
[jump target="*敵反応"]

*返事2A4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に沈黙を貫いた[lrcm]
[jump target="*敵反応"]


*返事2B1
くぬぎ「ふざけないで！んっ！あなたのものなんて最悪よっ！！」[lrcm]
くぬぎは口汚く言い捨てた[lrcm]
[jump target="*敵反応"]

*返事2B2
くぬぎ「このっ！程度の大きさ！んっ！大したことないわ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事2B3
くぬぎ「あんっ！だ、だめぇ！！おおきすぎぃっ！」[lrcm]
くぬぎは敵のブツの大きさを褒めそやした[lrcm]
[jump target="*敵反応"]

*返事2B4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に沈黙を返した[lrcm]
[jump target="*敵反応"]


*返事2C1
くぬぎ「あなたの！言うことなんてぇ！聞かないわ！！」[lrcm]
くぬぎは敵の言葉に反抗的に言い返した[lrcm]
[jump target="*敵反応"]

*返事2C2
くぬぎ「ふっ！そういうあなたこそぉ！もっと激しく来なさいよ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事2C3
くぬぎ「はいぃ！せいいっぱい、締めますぅ！！」[lrcm]
くぬぎは敵の言葉に従順なフリをした[lrcm]
[jump target="*敵反応"]

*返事2C4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵に冷たい視線を向けた[lrcm]
[jump target="*敵反応"]


*返事3A1
くぬぎ「ふざけないで！んっ！あなたのものなんて最悪よっ！！」[lrcm]
くぬぎは強気に敵を罵った[lrcm]
[jump target="*敵反応"]

*返事3A2
くぬぎ「はっ！この程度で大きい？わ、笑わせないでっ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事3A3
くぬぎ「す、すごいぃ！！こんなの！初めてぇっ！」[lrcm]
くぬぎは悦ぶフリをした[lrcm]
[jump target="*敵反応"]

*返事3A4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に沈黙を貫いた[lrcm]
[jump target="*敵反応"]


*返事3B1
くぬぎ「ふざけないで！んっ！あなたのものなんて最悪よっ！！」[lrcm]
くぬぎは口汚く言い捨てた[lrcm]
[jump target="*敵反応"]

*返事3B2
くぬぎ「このっ！程度の大きさ！んっ！大したことないわ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事3B3
くぬぎ「あんっ！だ、だめぇ！！おおきすぎぃっ！」[lrcm]
くぬぎは敵のブツの大きさを褒めそやした[lrcm]
[jump target="*敵反応"]

*返事3B4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に沈黙を返した[lrcm]
[jump target="*敵反応"]


*返事3C1
くぬぎ「あなたの！言うことなんてぇ！聞かないわ！！」[lrcm]
くぬぎは敵の言葉に反抗的に言い返した[lrcm]
[jump target="*敵反応"]

*返事3C2
くぬぎ「ふっ！そういうあなたこそぉ！もっと激しく来なさいよ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
[jump target="*敵反応"]

*返事3C3
くぬぎ「はいぃ！せいいっぱい、締めますぅ！！」[lrcm]
くぬぎは敵の言葉に従順なフリをした[lrcm]
[jump target="*敵反応"]

*返事3C4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵に冷たい視線を向けた[lrcm]
[jump target="*敵反応"]


*返事屈服
くぬぎ「はいっ！！あんっ！！太くてぇっ！！[wait time=100]
たくましくてぇ！んあっ！！[wait time=100]
たまらないですっ！！！」[lrcm]
反抗心を失ったくぬぎは敵の言葉を肯定してしまう[lrcm]
[eval exp="tf.React=1"]
[jump target="*敵攻撃"]
エラー[s]

*返事絶頂
[if exp="f.StanOrga == 1"]
くぬぎ「あっ♥はぁん♥あ゛～～～～♥」[lrcm]
絶頂しているくぬぎはただ喘ぐことしかできない[lrcm]
[eval exp="tf.React=1"]

[elsif exp="f.StanOrga > 1"]
くぬぎ「あ゛っ♥あ゛～～～～♥あああ----ッ♥♥♥♥」[lrcm]
くぬぎは絶頂から降りてくることができず[lrcm]
虚ろな目で喘ぎ声を上げ続けている[lrcm]
[endif]

[jump target="*敵攻撃"]
エラー[s]


*敵反応
[iscript]
tf.Min = 0, tf.Max = 99;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
if(tf.dice < 50){
  tf.React = 0;//ネガティブ
} else{
  tf.React = 1;//ポジティブ
}
[endscript]

[if exp="tf.React==0"]
敵はくぬぎの反応に幻滅したようだ[lrcm]
[jump target="*敵攻撃"]
[endif]

[if exp="tf.React==1"]
敵はくぬぎの反応に興奮したようだ[lrcm]
くぬぎの淫力が上がった[lrcm]
[eval exp="f.APP = f.APP + 10"][showStatus][lrcm]
[jump target="*敵攻撃"]
[endif]
エラー[s]


*敵攻撃
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Damage = Math.floor(f.EnTEC/3 * f.SEN/100 * tf.randomNum);
f.ERO = f.ERO + tf.Damage;
if(f.ERO > 100){f.ERO = 100;}
[endscript]

[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

f.value = 20;
naked = (f.Undress/10) + 1;
sexAppeal = 1 + (f.APP - 50) / 100;
tf.ATP = Math.floor(f.value * sexAppeal * naked * tf.randomNum);
tf.EnDFP = (100 - f.EnEND) / 100;
tf.EnDamage = Math.floor(tf.ATP * tf.EnDFP);
if(tf.EnDamage < 0){tf.EnDamage = 0;}
f.EnERO = f.EnERO + tf.EnDamage;
if(f.EnERO > 200){f.EnERO = 200;}
[endscript]
敵は激しく腰を前後した[lrcm]
くぬぎ「あんっ！ああっ！！」[lrcm]
くぬぎの快感度が[emb exp="tf.Damage"]上昇した[lrcm]
敵の興奮度が[emb exp="tf.EnDamage"]上昇した[lrcm]
[showStatus][lrcm]

[eval exp="tf.n++ , tf.loop++"

[jump target="絶頂" cond="f.ERO >= 100"]
[jump target="房中敗北A" cond="f.HP <= 0"]
[jump target="房中敗北B" cond="f.EnERO >= 100 && f.MND <= 0"]
[jump target="房中勝利" cond="f.EnERO >= 200 && f.StanOrga == 0"]

[if exp="f.StanOrga > 0"]
[eval exp="f.StanOrga = 0" cond="f.StanOrga > 0"]
くぬぎは絶頂から立ち直った[lrcm]
[endif]

[jump target="*敵発言分岐"]
error[s]


*絶頂
くぬぎ「だめっ！！イクっ！！イクっ！！ああああああああっ！！」[lrcm]
くぬぎは絶頂を迎えた[lrcm]
[eval exp="f.MND = f.MND - 30"]
[eval exp="f.HP = f.HP - 50"]
[showStatus]

[jump target="房中敗北A" cond="f.HP <= 0"]
[jump target="房中敗北B" cond="f.EnERO >= 100 && f.MND <= 0"]

[eval exp="f.ERO = 0"]
くぬぎの快感への抵抗が低下した[lrcm]
[eval exp="f.SEN = f.SEN + 20"]
[eval exp="f.StanOrga++"]
[showStatus]
[jump target="*敵発言分岐"]
エラー[s]


*房中敗北A
;スタミナ切れ
敗北A[lrcm]
くぬぎ「はぁ・・・・はぁ・・・・」[lrcm]
くぬぎ「もう、だめぇ・・・・」[lrcm]
敵の激しい責めにくぬぎは音を上げた[lrcm]
くぬぎ「あ、待って・・・少し・・・休ませてぇ」[lrcm]
思わず情けない声で哀願してしまうが、敵がそれを聞き入れるはずもない[lrcm]
敵「何をこの程度で弱音を吐くとは！くのいちの風上にもおけぬな！！」[lrcm]
敵はぐったりとしたくぬぎをうつ伏せにひっくり返すと背後から激しく突き立てた[lrcm]
くぬぎ「ああん！！あうん！！」[lrcm]
くぬぎの嬌声と腰を打ちつける音だけが響き続ける[lrcm]
それは完全に一方的な陵辱だった[lrcm]
敵「くっ！！出すぞ！！」[lrcm]
挿入を繰り返していた敵もいよいよ辛抱たまらなくなったらしい[lrcm]
一際激しく腰を前後させてから、一気にくぬぎの最奥まで貫くとそこで精を解き放った[lrcm]
くぬぎ「ああああああああああっ！！！」
激しい快楽に焼かれ白く染まった意識をくぬぎは手放した[l][r][cm]
[iscript]
f.ERO = 0;
f.HP = f.BaseSTM;
f.MND = f.BaseMND;
[endscript]
[showStatus]
くぬぎは敗北した[lrcm][wait time=1000]
[jump storage="selectStage.ks" target="*エネミー選択"]
エラー[s]


*房中敗北B
;抵抗力切れ & スタミナ切れ OR 敵興奮度MAX
敗北B[lrcm]
くぬぎ「あんっ！！あんっ！！」[lrcm]
敵「フハハハ！！どうだ小娘が！！」[lrcm]
抵抗する気力を失ったくぬぎは敵のなすがままに犯されていた[lrcm]
くぬぎ「も、もう、やめてぇ・・・・」[lrcm]
敵の激しい責めにくぬぎは音を上げた[lrcm]
思わず情けない声で哀願してしまうが、敵がそれを聞き入れるはずもない[lrcm]
敵「ぬかせ！これからが本番よ！！」[lrcm]
敵はぐったりとしたくぬぎをうつ伏せにひっくり返すと背後から激しく突き立てた[lrcm]
くぬぎ「ああん！！あうん！！」[lrcm]
さらにそのまま両腕を捻り上げむりやりくぬぎの上体を引き起こす。[r]
のけぞるような格好になったくぬぎの中を抉るように敵の剛直が抜き差しされる[lrcm]
くぬぎ「あぐぅん！！ぃんっ！！」
くぬぎの嬌声・・・というよりもはや悲鳴と腰を打ちつける音だけが響き続ける[lrcm]
それは完全に一方的な陵辱だった[lrcm]
敵「くっ！！出すぞ！！！」[lrcm]
挿入を繰り返していた敵もいよいよ辛抱たまらなくなったらしい[lrcm]
一際激しく腰を前後させてから、一気にくぬぎの最奥まで貫くとそこで精を解き放った[lrcm]
くぬぎ「うああああああああああっ！！！」
激しい快楽に焼かれ白く染まった意識をくぬぎは手放した[lrcm]
[showStatus]
くぬぎは敗北した[lrcm]
[eval exp="f.ERO = 0 , f.MND = f.BaseMND"]
[eval exp="f.ARS = f.ARS + 1"]
くぬぎの淫力が上昇した[lrcm]
[wait time=500]
[jump storage="selectStage.ks" target="*エネミー選択"]
エラー[s]


*房中勝利
敵「ぐおおおおっ！！出すぞ！！」[lrcm]
敵の肉棒が中で一際大きく膨らむのを感じてくぬぎの目が煌めいた[lrcm]
くぬぎ「っ・・・・今よっ！！忍法・吸精破顔術！！」[lrcm]
くぬぎが印を切ると、膣が敵の逸物を一際強烈に締め上げた[lrcm]
敵「ごおおおおおおっ！！何という圧力、何という上物よ！！」[lrcm]
その感触に敵は為す術もなく精を迸らせる[lrcm]
満ち足りた呆け顔を一瞬見せた敵だったが、すぐにその顔に動揺の色が走る[lrcm]
敵「と、止まらぬ！？」[lrcm]
くぬぎの膣に刺さったままの肉棒からは精液が延々と吹き出し続け、一向に収まる様子がないのだ[lrcm]
異常を感じ腰を離そうとした敵だが、くぬぎの膣はまるで吸盤のように肉棒に吸い付き肉棒を抜くことができない[lrcm]
くぬぎ「んっ・・・んん・・・！！」[lrcm]
その間もくぬぎの中は巧みにうねり、蠢き、精を搾り取り飲み下していく[lrcm]
敵「あ、ああああ・・・あああああああっ・・・」[lrcm]
もはや竿からは痛みを感じ始めていたがそれを上回る快楽の雷が脳天までを走り続け、敵はうめき声を上げながら腰を振ることしかできない[lrcm]
いつしか敵の顔からは血の気が引き白くなっていたが、それに反比例するように恍惚の笑みが浮かび上がってきていた[lrcm]
そしてしばらく後、敵は満面の笑みを浮かべたまま白眼を剥くととうとう仰向けに地に倒れた[lrcm]
くぬぎ「んうっ・・・・！！」[lrcm]
すっかり萎えきった肉棒が抜け落ちると、くぬぎの膣からは大量の白濁液が噴き出した[lrcm]
装束を整え立ち上がったくぬぎは敵を一瞥した[lrcm]
くぬぎ「極楽浄土。見えたかしら？」[lrcm]
くぬぎは勝利した[lrcm]
[eval exp="f.TIR = f.TIR - 20"][eval exp="f.TIR = 0" cond="f.TIR < 0"]
[eval exp="f.ERO = 0 , f.MND = f.BaseMND"]
[eval exp="f.ARS = f.ARS + 1"]
くぬぎの疲労度が回復した[lrcm]
くぬぎの淫力が上昇した[lrcm]
[showStatus]
[wait time=500]
[jump storage="selectStage.ks" target="*エネミー選択"]
エラー[s]
