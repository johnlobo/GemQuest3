;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module GameManager
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _man_game_render
	.globl _man_game_update
	.globl _man_game_init
	.globl _clearScreen
	.globl _man_board_render
	.globl _man_board_init
	.globl _man_board_create
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
;src/man/GameManager.c:11: void man_game_init(){
;	---------------------------------
; Function man_game_init
; ---------------------------------
_man_game_init::
;src/man/GameManager.c:12: man_board_create();
	call	_man_board_create
;src/man/GameManager.c:13: man_board_init(0, 0, 8, 8);
	ld	hl, #0x0808
	push	hl
	ld	hl, #0x0000
	push	hl
	call	_man_board_init
	pop	af
	pop	af
;src/man/GameManager.c:16: clearScreen(BG_COLOR);
	xor	a, a
	push	af
	inc	sp
	call	_clearScreen
	inc	sp
	ret
;src/man/GameManager.c:25: void man_game_update(){
;	---------------------------------
; Function man_game_update
; ---------------------------------
_man_game_update::
;src/man/GameManager.c:27: }
	ret
;src/man/GameManager.c:35: void man_game_render(){
;	---------------------------------
; Function man_game_render
; ---------------------------------
_man_game_render::
;src/man/GameManager.c:36: man_board_render();
	jp  _man_board_render
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
