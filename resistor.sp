*test for resistor

* Control block for ngspice
.pre_osdi Resistor.osdi

*5v DC source
V1 p 0 DC 5

*Use verilog-A resistor
 N1 p n resistor

*Load resistor to ground
 Rload out 0 1k 

.op

.end
