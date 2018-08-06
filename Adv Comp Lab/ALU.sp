* FILE: ALU.sp

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

* SPICE netlist for "ALU" (generated by MMI_SUE4.4.0)

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

.SUBCKT Comp B[0] B[1] B[2] B[3] B[4] B[5] B[6] B[7] B[8] B[9] B[10] B[11] 
+ B[12] B[13] B[14] B[15] B[16] B[17] B[18] B[19] B[20] B[21] B[22] B[23] 
+ B[24] B[25] B[26] B[27] B[28] B[29] B[30] B[31] Out[0] Out[1] Out[2] 
+ Out[3] Out[4] Out[5] Out[6] Out[7] Out[8] Out[9] Out[10] Out[11] Out[12] 
+ Out[13] Out[14] Out[15] Out[16] Out[17] Out[18] Out[19] Out[20] Out[21] 
+ Out[22] Out[23] Out[24] Out[25] Out[26] Out[27] Out[28] Out[29] Out[30] 
+ Out[31] S[1] 
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
.ENDS	$ Comp

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

.SUBCKT MUX_2_1 S0 a b out 
Xnand2 a net_1 net_2 nand2 
Xnand2_1 b S0 net_3 nand2 
Xnand2_2 net_2 net_3 out nand2 
Xinverter S0 net_1 inverter 
.ENDS	$ MUX_2_1

.SUBCKT MUX_64_32 A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] A[8] A[9] A[10] 
+ A[11] A[12] A[13] A[14] A[15] A[16] A[17] A[18] A[19] A[20] A[21] A[22] 
+ A[23] A[24] A[25] A[26] A[27] A[28] A[29] A[30] A[31] B[0] B[1] B[2] B[3] 
+ B[4] B[5] B[6] B[7] B[8] B[9] B[10] B[11] B[12] B[13] B[14] B[15] B[16] 
+ B[17] B[18] B[19] B[20] B[21] B[22] B[23] B[24] B[25] B[26] B[27] B[28] 
+ B[29] B[30] B[31] Out[0] Out[1] Out[2] Out[3] Out[4] Out[5] Out[6] Out[7] 
+ Out[8] Out[9] Out[10] Out[11] Out[12] Out[13] Out[14] Out[15] Out[16] 
+ Out[17] Out[18] Out[19] Out[20] Out[21] Out[22] Out[23] Out[24] Out[25] 
+ Out[26] Out[27] Out[28] Out[29] Out[30] Out[31] S[2] 
XMUX_2_1 S[2] A[0] B[0] Out[0] MUX_2_1 
XMUX_2_2 S[2] A[1] B[1] Out[1] MUX_2_1 
XMUX_2_3 S[2] A[2] B[2] Out[2] MUX_2_1 
XMUX_2_4 S[2] A[3] B[3] Out[3] MUX_2_1 
XMUX_2_5 S[2] A[4] B[4] Out[4] MUX_2_1 
XMUX_2_6 S[2] A[5] B[5] Out[5] MUX_2_1 
XMUX_2_7 S[2] A[6] B[6] Out[6] MUX_2_1 
XMUX_2_8 S[2] A[7] B[7] Out[7] MUX_2_1 
XMUX_2_9 S[2] A[8] B[8] Out[8] MUX_2_1 
XMUX_2_10 S[2] A[9] B[9] Out[9] MUX_2_1 
XMUX_2_11 S[2] A[10] B[10] Out[10] MUX_2_1 
XMUX_2_12 S[2] A[11] B[11] Out[11] MUX_2_1 
XMUX_2_13 S[2] A[12] B[12] Out[12] MUX_2_1 
XMUX_2_14 S[2] A[13] B[13] Out[13] MUX_2_1 
XMUX_2_15 S[2] A[14] B[14] Out[14] MUX_2_1 
XMUX_2_16 S[2] A[15] B[15] Out[15] MUX_2_1 
XMUX_2_17 S[2] A[16] B[16] Out[16] MUX_2_1 
XMUX_2_18 S[2] A[17] B[17] Out[17] MUX_2_1 
XMUX_2_19 S[2] A[18] B[18] Out[18] MUX_2_1 
XMUX_2_20 S[2] A[19] B[19] Out[19] MUX_2_1 
XMUX_2_21 S[2] A[20] B[20] Out[20] MUX_2_1 
XMUX_2_22 S[2] A[21] B[21] Out[21] MUX_2_1 
XMUX_2_23 S[2] A[22] B[22] Out[22] MUX_2_1 
XMUX_2_24 S[2] A[23] B[23] Out[23] MUX_2_1 
XMUX_2_25 S[2] A[24] B[24] Out[24] MUX_2_1 
XMUX_2_26 S[2] A[25] B[25] Out[25] MUX_2_1 
XMUX_2_27 S[2] A[26] B[26] Out[26] MUX_2_1 
XMUX_2_28 S[2] A[27] B[27] Out[27] MUX_2_1 
XMUX_2_29 S[2] A[28] B[28] Out[28] MUX_2_1 
XMUX_2_30 S[2] A[29] B[29] Out[29] MUX_2_1 
XMUX_2_31 S[2] A[30] B[30] Out[30] MUX_2_1 
XMUX_2_32 S[2] A[31] B[31] Out[31] MUX_2_1 
.ENDS	$ MUX_64_32

