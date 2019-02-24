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
[emb exp="f.Enemy.HN"]
[endmacro]

;数値関係
[macro name="dice"]
[iscript]
tf.dice = Math.floor(Math.random()*(tf.Max+1-tf.Min))+tf.Min;
[endscript]
[endmacro]

;ステータス関係

[macro name="enemySetUp"]
;敵設定読込
[iscript]
f.BaseEnHP = f.originEnHP;
f.BaseEnSTR = f.originEnSTR;
f.BaseEnDEF = f.originEnDEF;
f.BaseEnSPD = f.originEnSPD;
f.BaseEnFP = f.originEnFP;
f.BaseEnERO = f.originEnERO;
f.BaseEnMND = f.originEnMND;
f.BaseEnANG = f.originEnANG;
f.BaseEnTEC = f.originEnTEC;
f.BaseEnEND = f.originEnEND;
f.BaseBindPower = f.originBindPower;

f.EnHP = f.BaseEnHP;
f.EnSTR = f.BaseEnSTR;
f.EnDEF = f.BaseEnDEF;
f.EnSPD = f.BaseEnSPD;
f.EnFP = f.BaseEnFP;
f.EnERO = f.BaseEnERO;
f.EnMND = f.BaseEnMND;
f.EnANG = f.BaseEnANG;
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

[macro name="Digit"]
[iscript]
x = "UI/number/white/x.png"
function calcStatus(Digit,Point){
  str = "x" + Point;
  len = str.length;
  for(i=len; i<5; i++){str = "x" + str;}
  for(i=4; i>0; i--){
    num = str.substr(i,1);
    Digit[i]="UI/number/white/" + num + ".png";
  }
  return Digit;
}
f.TURNdigit=[];
calcStatus(f.TURNdigit,f.turn);

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
f.FGTdigit=[];
calcStatus(f.FGTdigit,f.FGT);

f.EnHPdigit=[];
calcStatus(f.EnHPdigit,f.EnHP);
f.EnFPdigit=[];
calcStatus(f.EnFPdigit,f.EnFP);
f.EnSPDdigit=[];
calcStatus(f.EnSPDdigit,f.EnSPD);
f.EnEROdigit=[];
calcStatus(f.EnEROdigit,f.EnERO);
f.EnMNDdigit=[];
calcStatus(f.EnMNDdigit,f.EnMND);
f.EnErectdigit=[];
calcStatus(f.EnErectdigit,f.EnErect);
[endscript]
[endmacro]

[macro name="showStatus"]
;◆↓パラメーターバーの枠などを描画するサブルーチンを呼び出しますdraw_para_bar_base
;◆↓パラメーターバー枠と枠内側の黒っぽい部分の横幅を設定
[eval exp ="f.para_bar_waku_width = f.para_bar_width + 4"]
[eval exp ="f.para_bar_empty_width = f.para_bar_width + 2"]
[eval exp ="f.para_bar_waku_width_En = f.para_bar_width_En + 4"]
[eval exp ="f.para_bar_empty_width_En = f.para_bar_width_En + 2"]
;◆↓パラメーターバー描画に使うレイヤーをアクティブに
[layopt layer=8 visible=true]
[layopt layer=9 visible=true]
;◆↓図形部分の描画
[image layer=8 x=180 y=15 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=15 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=180 y=30 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=30 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]

[image layer=8 x=630 y=15 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=15 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=630 y=30 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=30 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
;◆↓テキスト部分の描画

;◆◆↓パラメーターのHPバー、HP数値表示など可変部分をレイヤー9に描画しますdraw_para_bar
;◆↓可変部分の描画を一旦消します
[freeimage layer = 9]
;◆↓HP値によりHPバーの長さを計算
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.HP / f.BaseHP)"]
[eval exp="f.para_bar_EnHP_now_width = parseInt(f.para_bar_width_En * f.EnHP / f.BaseEnHP)"]
;◆↓HP最大値の3割以下にHP値が減ると赤いバーで描画、それよりHP値が高ければ緑色のバーで描画
[if exp="f.HP <= parseInt(f.BaseHP * 0.3)"]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_FP_now_width = parseInt(f.para_bar_width * f.FP / 100)"]
[image layer=9 x=182 y=30 width=&f.para_bar_FP_now_width height=10 storage="UI/parameter/bar_blue.png"]
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.HP / f.BaseHP)"]

