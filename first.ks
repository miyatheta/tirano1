*スタート
[iscript]
//PL初期設定
f.originHP = 1000;
f.originSTR = 70;
f.originDEF = 70;
f.originSPD = 100;
f.originFP = 0;//force
f.originERO = 0;//快感
f.originARS = 1;//arouse
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
f.HP = f.BaseHP;
f.STR = f.BaseSTR;
f.DEF = f.BaseDEF;
f.DEF = f.BaseSPD;
f.FP = f.BaseFP;
f.ERO = f.BaseERO;
f.ARS = f.BaseARS;//arouse
f.STM  = f.BaseSTM;
f.MND = f.BaseMND;

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

[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 60;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1;//arouse
f.originEnTEC = 50;//技術力
f.originEnEND = 20;//忍耐力
f.originBindPower = 100;

f.ClutchRate = 20;//組付初期値

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
f.EnOption = JSON.stringify(f.BaseEnOption);
f.EnOption = JSON.parse(f.EnOption);

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

[macro name="showStatus"]
[iscript]
alert("くぬぎ　\n体力：" + f.HP + "　すばやさ：" + f.DEF + "　気力：" + f.FP + "　快感度：" + f.ERO
+ "\n\n敵　　\n体力：" + f.EnHP + "　すばやさ：" + f.EnSPD + "　気力：" + f.EnFP + "　興奮度：" + f.EnERO);
[endscript]
[endmacro]

[macro name="Damage"]
[iscript]
if(f.VB > 2){
  f.VBonus = 1.3;
}else if(f.VB > 1){
  f.VBonus = 1.2;
}else{
  f.VBonus = 1.1;
}

tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum= (tf.dice / 1000) + 1;

tf.Buff = f.VBonus * f.VBuff;

tf.ATP = Math.floor(f.STR * 1.8 * tf.Buff * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}

f.VBuff = 1.0;
[endscript]
[endmacro]

[macro name="SuperArts"]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;
//残HPボーナス
if(f.HP < f.EnHP){
  f.HPBonus = (f.EnHP - f.HP)/f.EnHP + 1;
}

tf.ATP = Math.floor(300 * f.HPBonus * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[endmacro]

[jump storage="battle.ks" target="*ターン開始"]
