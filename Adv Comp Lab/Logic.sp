* FILE: Logic.sp

********************** begin header *****************************

* Example header file for SPICE

.OPTIONS post ACCT OPTS lvltim=2
.OPTIONS post_version=9007

.option gmindc=   10.0p       

.options ADM_V_SUPPLY=3.3
*.options ADM_ACCURACY=10
*.options ADM_MODE=exp
.options ADM_MODE=acs
*.options ADM_MAXSTEP=10p
.options ignore_meas=0
*.param temper = 105

**################################################
* Corners are TT, SS, FF, SF, FS
.lib '<spice_model_file>' TT
**################################################

.param  arean(w,sdd) = '(w*sdd*1p)'
.param  areap(w,sdd) = '(w*sdd*1p)'
* Setup either one or the other of the following
* For ACM=2 fet models
.param  perin(w,sdd) = '(2u*(w+sdd))'
.param  perip(w,sdd) = '(2u*(w+sdd))'
* For ACM=3 fet models
*.param  perin(w,sdd) = '(1u*(w+2*sdd))'
*.param  perip(w,sdd) = '(1u*(w+2*sdd))'

.param ln_min   =  0.35u
.param lp_min   =  0.35u

* used in source/drain area/perimeter calculation
.param sdd        =  0.95

.PARAM vddp=3.0		$ VDD voltage

VDD vdd 0 DC vddp 

.TEMP 105
.TRAN 10p 16n
*********************** end header ******************************

* SPICE netlist for "Logic" (generated by MMI_SUE4.4.0)

.SUBCKT nand2 in0 in1 out WP=2 WN=2
M_1 out in0 vdd vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_2 out in0 net_1 gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_3 out in1 vdd vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_4 net_1 in1 gnd gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
.ENDS	$ nand2

.SUBCKT inverter in out WP=2 LP=lp_min WN=1 LN=ln_min
M_1 out in gnd gnd n W='WN*1u' L=LN ad='arean(WN,sdd)' as='arean(WN,sdd)' 
+ pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in vdd vdd p W='WP*1u' L=LP ad='areap(WP,sdd)' as='areap(WP,sdd)' 
+ pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ inverter

.SUBCKT nor2 in0 in1 out WP=4 WN=1
M_1 out in1 gnd gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in1 net_1 vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_3 out in0 gnd gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_4 net_1 in0 vdd vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ nor2

.SUBCKT xgate in in_L t1 t2 WP=2 WN=1
M_1 t2 in_L t1 vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_2 t2 in t1 gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' as='arean(WN,sdd)' 
+ pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
.ENDS	$ xgate

.SUBCKT my_xor in1 in2 out 
Xinverter in1 net_1 inverter 
Xinverter_1 net_2 out inverter WP=6 WN=3
Xinverter_2 in2 net_3 inverter 
Xxgate in1 net_1 in2 net_2 xgate 
Xxgate_1 net_1 in1 net_3 net_2 xgate 
.ENDS	$ my_xor

.SUBCKT MUX_2_1 S0 a b out 
Xnand2 a net_2 net_1 nand2 
Xnand2_1 b S0 net_3 nand2 
Xnand2_2 net_1 net_3 out nand2 
Xinverter S0 net_2 inverter 
.ENDS	$ MUX_2_1

.SUBCKT MUX_4_1 S0 S1 a b c d out 
XMUX_2_1 net_3 a b net_2 MUX_2_1 
XMUX_2_2 S0 c d net_1 MUX_2_1 
XMUX_2_3 S1 net_2 net_1 out MUX_2_1 
Xinverter S0 net_3 inverter 
.ENDS	$ MUX_4_1

* start main CELL Logic
* .SUBCKT Logic Out S[0] S[1] a b 
Xnand2 a b net_5 nand2 
Xinverter net_5 net_2 inverter 
Xnor2 a b net_3 nor2 
Xinverter_1 net_3 net_6 inverter 
Xmy_xor a b net_1 my_xor 
Xmy_xor_1 a b net_7 my_xor 
Xinverter_2 net_7 net_4 inverter 
XMUX_4_1 S[0] S[1] net_2 net_6 net_1 net_4 Out MUX_4_1 
* .ENDS	$ Logic

.GLOBAL gnd vdd

.END

