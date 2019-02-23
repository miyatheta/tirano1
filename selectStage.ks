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
f.APP = f.BaseAPP + f.ARS;
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
;[showStatus]
[image layer="base" visible="true" storage="mori_yoru.jpg" width=960]
[chara_new name="kunugi" storage="chara/kunugi/battle_stand.png"]
[chara_face name="kunugi" face="battle_stand_nude" storage="chara/kunugi/battle_stand_nude.png"]
[chara_show name="kunugi" left=50 top=100 width=400]

*時間経過
[eval exp="f.stage++"]

[eval exp="f.countAmpl++" cond="f.countAmpl > 0"]
[if exp="f.countAmpl > 10"]
くぬぎは感度増幅状態から回復した[wt7]
[eval exp="f.countAmpl = 0 , f.countAmpl = 0"]
;[showStatus]
[endif]

[eval exp="f.countEstr++" cond="f.countEstr > 0"]
[if exp="f.countEstr > 10"]
くぬぎは発情状態から回復した[wt7]
[eval exp="f.countEstr = 0 , f.countEstr = 0"]
;[showStatus]
[endif]

[eval exp="f.countMaso++" cond="f.countMaso > 0"]
;[showStatus]
[if exp="f.countMaso > 10"]
くぬぎは被虐体質から回復した[wt7]
[eval exp="f.countMaso = 0 , f.countMaso = 0"]
[endif]

[eval exp="f.countBitch++" cond="f.countBitch > 0"]
[if exp="f.countBitch > 10"]
くぬぎは淫乱状態から回復した[wt7]
[eval exp="f.countBitch = 0 , f.countBitch = 0"]
;[showStatus]
[endif]

[eval exp="f.countHypno++" cond="f.countHypno > 0"]
[if exp="f.countHypno > 10"]
くぬぎは催淫状態から回復した[wt7]
[eval exp="f.countHypno = 0 , f.countHypno = 0"]
;[showStatus]
[endif]

[if exp="f.countParas > 30"]
くぬぎは虫憑き状態から回復した[wt7]
[eval exp="f.countParas = 0 , f.countParas = 0"]
;[showStatus]
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
f.Enemy={Code:1, Name:"亥川豪左衛門", HN:"豪左", Lv:1}

f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 70;
f.originEnSPD = 80;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnMND = 70;//理性
f.originEnANG = 50;//暴力性
f.originEnTEC = 70;//技術力
f.originEnEND = 70;//忍耐力
f.originBindPower = 100;

f.originEnOption=[
{id:0, hand:'グー', name:'力', suit:'P', switch:0},
{id:1, hand:'グー', name:'力', suit:'P', switch:0},
{id:2, hand:'グー', name:'力', suit:'P', switch:0},
{id:3, hand:'グー', name:'力', suit:'P', switch:0},
{id:4, hand:'チョキ', name:'心', suit:'F', switch:0},
{id:5, hand:'チョキ', name:'心', suit:'F', switch:0},
{id:6, hand:'チョキ', name:'心', suit:'F', switch:0},
{id:7, hand:'パー', name:'技', suit:'A', switch:0},
{id:8, hand:'パー', name:'技', suit:'A', switch:0}];

f.EnOption = [];
f.EnOption = JSON.stringify(f.originEnOption);
f.EnOption = JSON.parse(f.EnOption);

f.EnPattern = [];
f.EnPattern[0] = [0,1,2,4,5,3,6,7,8];
f.EnPattern[1] = [0,4,5,7,1,2,3,8,6];
f.EnPattern[2] = [0,7,1,4,5,2,6,3,8];
f.EnPattern[3] = [7,4,0,1,5,2,8,6,3];
f.EnPattern[4] = [4,0,1,5,7,2,8,6,3];
f.EnPattern[5] = [4,0,1,5,2,7,3,6,8];
f.EnPattern[6] = [7,0,4,5,1,2,3,8,6];

f.ClutchRate = 20;//組付初期値
[endscript]
[enemySetUp]
[jump storage="intermission.ks" target="*敵1"]

*敵2
[iscript]
//敵の設定
f.Enemy={Code:2, Name:"蛭児石舟", HN:"蛭児", Lv:1};

f.originEnHP = 1000;
f.originEnSTR = 90;
f.originEnDEF = 80;
f.originEnSPD = 70;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnMND = 70;//理性
f.originEnANG = 50;//暴力性
f.originEnTEC = 70;//技術力
f.originEnEND = 70;//忍耐力
f.originBindPower = 80;

f.originEnOption[0] = ['グー','グー','グー','グー','チョキ','チョキ','チョキ','パー','パー'];
f.originEnOption[1] = ['グー','チョキ','チョキ','パー','グー','グー','グー','パー','チョキ'];
f.originEnOption[2] = ['グー','グー','グー','チョキ','グー','パー','チョキ','チョキ','パー'];
f.originEnOption[3] = ['パー','チョキ','グー','チョキ','パー','グー','グー','チョキ','グー'];
f.originEnOption[4] = ['チョキ','グー','グー','チョキ','パー','チョキ','パー','グー','グー'];
f.originEnOption[5] = ['チョキ','チョキ','グー','パー','チョキ','グー','グー','グー','パー'];
f.originEnOption[6] = ['チョキ','グー','チョキ','パー','グー','グー','グー','パー','チョキ'];

f.ClutchRate = 0;//組付初期値

[endscript]
[enemySetUp]
[jump storage="intermission.ks" target="*敵2"]

*敵3
[iscript]
//敵の設定
f.Enemy={Code:3, Name:"遊田弦十郎", HN:"遊田", Lv:1}

f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 70;
f.originEnSPD = 80;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnMND = 70;//理性
f.originEnANG = 50;//暴力性
f.originEnTEC = 70;//技術力
f.originEnEND = 70;//忍耐力
f.originBindPower = 120;

f.originEnOption[0] = ['グー','グー','チョキ','チョキ','チョキ','チョキ','パー','パー','パー'];
f.originEnOption[1] = ['グー','チョキ','チョキ','パー','パー','チョキ','グー','パー','チョキ'];
f.originEnOption[2] = ['グー','パー','チョキ','チョキ','パー','グー','チョキ','チョキ','パー'];
f.originEnOption[3] = ['パー','チョキ','グー','チョキ','パー','チョキ','パー','チョキ','グー'];
f.originEnOption[4] = ['チョキ','グー','チョキ','チョキ','パー','チョキ','パー','パー','グー'];
f.originEnOption[5] = ['チョキ','チョキ','グー','チョキ','パー','チョキ','グー','パー','パー'];
f.originEnOption[6] = ['チョキ','グー','チョキ','パー','パー','チョキ','グー','パー','チョキ'];

f.ClutchRate = 50;//組付初期値
[endscript]
[enemySetUp]
[jump storage="intermission.ks" target="*敵3"]
[s]
