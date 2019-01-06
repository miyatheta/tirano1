*スタート
[position width=960 height=150 top=490 left=0]
[iscript]
//PL初期設定
f.originHP = 1000;
f.originSTR = 70;
f.originDEF = 60;
f.originSPD = 100;
f.originFP = 0;//気力
f.originERO = 0;//快感
f.originARS = 50;//淫らさ
f.originSEN = 100;//感度
f.originMND = 100;//精神力=房中体力
f.originTIR = 0;//疲労度

f.originOption=[
{id:0, hand:'グーー', name:'力', suit:'P', switch:0},
{id:1, hand:'グーー', name:'力', suit:'P', switch:0},
{id:2, hand:'グーー', name:'力', suit:'P', switch:0},
{id:3, hand:'チョキ', name:'心', suit:'F', switch:0},
{id:4, hand:'チョキ', name:'心', suit:'F', switch:0},
{id:5, hand:'チョキ', name:'心', suit:'F', switch:0},
{id:6, hand:'パーー', name:'技', suit:'A', switch:0},
{id:7, hand:'パーー', name:'技', suit:'A', switch:0},
{id:8, hand:'パーー', name:'技', suit:'A', switch:0}];

[endscript]

[iscript]
//PL基準設定
f.BaseHP = f.originHP;
f.BaseSTR = f.originSTR;
f.BaseDEF = f.originDEF;
f.BaseSPD = f.originSPD;
f.BaseFP = f.originFP;
f.BaseERO = f.originERO;
f.BaseARS = f.originARS;
f.BaseSEN = f.originSEN;
f.BaseMND = f.originMND;
f.BaseTIR = f.originTIR;

f.BaseOption = [];
f.BaseOption = JSON.stringify(f.originOption);
f.BaseOption = JSON.parse(f.BaseOption);

f.GBuff=1.0;
[endscript]

[iscript]
//PL初期化設定
f.HP = f.BaseHP;
f.STR = f.BaseSTR;
f.DEF = f.BaseDEF;
f.SPD = f.BaseSPD;
f.FP = f.BaseFP;
f.ERO = f.BaseERO;
f.APP = f.BaseAPP;
f.ARS = f.BaseARS;
f.SEN  = f.BaseSEN;
f.MND = f.BaseMND;
f.TIR = f.BaseTIR;

f.VBuff = 1.0;
f.HPBonus = 1.0;

f.Option = [];
f.Option = JSON.stringify(f.BaseOption);
f.Option = JSON.parse(f.Option);
f.selectOption = [];
f.count = 0;

f.skill1CT = 0, f.skill2CT = 0, f.skill3CT = 0, f.skill4CT = 0;
f.Comand = 0;
f.Pary = 0;//回避
f.Undress = 0;//脱衣
f.CharmET = 0;//魅了の持続T(ET = EffectTurn)
f.StanOrga = 0;//絶頂時のスタン

f.Ampl = 0;//感度増幅
f.countAmpl = 0;
f.Estr = 0;//発情
f.countEstr = 0;
f.Maso = 0;//被虐
f.countMaso = 0;
f.Paras = 0;//蟲憑き
f.countParas = 0;
f.Bitch = 0;//淫乱
f.countBitch = 0;
f.Hypno = 0;//催眠
f.countHypno = 0;

f.stage = 0;
[endscript]

[iscript]
//敵の設定
f.originEnHP = 0;
f.originEnSTR = 0;
f.originEnDEF = 0;
f.originEnSPD = 0;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnTEC = 0;//技術力
f.originEnEND = 0;//忍耐力
f.originBindPower = 100;

f.ClutchRate = 20;//組付初期値

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

f.originEnOption=[
{id:0, hand:'グーー', name:'力', switch:0},
{id:1, hand:'グーー', name:'力', switch:0},
{id:2, hand:'グーー', name:'力', switch:0},
{id:3, hand:'チョキ', name:'技', switch:0},
{id:4, hand:'チョキ', name:'技', switch:0},
{id:5, hand:'チョキ', name:'技', switch:0},
{id:6, hand:'パーー', name:'速', switch:0},
{id:7, hand:'パーー', name:'速', switch:0},
{id:8, hand:'パーー', name:'速', switch:0}];

f.BaseEnOption = JSON.stringify(f.originEnOption);
f.BaseEnOption = JSON.parse(f.BaseEnOption);
f.EnOption = JSON.stringify(f.BaseEnOption);
f.EnOption = JSON.parse(f.EnOption);

f.EnCount = 0;

f.EnVBuff = 1.0;
f.EnStan = 0;
[endscript]

[jump storage="macros.ks" target="*マクロ"]
