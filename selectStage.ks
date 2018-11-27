*ステージセレクト
[iscript]
//PL一時設定
f.HP = f.BaseHP;
f.STR = f.BaseSTR;
f.DEF = f.BaseDEF;
f.SPD = f.BaseSPD;
f.FP = f.BaseFP;
//f.ERO = f.BaseERO;
//f.ARS = f.BaseARS;
f.APP = f.ARS;
f.SEN  = f.BaseSEN + (100 * f.Ampl);
f.MND = f.BaseMND;
//f.TIR = f.BaseTIR;

f.VBuff = 1.0;
f.HPBonus = 1.0;

f.Option = [];
f.Option = JSON.stringify(f.BaseOption);
f.Option = JSON.parse(f.Option);
f.selectOption = [];
f.count = 0;

f.skill1CT = 0, f.skill2CT = 0, f.skill3CT = 0;
f.Comand = 0;
f.Pary = 0;//回避
f.Undress = 0;//脱衣
f.CharmET = 0;//魅了の持続T(ET = EffectTurn)

[endscript]

[showStatus]

*時間経過
[eval exp="f.stage++"]

[eval exp="f.countAmpl++" cond="f.countAmpl > 0"]
[if exp="f.countAmpl > 10"]
くぬぎは感度増幅状態から回復した[wt7]
[eval exp="f.countAmpl = 0 , f.countAmpl = 0"][showStatus]
[endif]

[eval exp="f.countEstr++" cond="f.countEstr > 0"]
[if exp="f.countEstr > 10"]
くぬぎは発情状態から回復した[wt7]
[eval exp="f.countEstr = 0 , f.countEstr = 0"][showStatus]
[endif]

[eval exp="f.countMaso++" cond="f.countMaso > 0"][showStatus]
[if exp="f.countMaso > 10"]
くぬぎは被虐体質から回復した[wt7]
[eval exp="f.countMaso = 0 , f.countMaso = 0"]
[endif]

[eval exp="f.countBitch++" cond="f.countBitch > 0"]
[if exp="f.countBitch > 10"]
くぬぎは淫乱状態から回復した[wt7]
[eval exp="f.countBitch = 0 , f.countBitch = 0"][showStatus]
[endif]

[eval exp="f.countHypno++" cond="f.countHypno > 0"]
[if exp="f.countHypno > 10"]
くぬぎは催淫状態から回復した[wt7]
[eval exp="f.countHypno = 0 , f.countHypno = 0"][showStatus]
[endif]

[if exp="f.countParas > 30"]
くぬぎは虫憑き状態から回復した[wt7]
[eval exp="f.countParas = 0 , f.countParas = 0"][showStatus]
[endif]



*エネミー選択
[emb exp="f.stage"]回戦[r]
[glink target="*敵1" exp="f.enemy=1" text="敵１" size=15 x=50 y=100]
[glink target="*敵2" exp="f.enemy=2" text="敵２" size=15 x=50 y=150]
[glink target="*敵3" exp="f.enemy=3" text="敵３" size=15 x=50 y=200]
[s]

*敵1
[iscript]
//敵の設定
f.EnemyCode=1;
f.EnemyName="剛造";

f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 70;
f.originEnSPD = 60;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnTEC = 70;//技術力
f.originEnEND = 70;//忍耐力
f.originBindPower = 100;

f.originEnOption[0] = ['グーー','グーー','グーー','チョキ','チョキ','チョキ','チョキ','パーー','パーー'];
f.originEnOption[1] = ['グーー','チョキ','チョキ','パーー','チョキ','グーー','グーー','パーー','チョキ'];
f.originEnOption[2] = ['グーー','パーー','グーー','チョキ','チョキ','グーー','チョキ','チョキ','パーー'];
f.originEnOption[3] = ['パーー','チョキ','グーー','チョキ','パーー','グーー','パーー','チョキ','グーー'];
f.originEnOption[4] = ['チョキ','グーー','グーー','チョキ','パーー','チョキ','パーー','チョキ','グーー'];
f.originEnOption[5] = ['チョキ','チョキ','グーー','チョキ','グーー','パーー','グーー','チョキ','パーー'];
f.originEnOption[6] = ['チョキ','グーー','チョキ','パーー','チョキ','グーー','グーー','パーー','チョキ'];

f.ClutchRate = 20;//組付初期値
[endscript]
[enemySetUp]
[jump storage="intermission.ks" target="*敵1"]

*敵2
[iscript]
//敵の設定
f.EnemyCode=2;
f.EnemyName="深淵";

f.originEnHP = 1000;
f.originEnSTR = 90;
f.originEnDEF = 80;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnTEC = 70;//技術力
f.originEnEND = 70;//忍耐力
f.originBindPower = 80;

f.originEnOption[0] = ['グーー','グーー','グーー','グーー','チョキ','チョキ','チョキ','パーー','パーー'];
f.originEnOption[1] = ['グーー','チョキ','チョキ','パーー','グーー','グーー','グーー','パーー','チョキ'];
f.originEnOption[2] = ['グーー','グーー','グーー','チョキ','グーー','パーー','チョキ','チョキ','パーー'];
f.originEnOption[3] = ['パーー','チョキ','グーー','チョキ','パーー','グーー','グーー','チョキ','グーー'];
f.originEnOption[4] = ['チョキ','グーー','グーー','チョキ','パーー','チョキ','パーー','グーー','グーー'];
f.originEnOption[5] = ['チョキ','チョキ','グーー','パーー','チョキ','グーー','グーー','グーー','パーー'];
f.originEnOption[6] = ['チョキ','グーー','チョキ','パーー','グーー','グーー','グーー','パーー','チョキ'];

f.ClutchRate = 0;//組付初期値

[endscript]
[enemySetUp]
[jump storage="intermission.ks" target="*敵2"]

*敵3
[iscript]
//敵の設定
f.EnemyCode=3;
f.EnemyName="弦十郎";

f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 70;
f.originEnSPD = 50;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnTEC = 70;//技術力
f.originEnEND = 70;//忍耐力
f.originBindPower = 120;

f.originEnOption[0] = ['グーー','グーー','チョキ','チョキ','チョキ','チョキ','パーー','パーー','パーー'];
f.originEnOption[1] = ['グーー','チョキ','チョキ','パーー','パーー','チョキ','グーー','パーー','チョキ'];
f.originEnOption[2] = ['グーー','パーー','チョキ','チョキ','パーー','グーー','チョキ','チョキ','パーー'];
f.originEnOption[3] = ['パーー','チョキ','グーー','チョキ','パーー','チョキ','パーー','チョキ','グーー'];
f.originEnOption[4] = ['チョキ','グーー','チョキ','チョキ','パーー','チョキ','パーー','パーー','グーー'];
f.originEnOption[5] = ['チョキ','チョキ','グーー','チョキ','パーー','チョキ','グーー','パーー','パーー'];
f.originEnOption[6] = ['チョキ','グーー','チョキ','パーー','パーー','チョキ','グーー','パーー','チョキ'];

f.ClutchRate = 50;//組付初期値
[endscript]
[enemySetUp]
[jump storage="intermission.ks" target="*敵3"]
[s]
