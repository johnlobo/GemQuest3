;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
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
	.globl _sys_input_update
	.globl _sys_input_init
	.globl _man_player_render
	.globl _man_player_createPlayer
	.globl _man_player_init
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
;src/man/GameManager.c:13: void man_game_init(){
;	---------------------------------
; Function man_game_init
; ---------------------------------
_man_game_init::
;src/man/GameManager.c:14: man_board_create();
	call	_man_board_create
;src/man/GameManager.c:15: man_board_init(0, 0, 8, 8);
	ld	hl, #0x0808
	push	hl
	ld	hl, #0x0000
	push	hl
	call	_man_board_init
	pop	af
	pop	af
;src/man/GameManager.c:18: clearScreen(BG_COLOR);
	xor	a, a
	push	af
	inc	sp
	call	_clearScreen
	inc	sp
;src/man/GameManager.c:20: man_player_init();
	call	_man_player_init
;src/man/GameManager.c:21: man_player_createPlayer(0,0,"David\0",100);
	ld	a, #0x64
	push	af
	inc	sp
	ld	hl, #___str_0
	push	hl
	ld	hl, #0x0000
	push	hl
	call	_man_player_createPlayer
	pop	af
	pop	af
	inc	sp
;src/man/GameManager.c:22: man_player_createPlayer(8,8,"Malo1\0",100);
	ld	a, #0x64
	push	af
	inc	sp
	ld	hl, #___str_1
	push	hl
	ld	hl, #0x0808
	push	hl
	call	_man_player_createPlayer
	pop	af
	pop	af
	inc	sp
;src/man/GameManager.c:23: sys_input_init();
	jp  _sys_input_init
___str_0:
	.ascii "David"
	.db 0x00
	.db 0x00
___str_1:
	.ascii "Malo1"
	.db 0x00
	.db 0x00
;src/man/GameManager.c:32: void man_game_update(){
;	---------------------------------
; Function man_game_update
; ---------------------------------
_man_game_update::
;src/man/GameManager.c:33: sys_input_update();
	jp  _sys_input_update
;src/man/GameManager.c:42: void man_game_render(){
;	---------------------------------
; Function man_game_render
; ---------------------------------
_man_game_render::
;src/man/GameManager.c:43: man_board_render();
	call	_man_board_render
;src/man/GameManager.c:44: man_player_render();
	jp  _man_player_render
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
