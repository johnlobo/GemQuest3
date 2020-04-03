;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module tiles
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sp_tiles_8
	.globl _sp_tiles_7
	.globl _sp_tiles_6
	.globl _sp_tiles_5
	.globl _sp_tiles_4
	.globl _sp_tiles_3
	.globl _sp_tiles_2
	.globl _sp_tiles_1
	.globl _sp_tiles_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_sp_tiles_0:
	.db #0x44	; 68	'D'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xd8	; 216
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0x98	; 152
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x88	; 136
_sp_tiles_1:
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x56	; 86	'V'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0x5c	; 92
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
_sp_tiles_2:
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0xb4	; 180
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x0c	; 12
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xf5	; 245
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0xb4	; 180
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa0	; 160
_sp_tiles_3:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x3b	; 59
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x0c	; 12
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x19	; 25
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x2f	; 47
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x3b	; 59
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x37	; 55	'7'
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
_sp_tiles_4:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x2a	; 42
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x2a	; 42
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x7b	; 123
	.db #0x2e	; 46
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1d	; 29
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1d	; 29
	.db #0xa6	; 166
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x2a	; 42
	.db #0x51	; 81	'Q'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
_sp_tiles_5:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0xf3	; 243
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xa2	; 162
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xa2	; 162
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xa2	; 162
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x00	; 0
_sp_tiles_6:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sp_tiles_7:
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
_sp_tiles_8:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.area _INITIALIZER
	.area _CABS (ABS)