[if exp="f.EnHP <= parseInt(f.BaseEnHP * 0.3)"]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_EnFP_now_width = parseInt(f.para_bar_width * f.EnFP / 100)"]
[image layer=9 x=632 y=30 width=&f.para_bar_EnFP_now_width height=10 storage="UI/parameter/bar_blue.png"]

;↓テキスト部分の描画
[Digit]
[freeimage layer=1]
[image layer=1 storage="&f.TURNdigit[3]" width="40" top="10" left="420" visible="true"]
[image layer=1 storage="&f.TURNdigit[4]" width="40" top="10" left="450" visible="true"]

[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="30" visible="true"]
[image layer=1 storage="&f.HPdigit[1]" width="20" top="10" left="95" visible="true"]
[image layer=1 storage="&f.HPdigit[2]" width="20" top="10" left="115" visible="true"]
[image layer=1 storage="&f.HPdigit[3]" width="20" top="10" left="135" visible="true"]
[image layer=1 storage="&f.HPdigit[4]" width="20" top="10" left="155" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="30" visible="true"]
[image layer=1 storage="&f.FPdigit[1]" width="20" top="30" left="95" visible="true"]
[image layer=1 storage="&f.FPdigit[2]" width="20" top="30" left="110" visible="true"]
[image layer=1 storage="&f.FPdigit[3]" width="20" top="30" left="135" visible="true"]
[image layer=1 storage="&f.FPdigit[4]" width="20" top="30" left="155" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="290" visible="true"]
[image layer=1 storage="&f.SPDdigit[2]" width="20" top="30" left="350" visible="true"]
[image layer=1 storage="&f.SPDdigit[3]" width="20" top="30" left="375" visible="true"]
[image layer=1 storage="&f.SPDdigit[4]" width="20" top="30" left="395" visible="true"]

[image layer=1 storage="UI/number/疲労.png" width="75" top="460" left="0" visible="true"]
[image layer=1 storage="&f.TIRdigit[1]" width="20" top="460" left="50" visible="true"]
[image layer=1 storage="&f.TIRdigit[2]" width="20" top="460" left="70" visible="true"]
[image layer=1 storage="&f.TIRdigit[3]" width="20" top="460" left="90" visible="true"]
[image layer=1 storage="&f.TIRdigit[4]" width="20" top="460" left="110" visible="true"]

[image layer=1 storage="UI/number/淫らさ.png" width="75" top="480" left="0" visible="true"]
[image layer=1 storage="&f.ARSdigit[1]" width="20" top="480" left="50" visible="true"]
[image layer=1 storage="&f.ARSdigit[2]" width="20" top="480" left="70" visible="true"]
[image layer=1 storage="&f.ARSdigit[3]" width="20" top="480" left="90" visible="true"]
[image layer=1 storage="&f.ARSdigit[4]" width="20" top="480" left="110" visible="true"]

[image layer=1 storage="UI/number/色気.png" width="75" top="500" left="0" visible="true"]
[image layer=1 storage="&f.APPdigit[1]" width="20" top="500" left="50" visible="true"]
[image layer=1 storage="&f.APPdigit[2]" width="20" top="500" left="70" visible="true"]
[image layer=1 storage="&f.APPdigit[3]" width="20" top="500" left="90" visible="true"]
[image layer=1 storage="&f.APPdigit[4]" width="20" top="500" left="110" visible="true"]

