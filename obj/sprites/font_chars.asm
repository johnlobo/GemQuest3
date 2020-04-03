;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module font_chars
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_font_chars
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
_g_font_chars:
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
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
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xcc	; 204
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xdd	; 221
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xcc	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0x44	; 68	'D'
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xcc	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0x44	; 68	'D'
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0x44	; 68	'D'
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0x44	; 68	'D'
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xee	; 238
	.db #0x44	; 68	'D'
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xcc	; 204
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x55	; 85	'U'
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xcc	; 204
	.db #0xee	; 238
	.db #0x88	; 136
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