.SUBCKT Adder_HA A B Cout S 
Xmy_xor A B S my_xor 
Xnand2 A B net_1 nand2 
Xinverter net_1 Cout inverter 
.ENDS	$ Adder_HA

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

.SUBCKT Adder_FA A B Cin Cout S 
XAdder_HA A B net_2 net_1 Adder_HA 
XAdder_HA_1 net_1 Cin net_3 S Adder_HA 
Xnor2 net_3 net_2 net_4 nor2 
Xinverter net_4 Cout inverter 
.ENDS	$ Adder_FA

.SUBCKT Adder_4bits A[0] A[1] A[2] A[3] B[0] B[1] B[2] B[3] Cin Cout S[0] 
+ S[1] S[2] S[3] 
XAdder_FA A[0] B[0] Cin net_2 S[0] Adder_FA 
XAdder_FA_1 A[1] B[1] net_2 net_3 S[1] Adder_FA 
XAdder_FA_2 A[2] B[2] net_3 net_1 S[2] Adder_FA 
XAdder_FA_3 A[3] B[3] net_1 Cout S[3] Adder_FA 
.ENDS	$ Adder_4bits

.SUBCKT Adder_8bits A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] B[0] B[1] B[2] 
+ B[3] B[4] B[5] B[6] B[7] Cin Cout S[0] S[1] S[2] S[3] S[4] S[5] S[6] S[7] 
+ 
XAdder_4bits A[0] A[1] A[2] A[3] B[0] B[1] B[2] B[3] Cin net_1 S[0] S[1] 
+ S[2] S[3] Adder_4bits 
XAdder_4bits_1 A[4] A[5] A[6] A[7] B[4] B[5] B[6] B[7] net_1 Cout S[4] S[5] 
+ S[6] S[7] Adder_4bits 
.ENDS	$ Adder_8bits

.SUBCKT Adder_32bits A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] A[8] A[9] 
+ A[10] A[11] A[12] A[13] A[14] A[15] A[16] A[17] A[18] A[19] A[20] A[21] 
+ A[22] A[23] A[24] A[25] A[26] A[27] A[28] A[29] A[30] A[31] B[0] B[1] 
+ B[2] B[3] B[4] B[5] B[6] B[7] B[8] B[9] B[10] B[11] B[12] B[13] B[14] 
+ B[15] B[16] B[17] B[18] B[19] B[20] B[21] B[22] B[23] B[24] B[25] B[26] 
+ B[27] B[28] B[29] B[30] B[31] Cin Cout S[0] S[1] S[2] S[3] S[4] S[5] S[6] 
+ S[7] S[8] S[9] S[10] S[11] S[12] S[13] S[14] S[15] S[16] S[17] S[18] 
+ S[19] S[20] S[21] S[22] S[23] S[24] S[25] S[26] S[27] S[28] S[29] S[30] 
+ S[31] 
XAdder_8bits A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] B[0] B[1] B[2] B[3] 
+ B[4] B[5] B[6] B[7] Cin net_3 S[0] S[1] S[2] S[3] S[4] S[5] S[6] S[7] 
+ Adder_8bits 
XAdder_8bits_1 A[8] A[9] A[10] A[11] A[12] A[13] A[14] A[15] B[8] B[9] 
+ B[10] B[11] B[12] B[13] B[14] B[15] net_3 net_1 S[8] S[9] S[10] S[11] 
+ S[12] S[13] S[14] S[15] Adder_8bits 
XAdder_8bits_2 A[16] A[17] A[18] A[19] A[20] A[21] A[22] A[23] B[16] B[17] 
+ B[18] B[19] B[20] B[21] B[22] B[23] net_1 net_2 S[16] S[17] S[18] S[19] 
+ S[20] S[21] S[22] S[23] Adder_8bits 
XAdder_8bits_3 A[24] A[25] A[26] A[27] A[28] A[29] A[30] A[31] B[24] B[25] 
+ B[26] B[27] B[28] B[29] B[30] B[31] net_2 Cout S[24] S[25] S[26] S[27] 
+ S[28] S[29] S[30] S[31] Adder_8bits 
.ENDS	$ Adder_32bits