[image layer=1 storage="UI/number/感度.png" width="75" top="520" left="0" visible="true"]
[image layer=1 storage="&f.SENdigit[1]" width="20" top="520" left="50" visible="true"]
[image layer=1 storage="&f.SENdigit[2]" width="20" top="520" left="70" visible="true"]
[image layer=1 storage="&f.SENdigit[3]" width="20" top="520" left="90" visible="true"]
[image layer=1 storage="&f.SENdigit[4]" width="20" top="520" left="110" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="540" left="0" visible="true"]
[image layer=1 storage="&f.EROdigit[1]" width="20" top="540" left="50" visible="true"]
[image layer=1 storage="&f.EROdigit[2]" width="20" top="540" left="70" visible="true"]
[image layer=1 storage="&f.EROdigit[3]" width="20" top="540" left="90" visible="true"]
[image layer=1 storage="&f.EROdigit[4]" width="20" top="540" left="110" visible="true"]

[image layer=1 storage="UI/number/理性.png" width="75" top="560" left="0" visible="true"]
[image layer=1 storage="&f.MNDdigit[1]" width="20" top="560" left="50" visible="true"]
[image layer=1 storage="&f.MNDdigit[2]" width="20" top="560" left="70" visible="true"]
[image layer=1 storage="&f.MNDdigit[3]" width="20" top="560" left="90" visible="true"]
[image layer=1 storage="&f.MNDdigit[4]" width="20" top="560" left="110" visible="true"]

[image layer=1 storage="UI/number/戦意.png" width="75" top="580" left="0" visible="true"]
[image layer=1 storage="&f.FGTdigit[1]" width="20" top="580" left="50" visible="true"]
[image layer=1 storage="&f.FGTdigit[2]" width="20" top="580" left="70" visible="true"]
[image layer=1 storage="&f.FGTdigit[3]" width="20" top="580" left="90" visible="true"]
[image layer=1 storage="&f.FGTdigit[4]" width="20" top="580" left="110" visible="true"]

[image layer=1 storage="UI/number/敵名.png" width="75" top="480" left="890" visible="true"]

[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="850" visible="true"]
[image layer=1 storage="&f.EnHPdigit[1]" width="20" top="10" left="755" visible="true"]
[image layer=1 storage="&f.EnHPdigit[2]" width="20" top="10" left="780" visible="true"]
[image layer=1 storage="&f.EnHPdigit[3]" width="20" top="10" left="805" visible="true"]
[image layer=1 storage="&f.EnHPdigit[4]" width="20" top="10" left="830" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="850" visible="true"]
[image layer=1 storage="&f.EnFPdigit[1]" width="20" top="30" left="755" visible="true"]
[image layer=1 storage="&f.EnFPdigit[2]" width="20" top="30" left="780" visible="true"]
[image layer=1 storage="&f.EnFPdigit[3]" width="20" top="30" left="805" visible="true"]
[image layer=1 storage="&f.EnFPdigit[4]" width="20" top="30" left="830" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="550" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[1]" width="20" top="30" left="455" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[2]" width="20" top="30" left="480" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[3]" width="20" top="30" left="505" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[4]" width="20" top="30" left="530" visible="true"]

[image layer=1 storage="UI/number/興奮.png" width="75" top="520" left="890" visible="true"]
[image layer=1 storage="&f.EnEROdigit[1]" width="20" top="520" left="795" visible="true"]
[image layer=1 storage="&f.EnEROdigit[2]" width="20" top="520" left="820" visible="true"]
[image layer=1 storage="&f.EnEROdigit[3]" width="20" top="520" left="845" visible="true"]
[image layer=1 storage="&f.EnEROdigit[4]" width="20" top="520" left="870" visible="true"]

[image layer=1 storage="UI/number/理性.png" width="75" top="540" left="890" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[1]" width="20" top="540" left="795" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[2]" width="20" top="540" left="820" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[3]" width="20" top="540" left="845" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[4]" width="20" top="540" left="870" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="560" left="890" visible="true"]
[image layer=1 storage="&f.EnErectdigit[1]" width="20" top="560" left="795" visible="true"]
[image layer=1 storage="&f.EnErectdigit[2]" width="20" top="560" left="820" visible="true"]
[image layer=1 storage="&f.EnErectdigit[3]" width="20" top="560" left="845" visible="true"]
[image layer=1 storage="&f.EnErectdigit[4]" width="20" top="560" left="870" visible="true"]

