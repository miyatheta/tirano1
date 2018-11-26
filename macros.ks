*マクロ
;文法関係
[macro name="lrcm"]
[l][r][cm]
[endmacro]

[macro name="wt7"]
[wait time=800][cm]
[endmacro]

[macro name="wt5"]
[wait time=600][cm]
[endmacro]

[macro name="EnName"]
[emb exp="f.EnemyName"]
[endmacro]

;数値関係
[macro name="dice"]
[iscript]
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
[endscript]
[endmacro]

;ステータス関係
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
f.MNDdigit=[];
calcStatus(f.MNDdigit,f.MND);
f.ARSdigit=[];
calcStatus(f.ARSdigit,f.ARS);
f.APPdigit=[];
calcStatus(f.APPdigit,f.APP);
f.SENdigit=[];
calcStatus(f.SENdigit,f.SEN);


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

[image layer=1 storage="number/疲労.png" width="100" top="575" left="0" visible="true"]
[image layer=1 storage="&f.TIRdigit[1]" width="25" top="575" left="75" visible="true"]
[image layer=1 storage="&f.TIRdigit[2]" width="25" top="575" left="100" visible="true"]
[image layer=1 storage="&f.TIRdigit[3]" width="25" top="575" left="125" visible="true"]
[image layer=1 storage="&f.TIRdigit[4]" width="25" top="575" left="150" visible="true"]

[image layer=1 storage="number/精神.png" width="100" top="500" left="200" visible="true"]
[image layer=1 storage="&f.MNDdigit[1]" width="25" top="500" left="275" visible="true"]
[image layer=1 storage="&f.MNDdigit[2]" width="25" top="500" left="300" visible="true"]
[image layer=1 storage="&f.MNDdigit[3]" width="25" top="500" left="325" visible="true"]
[image layer=1 storage="&f.MNDdigit[4]" width="25" top="500" left="350" visible="true"]

[image layer=1 storage="number/淫らさ.png" width="100" top="525" left="200" visible="true"]
[image layer=1 storage="&f.ARSdigit[1]" width="25" top="525" left="275" visible="true"]
[image layer=1 storage="&f.ARSdigit[2]" width="25" top="525" left="300" visible="true"]
[image layer=1 storage="&f.ARSdigit[3]" width="25" top="525" left="325" visible="true"]
[image layer=1 storage="&f.ARSdigit[4]" width="25" top="525" left="350" visible="true"]

[image layer=1 storage="number/淫力.png" width="100" top="550" left="200" visible="true"]
[image layer=1 storage="&f.APPdigit[1]" width="25" top="550" left="275" visible="true"]
[image layer=1 storage="&f.APPdigit[2]" width="25" top="550" left="300" visible="true"]
[image layer=1 storage="&f.APPdigit[3]" width="25" top="550" left="325" visible="true"]
[image layer=1 storage="&f.APPdigit[4]" width="25" top="550" left="350" visible="true"]

[image layer=1 storage="number/感度.png" width="100" top="575" left="200" visible="true"]
[image layer=1 storage="&f.SENdigit[1]" width="25" top="575" left="275" visible="true"]
[image layer=1 storage="&f.SENdigit[2]" width="25" top="575" left="300" visible="true"]
[image layer=1 storage="&f.SENdigit[3]" width="25" top="575" left="325" visible="true"]
[image layer=1 storage="&f.SENdigit[4]" width="25" top="575" left="350" visible="true"]

[image layer=1 storage="number/快感.png" width="100" top="600" left="200" visible="true"]
[image layer=1 storage="&f.EROdigit[1]" width="25" top="600" left="275" visible="true"]
[image layer=1 storage="&f.EROdigit[2]" width="25" top="600" left="300" visible="true"]
[image layer=1 storage="&f.EROdigit[3]" width="25" top="600" left="325" visible="true"]
[image layer=1 storage="&f.EROdigit[4]" width="25" top="600" left="350" visible="true"]

[image layer=1 storage="number/敵名.png" width="100" top="475" left="680" visible="true"]

