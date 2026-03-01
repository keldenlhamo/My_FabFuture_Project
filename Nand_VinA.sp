To observe propagation delay of nand

* Include the Sky130 device models
.lib "/foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice" tt

* Power supply: 1.8V
Vdd vdd gnd 1.8


* Inputs
* PULSE(initial final delay rise fall widht period)
VinA inA gnd PULSE(0 1.8 0ns 100ps 100ps 4n 8n)
VinB inB gnd DC 1.8

* Two PMOS transistors in parralel for the pull-up network  (W=1u, L=150n)
* Format: Mname drain gate source body model W=... L=...
Xp1 NAND inA vdd vdd sky130_fd_pr__pfet_01v8_hvt  l=0.150  w=0.99
Xp2 NAND inB vdd vdd sky130_fd_pr__pfet_01v8_hvt  l=0.150  w=0.99

* Two NMOS transistors in series for the pull-down network  (W=0.5u, L=150n)
Xn1 NAND inA npd gnd sky130_fd_pr__nfet_01v8  l=0.150  w=0.495
Xn2 npd  inB gnd gnd sky130_fd_pr__nfet_01v8  l=0.150  w=0.495

* Output load capacitor (typical gate load)
Cload NAND gnd 10f

* Simulation: transient analysis for 30ns
.tran 10p 30ns

* Save node voltages for plotting
.save v(inA) v(inB) v(NAND)

* Control block for ngspice
.control
run
plot v(inA)+4 v(inB)+2 v(NAND)
plot v(inA) v(NAND)
*plot v(inB) v(NAND)

meas tran tpd_hl TRIG v(inA) VAL=0.9 RISE=1 TARG v(NAND) VAL=0.9 FALL=1
meas tran tpd_lh TRIG v(inA) VAL=0.9 FALL=1 TARG v(NAND) VAL=0.9 RISE=1
*meas tran tpd_hl TRIG v(inB) VAL=0.9 RISE=1 TARG v(NAND) VAL=0.9 FALL=1
*meas tran tpd_lh TRIG v(inB) VAL=0.9 FALL=1 TARG v(NAND) VAL=0.9 RISE=1

.endc

.end