[endmacro]

[macro name="showStatus_H"]
/*
;◆↓パラメーターバーの枠などを描画するサブルーチンを呼び出しますdraw_para_bar_base
;◆↓パラメーターバー枠と枠内側の黒っぽい部分の横幅を設定
[eval exp ="f.para_bar_waku_width = f.para_bar_width + 4"]
[eval exp ="f.para_bar_empty_width = f.para_bar_width + 2"]
[eval exp ="f.para_bar_waku_width_En = f.para_bar_width_En + 4"]
[eval exp ="f.para_bar_empty_width_En = f.para_bar_width_En + 2"]
;◆↓パラメーターバー描画に使うレイヤーをアクティブに
[layopt layer=8 visible=true]
[layopt layer=9 visible=true]
;◆↓図形部分の描画
[image layer=8 x=180 y=15 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=15 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=180 y=30 width=&f.para_bar_waku_width height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=181 y=30 width=&f.para_bar_empty_width height=10 storage="UI/parameter/bar_empty.png"]

[image layer=8 x=630 y=15 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=15 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
[image layer=8 x=630 y=30 width=&f.para_bar_waku_width_En height=10 storage="UI/parameter/bar_waku.png"]
[image layer=8 x=631 y=30 width=&f.para_bar_empty_width_En height=10 storage="UI/parameter/bar_empty.png"]
;◆↓テキスト部分の描画

;◆◆↓パラメーターのHPバー、HP数値表示など可変部分をレイヤー9に描画しますdraw_para_bar
;◆↓可変部分の描画を一旦消します
[freeimage layer = 9]
;◆↓HP値によりHPバーの長さを計算
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.HP / f.BaseHP)"]
[eval exp="f.para_bar_EnHP_now_width = parseInt(f.para_bar_width_En * f.EnHP / f.BaseEnHP)"]
;◆↓HP最大値の3割以下にHP値が減ると赤いバーで描画、それよりHP値が高ければ緑色のバーで描画
[if exp="f.HP <= parseInt(f.BaseHP * 0.3)"]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=182 y=15 width=&f.para_bar_HP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_FP_now_width = parseInt(f.para_bar_width * f.FP / 100)"]
[image layer=9 x=182 y=30 width=&f.para_bar_FP_now_width height=10 storage="UI/parameter/bar_blue.png"]
[eval exp="f.para_bar_HP_now_width = parseInt(f.para_bar_width * f.HP / f.BaseHP)"]

[if exp="f.EnHP <= parseInt(f.BaseEnHP * 0.3)"]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_red.png"]
[else]
    [image layer=9 x=632 y=15 width=&f.para_bar_EnHP_now_width height=10 storage="UI/parameter/bar_green.png"]
[endif]
[eval exp="f.para_bar_EnFP_now_width = parseInt(f.para_bar_width * f.EnFP / 100)"]
[image layer=9 x=632 y=30 width=&f.para_bar_EnFP_now_width height=10 storage="UI/parameter/bar_blue.png"]
 */
;↓テキスト部分の描画
[freeimage layer = 1]
/*
[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="30" visible="true"]
[image layer=1 storage="&f.HPdigit[1]" width="20" top="10" left="95" visible="true"]
[image layer=1 storage="&f.HPdigit[2]" width="20" top="10" left="115" visible="true"]
[image layer=1 storage="&f.HPdigit[3]" width="20" top="10" left="135" visible="true"]
[image layer=1 storage="&f.HPdigit[4]" width="20" top="10" left="155" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="30" visible="true"]
[image layer=1 storage="&f.FPdigit[1]" width="20" top="30" left="95" visible="true"]
[image layer=1 storage="&f.FPdigit[2]" width="20" top="30" left="110" visible="true"]
[image layer=1 storage="&f.FPdigit[3]" width="20" top="30" left="135" visible="true"]
[image layer=1 storage="&f.FPdigit[4]" width="20" top="30" left="155" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="290" visible="true"]
[image layer=1 storage="&f.SPDdigit[2]" width="20" top="30" left="350" visible="true"]
[image layer=1 storage="&f.SPDdigit[3]" width="20" top="30" left="375" visible="true"]
[image layer=1 storage="&f.SPDdigit[4]" width="20" top="30" left="395" visible="true"]
 */
