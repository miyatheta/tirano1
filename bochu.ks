*房中開始
[chara_hide name="kunugi" ]
[chara_hide name="&f.Enemy.ID"]
[image layer=0 x=0 y=0 width="960" storage="bochu/samplehalf.png"]
[position width=640 height=100 top=540 left=160]
[freeimage layer=2]
[freeimage layer=3]
[freeimage layer=4]
[freeimage layer=5]
[freeimage layer=8]
[freeimage layer=9]
[showStatus_H]
[iscript]
tf.React = 0;
tf.n=0;
tf.loop = 0;
tf.Step = 0;
tf.Orga = 0;
[endscript]

房中開始です[wt7]
[eval exp="f.EnERO = 0"]

*導入分岐
[if exp="tf.n == 0"]
  [eval exp="tf.Min=1,tf.Max=3"][dice]
  [eval exp="tf.n = tf.dice"]
[elsif exp="tf.n >= 3"]
  [eval exp="tf.n = 1"]
[endif]
[jump target="*導入1" cond="tf.Step == 0 "]
[jump target="*導入2" cond="tf.Step == 1 && tf.loop >= 1 && f.EnErect > 33"]
[jump target="*導入3" cond="tf.Step == 2 && tf.loop >= 1 && f.EnErect > 66"]
[jump target="*行動選択"]
[s]

*導入1
敵は装束を脱ぎ捨ててマラを取り出すと[r]くぬぎの腰を掴み、その秘所に荒々しく挿入した[lrcm]
くぬぎ「あうっ！！」[lrcm]
[eval exp="tf.Step = 1 , tf.loop = 0"]
[jump target="行動選択"]

*導入2
条件によって描写と台詞が変わります[lrcm]
[if exp="tf.Orga > 1"]
（１回以上絶頂している）[lrcm]
敵「なんだぁ？ずいぶんと感じやすいんだなぁ？」[lrcm]
くぬぎ「う、うるさい！んっ。だまれぇ！あんっ！」[lrcm]
敵「おうおう！まだ元気そうだな？じゃあ、もっと激しくいくぜ！」[lrcm]
[elsif exp="f.ERO > 50"]
（快感50以上）[lrcm]
敵「へっへっへっ・・・良い感じに濡れてきやがったな？」[lrcm]
敵「これならもっと激しくやっても良さそうだなぁ？」[lrcm]
[else]
（快感50未満）[lrcm]
敵「へっ、この俺の責めによく耐えてやがるな」[lrcm]
敵「戦いだけじゃなく、こっちの技もよく仕込まれるってわけか」[lrcm]
敵「だが、ここからが本番だぜ？」
[endif]
[eval exp="tf.Step = 2 , tf.loop = 0"]
[jump target="行動選択"]

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
[eval exp="tf.Step = 3 , tf.loop = 0"]
[jump target="行動選択"]

*行動選択
[if exp="f.StanOrga > 0"]
くぬぎは絶頂している[lrcm]
[]
[endif]
くぬぎの行動[wt7]
[glink target="*行動1" text="身をかばう" x="50" y="100" size="15"]
[glink target="*行動2" text="敵意を燃やす" x="50" y="150" size="15"]
[glink target="*行動3" text="気を引き締める" x="50" y="200" size="15"]
[glink target="*行動4" text="x" x="50" y="250" size="15"]
[s]

*行動1
くぬぎは腕で自分の身を庇った[wt7]
[wt7]
[jump target="*敵発言分岐"]

*行動2
くぬぎは敵を睨みつけた[wt7]
戦意が上昇[wt7]
[jump target="*敵発言分岐"]

*行動3
くぬぎは唇を噛んだ[wt7]
理性が上昇した[wt7]
[jump target="*敵発言分岐"]

*行動4
くぬぎは腕で自分の身を庇った[wt7]
[jump target="*敵発言分岐"]

