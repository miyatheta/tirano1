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
[glink target="*敵1" exp="f.enemy=1" text="敵１" size=15 x=50 y=100]
[glink target="*敵2" exp="f.enemy=2" text="敵２" size=15 x=50 y=150]
[glink target="*敵3" exp="f.enemy=3" text="敵３" size=15 x=50 y=200]
[s]

*敵1
[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 70;
f.originEnSPD = 60;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1.1;//arouse
f.originEnTEC = 70;//技術力
f.originEnEND = 70;//忍耐力
f.originBindPower = 100;

f.originEnOption[0] = ['グー','グー','グー','チョキ','チョキ','チョキ','チョキ','パー','パー'];
f.originEnOption[1] = ['グー','チョキ','チョキ','パー','チョキ','グー','グー','パー','チョキ'];
f.originEnOption[2] = ['グー','パー','グー','チョキ','チョキ','グー','チョキ','チョキ','パー'];
f.originEnOption[3] = ['パー','チョキ','グー','チョキ','パー','グー','パー','チョキ','グー'];
f.originEnOption[4] = ['チョキ','グー','グー','チョキ','パー','チョキ','パー','チョキ','グー'];
f.originEnOption[5] = ['チョキ','チョキ','グー','チョキ','グー','パー','グー','チョキ','パー'];
f.originEnOption[6] = ['チョキ','グー','チョキ','パー','チョキ','グー','グー','パー','チョキ'];

f.ClutchRate = 20;//組付初期値
[endscript]
[jump target="*敵設定読込"]

*敵2
[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 90;
f.originEnDEF = 80;
f.originEnSPD = 30;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1;//arouse
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
[jump target="*敵設定読込"]

*敵3
[iscript]
//敵の設定
f.originEnHP = 1000;
f.originEnSTR = 80;
f.originEnDEF = 70;
f.originEnSPD = 50;
f.originEnFP = 0;
f.originEnERO = 0;
f.originEnARS = 1.2;//arouse
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
