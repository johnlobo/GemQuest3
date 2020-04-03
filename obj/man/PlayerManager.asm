;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module PlayerManager
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strCopy
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
	.ds 65
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
;src/man/PlayerManager.c:32: void man_player_init(){
;	---------------------------------
; Function man_player_init
; ---------------------------------
_man_player_init::
;src/man/PlayerManager.c:33: players_list.num_players = 0;
	ld	hl, #(_players_list + 0x0040)
	ld	(hl), #0x00
	ret
;src/man/PlayerManager.c:42: void man_player_createPlayer(u8 x, u8 y, u8 *name, u8 life){
;	---------------------------------
; Function man_player_createPlayer
; ---------------------------------
_man_player_createPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/man/PlayerManager.c:43: players_list.list[players_list.num_players].active = NO;
	ld	de, #_players_list+0
	ld	bc, #_players_list+0
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
	add	hl, de
	ld	(hl), #0x00
;src/man/PlayerManager.c:44: strCopy(name, &players_list.list[players_list.num_players].name[0]);
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
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
;src/man/PlayerManager.c:45: players_list.list[players_list.num_players].x = x;
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
	add	hl, bc
	ld	de, #0x0017
	add	hl, de
	ld	a, 4 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:46: players_list.list[players_list.num_players].y = y;
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
	add	hl, bc
	ld	de, #0x0018
	add	hl, de
	ld	a, 5 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:47: players_list.list[players_list.num_players].px = x;
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
	add	hl, bc
	ld	de, #0x0019
	add	hl, de
	ld	a, 4 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:48: players_list.list[players_list.num_players].py = y;
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
	add	hl, bc
	ld	de, #0x001a
	add	hl, de
	ld	a, 5 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:49: players_list.list[players_list.num_players].life = life;
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
	add	hl, bc
	ld	de, #0x001b
	add	hl, de
	ld	a, 8 (ix)
	ld	(hl), a
;src/man/PlayerManager.c:50: players_list.list[players_list.num_players].score = 0;
	ld	a, (#(_players_list + 0x0040) + 0)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
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
;src/man/PlayerManager.c:59: TPlayer* man_player_get_player(u8 player){
;	---------------------------------
; Function man_player_get_player
; ---------------------------------
_man_player_get_player::
;src/man/PlayerManager.c:60: return &players_list.list[player]; 
	ld	bc, #_players_list+0
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	l, a
	ld	h,#0x00
	add	hl, bc
	ret
;src/man/PlayerManager.c:69: void man_player_update(){
;	---------------------------------
; Function man_player_update
; ---------------------------------
_man_player_update::
;src/man/PlayerManager.c:71: }
	ret
;src/man/PlayerManager.c:81: void man_player_render(){
;	---------------------------------
; Function man_player_render
; ---------------------------------
_man_player_render::
;src/man/PlayerManager.c:83: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
