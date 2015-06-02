# ComplexMultipliers

## Conventional
* Conventional_UFP_NoPipe -- Generic Conventional complex number multiplier, Unpipelined
	* NCL_signals.vhd, NCL_gates.vhd, NCL_functions.vhd, MTNCL_gates.vhd, MTNCL_gates_extension.vhd, MTNCL_adders.vhd, MTNCL_completion.vhd, MTNCL_registers.vhd, MTNCL_misc.vhd, carry_generate_propagatem.vhd, MTNCL_CLA_genm.vhd, MTNCL_sub_gen.vhd, MTNCL_mult_signed_gen.vhd, rca_4b_m.vhd

## MTNCL Library
* carry_generate_propagatem -- Contains the propagate and generate logic for the Carry Lookahead Adder
* MTNCL_add_gen -- Contains generic MTNCL 2s complement adder
* MTNCL_adders -- Contains MTNCL Half Adder, Full Adder, CSA, etc.
* MTNCL_CLA_genm -- Contains generic MTNCL 2s complement Carry Lookahead Adder
* MTNCL_completion -- Contains completion gates
* MTNCL_gates_extension.vhd -- Contains th55m and th15m made of standard MTNCL gates
* MTNCL_gates -- Contains standard MTNCL gates
* MTNCL_misc -- Contains and2i gate, NCL_inv, and MSB
* MTNCL_mult_signed_gen  -- Contains a generic 2s complement multiplier
* MTNCL_registers -- Contains regm
* MTNCL_sub_gen -- Contains generic 2s complement subtraction unit
* rca_4b_m -- Contains 4-bit ripple carry adder used in MTNCL_CLA_genm


## NCL Library
* NCL_functions -- Contains functions for NCL
* NCL_gates -- Contains standard NCL gates
* NCL_signals -- Contains NCL dual and quad-rail signals


## Testbences
* tb_add_genm -- Testbench for generic adder. Tests all possible combinations for 8 x 8 array.
* tb_cla_add_genm -- Testbench for generic CLA adder. Tests all possible combinations for 8 x 8 array.
* tb_Conventional -- Testbench for generic Conventional complex multiplier.
* tb_mult_genm -- Testbench for generic multiplier. Tests all possible combinations for 8 x 8 array.
* tb_multNoReg_genm -- Testbench for generic multiplier with no registers on input and output.
* tb_sub_genm -- Testbench for generic subtraction unit. Tests all possible combinations for 8 x 8 array.
* tb_subNoReg_genm -- Testbench for generic subtraction unit with no input and output registers.
 

