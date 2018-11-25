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
f.APP = f.ARS;//色気、魅力
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

[macro name="enemySetUp"]
;敵設定読込
[iscript]
f.BaseEnHP = f.originEnHP;
f.BaseEnSTR = f.originEnSTR;
f.BaseEnDEF = f.originEnDEF;
f.BaseEnSPD = f.originEnSPD;
f.BaseEnFP = f.originEnFP;
f.BaseEnERO = f.originEnERO;
f.BaseEnTEC = f.originEnTEC;
f.BaseEnEND = f.originEnEND;
f.BaseBindPower = f.originBindPower;

f.EnHP = f.BaseEnHP;
f.EnSTR = f.BaseEnSTR;
f.EnDEF = f.BaseEnDEF;
f.EnSPD = f.BaseEnSPD;
f.EnFP = f.BaseEnFP;
f.EnERO = f.BaseEnERO;
f.EnTEC = f.BaseEnTEC;
f.EnEND = f.BaseEnEND;
f.BindPower = f.BaseBindPower;

f.BaseEnOption = JSON.stringify(f.originEnOption);
f.BaseEnOption = JSON.parse(f.BaseEnOption);
f.EnOption = JSON.stringify(f.BaseEnOption);
f.EnOption = JSON.parse(f.EnOption);

f.EnCount = 0;

f.EnVBuff = 1.0;
f.EnStan = 0;
[endscript]
[endmacro]

[showStatus]

*時間経過
[eval exp="f.stage++"]

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
