* schmitt trigger ngspice example

* NGSPICE transistor models
.model mosn NMOS level=49 version=3.3.0 tox=10n nch=1e17 nsub=5e16 
.model mosp PMOS level=49 version=3.3.0 tox=10n nch=1e17 nsub=5e16

* 1 V power supply
vsup VDD 0 1 


* Trigger pull-up network -- two pmos in series
Mp1 npu nin VDD VDD mosp L=0.35u W=2u 
Mp2 nout nin npu VDD mosp L=0.35u W=2u
* Feedback PMOS from ground to pullup, with gate connected to output
Mpfeedback npu nout 0 VDD mosp L=0.35u W=2u 


* Pull-down network -- two nmos in series
Mn1 npd nin 0 0 mosn L=0.35u W=2u
Mn2 nout nin npd 0 mosn L=0.35u W=2u
* Feedback NMOS from VDD to pulldown, with gate connected to output
Mnfeedback npd nout VDD 0 mosn L=0.35u W=2u


* Input voltage source, ramps up to VDD then back down
vin nin 0 PWL(0 0 1mS 1V 2mS 0V) 

*.dc vin 0 1 0.01

.control 
* rising input dc sweep
  dc vin 0 1 0.002
  let vout = v(nout)
  let vin = v(nin)
  set dc1 = $curplot 

* falling input dc sweep
  dc vin 1 0 -0.002
  let vout_fallingInput = v(nout)
  let vout_risingInput = {$dc1}.v(nout)
  let vin = v(nin)
* plot both sweep results
  plot vout_fallingInput vs vin vout_risingInput vs {$dc1}.v(nin) title 'DC Simulations'
  
* transient simulation using vin sweep
  tran 100n 2m 
  let vin = v(nin)
  let vout = v(nout)
* plot signals against time
  plot vin vout title 'Transient Simulation'
* plot vout against vin 
  plot vout vs vin retraceplot title 'Transient Simulation Vout vs Vin'
.endc