[image layer=1 storage="UI/number/疲労.png" width="75" top="460" left="0" visible="true"]
[image layer=1 storage="&f.TIRdigit[1]" width="20" top="460" left="50" visible="true"]
[image layer=1 storage="&f.TIRdigit[2]" width="20" top="460" left="70" visible="true"]
[image layer=1 storage="&f.TIRdigit[3]" width="20" top="460" left="90" visible="true"]
[image layer=1 storage="&f.TIRdigit[4]" width="20" top="460" left="110" visible="true"]

[image layer=1 storage="UI/number/淫らさ.png" width="75" top="480" left="0" visible="true"]
[image layer=1 storage="&f.ARSdigit[1]" width="20" top="480" left="50" visible="true"]
[image layer=1 storage="&f.ARSdigit[2]" width="20" top="480" left="70" visible="true"]
[image layer=1 storage="&f.ARSdigit[3]" width="20" top="480" left="90" visible="true"]
[image layer=1 storage="&f.ARSdigit[4]" width="20" top="480" left="110" visible="true"]

[image layer=1 storage="UI/number/色気.png" width="75" top="500" left="0" visible="true"]
[image layer=1 storage="&f.APPdigit[1]" width="20" top="500" left="50" visible="true"]
[image layer=1 storage="&f.APPdigit[2]" width="20" top="500" left="70" visible="true"]
[image layer=1 storage="&f.APPdigit[3]" width="20" top="500" left="90" visible="true"]
[image layer=1 storage="&f.APPdigit[4]" width="20" top="500" left="110" visible="true"]

[image layer=1 storage="UI/number/感度.png" width="75" top="520" left="0" visible="true"]
[image layer=1 storage="&f.SENdigit[1]" width="20" top="520" left="50" visible="true"]
[image layer=1 storage="&f.SENdigit[2]" width="20" top="520" left="70" visible="true"]
[image layer=1 storage="&f.SENdigit[3]" width="20" top="520" left="90" visible="true"]
[image layer=1 storage="&f.SENdigit[4]" width="20" top="520" left="110" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="540" left="0" visible="true"]
[image layer=1 storage="&f.EROdigit[1]" width="20" top="540" left="50" visible="true"]
[image layer=1 storage="&f.EROdigit[2]" width="20" top="540" left="70" visible="true"]
[image layer=1 storage="&f.EROdigit[3]" width="20" top="540" left="90" visible="true"]
[image layer=1 storage="&f.EROdigit[4]" width="20" top="540" left="110" visible="true"]

[image layer=1 storage="UI/number/理性.png" width="75" top="560" left="0" visible="true"]
[image layer=1 storage="&f.MNDdigit[1]" width="20" top="560" left="50" visible="true"]
[image layer=1 storage="&f.MNDdigit[2]" width="20" top="560" left="70" visible="true"]
[image layer=1 storage="&f.MNDdigit[3]" width="20" top="560" left="90" visible="true"]
[image layer=1 storage="&f.MNDdigit[4]" width="20" top="560" left="110" visible="true"]

[image layer=1 storage="UI/number/戦意.png" width="75" top="580" left="0" visible="true"]
[image layer=1 storage="&f.FGTdigit[1]" width="20" top="580" left="50" visible="true"]
[image layer=1 storage="&f.FGTdigit[2]" width="20" top="580" left="70" visible="true"]
[image layer=1 storage="&f.FGTdigit[3]" width="20" top="580" left="90" visible="true"]
[image layer=1 storage="&f.FGTdigit[4]" width="20" top="580" left="110" visible="true"]

