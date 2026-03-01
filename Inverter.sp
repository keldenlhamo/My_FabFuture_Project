* CMOS Inverter Simulation
* For Fab Futures - Week 2

* Include the Sky130 device models
.lib "/foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice" tt

* Power supply: 1.8V
Vdd vdd gnd 1.8

* Input: pulse from 0V to 1.8V
* PULSE(initial final delay rise fall width period)
Vin in gnd PULSE(0 1.8 1n 100p 100p 2n 4n)

* PMOS transistor (W=1u, L=150n)
* Format: Mname drain gate source body model W=... L=...
Xp out in vdd vdd sky130_fd_pr__pfet_01v8  l=0.150  w=0.99

* NMOS transistor (W=0.5u, L=150n)
Xn out in gnd gnd sky130_fd_pr__nfet_01v8  l=0.150  w=0.495

* Output load capacitor (typical gate load)
Cload out gnd 10f

* Simulation: transient analysis, 10ps step 20ns duration
.tran 10p 20n

* Save node voltages for plotting
.save v(in) v(out)

* Control block for ngspice
.control
run
plot v(in)+ 2  v(out)
meas tran tpd_hl TRIG v(in) VAL=0.9 RISE=1 TARG v(out) VAL=0.9 FALL=1
meas tran tpd_lh TRIG v(in) VAL=0.9 FALL=1 TARG v(out) VAL=0.9 RISE=1
.endc

.end
