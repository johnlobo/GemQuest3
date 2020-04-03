;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initMain
	.globl _myInterruptHandler
	.globl _man_game_render
	.globl _man_game_update
	.globl _man_game_init
	.globl _showMessage
	.globl _clearScreen
	.globl _initKeys
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_setBlendMode
	.globl _cpct_scanKeyboard
	.globl _cpct_setStackLocation
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _screenBuffer0
	.globl _keys2
	.globl _keys1
	.globl _i_time
	.globl _g_nInterrupt
	.globl _sp_palette0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_nInterrupt::
	.ds 1
_i_time::
	.ds 4
_keys1	=	0xa8dc
_keys2	=	0xa92b
_screenBuffer0	=	0xb000
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
;src/main.c:50: cpctm_createTransparentMaskTable(g_tablatrans, 0x200, M0, 0);
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
	.org 0x200 
	 _g_tablatrans::
	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.area _CSEG (REL, CON) 
;src/main.c:67: void myInterruptHandler()
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:69: i_time++;
	ld	iy, #_i_time
	inc	0 (iy)
	jr	NZ,00109$
	inc	1 (iy)
	jr	NZ,00109$
	inc	2 (iy)
	jr	NZ,00109$
	inc	3 (iy)
00109$:
;src/main.c:71: if (++g_nInterrupt == 6)
	ld	iy, #_g_nInterrupt
	inc	0 (iy)
	ld	a, 0 (iy)
	sub	a, #0x06
	ret	NZ
;src/main.c:73: cpct_scanKeyboard();
	call	_cpct_scanKeyboard
;src/main.c:74: g_nInterrupt = 0;
	ld	hl,#_g_nInterrupt + 0
	ld	(hl), #0x00
	ret
_sp_palette0:
	.db #0x54	; 84	'T'
	.db #0x4d	; 77	'M'
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0x4c	; 76	'L'
	.db #0x4e	; 78	'N'
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x56	; 86	'V'
	.db #0x5e	; 94
	.db #0x53	; 83	'S'
	.db #0x5f	; 95
	.db #0x55	; 85	'U'
	.db #0x58	; 88	'X'
	.db #0x44	; 68	'D'
	.db #0x4b	; 75	'K'
;src/main.c:78: void initMain()
;	---------------------------------
; Function initMain
; ---------------------------------
_initMain::
;src/main.c:83: cpct_setBlendMode(CPCT_BLEND_XOR);
	ld	l, #0xae
	call	_cpct_setBlendMode
;src/main.c:84: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:85: cpct_setPalette(sp_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_sp_palette0
	push	hl
	call	_cpct_setPalette
;src/main.c:86: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:88: clearScreen(BG_COLOR);
	xor	a, a
	push	af
	inc	sp
	call	_clearScreen
	inc	sp
;src/main.c:94: showMessage("GEMQUEST3 IS LOADED!!", MESSAGE);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_0
	push	hl
	call	_showMessage
	pop	af
	inc	sp
;src/main.c:96: seed = i_time;
	ld	iy, #_i_time
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	e, 2 (iy)
	ld	d, 3 (iy)
;src/main.c:98: if (!seed)
	ld	a, d
	or	a, e
	or	a, h
	or	a,l
	jr	NZ,00102$
;src/main.c:99: seed++;
	inc	l
	jr	NZ,00109$
	inc	h
	jr	NZ,00109$
	inc	e
	jr	NZ,00109$
	inc	d
00109$:
00102$:
;src/main.c:100: cpct_srand(seed);
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:103: initKeys(SINGLE); 
	xor	a, a
	push	af
	inc	sp
	call	_initKeys
	inc	sp
	ret
___str_0:
	.ascii "GEMQUEST3 IS LOADED!!"
	.db 0x00
;src/main.c:106: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:108: cpct_setStackLocation(NEW_STACK_LOCATION);
	ld	hl, #0x0100
	call	_cpct_setStackLocation
;src/main.c:110: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:112: cpct_setInterruptHandler((void*) myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:115: initMain();
	call	_initMain
;src/main.c:116: man_game_init();
	call	_man_game_init
;src/main.c:119: while (1){
00102$:
;src/main.c:121: man_game_update();
	call	_man_game_update
;src/main.c:122: man_game_render();
	call	_man_game_render
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
