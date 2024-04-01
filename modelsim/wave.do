onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_booth_multiplier/u_booth_multiplier/multiplicand
add wave -noupdate -radix decimal /tb_booth_multiplier/u_booth_multiplier/multiplier
add wave -noupdate -radix decimal /tb_booth_multiplier/u_booth_multiplier/result
add wave -noupdate -radix binary /tb_booth_multiplier/u_booth_multiplier/multiplier
add wave -noupdate -radix binary /tb_booth_multiplier/u_booth_multiplier/booth_input
add wave -noupdate /tb_booth_multiplier/u_booth_multiplier/partial_reverse
add wave -noupdate /tb_booth_multiplier/u_booth_multiplier/partial_zero
add wave -noupdate /tb_booth_multiplier/u_booth_multiplier/partial_one
add wave -noupdate /tb_booth_multiplier/u_booth_multiplier/partial_double
add wave -noupdate /tb_booth_multiplier/u_booth_multiplier/partial_tail
add wave -noupdate {/tb_booth_multiplier/u_booth_multiplier/DECODE_GEN[0]/genblk1/u_partial_prod/partial_product}
add wave -noupdate {/tb_booth_multiplier/u_booth_multiplier/DECODE_GEN[0]/genblk1/u_partial_prod/partial_tail_out}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10189 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 426
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {4864 ps} {28007 ps}
