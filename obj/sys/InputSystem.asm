;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module InputSystem
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sys_input_update
	.globl _sys_input_init
	.globl _man_player_get_player
	.globl _cpct_isKeyPressed
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
;src/sys/InputSystem.c:22: void sys_input_init() {
;	---------------------------------
; Function sys_input_init
; ---------------------------------
_sys_input_init::
;src/sys/InputSystem.c:24: }
	ret
;src/sys/InputSystem.c:26: void sys_input_update() {
;	---------------------------------
; Function sys_input_update
; ---------------------------------
_sys_input_update::
;src/sys/InputSystem.c:27: TPlayer *player = man_player_get_player(0);
	xor	a, a
	push	af
	inc	sp
	call	_man_player_get_player
	inc	sp
	ld	c, l
	ld	b, h
;src/sys/InputSystem.c:29: if (cpct_isKeyPressed(keys1.left)) {
	ld	hl, (#(_keys1 + 0x0004) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/sys/InputSystem.c:30: player->x = player->x - 1;
	ld	hl, #0x0017
	add	hl, bc
	ld	e, (hl)
	dec	e
	ld	(hl), e
00102$:
;src/sys/InputSystem.c:32: if (cpct_isKeyPressed(keys1.right)) {
	ld	hl, (#(_keys1 + 0x0006) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/sys/InputSystem.c:33: player->x = player->x + 1;
	ld	hl, #0x0017
	add	hl, bc
	ld	e, (hl)
	inc	e
	ld	(hl), e
00104$:
;src/sys/InputSystem.c:35: if (cpct_isKeyPressed(keys1.up)) {
	ld	hl, (#_keys1 + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00106$
;src/sys/InputSystem.c:36: player->y = player->y - 1;
	ld	hl, #0x0018
	add	hl, bc
	ld	e, (hl)
	dec	e
	ld	(hl), e
00106$:
;src/sys/InputSystem.c:38: if (cpct_isKeyPressed(keys1.down)) {
	ld	hl, (#(_keys1 + 0x0002) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	ret	Z
;src/sys/InputSystem.c:39: player->y = player->y + 1;
	ld	hl, #0x0018
	add	hl, bc
	ld	c, (hl)
	inc	c
	ld	(hl), c
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
