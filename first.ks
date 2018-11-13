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
f.originTIR = 0;//疲労度

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
f.BaseTIR = f.originTIR;

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
f.SPD = f.BaseSPD;
f.FP = f.BaseFP;
f.ERO = f.BaseERO;
f.ARS = f.BaseARS;//arouse
f.STM  = f.BaseSTM;
f.MND = f.BaseMND;
f.TIR = f.BaseTIR;

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
f.StanOrga = 0;//絶頂時のスタン
f.stage = 1;
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
f.BaseEnTEC = f.originEnTEC;
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
f.EnTEC = f.BaseEnTEC;
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

[macro name="lrcm"]
[l][r][cm]
[endmacro]

[macro name="showStatus"]
[freeimage layer=1]
[iscript]
x = "number/white/x.png"
function calcStatus(Digit,Point){
  str = "x" + Point;
  len = str.length;
  for(i=len; i<5; i++){str = "x" + str;}
  for(i=4; i>0; i--){
    num = str.substr(i,1);
    Digit[i]="number/white/" + num + ".png";
  }
  return Digit;
}
f.HPdigit=[];
calcStatus(f.HPdigit,f.HP);
f.FPdigit=[];
calcStatus(f.FPdigit,f.FP);
f.SPDdigit=[];
calcStatus(f.SPDdigit,f.SPD);
f.EROdigit=[];
calcStatus(f.EROdigit,f.ERO);
f.TIRdigit=[];
calcStatus(f.TIRdigit,f.TIR);

f.EnHPdigit=[];
calcStatus(f.EnHPdigit,f.EnHP);
f.EnFPdigit=[];
calcStatus(f.EnFPdigit,f.EnFP);
f.EnSPDdigit=[];
calcStatus(f.EnSPDdigit,f.EnSPD);
f.EnEROdigit=[];
calcStatus(f.EnEROdigit,f.EnERO);
[endscript]
[image layer=1 storage="number/PL.png" width="100" top="475" left="0" visible="true"]

[image layer=1 storage="number/体力.png" width="100" top="500" left="0" visible="true"]
[image layer=1 storage="&f.HPdigit[1]" width="25" top="500" left="75" visible="true"]
[image layer=1 storage="&f.HPdigit[2]" width="25" top="500" left="100" visible="true"]
[image layer=1 storage="&f.HPdigit[3]" width="25" top="500" left="125" visible="true"]
[image layer=1 storage="&f.HPdigit[4]" width="25" top="500" left="150" visible="true"]

[image layer=1 storage="number/気力.png" width="100" top="525" left="0" visible="true"]
[image layer=1 storage="&f.FPdigit[1]" width="25" top="525" left="75" visible="true"]
[image layer=1 storage="&f.FPdigit[2]" width="25" top="525" left="100" visible="true"]
[image layer=1 storage="&f.FPdigit[3]" width="25" top="525" left="125" visible="true"]
[image layer=1 storage="&f.FPdigit[4]" width="25" top="525" left="150" visible="true"]

[image layer=1 storage="number/敏捷.png" width="100" top="550" left="0" visible="true"]
[image layer=1 storage="&f.SPDdigit[1]" width="25" top="550" left="75" visible="true"]
[image layer=1 storage="&f.SPDdigit[2]" width="25" top="550" left="100" visible="true"]
[image layer=1 storage="&f.SPDdigit[3]" width="25" top="550" left="125" visible="true"]
[image layer=1 storage="&f.SPDdigit[4]" width="25" top="550" left="150" visible="true"]

[image layer=1 storage="number/快感.png" width="100" top="575" left="0" visible="true"]
[image layer=1 storage="&f.EROdigit[1]" width="25" top="575" left="75" visible="true"]
[image layer=1 storage="&f.EROdigit[2]" width="25" top="575" left="100" visible="true"]
[image layer=1 storage="&f.EROdigit[3]" width="25" top="575" left="125" visible="true"]
[image layer=1 storage="&f.EROdigit[4]" width="25" top="575" left="150" visible="true"]

[image layer=1 storage="number/疲労.png" width="100" top="500" left="200" visible="true"]
[image layer=1 storage="&f.TIRdigit[1]" width="25" top="500" left="250" visible="true"]
[image layer=1 storage="&f.TIRdigit[2]" width="25" top="500" left="270" visible="true"]
[image layer=1 storage="&f.TIRdigit[3]" width="25" top="500" left="300" visible="true"]
[image layer=1 storage="&f.TIRdigit[4]" width="25" top="500" left="325" visible="true"]

[image layer=1 storage="number/敵名.png" width="100" top="475" left="480" visible="true"]

[image layer=1 storage="number/体力.png" width="100" top="500" left="480" visible="true"]
[image layer=1 storage="&f.EnHPdigit[1]" width="25" top="500" left="555" visible="true"]
[image layer=1 storage="&f.EnHPdigit[2]" width="25" top="500" left="580" visible="true"]
[image layer=1 storage="&f.EnHPdigit[3]" width="25" top="500" left="605" visible="true"]
[image layer=1 storage="&f.EnHPdigit[4]" width="25" top="500" left="630" visible="true"]

[image layer=1 storage="number/気力.png" width="100" top="525" left="480" visible="true"]
[image layer=1 storage="&f.EnFPdigit[1]" width="25" top="525" left="555" visible="true"]
[image layer=1 storage="&f.EnFPdigit[2]" width="25" top="525" left="580" visible="true"]
[image layer=1 storage="&f.EnFPdigit[3]" width="25" top="525" left="605" visible="true"]
[image layer=1 storage="&f.EnFPdigit[4]" width="25" top="525" left="630" visible="true"]

[image layer=1 storage="number/敏捷.png" width="100" top="550" left="480" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[1]" width="25" top="550" left="555" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[2]" width="25" top="550" left="580" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[3]" width="25" top="550" left="605" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[4]" width="25" top="550" left="630" visible="true"]

[image layer=1 storage="number/興奮.png" width="100" top="575" left="480" visible="true"]
[image layer=1 storage="&f.EnEROdigit[1]" width="25" top="575" left="555" visible="true"]
[image layer=1 storage="&f.EnEROdigit[2]" width="25" top="575" left="580" visible="true"]
[image layer=1 storage="&f.EnEROdigit[3]" width="25" top="575" left="605" visible="true"]
[image layer=1 storage="&f.EnEROdigit[4]" width="25" top="575" left="630" visible="true"]

[endmacro]

[macro name="showStatusT"]
[iscript]
alert("くぬぎ　\n体力：" + f.HP + "　すばやさ：" + f.SPD + "　気力：" + f.FP + "　快感度：" + f.ERO
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

[jump storage="selectStage.ks" target="*ステージセレクト"]
