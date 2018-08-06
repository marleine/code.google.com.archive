* FILE: Comp.sp

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

* SPICE netlist for "Comp" (generated by MMI_SUE4.4.0)

.SUBCKT xgate in in_L t1 t2 WP=2 WN=1
M_1 t2 in_L t1 vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_2 t2 in t1 gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' as='arean(WN,sdd)' 
+ pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
.ENDS	$ xgate

.SUBCKT inverter in out WP=2 LP=lp_min WN=1 LN=ln_min
M_1 out in gnd gnd n W='WN*1u' L=LN ad='arean(WN,sdd)' as='arean(WN,sdd)' 
+ pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in vdd vdd p W='WP*1u' L=LP ad='areap(WP,sdd)' as='areap(WP,sdd)' 
+ pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ inverter

.SUBCKT my_xor in1 in2 out 
Xinverter in1 net_1 inverter 
Xinverter_1 net_2 out inverter WP=6 WN=3
Xinverter_2 in2 net_3 inverter 
Xxgate in1 net_1 in2 net_2 xgate 
Xxgate_1 net_1 in1 net_3 net_2 xgate 
.ENDS	$ my_xor

* start main CELL Comp
* .SUBCKT Comp B[0] B[1] B[2] B[3] B[4] B[5] B[6] B[7] B[8] B[9] B[10] 
*+ B[11] B[12] B[13] B[14] B[15] B[16] B[17] B[18] B[19] B[20] B[21] B[22] 
*+ B[23] B[24] B[25] B[26] B[27] B[28] B[29] B[30] B[31] Out[0] Out[1] 
*+ Out[2] Out[3] Out[4] Out[5] Out[6] Out[7] Out[8] Out[9] Out[10] Out[11] 
*+ Out[12] Out[13] Out[14] Out[15] Out[16] Out[17] Out[18] Out[19] Out[20] 
*+ Out[21] Out[22] Out[23] Out[24] Out[25] Out[26] Out[27] Out[28] Out[29] 
*+ Out[30] Out[31] S[1] 
Xmy_xor B[31] S[1] Out[31] my_xor 
Xmy_xor_1 B[30] S[1] Out[30] my_xor 
Xmy_xor_2 B[29] S[1] Out[29] my_xor 
Xmy_xor_3 B[28] S[1] Out[28] my_xor 
Xmy_xor_4 B[27] S[1] Out[27] my_xor 
Xmy_xor_5 B[26] S[1] Out[26] my_xor 
Xmy_xor_6 B[25] S[1] Out[25] my_xor 
Xmy_xor_7 B[24] S[1] Out[24] my_xor 
Xmy_xor_8 B[23] S[1] Out[23] my_xor 
Xmy_xor_9 B[22] S[1] Out[22] my_xor 
Xmy_xor_10 B[21] S[1] Out[21] my_xor 
Xmy_xor_11 B[20] S[1] Out[20] my_xor 
Xmy_xor_12 B[19] S[1] Out[19] my_xor 
Xmy_xor_13 B[18] S[1] Out[18] my_xor 
Xmy_xor_14 B[17] S[1] Out[17] my_xor 
Xmy_xor_15 B[16] S[1] Out[16] my_xor 
Xmy_xor_16 B[15] S[1] Out[15] my_xor 
Xmy_xor_17 B[14] S[1] Out[14] my_xor 
Xmy_xor_18 B[13] S[1] Out[13] my_xor 
Xmy_xor_19 B[12] S[1] Out[12] my_xor 
Xmy_xor_20 B[11] S[1] Out[11] my_xor 
Xmy_xor_21 B[10] S[1] Out[10] my_xor 
Xmy_xor_22 B[9] S[1] Out[9] my_xor 
Xmy_xor_23 B[8] S[1] Out[8] my_xor 
Xmy_xor_24 B[7] S[1] Out[7] my_xor 
Xmy_xor_25 B[6] S[1] Out[6] my_xor 
Xmy_xor_26 B[5] S[1] Out[5] my_xor 
Xmy_xor_27 B[4] S[1] Out[4] my_xor 
Xmy_xor_28 B[3] S[1] Out[3] my_xor 
Xmy_xor_29 B[2] S[1] Out[2] my_xor 
Xmy_xor_30 B[1] S[1] Out[1] my_xor 
Xmy_xor_31 B[0] S[1] Out[0] my_xor 
* .ENDS	$ Comp

.GLOBAL gnd vdd

.END

