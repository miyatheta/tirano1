*スタート
[macro name="showStatus"]
[iscript]
alert("くぬぎ　\n体力：" + f.TempHP + "　すばやさ：" + f.TempSPD + "　気力：" + f.TempFP + "　快感度：" + f.TempERO
+ "\n\n敵　　\n体力：" + f.TempEnHP + "　すばやさ：" + f.TempEnSPD + "　気力：" + f.TempEnFP + "　興奮度：" + f.TempEnERO);
[endscript]
[endmacro]

[iscript]
//PL初期設定
f.originHP = 1000;
f.originSTR = 70;
f.originDEF = 70;
f.originSPD = 100;
f.originFP = 0;//force
f.originERO = 0;//快感
f.originARS = 0;//arouse
f.originSTM = 100;//房中体力
f.originMND = 100;//精神力

f.originOption=[
{id:0, hand:'グー', name:'力', switch:0},
{id:1, hand:'グー', name:'力', switch:0},
{id:2, hand:'グー', name:'力', switch:0},
{id:3, hand:'チョキ', name:'技', switch:0},
{id:4, hand:'チョキ', name:'技', switch:0},
{id:5, hand:'チョキ', name:'技', switch:0},
{id:6, hand:'パー', name:'速', switch:0},
{id:7, hand:'パー', name:'速', switch:0},
{id:8, hand:'パー', name:'速', switch:0}];

[endscript]

[iscript]
//PL基準設定
f.BaseHP = f.originHP;
f.BaseSTR = f.originSTR;
f.BaseDEF = f.originDEF;
f.BaseSPD = f.originSPD;
f.BaseFP = f.originFP;//force
f.BaseERO = f.originERO;
f.BaseARS = f.originARS;//arouse
f.BaseSTM = f.originSTM;
f.BaseMND = f.originMND;

f.BaseOption = [];
f.BaseOption = JSON.stringify(f.originOption);
f.BaseOption = JSON.parse(f.BaseOption);

f.GBuff=1.0;
[endscript]

[iscript]
//PL一時設定
f.TempHP = f.BaseHP;
f.TempSTR = f.BaseSTR;
f.TempDEF = f.BaseDEF;
f.TempSPD = f.BaseSPD;
f.TempFP = f.BaseFP;
f.TempERO = f.BaseERO;
f.TempARS = f.BaseARS;//arouse
f.TempSTM = f.BaseSTM;
f.TempMND = f.BaseMND;

f.VBuff = 1.0;
f.HPBonus = 1.0;

f.TempOption = [];
f.TempOption = JSON.stringify(f.BaseOption);
f.TempOption = JSON.parse(f.TempOption);
f.selectOption = [];
f.count = 0;

f.skill1CT = 0, f.skill2CT = 0, f.skill3CT = 0;
f.Comand = 0;
f.Pary = 0 , f.Undress = 0;

[endscript]

[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 60;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1;//arouse
f.originBindPower = 100;

f.ClutchRate = 20;//組付初期値

f.BaseEnHP = f.originEnHP;
f.BaseEnSTR = f.originEnSTR;
f.BaseEnDEF = f.originEnDEF;
f.BaseEnSPD = f.originEnSPD;
f.BaseEnFP = f.originEnFP;
f.BaseEnERO = f.originEnERO;
f.BaseEnARS = f.originEnARS;//arouse
f.BaseBindPower = f.originBindPower;

f.TempEnHP = f.BaseEnHP;
f.TempEnSTR = f.BaseEnSTR;
f.TempEnDEF = f.BaseEnDEF;
f.TempEnSPD = f.BaseEnSPD;
f.TempEnFP = f.BaseEnFP;
f.TempEnERO = f.BaseEnERO;
f.TempEnARS = f.BaseEnARS;//arouse
f.TempBindPower = f.BaseBindPower;

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

f.BaseEnOption = JSON.stringify(f.originEnOption);
f.BaseEnOption = JSON.parse(f.BaseEnOption);
f.TempEnOption = JSON.stringify(f.BaseEnOption);
f.TempEnOption = JSON.parse(f.TempEnOption);

f.EnCount = 0;

f.EnVBuff = 1.0;
f.EnStan = 0;
[endscript]

[iscript]
//環境変数
f.turn = 0;
f.BindCount = 0;
f.ClutchTurn = 0
[endscript]
[jump storage="battle.ks" target="*ターン開始"]
