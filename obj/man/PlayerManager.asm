;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module PlayerManager
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strCopy
	.globl _players_num
	.globl _players_list
	.globl _man_player_init
	.globl _man_player_createPlayer
	.globl _man_player_get_player
	.globl _man_player_update
	.globl _man_player_render
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_players_list::
	.ds 64
_players_num::
	.ds 1
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
;src/man/PlayerManager.c:33: void man_player_init(){
;	---------------------------------
; Function man_player_init
; ---------------------------------
_man_player_init::
;src/man/PlayerManager.c:34: players_num = 0;
	ld	hl,#_players_num + 0
	ld	(hl), #0x00
	ret
;src/man/PlayerManager.c:43: void man_player_createPlayer(u8 x, u8 y, u8 *name, u8 life){
;	---------------------------------
; Function man_player_createPlayer
; ---------------------------------
_man_player_createPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/man/PlayerManager.c:44: players_list[players_num].active = NO;
	ld	bc, #_players_list+0
	ld	iy, #_players_num
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x00
;src/man/PlayerManager.c:45: strCopy(name, &players_list[players_num].name[0]);
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	push	bc
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strCopy
	pop	af
	pop	af
	pop	bc
;src/man/PlayerManager.c:46: players_list[players_num].x = x;
	ld	iy, #_players_num
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x0017
	add	hl, de
	ld	a, 4 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:47: players_list[players_num].y = y;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x0018
	add	hl, de
	ld	a, 5 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:48: players_list[players_num].px = x;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x0019
	add	hl, de
	ld	a, 4 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:49: players_list[players_num].py = y;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x001a
	add	hl, de
	ld	a, 5 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:50: players_list[players_num].life = life;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #0x001b
	add	hl, de
	ld	a, 8 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:51: players_list[players_num].score = 0;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #0x001c
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	pop	ix
	ret
;src/man/PlayerManager.c:60: TPlayer* man_player_get_player(u8 player){
;	---------------------------------
; Function man_player_get_player
; ---------------------------------
_man_player_get_player::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/man/PlayerManager.c:61: return &players_list[player]; 
	ld	bc, #_players_list+0
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	pop	ix
	ret
;src/man/PlayerManager.c:70: void man_player_update(){
;	---------------------------------
; Function man_player_update
; ---------------------------------
_man_player_update::
;src/man/PlayerManager.c:72: }
	ret
;src/man/PlayerManager.c:80: void man_player_render(){
;	---------------------------------
; Function man_player_render
; ---------------------------------
_man_player_render::
;src/man/PlayerManager.c:82: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