.SUBCKT MUX_4_1 S0 S1 a b c d out 
XMUX_2_1 net_3 a b net_2 MUX_2_1 
XMUX_2_2 S0 c d net_1 MUX_2_1 
XMUX_2_3 S1 net_2 net_1 out MUX_2_1 
Xinverter S0 net_3 inverter 
.ENDS	$ MUX_4_1

.SUBCKT Logic Out S[0] S[1] a b 
Xnand2 a b net_7 nand2 
Xinverter net_7 net_4 inverter 
Xnor2 a b net_5 nor2 
Xinverter_1 net_5 net_2 inverter 
Xmy_xor a b net_1 my_xor 
Xmy_xor_1 a b net_6 my_xor 
Xinverter_2 net_6 net_3 inverter 
XMUX_4_1 S[0] S[1] net_4 net_2 net_1 net_3 Out MUX_4_1 
.ENDS	$ Logic

.SUBCKT Logic_64_32 A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] A[8] A[9] A[10] 
+ A[11] A[12] A[13] A[14] A[15] A[16] A[17] A[18] A[19] A[20] A[21] A[22] 
+ A[23] A[24] A[25] A[26] A[27] A[28] A[29] A[30] A[31] B[0] B[1] B[2] B[3] 
+ B[4] B[5] B[6] B[7] B[8] B[9] B[10] B[11] B[12] B[13] B[14] B[15] B[16] 
+ B[17] B[18] B[19] B[20] B[21] B[22] B[23] B[24] B[25] B[26] B[27] B[28] 
+ B[29] B[30] B[31] Out[0] Out[1] Out[2] Out[3] Out[4] Out[5] Out[6] Out[7] 
+ Out[8] Out[9] Out[10] Out[11] Out[12] Out[13] Out[14] Out[15] Out[16] 
+ Out[17] Out[18] Out[19] Out[20] Out[21] Out[22] Out[23] Out[24] Out[25] 
+ Out[26] Out[27] Out[28] Out[29] Out[30] Out[31] S[0] S[1] 
XLogic Out[0] S[0] S[1] A[0] B[0] Logic 
XLogic_1 Out[1] S[0] S[1] A[1] B[1] Logic 
XLogic_2 Out[2] S[0] S[1] A[2] B[2] Logic 
XLogic_3 Out[3] S[0] S[1] A[3] B[3] Logic 
XLogic_4 Out[4] S[0] S[1] A[4] B[4] Logic 
XLogic_5 Out[5] S[0] S[1] A[5] B[5] Logic 
XLogic_6 Out[6] S[0] S[1] A[6] B[6] Logic 
XLogic_7 Out[7] S[0] S[1] A[7] B[7] Logic 
XLogic_8 Out[8] S[0] S[1] A[8] B[8] Logic 
XLogic_9 Out[9] S[0] S[1] A[9] B[9] Logic 
XLogic_10 Out[10] S[0] S[1] A[10] B[10] Logic 
XLogic_11 Out[11] S[0] S[1] A[11] B[11] Logic 
XLogic_12 Out[12] S[0] S[1] A[12] B[12] Logic 
XLogic_13 Out[13] S[0] S[1] A[13] B[13] Logic 
XLogic_14 Out[14] S[0] S[1] A[14] B[14] Logic 
XLogic_15 Out[15] S[0] S[1] A[15] B[15] Logic 
XLogic_16 Out[16] S[0] S[1] A[16] B[16] Logic 
XLogic_17 Out[17] S[0] S[1] A[17] B[17] Logic 
XLogic_18 Out[18] S[0] S[1] A[18] B[18] Logic 
XLogic_19 Out[19] S[0] S[1] A[19] B[19] Logic 
XLogic_20 Out[20] S[0] S[1] A[20] B[20] Logic 
XLogic_21 Out[21] S[0] S[1] A[21] B[21] Logic 
XLogic_22 Out[22] S[0] S[1] A[22] B[22] Logic 
XLogic_23 Out[23] S[0] S[1] A[23] B[23] Logic 
XLogic_24 Out[24] S[0] S[1] A[24] B[24] Logic 
XLogic_25 Out[25] S[0] S[1] A[25] B[25] Logic 
XLogic_26 Out[26] S[0] S[1] A[26] B[26] Logic 
XLogic_27 Out[27] S[0] S[1] A[27] B[27] Logic 
XLogic_28 Out[28] S[0] S[1] A[28] B[28] Logic 
XLogic_29 Out[29] S[0] S[1] A[29] B[29] Logic 
XLogic_30 Out[30] S[0] S[1] A[30] B[30] Logic 
XLogic_31 Out[31] S[0] S[1] A[31] B[31] Logic 
.ENDS	$ Logic_64_32

