*房中開始
房中です[l][r][cm]
[iscript]
tf.React = 0;
f.EnERO = 0;
f.HP = 100;
[endscript]
[showStatus]

*導入
敵は装束を脱ぎ捨ててマラを取り出すと[r]くぬぎの腰を掴み、その秘所に荒々しく挿入した[lrcm]
くぬぎ「あうっ！！」[lrcm]

*会話
敵「フハハハ！！どうだ我が愚息の味は！！たまらんだろう！？」[lrcm]

*行動選択通常
[jump target="*行動選択屈服" cond="f.MND<=0"]
くぬぎは・・・[lrcm]
[glink target="*敵反応" text="選択肢1(強気・反抗的)" exp="" x=100 y=50]
[glink target="*敵反応" text="選択肢2（挑発）" exp="" x=100 y=100]
[glink target="*敵反応" text="選択肢3（弱気・従順）" exp="" x=100 y=150]
[glink target="*敵反応" text="選択肢4（無反応）" exp="" x=100 y=200]
[s]

*行動選択屈服
くぬぎ「はいっ！！あんっ！！太くてぇっ！！[wait time=100]
たくましくてぇ！んあっ！！[wait time=100]
たまらないですっ！！！」[lrcm]
反抗心を失ったくぬぎは敵の言葉を肯定してしまう[lrcm]
[eval exp="tf.React=1"]
[jump target="*敵攻撃"]

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
敵の好感度上昇[lrcm]
[eval exp="f.EnARS = f.EnARS + 0.1"]
[jump target="*敵攻撃"]
[endif]

*敵攻撃
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;
tf.Damage = Math.floor(f.EnTEC/10 * f.ARS * tf.randomNum);
f.ERO = f.ERO + tf.Damage;
if(f.ERO > 100){f.ERO = 100;}
f.HP = f.HP - 10;
if(f.HP < 0){f.HP = 0;}
[endscript]

[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;
tf.EnDamage = Math.floor(5 * f.EnARS * tf.randomNum);
f.EnERO = f.EnERO + tf.EnDamage;
if(f.ERO > 100){f.ERO = 100;}
[endscript]
敵は激しく腰を前後した[lrcm]
くぬぎ「あんっ！ああっ！！」[lrcm]
くぬぎの快感度が[emb exp="tf.Damage"]上昇した[lrcm]
敵の興奮度が[emb exp="tf.EnDamage"]上昇した[lrcm]
[showStatus]

[jump target="絶頂" cond="f.ERO >= 100"]
[jump target="房中敗北B" cond="f.EnERO >= 100 && f.MND <= 0"]
[jump target="房中敗北B" cond="f.HP <= 0 && f.MND <= 0"]
[jump target="房中敗北A" cond="f.HP <= 0"]
[jump target="房中勝利" cond="f.EnERO >= 100"]
[jump target="*会話"]

*絶頂
くぬぎ「だめっ！！イクっ！！イクっ！！ああああああああっ！！」[lrcm]
くぬぎは絶頂を迎えた[lrcm]
[iscript]
f.ERO = 0;
f.HP = f.HP - 30;
f.MND = f.MND - (f.ARS * 10);
[endscript]
[showStatus]
[jump target="房中敗北A" cond="f.HP <= 0"]
[jump target="房中敗北B" cond="f.EnERO >= 100 && f.MND <= 0"]
[jump target="房中敗北B" cond="f.HP <= 0 && f.MND <= 0"]

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
激しい快楽に焼かれ白く染まった意識をくぬぎは手放した[l][r][cm]
[iscript]
f.ERO = 0;
f.HP = f.BaseSTM;
f.MND = f.BaseMND;
[endscript]
[showStatus]
くぬぎは敗北した[lrcm][wait time=1000]
[jump storage="selectStage.ks" target="*エネミー選択"]


*房中勝利
敵「ぐおおおおっ！！出すぞ！！」[l][r][cm]
敵の肉棒が中で一際大きく膨らむのを感じてくぬぎの目が煌めいた[l][r][cm]
くぬぎ「っ・・・・今よっ！！忍法・吸精破顔術！！」[l][r][cm]
くぬぎが印を切ると、膣が敵の逸物を一際強烈に締め上げた[l][r][cm]
敵「ごおおおおおおっ！！何という圧力、何という上物よ！！」[l][r][cm]
その感触に敵は為す術もなく精を迸らせる[l][r][cm]
満ち足りた呆け顔を一瞬見せた敵だったが、すぐにその顔に動揺の色が走る[l][r][cm]
敵「と、止まらぬ！？」[l][r][cm]
くぬぎの膣に刺さったままの肉棒からは精液が延々と吹き出し続け、一向に収まる様子がないのだ[l][r][cm]
異常を感じ腰を離そうとした敵だが、くぬぎの膣はまるで吸盤のように肉棒に吸い付き肉棒を抜くことができない[l][r][cm]
くぬぎ「んっ・・・んん・・・！！」[l][r][cm]
その間もくぬぎの中は巧みにうねり、蠢き、精を搾り取り飲み下していく[l][r][cm]
敵「あ、ああああ・・・あああああああっ・・・」[l][r][cm]
もはや竿からは痛みを感じ始めていたがそれを上回る快楽の雷が脳天までを走り続け、敵はうめき声を上げながら腰を振ることしかできない[l][r][cm]
いつしか敵の顔からは血の気が引き白くなっていたが、それに反比例するように恍惚の笑みが浮かび上がってきていた[l][r][cm]
そしてしばらく後、敵は満面の笑みを浮かべたまま白眼を剥くととうとう仰向けに地に倒れた[l][r][cm]
くぬぎ「んうっ・・・・！！」[l][r][cm]
すっかり萎えきった肉棒が抜け落ちると、くぬぎの膣からは大量の白濁液が噴き出した[l][r][cm]
装束を整え立ち上がったくぬぎは敵を一瞥した[l][r][cm]
くぬぎ「極楽浄土。見えたかしら？」[l][r][cm]
くぬぎの疲労度が回復した[r]
[eval exp="f.TIR = f.TIR - 20"][eval exp="f.TIR = 0" cond="f.TIR < 0"]
[iscript]
f.ERO = 0;
f.HP = f.BaseSTM;
f.MND = f.BaseMND;

[endscript]
[showStatus]
くぬぎは勝利した[lrcm][wait time=1000]
[jump storage="selectStage.ks" target="*エネミー選択"]
