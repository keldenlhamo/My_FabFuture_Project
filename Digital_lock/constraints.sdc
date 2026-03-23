# ============================================================================
# Timing Constraints for Fab Futures Projects
# ============================================================================
#
# This file tells the synthesis and place & route tools about your design's
# timing requirements. The most important constraint is the clock period.
#
# SDC = Synopsys Design Constraints (industry standard format)
#
# ============================================================================

# ----------------------------------------------------------------------------
# Clock Definition
# ----------------------------------------------------------------------------
# Define a 50 MHz clock (20 ns period) on the 'clk' input
#
# create_clock arguments:
#   -name clk        : Name this clock "clk" for timing reports
#   -period 20       : Clock period in nanoseconds (50 MHz = 20 ns)
#   [get_ports clk]  : Apply to the port named "clk"

create_clock -name clk -period 20 [get_ports clk]

# ----------------------------------------------------------------------------
# False Paths (Optional)
# ----------------------------------------------------------------------------
# Reset is asynchronous - don't try to meet timing on it
# (The reset synchronizer handles the clock domain crossing)

set_false_path -from [get_ports rst_n]

# ----------------------------------------------------------------------------
# Clock Uncertainty (Optional, for more accurate analysis)
# ----------------------------------------------------------------------------
# Account for clock jitter and skew. 0.5 ns is typical for simple designs.

set_clock_uncertainty 0.5 [get_clocks clk]

# ============================================================================

# Human-driven asynchronous inputs: do not apply set_input_delay

set_false_path -from [get_ports btn]
set_false_path -from [get_ports {pw_switch[0] pw_switch[1] pw_switch[2] pw_switch[3]}]


# That's it! For our educational designs, these basic constraints are enough.
#
# More complex designs might add:
#   - Multiple clock domains
#   - Clock-to-clock constraints (set_clock_groups)
#   - Multicycle paths (set_multicycle_path)
#   - Max transition/capacitance constraints
# ============================================================================