*敵発言分岐
;[emb exp="tf.Step"]＆[emb exp="tf.n"]＆[emb exp="tf.loop"][lrcm]
[jump target="*敵発言絶頂A" cond="tf.n == 1 && f.StanOrga > 0"]
[jump target="*敵発言絶頂B" cond="tf.n == 2 && f.StanOrga > 0"]
[jump target="*敵発言絶頂C" cond="tf.n == 3 && f.StanOrga > 0"]

[jump target="*敵発言1A" cond="tf.n == 1 && tf.Step==1"]
[jump target="*敵発言1B" cond="tf.n == 2 && tf.Step==1"]
[jump target="*敵発言1C" cond="tf.n == 3 && tf.Step==1"]

[jump target="*敵発言2A" cond="tf.n == 1 && tf.Step==2"]
[jump target="*敵発言2B" cond="tf.n == 2 && tf.Step==2"]
[jump target="*敵発言2C" cond="tf.n == 3 && tf.Step==2"]

[jump target="*敵発言3A" cond="tf.n == 1 && tf.Step==3"]
[jump target="*敵発言3B" cond="tf.n == 2 && tf.Step==3"]
[jump target="*敵発言3C" cond="tf.n == 3 && tf.Step==3"]
エラー[s]

*敵発言1A
敵発言1A[lrcm]
敵「フハハハ！！どうだ俺の愚息の味は！！たまらんだろう！？」[lrcm]
[eval exp="tf.act='A'"]
[jump target="*返事選択通常"]

*敵発言1B
敵発言1B[lrcm]
敵「さすがくノ一！アソコも鍛えているな！！俺のデカマラをしっかりくわえ込みやがった！！」[lrcm]
[eval exp="tf.act='B'"]
[jump target="*返事選択通常"]

*敵発言1C
敵発言1C[lrcm]
敵「ホラホラ！！もっと気合入れてアソコを締めろ！！」[lrcm]
[eval exp="tf.act='C'"]
[jump target="*返事選択通常"]


*敵発言2A
敵発言2A[lrcm]
敵「オラァオラァ！鳴きやがれ！！」[lrcm]
[eval exp="tf.act='A'"]
[jump target="*返事選択通常"]

*敵発言2B
敵発言2B[lrcm]
敵「さすがくノ一！アソコも鍛えているな！！俺のデカマラをしっかりくわえ込みやがった！」[lrcm]
[eval exp="tf.act='B'"]
[jump target="*返事選択通常"]

*敵発言2C
敵発言2C[lrcm]
敵「ホラホラ！！もっと気合入れてアソコを締めろ！！」[lrcm]
[eval exp="tf.act='C'"]
[jump target="*返事選択通常"]


*敵発言3A
敵発言3A[lrcm]
敵「うおおおお、込み上げてきたぜぇっ！！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='A'"]
[jump target="*返事選択通常"]

*敵発言3B
敵発言3B[lrcm]
敵「イクぞ！オラァ！オラァ！オラァ！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='B'"]
[jump target="*返事選択通常"]

*敵発言3C
敵発言3C[lrcm]
敵「ウオオオおお！！出すぞっ！！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='C'"]
[jump target="*返事選択通常"]
[jump target="*返事選択通常"]


*敵発言絶頂A
敵発言絶頂A[lrcm]
敵「うおおおお、込み上げてきたぜぇっ！！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='A'"]
[jump target="*返事選択通常"]

*敵発言絶頂B
敵発言絶頂B[lrcm]
敵「イクぞ！オラァ！オラァ！オラァ！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='B'"]
[jump target="*返事選択通常"]

*敵発言絶頂C
敵発言絶頂C[lrcm]
敵「ウオオオおお！！出すぞっ！！」[lrcm]
敵は最後の追い込みとばかりに腰を激しく振った[lrcm]
[eval exp="tf.act='C'"]
[jump target="*返事選択通常"]