* start main CELL ALU
* .SUBCKT ALU ALU_Result[0] ALU_Result[1] ALU_Result[2] ALU_Result[3] 
*+ ALU_Result[4] ALU_Result[5] ALU_Result[6] ALU_Result[7] ALU_Result[8] 
*+ ALU_Result[9] ALU_Result[10] ALU_Result[11] ALU_Result[12] 
*+ ALU_Result[13] ALU_Result[14] ALU_Result[15] ALU_Result[16] 
*+ ALU_Result[17] ALU_Result[18] ALU_Result[19] ALU_Result[20] 
*+ ALU_Result[21] ALU_Result[22] ALU_Result[23] ALU_Result[24] 
*+ ALU_Result[25] ALU_Result[26] ALU_Result[27] ALU_Result[28] 
*+ ALU_Result[29] ALU_Result[30] ALU_Result[31] a[0] a[1] a[2] a[3] a[4] 
*+ a[5] a[6] a[7] a[8] a[9] a[10] a[11] a[12] a[13] a[14] a[15] a[16] a[17] 
*+ a[18] a[19] a[20] a[21] a[22] a[23] a[24] a[25] a[26] a[27] a[28] a[29] 
*+ a[30] a[31] b[0] b[1] b[2] b[3] b[4] b[5] b[6] b[7] b[8] b[9] b[10] 
*+ b[11] b[12] b[13] b[14] b[15] b[16] b[17] b[18] b[19] b[20] b[21] b[22] 
*+ b[23] b[24] b[25] b[26] b[27] b[28] b[29] b[30] b[31] cout s[0] s[1] 
*+ s[2] 
XComp b[0] b[1] b[2] b[3] b[4] b[5] b[6] b[7] b[8] b[9] b[10] b[11] b[12] 
+ b[13] b[14] b[15] b[16] b[17] b[18] b[19] b[20] b[21] b[22] b[23] b[24] 
+ b[25] b[26] b[27] b[28] b[29] b[30] b[31] net_2[0] net_2[1] net_2[2] 
+ net_2[3] net_2[4] net_2[5] net_2[6] net_2[7] net_2[8] net_2[9] net_2[10] 
+ net_2[11] net_2[12] net_2[13] net_2[14] net_2[15] net_2[16] net_2[17] 
+ net_2[18] net_2[19] net_2[20] net_2[21] net_2[22] net_2[23] net_2[24] 
+ net_2[25] net_2[26] net_2[27] net_2[28] net_2[29] net_2[30] net_2[31] 
+ s[1] Comp 
XMUX_64_32 net_1[0] net_1[1] net_1[2] net_1[3] net_1[4] net_1[5] net_1[6] 
+ net_1[7] net_1[8] net_1[9] net_1[10] net_1[11] net_1[12] net_1[13] 
+ net_1[14] net_1[15] net_1[16] net_1[17] net_1[18] net_1[19] net_1[20] 
+ net_1[21] net_1[22] net_1[23] net_1[24] net_1[25] net_1[26] net_1[27] 
+ net_1[28] net_1[29] net_1[30] net_1[31] net_3[0] net_3[1] net_3[2] 
+ net_3[3] net_3[4] net_3[5] net_3[6] net_3[7] net_3[8] net_3[9] net_3[10] 
+ net_3[11] net_3[12] net_3[13] net_3[14] net_3[15] net_3[16] net_3[17] 
+ net_3[18] net_3[19] net_3[20] net_3[21] net_3[22] net_3[23] net_3[24] 
+ net_3[25] net_3[26] net_3[27] net_3[28] net_3[29] net_3[30] net_3[31] 
+ ALU_Result[0] ALU_Result[1] ALU_Result[2] ALU_Result[3] ALU_Result[4] 
+ ALU_Result[5] ALU_Result[6] ALU_Result[7] ALU_Result[8] ALU_Result[9] 
+ ALU_Result[10] ALU_Result[11] ALU_Result[12] ALU_Result[13] 
+ ALU_Result[14] ALU_Result[15] ALU_Result[16] ALU_Result[17] 
+ ALU_Result[18] ALU_Result[19] ALU_Result[20] ALU_Result[21] 
+ ALU_Result[22] ALU_Result[23] ALU_Result[24] ALU_Result[25] 
+ ALU_Result[26] ALU_Result[27] ALU_Result[28] ALU_Result[29] 
+ ALU_Result[30] ALU_Result[31] s[2] MUX_64_32 
XAdder_32bits a[0] a[1] a[2] a[3] a[4] a[5] a[6] a[7] a[8] a[9] a[10] a[11] 
+ a[12] a[13] a[14] a[15] a[16] a[17] a[18] a[19] a[20] a[21] a[22] a[23] 
+ a[24] a[25] a[26] a[27] a[28] a[29] a[30] a[31] net_2[0] net_2[1] 
+ net_2[2] net_2[3] net_2[4] net_2[5] net_2[6] net_2[7] net_2[8] net_2[9] 
+ net_2[10] net_2[11] net_2[12] net_2[13] net_2[14] net_2[15] net_2[16] 
+ net_2[17] net_2[18] net_2[19] net_2[20] net_2[21] net_2[22] net_2[23] 
+ net_2[24] net_2[25] net_2[26] net_2[27] net_2[28] net_2[29] net_2[30] 
+ net_2[31] s[0] cout net_1[0] net_1[1] net_1[2] net_1[3] net_1[4] net_1[5] 
+ net_1[6] net_1[7] net_1[8] net_1[9] net_1[10] net_1[11] net_1[12] 
+ net_1[13] net_1[14] net_1[15] net_1[16] net_1[17] net_1[18] net_1[19] 
+ net_1[20] net_1[21] net_1[22] net_1[23] net_1[24] net_1[25] net_1[26] 
+ net_1[27] net_1[28] net_1[29] net_1[30] net_1[31] Adder_32bits 
XLogic_64_32 a[0] a[1] a[2] a[3] a[4] a[5] a[6] a[7] a[8] a[9] a[10] a[11] 
+ a[12] a[13] a[14] a[15] a[16] a[17] a[18] a[19] a[20] a[21] a[22] a[23] 
+ a[24] a[25] a[26] a[27] a[28] a[29] a[30] a[31] b[0] b[1] b[2] b[3] b[4] 
+ b[5] b[6] b[7] b[8] b[9] b[10] b[11] b[12] b[13] b[14] b[15] b[16] b[17] 
+ b[18] b[19] b[20] b[21] b[22] b[23] b[24] b[25] b[26] b[27] b[28] b[29] 
+ b[30] b[31] net_3[0] net_3[1] net_3[2] net_3[3] net_3[4] net_3[5] 
+ net_3[6] net_3[7] net_3[8] net_3[9] net_3[10] net_3[11] net_3[12] 
+ net_3[13] net_3[14] net_3[15] net_3[16] net_3[17] net_3[18] net_3[19] 
+ net_3[20] net_3[21] net_3[22] net_3[23] net_3[24] net_3[25] net_3[26] 
+ net_3[27] net_3[28] net_3[29] net_3[30] net_3[31] s[0] s[1] Logic_64_32 
* .ENDS	$ ALU

.GLOBAL gnd vdd

.END