[image layer=1 storage="number/体力.png" width="100" top="500" left="680" visible="true"]
[image layer=1 storage="&f.EnHPdigit[1]" width="25" top="500" left="755" visible="true"]
[image layer=1 storage="&f.EnHPdigit[2]" width="25" top="500" left="780" visible="true"]
[image layer=1 storage="&f.EnHPdigit[3]" width="25" top="500" left="805" visible="true"]
[image layer=1 storage="&f.EnHPdigit[4]" width="25" top="500" left="830" visible="true"]

[image layer=1 storage="number/気力.png" width="100" top="525" left="680" visible="true"]
[image layer=1 storage="&f.EnFPdigit[1]" width="25" top="525" left="755" visible="true"]
[image layer=1 storage="&f.EnFPdigit[2]" width="25" top="525" left="780" visible="true"]
[image layer=1 storage="&f.EnFPdigit[3]" width="25" top="525" left="805" visible="true"]
[image layer=1 storage="&f.EnFPdigit[4]" width="25" top="525" left="830" visible="true"]

[image layer=1 storage="number/敏捷.png" width="100" top="550" left="680" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[1]" width="25" top="550" left="755" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[2]" width="25" top="550" left="780" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[3]" width="25" top="550" left="805" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[4]" width="25" top="550" left="830" visible="true"]

[image layer=1 storage="number/興奮.png" width="100" top="575" left="680" visible="true"]
[image layer=1 storage="&f.EnEROdigit[1]" width="25" top="575" left="755" visible="true"]
[image layer=1 storage="&f.EnEROdigit[2]" width="25" top="575" left="780" visible="true"]
[image layer=1 storage="&f.EnEROdigit[3]" width="25" top="575" left="805" visible="true"]
[image layer=1 storage="&f.EnEROdigit[4]" width="25" top="575" left="830" visible="true"]

[endmacro]

;戦闘関連
[macro name="Damage"]
[iscript]
if(f.VB > 2){
  f.VBonus = 1.5;
}else if(f.VB > 1){
  f.VBonus = 1.3;
}else{
  f.VBonus = 1.1;
}

tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum= (tf.dice / 1000) + 1;

tf.Buff = f.VBonus * f.VBuff;

tf.ATP = Math.floor(f.STR * 2.25 * tf.Buff * tf.randomNum);
tf.EnDFP = Math.floor(f.EnDEF * 1.2);
tf.Damage = tf.ATP - tf.EnDFP;
if(tf.Damage<0){tf.Damage=0;}

f.VBuff = 1.0;
[endscript]
[endmacro]

[macro name="EnDamage"]
[iscript]
if(f.EnVB > 2){
  f.EnVBonus = 1.5;
}else if(f.EnVB > 1){
  f.EnVBonus = 1.3;
}else{
  f.EnVBonus = 1.1;
}

tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;

tf.Buff = f.EnVBonus * f.EnVBuff;
tf.DeBuff = (100 - f.CharmBuff) / 100;
if (tf.DeBuff < 0){tf.DeBuff = 0};

//alert('バフは' + tf.Buff + '、デバフは' +tf.DeBuff);

tf.EnATP = Math.floor(f.EnSTR * 2.25 * tf.Buff * tf.DeBuff * tf.randomNum);
tf.DFP = Math.floor(f.DEF * 1.2);
tf.Damage = tf.EnATP - tf.DFP;
if(tf.Damage<0){tf.Damage=0;}

f.EnVBuff = 1.0;
[endscript]
[endmacro]

[macro name="HDamage"]
[iscript]
tf.Min = 0, tf.Max = 50;
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
tf.randomNum = (tf.dice / 1000) + 1;
naked = (f.Undress/10) + 1;
sexAppeal = 1 + (f.APP - 50) / 100;
tf.ATP = Math.floor(f.value * sexAppeal * naked * tf.randomNum);
tf.EnDFP = (100 - f.EnEND) / 100;
tf.HDamage = Math.floor(tf.ATP * tf.EnDFP);
if(tf.Damage<0){tf.Damage=0;}
[endscript]
[endmacro]

[macro name="Masochism"]
[iscript]
tf.Damage = Math.floor(2 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Estrus"]
[iscript]
tf.Damage = Math.floor(1 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Parasite"]
[iscript]
tf.Damage = Math.floor(5 * f.SEN / 100);
[endscript]
[endmacro]


[position width=960 height=480 top=0 left=0]
[jump storage="selectStage.ks" target="*ステージセレクト"]
