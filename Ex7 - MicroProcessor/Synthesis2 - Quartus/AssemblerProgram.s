# Instructions  | Encoding Data to Din
MVI R0,5		# DIN = 0x2000 , DIN = 5
MOV R1,R0		# DIN = 0x0400
ADD R0,R1		# DIN = 0x4080
SUB R0,R0		# DIN = 0x6000