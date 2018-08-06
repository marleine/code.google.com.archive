* FILE: Adder_8bits.sp

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

* SPICE netlist for "Adder_8bits" (generated by MMI_SUE4.4.0)

.SUBCKT inverter in out WP=2 LP=lp_min WN=1 LN=ln_min
M_1 out in gnd gnd n W='WN*1u' L=LN ad='arean(WN,sdd)' as='arean(WN,sdd)' 
+ pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in vdd vdd p W='WP*1u' L=LP ad='areap(WP,sdd)' as='areap(WP,sdd)' 
+ pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ inverter

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

* start main CELL Adder_8bits
* .SUBCKT Adder_8bits A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] B[0] B[1] 
*+ B[2] B[3] B[4] B[5] B[6] B[7] Cin Cout S[0] S[1] S[2] S[3] S[4] S[5] 
*+ S[6] S[7] 
XAdder_4bits A[0] A[1] A[2] A[3] B[0] B[1] B[2] B[3] Cin net_1 S[0] S[1] 
+ S[2] S[3] Adder_4bits 
XAdder_4bits_1 A[4] A[5] A[6] A[7] B[4] B[5] B[6] B[7] net_1 Cout S[4] S[5] 
+ S[6] S[7] Adder_4bits 
* .ENDS	$ Adder_8bits

.GLOBAL gnd vdd

.END
