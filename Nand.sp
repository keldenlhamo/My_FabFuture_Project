* NAND gate with pdk

* Include the Sky130 device models
.lib "/foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice" tt

* Power supply: 1.8V
Vdd vdd gnd 1.8


* Inputs
* PULSE(initial final delay rise fall widht period)
VA inA gnd PULSE(0 1.8 0n 100p 100p 4n 8n)
VB inB gnd PULSE(0 1.8 0ns 100ps 100ps 2n 4n)

* Two PMOS transistors in parralel for the pull-up network  (W=1u, L=150n)
* Format: Mname drain gate source body model W=... L=...
Xpa NAND inA vdd vdd sky130_fd_pr__pfet_01v8  l=0.150  w=0.99
Xpb NAND inB vdd vdd sky130_fd_pr__pfet_01v8 l=0.150  w=0.99

* Two NMOS transistors in series for the pull-down network  (W=0.5u, L=150n)
Xna NAND inA npd gnd sky130_fd_pr__nfet_01v8  l=0.150  w=0.495
Xnb npd  inB gnd gnd sky130_fd_pr__nfet_01v8  l=0.150  w=0.495

* Output load capacitor (typical gate load)
Cload NAND gnd 10f

* Simulation: transient analysis for 20ns
.tran 10p 20n

* Save node voltages for plotting
.save v(inA) v(inB) v(NAND)

* Control block for ngspice
.control
run
plot v(inA) v(NAND)
plot v(inB) v(NAND)
meas tran tpd_hl TRIG v(inA) VAL=0.9 RISE=1 TARG v(NAND) VAL=0.9 FALL=1
meas tran tpd_lh TRIG v(inA) VAL=0.9 FALL=1 TARG v(NAND) VAL=0.9 RISE=1
meas tran tpd_hl TRIG v(inB) VAL=0.9 RISE=1 TARG v(NAND) VAL=0.9 FALL=1
meas tran tpd_lh TRIG v(inB) VAL=0.9 FALL=1 TARG v(NAND) VAL=0.9 RISE=1

wrdata results.csv v(inA) v(inB) v(NAND)

.endc

.end