[image layer=1 storage="UI/number/敵名.png" width="75" top="480" left="850" visible="true"]
/*
[image layer=1 storage="UI/number/体力.png" width="75" top="10" left="850" visible="true"]
[image layer=1 storage="&f.EnHPdigit[1]" width="20" top="10" left="755" visible="true"]
[image layer=1 storage="&f.EnHPdigit[2]" width="20" top="10" left="780" visible="true"]
[image layer=1 storage="&f.EnHPdigit[3]" width="20" top="10" left="805" visible="true"]
[image layer=1 storage="&f.EnHPdigit[4]" width="20" top="10" left="830" visible="true"]

[image layer=1 storage="UI/number/気力.png" width="75" top="30" left="850" visible="true"]
[image layer=1 storage="&f.EnFPdigit[1]" width="20" top="30" left="755" visible="true"]
[image layer=1 storage="&f.EnFPdigit[2]" width="20" top="30" left="780" visible="true"]
[image layer=1 storage="&f.EnFPdigit[3]" width="20" top="30" left="805" visible="true"]
[image layer=1 storage="&f.EnFPdigit[4]" width="20" top="30" left="830" visible="true"]

[image layer=1 storage="UI/number/敏捷.png" width="75" top="30" left="550" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[1]" width="20" top="30" left="455" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[2]" width="20" top="30" left="480" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[3]" width="20" top="30" left="505" visible="true"]
[image layer=1 storage="&f.EnSPDdigit[4]" width="20" top="30" left="530" visible="true"]
 */
[image layer=1 storage="UI/number/興奮.png" width="75" top="520" left="890" visible="true"]
[image layer=1 storage="&f.EnEROdigit[1]" width="20" top="520" left="795" visible="true"]
[image layer=1 storage="&f.EnEROdigit[2]" width="20" top="520" left="820" visible="true"]
[image layer=1 storage="&f.EnEROdigit[3]" width="20" top="520" left="845" visible="true"]
[image layer=1 storage="&f.EnEROdigit[4]" width="20" top="520" left="870" visible="true"]

[image layer=1 storage="UI/number/理性.png" width="75" top="540" left="890" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[1]" width="20" top="540" left="795" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[2]" width="20" top="540" left="820" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[3]" width="20" top="540" left="845" visible="true"]
[image layer=1 storage="&f.EnMNDdigit[4]" width="20" top="540" left="870" visible="true"]

[image layer=1 storage="UI/number/快感.png" width="75" top="560" left="890" visible="true"]
[image layer=1 storage="&f.EnErectdigit[1]" width="20" top="560" left="795" visible="true"]
[image layer=1 storage="&f.EnErectdigit[2]" width="20" top="560" left="820" visible="true"]
[image layer=1 storage="&f.EnErectdigit[3]" width="20" top="560" left="845" visible="true"]
[image layer=1 storage="&f.EnErectdigit[4]" width="20" top="560" left="870" visible="true"]

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

[macro name="battleEND"]
[iscript]
for(i=0; i<f.selectOption.length; i++){
  f.selectOption[i].switch=0
}
f.selectOption = [];
f.count=0;
f.EnCount=0;

f.Undress=0;
[endscript]
[endmacro]

[macro name="Retry"]
[iscript]
f.HP = f.BaseHP;
f.STR = f.BaseSTR;
f.DEF = f.BaseDEF;
f.SPD = f.BaseSPD;
f.FP = f.BaseFP;
f.ERO = f.BaseERO;
f.APP = f.BaseAPP;
f.FGT = f.BaseFGT;
f.TIR = f.BaseTIR;
[endscript]
[endmacro]

[macro name="Masochism"]
[iscript]
tf.Damage = Math.floor(3 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Estrus"]
[iscript]
tf.Damage = Math.floor(3 * f.SEN / 100);
[endscript]
[endmacro]

[macro name="Parasite"]
[iscript]
tf.Damage = Math.floor(5 * f.SEN / 100);
[endscript]
[endmacro]



[jump storage="selectStage.ks" target="*ステージセレクト"]
