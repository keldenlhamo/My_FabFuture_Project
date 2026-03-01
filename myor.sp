* OR gate ngspice - NOR gate + Inverter

* NGSPICE transistor models
.model mosn NMOS level=49 version=3.3.0 tox=10n nch=1e17 nsub=5e16 
.model mosp PMOS level=49 version=3.3.0 tox=10n nch=1e17 nsub=5e16

* 1 V power supply
vsup VDD 0 1 


* OR pull-up network -- two pmos in series
Mp1 npu A VDD VDD mosp L=0.35u W=2u 
Mp2 nOUT B npu VDD mosp L=0.35u W=2u


* Pull-down network -- two nmos in parallel
Mn1 nOUT A 0 0 mosn L=0.35u W=2u
Mn2 nOUT B 0 0 mosn L=0.35u W=2u

* Inverter, or a logical NOT
Mp3 OUT nOUT VDD VDD mosp L=0.35u W=2u
Mn3 OUT nOUT 0 0 mosn L=0.35u W=2u


* Input voltage source, ramps up to VDD then back down
vin1 A 0 PWL(0 0 0.5mS 0 0.5001mS 1V 2mS 1V 2.001mS 0) 
vin2 B 0 PWL(0 0 1mS 0 1.001mS 1V 2.5mS 1V 2.5001mS 0) 

.control 
* transient simulation using vin sweep
  tran 100n 4m 

* plot signals against time
  plot v(A)+4 v(B)+2 v(OUT)
.endc