*返事選択通常
[glink target="*返事分岐" text="挑発する" exp="tf.res=1" size="20" x="0" y="100"]
[glink target="*返事分岐" text="誘惑する" exp="tf.res=2" size="20" x="0" y="150"]
[glink target="*返事分岐" text="哀願する" exp="tf.res=3" size="20" x="0" y="200"]
[glink target="*返事分岐" text="沈黙する" exp="tf.res=4" size="20" x="0" y="250"]
[s]

*返事分岐
[eval exp="tf.tag='*返事' + tf.act + tf.res"]
[emb exp="tf.tag"][lrcm]
[jump target="&tf.tag"]
エラー[s]

*返事A1
くぬぎ「ふざけないで！あなたのものなんて最悪よっ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
敵の理性が減少[wt7][eval exp="f.EnMND = f.EnMND - 5"][eval exp="f.EnMND = 0" cond="f.EnMND < 0"]
敵の暴力性が上昇[wt7][eval exp="f.EnANG = f.EnANG + 5"][eval exp="f.EnANG = 100" cond="f.EnANG > 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事A2
くぬぎ「す、すごいぃ！！こんなの！初めてぇっ！」[lrcm]
くぬぎは悦ぶフリをした[lrcm]
敵の理性が減少[wt7][eval exp="f.EnMND = f.EnMND - 5"][eval exp="f.EnMND = 0" cond="f.EnMND < 0"]
敵の欲情が上昇[wt7][eval exp="f.EnErect = f.EnErect + 5"][eval exp="f.EnErect = 99" cond="f.EnErect >= 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事A3
くぬぎ「いやぁっ！！お願いだから抜いてぇ！！」[lrcm]
くぬぎは涙を零して哀願した[lrcm]
敵の暴力性が減少[wt7][eval exp="f.EnANG = f.EnANG - 5"][eval exp="f.EnANG = 0" cond="f.EnANG < 0"]
敵の欲情が上昇[wt7][eval exp="f.EnErect = f.EnMND + 5"][eval exp="f.EnErect = 99" cond="f.EnErect >= 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事A4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に顔を背け沈黙を貫いた[lrcm]
敵の理性が上昇[wt7][eval exp="f.EnMND = f.EnMND + 5"][eval exp="f.EnMND = 100" cond="f.EnMND > 100"]
敵の欲情が減少[wt7][eval exp="f.EnErect = f.EnErect - 5"][eval exp="f.EnErect = 0" cond="f.EnErect < 0"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事B1
くぬぎ「はっ！この程度で大きい？わ、笑わせないでっ！！」[lrcm]
くぬぎは敵を挑発した[lrcm]
敵の理性が減少[wt7][eval exp="f.EnMND = f.EnMND - 5"][eval exp="f.EnMND = 0" cond="f.EnMND < 0"]
敵の暴力性が上昇[wt7][eval exp="f.EnANG = f.EnANG + 5"][eval exp="f.EnANG = 100" cond="f.EnANG > 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事B2
くぬぎ「あんっ！だ、だめぇ！！すごっ！おおきすぎぃっ！！」[lrcm]
くぬぎは敵のイチモツの大きさを褒めそやした[lrcm]
敵の理性が減少[wt7][eval exp="f.EnMND = f.EnMND - 5"][eval exp="f.EnMND = 0" cond="f.EnMND < 0"]
敵の欲情が上昇[wt7][eval exp="f.EnErect = f.EnErect + 5"][eval exp="f.EnErect = 100" cond="f.EnErect > 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事B3
くぬぎ「だめぇ！！そんな大きなもの入らないいい！！」[lrcm]
くぬぎは涙声で叫んだ[lrcm]
敵の暴力性が減少[wt7][eval exp="f.EnANG = f.EnANG - 5"][eval exp="f.EnANG = 0" cond="f.EnANG < 0"]
敵の欲情が上昇[wt7][eval exp="f.EnErect = f.EnMND + 5"][eval exp="f.EnErect = 100" cond="f.EnErect > 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事B4
くぬぎ「・・・・・」[lrcm]
くぬぎは敵の言葉に顔を背け沈黙を貫いた[lrcm]
敵の理性が上昇[wt7][eval exp="f.EnMND = f.EnMND + 5"][eval exp="f.EnMND = 100" cond="f.EnMND > 100"]
敵の欲情が減少[wt7][eval exp="f.EnErect = f.EnErect - 5"][eval exp="f.EnErect = 0" cond="f.EnErect < 0"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事C1
くぬぎ「うるさいっ！さっさと果てろ！この下郎ぉ！！」[lrcm]
くぬぎは敵の言葉に反抗的に言い返した[lrcm]
敵の理性が上昇[wt7][eval exp="f.EnMND = f.EnMND - 5"][eval exp="f.EnMND = 0" cond="f.EnMND < 0"]
敵の欲情が減少[wt7][eval exp="f.EnANG = f.EnANG + 5"][eval exp="f.EnANG = 100" cond="f.EnANG > 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事C2
くぬぎ「あなたこそぉ！もっと激しくしてぇ！！」[lrcm]
くぬぎは敵を煽った[lrcm]
敵の理性が上昇[wt7][eval exp="f.EnMND = f.EnMND - 5"][eval exp="f.EnMND = 0" cond="f.EnMND < 0"]
敵の欲情が減少[wt7][eval exp="f.EnErect = f.EnErect + 5"][eval exp="f.EnErect = 100" cond="f.EnErect > 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事C3
くぬぎ「いやぁっ！！そんなに激しくしないでぇ！！壊れちゃう！！」[lrcm]
くぬぎは首を振りながら悲鳴を上げた[lrcm]
敵の理性が上昇[wt7][eval exp="f.EnANG = f.EnANG - 5"][eval exp="f.EnANG = 0" cond="f.EnANG < 0"]
敵の欲情が減少[wt7][eval exp="f.EnErect = f.EnMND + 5"][eval exp="f.EnErect = 100" cond="f.EnErect > 100"]
[showStatus_H]
[jump target="*敵行動選択"]

*返事1C4
くぬぎ「っ・・・・・！」[lrcm]
くぬぎは目を瞑り、声を上げるのを堪えた[lrcm]
敵の理性が上昇[wt7][eval exp="f.EnMND = f.EnMND + 5"][eval exp="f.EnMND = 100" cond="f.EnMND > 100"]
敵の欲情が減少[wt7][eval exp="f.EnErect = f.EnErect - 5"][eval exp="f.EnErect = 0" cond="f.EnErect < 0"]
[showStatus_H]
[jump target="*敵行動選択"]

*敵行動選択
[iscript]
tf.Min = 0, tf.Max = 1000;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;
[endscript]
[if exp="tf.dice<250"]
敵はくぬぎの胸を揉みしだいた[wt7]
[jump target="*反応1"]
[elsif exp="tf.dice>=250 && tf.dice<500"]
敵はくぬぎの唇に吸い付いた[wt7]
[jump target="*反応2"]
[elsif exp="tf.dice<=500 && tf.dice<750"]
敵はくぬぎの尻を叩いた[wt7]
[jump target="*反応3"]
[else]
敵はくぬぎの陰核を捻った[wt7]
[jump target="*反応4"]
[endif]

*反応1
[call storage="voicePL.ks" target="*悲鳴房中"]
くぬぎの快感が上昇[wt7][eval exp="f.ERO = f.ERO + 5"][eval exp="f.ERO = 99" cond="f.ERO > 99"]
[showStatus_H]
[jump target="*判定"]

*反応2
[call storage="voicePL.ks" target="*悲鳴房中"]
くぬぎの戦意が減少[wt7][eval exp="f.FGT = f.FGT - 5"][eval exp="f.FGT = 1" cond="f.FGT < 1"]
[showStatus_H]
[jump target="*判定"]

*反応3
[call storage="voicePL.ks" target="*悲鳴房中"]
くぬぎの戦意が減少[wt7][eval exp="f.FGT = f.FGT - 5"][eval exp="f.FGT = 1" cond="f.FGT < 1"]
[showStatus_H]
[jump target="*判定"]

*反応4
[call storage="voicePL.ks" target="*悲鳴房中"]
くぬぎの戦意が減少[wt7][eval exp="f.FGT = f.FGT - 5"][eval exp="f.FGT = 1" cond="f.FGT < 1"]
[showStatus_H]
[jump target="*判定"]


*判定
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Damage = Math.floor(f.EnTEC/10 * f.SEN/100 * tf.randomNum);
if(tf.Damage < 0){tf.Damage = 0;}
[endscript]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

f.value = 20;
naked = (f.Undress/10) + 1;
sexAppeal = 1 + f.APP / 100;
tf.ATP = Math.floor(f.value * sexAppeal * naked * tf.randomNum);
tf.EnDFP = (100 - f.EnEND) / 100;
tf.EnDamage = Math.floor(tf.ATP * tf.EnDFP);
if(tf.EnDamage < 0){tf.EnDamage = 0;}
[endscript]
敵は激しく腰を前後した[lrcm]
[call storage="voicePL.ks" target="*悲鳴房中"]
くぬぎの快感度が[emb exp="tf.Damage"]上昇した[lrcm][eval exp="f.ERO = f.ERO + tf.Damage"]
敵の快感度が[emb exp="tf.EnDamage"]上昇した[lrcm][eval exp="f.EnErect = f.EnErect + tf.EnDamage"]
[showStatus_H]

[if exp="f.ERO >= 100 && f.StanOrga > 0"]
[jump target="*連続絶頂1"]
[elsif exp="f.ERO >= 100"]
[jump target="*絶頂1"]
[else]
[jump target="*敵判定"]
[endif]

*絶頂1
[eval exp="tf.Orga = tf.Orga + 1"]
くぬぎは絶頂を迎えた[wt7]
[call storage="voicePL.ks" target="*悲鳴絶頂"]
くぬぎの理性が減少した[wt7]
くぬぎの戦意が減少した[wt7]
[eval exp="f.ERO = f.ERO - 100"]
[showStatus_H]
[eval exp="f.StanOrga=3"]
[jump target="*敵判定"]
[s]

*連続絶頂1
[eval exp="tf.Orga = tf.Orga + 1"]
くぬぎ「ダメぇ！！また！イッちゃう！！イッたままなのに！またイッちゃうううう！！！」[wt7]
くぬぎは絶頂を迎えた[wt7]
くぬぎの理性が減少した[wt7]
くぬぎの戦意が減少した[wt7]
[eval exp="f.ERO = f.ERO - 100"]
[showStatus_H]
[eval exp="f.StanOrga=3"]
[jump target="*敵判定"]
[s]

*敵判定
[if exp="f.EnErect>=100"]
[jump target="*敵絶頂"]
[else]
[jump target="*房中継続"]
[endif]
[s]

*敵絶頂
敵「くっ！！もう堪らん！！出すぞ！！」[wt7]
[eval exp="tf.Min=0 ,tf.Max=99"][dice]

[if exp="f.FGT<=0"]
[jump target="*敵絶頂戦意喪失時"]
[elsif exp="f.StanOrga>0"]
[jump target="*敵絶頂スタン時"]
[elsif exp="f.EnMND > tf.dice"]
[jump target="*敵絶頂外出"]
[else]
[jump target="*敵絶頂勝利時"]
[s]

*敵絶頂戦意喪失時
[jump target="*敗北シーン1"]
[s]

*敵絶頂スタン時
くぬぎ「いやぁ！！いまは、らめぇ！！」[wt7]
敵「うおおおおおおっ」[wt7]
[call storage="voicePL.ks" target="*悲鳴絶頂"]
敵は盛大にくぬぎの中に精を解き放った[wt7]
本来は術をかける絶好機[wt7]
しかし未だに絶頂から戻ってこれていないくぬぎに術をかける余裕はなかった[wt7]
[if exp="f.ERO>=100"]
それどころか...[wt7]
くぬぎ「ダメぇ！！また！イッちゃう！！イッたままなのに！またイッちゃうううう！！！」[wt7]
くぬぎは敵の射精の衝撃によりそのまま再び絶頂を迎えた[wt7]
[eval exp="f.StanOrga=3"]
[endif]
[eval exp="f.EnErect = 0"]
[jump target="*房中継続"]
[s]

*敵絶頂外出
[call storage="voicePL.ks" target="*悲鳴房中"]
くぬぎ（このままっ！！中に出させれば！！）[wt7]
忌まわしい封印を緩めて戦う力を取り戻すことができる[wt7]
相手の激しい腰使いに翻弄されながら、くぬぎは一縷の
しかし[wt7]
敵「うおおおおおおっ！！」[wt7]
敵はいきり立った陰茎を膣から引き抜くと、その瞬間に射精した[wt7]
くぬぎ「あああああああっ！！」[wt7]
勢いよく吹き出した生暖かい精液がくぬぎの肌に降り掛かる[wt7]
くぬぎ「あ・・・あっ！」[wt7]
敵「危ねえ、危ねえ。うっかり中出ししちまうところだったぜ」[wt7]
白濁まみれで呆然とするくぬぎを見て敵はにやりと笑った[wt7]
敵「おっと残念そうな顔だな。なんだ中が良かったか？」[wt7]
くぬぎ（こいつ！！）[wt7]
敵「心配しなくともまだまだ終わりじゃねえぞ！！」[wt7]
敵はくぬぎを組み敷くと、依然として硬度を失わないイチモツをくぬぎの陰唇にねじ込んだ[wt7]
くぬぎ「きゃああああああっ！！」[wt7]
[eval exp="f.EnErect = 0"]
[showStatus_H]
[jump target="*房中継続"]
[s]

*敵絶頂勝利時
[jump target="*勝利シーン"]
[s]

*房中継続
[eval exp="tf.n = tf.n + 1 , tf.loop = tf.loop + 1 , f.StanOrga = f.StanOrga - 1"]
[if exp="f.StanOrga == 1"]
[eval exp="f.StanOrga = 0" cond="f.StanOrga > 0"]
くぬぎは絶頂から立ち直った[lrcm]
[endif]
[jump target="*導入分岐"]


*敗北シーン1
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
[showStatus_H]
くぬぎは敗北した[lrcm]
[eval exp="f.ARS = f.ARS + 1"]
くぬぎの淫らさが上昇した[lrcm]
[eval exp="f.BaseMND = f.BaseMND - 1"][eval exp="f.BaseMND = 0" cond="f.BaseMND < 0 "]
くぬぎの理性の最大値が減少した[lrcm]
[eval exp="f.ERO = 0 , f.MND = f.BaseMND"]
[wait time=500]
[battleEND]
[jump storage="prison.ks" target="*スタート"]

*敗北シーン2


*敗北シーン3


*勝利シーン
敵「ぐおおおおっ！！出すぞ！！」[lrcm]
敵の肉棒が中で一際大きく膨らむと怒涛の勢いで[r]
くぬぎの中に熱い精液が迸った[lrcm]
くぬぎ「くぅっ！！」[lrcm]
敵に汚される屈辱に歯を食いしばりながら[r]
くぬぎは体に活力が湧いてくるのを感じた[lrcm]
くぬぎ（この力があれば...戦える！！）[lrcm]
[eval exp="f.MND = f.MND - 10"]
[eval exp="f.ARS = f.ARS + 5"]
中出しによりくぬぎの理性が減少[lrcm]
淫らさが上昇[lrcm]
[eval exp="f.EnErect = 0"]
[showStatus_H]
[jump storage="battle.ks" target="*房中帰り"]
