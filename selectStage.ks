*ステージセレクト
[iscript]
//PL一時設定
f.HP = f.BaseHP;
f.STR = f.BaseSTR;
f.DEF = f.BaseDEF;
f.SPD = f.BaseSPD;
f.FP = f.BaseFP;
//f.ERO = f.BaseERO;
f.ARS = f.BaseARS;//arouse
f.STM  = f.BaseSTM;
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

*エネミー選択
[emb exp="f.stage"]回戦[r]
[link target="*敵1"]敵1[endlink][r]
[link target="*敵2"]敵2[endlink][r]
[link target="*敵3"]敵3[endlink][r]
[s]

*敵1
[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 60;
f.originEnSPD = 50;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1.1;//arouse
f.originEnTEC = 50;//技術力
f.originEnEND = 20;//忍耐力
f.originBindPower = 100;

f.originEnOption=[
{id:0, hand:'グー', name:'力', switch:0},
{id:1, hand:'グー', name:'力', switch:0},
{id:2, hand:'グー', name:'力', switch:0},
{id:3, hand:'チョキ', name:'技', switch:0},
{id:4, hand:'チョキ', name:'技', switch:0},
{id:5, hand:'チョキ', name:'技', switch:0},
{id:6, hand:'パー', name:'速', switch:0},
{id:7, hand:'パー', name:'速', switch:0},
{id:8, hand:'パー', name:'速', switch:0}];

f.ClutchRate = 20;//組付初期値
[endscript]
[jump target="*敵設定読込"]

*敵2
[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 85;
f.originEnDEF = 30;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1;//arouse
f.originEnTEC = 50;//技術力
f.originEnEND = 50;//忍耐力
f.originBindPower = 80;

f.originEnOption=[
{id:0, hand:'グー', name:'力', switch:0},
{id:1, hand:'グー', name:'力', switch:0},
{id:2, hand:'グー', name:'力', switch:0},
{id:3, hand:'チョキ', name:'技', switch:0},
{id:4, hand:'チョキ', name:'技', switch:0},
{id:5, hand:'チョキ', name:'技', switch:0},
{id:6, hand:'パー', name:'速', switch:0},
{id:7, hand:'パー', name:'速', switch:0},
{id:8, hand:'パー', name:'速', switch:0}];

f.ClutchRate = 0;//組付初期値
[endscript]
[jump target="*敵設定読込"]

*敵3
[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 75;
f.originEnDEF = 80;
f.originEnSPD = 40;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1.2;//arouse
f.originEnTEC = 50;//技術力
f.originEnEND = 10;//忍耐力
f.originBindPower = 120;

f.originEnOption=[
{id:0, hand:'グー', name:'力', switch:0},
{id:1, hand:'グー', name:'力', switch:0},
{id:2, hand:'グー', name:'力', switch:0},
{id:3, hand:'チョキ', name:'技', switch:0},
{id:4, hand:'チョキ', name:'技', switch:0},
{id:5, hand:'チョキ', name:'技', switch:0},
{id:6, hand:'パー', name:'速', switch:0},
{id:7, hand:'パー', name:'速', switch:0},
{id:8, hand:'パー', name:'速', switch:0}];

f.ClutchRate = 50;//組付初期値
[endscript]
[jump target="*敵設定読込"]

*敵設定読込
[iscript]
f.BaseEnHP = f.originEnHP;
f.BaseEnSTR = f.originEnSTR;
f.BaseEnDEF = f.originEnDEF;
f.BaseEnSPD = f.originEnSPD;
f.BaseEnFP = f.originEnFP;
f.BaseEnERO = f.originEnERO;
f.BaseEnARS = f.originEnARS;//arouse
f.BaseEnEROAP = f.originEnEROAP;
f.BaseEnEND = f.originEnEND;
f.BaseBindPower = f.originBindPower;

f.EnHP = f.BaseEnHP;
f.EnSTR = f.BaseEnSTR;
f.EnDEF = f.BaseEnDEF;
f.EnSPD = f.BaseEnSPD;
f.EnFP = f.BaseEnFP;
f.EnERO = f.BaseEnERO;
f.EnARS = f.BaseEnARS;//arouse
f.EnEROAP = f.BaseEnEROAP;
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
[cm]
[jump storage="battle.ks" target="*バトルスタート"]
