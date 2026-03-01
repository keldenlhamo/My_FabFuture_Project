* AND gate ngspice example

* NGSPICE transistor models
.model mosn NMOS level=49 version=3.3.0 tox=10n nch=1e17 nsub=5e16 
.model mosp PMOS level=49 version=3.3.0 tox=10n nch=1e17 nsub=5e16

* 1 V power supply
vsup VDD 0 1 


* AND pull-up network -- two pmos in parallel
Mp1 nOUT A VDD VDD mosp L=0.35u W=2u 
Mp2 nOUT B VDD VDD mosp L=0.35u W=2u


* Pull-down network -- two nmos in series
Mn1 nOUT A npd 0 mosn L=0.35u W=2u 
Mn2 npd B 0 0 mosn L=0.35u W=2u

* Inverter, or a logical NOT
Mp3 AND nOUT VDD VDD mosp L=0.35u W=2u
Mn3 AND nOUT 0 0 mosn L=0.35u W=2u

* Input voltage source, ramps up to VDD then back down
vin1 A 0 PWL(0 0 2mS 0 2.001mS 1V 3mS 1V 3.001mS 0) 
vin2 B 0 PWL(0 0 1mS 0 1.001mS 1V 2.5mS 1V 2.5001mS 0) 

.control 
* transient simulation using vin sweep
  tran 100n 4m 

* plot vout against vin 
  plot v(A) 
  plot v(B) 
  plot v(AND)
.endc
