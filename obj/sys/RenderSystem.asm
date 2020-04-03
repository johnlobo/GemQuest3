;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module RenderSystem
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _draw_player
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteBlended
	.globl _render
	.globl _sys_render_init
	.globl _sys_render_update
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_render::
	.ds 4
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
;src/sys/RenderSystem.c:26: void sys_render_init(u8 x, u8 y, TPlayers_List *pl) {
;	---------------------------------
; Function sys_render_init
; ---------------------------------
_sys_render_init::
;src/sys/RenderSystem.c:27: render.o_x = x;
	ld	hl, #_render
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
;src/sys/RenderSystem.c:28: render.o_y = y;
	ld	hl, #(_render + 0x0001)
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
;src/sys/RenderSystem.c:29: render.players = pl;
	ld	hl, #(_render + 0x0002)
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	ret
;src/sys/RenderSystem.c:40: void draw_player(TPlayer *player){
;	---------------------------------
; Function draw_player
; ---------------------------------
_draw_player::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/sys/RenderSystem.c:43: pvmem = cpct_getScreenPtr (CPCT_VMEM_START,  render.o_x - 1 + (player->x * 5), render.o_y - 2 + (player->y*13));
	ld	a, (#_render + 1)
	ld	d, a
	dec	d
	dec	d
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	e, 24 (iy)
	ld	l, e
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	a, d
	add	a, l
	ld	d, a
	ld	hl, #_render + 0
	ld	e, (hl)
	dec	e
	ld	l, c
	ld	h, b
	ld	bc, #0x0017
	add	hl, bc
	ld	c, (hl)
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, e
	add	a, l
	ld	e,a
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/sys/RenderSystem.c:44: cpct_drawSpriteBlended(pvmem, G_MARKERS_0_H, G_MARKERS_0_W, g_markers_0); // Faster Sprites with XOR
	ld	bc, #_g_markers_0+0
	push	bc
	ld	bc, #0x0610
	push	bc
	push	hl
	call	_cpct_drawSpriteBlended
	pop	ix
	ret
;src/sys/RenderSystem.c:54: void sys_render_update() {
;	---------------------------------
; Function sys_render_update
; ---------------------------------
_sys_render_update::
;src/sys/RenderSystem.c:57: for (i=0; i<render.players->num_players; i++){
	ld	c, #0x00
00105$:
	ld	de, (#(_render + 0x0002) + 0)
	push	de
	pop	iy
	ld	b, 64 (iy)
;src/sys/RenderSystem.c:58: if (render.players->list[i].active){
	ld	a,c
	cp	a,b
	ret	NC
	rrca
	rrca
	rrca
	and	a, #0xe0
	ld	b, a
	ld	l,b
	ld	h,#0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z,00106$
;src/sys/RenderSystem.c:59: draw_player(&render.players->list[i]);
	push	bc
	push	hl
	call	_draw_player
	pop	af
	pop	bc
00106$:
;src/sys/RenderSystem.c:57: for (i=0; i<render.players->num_players; i++){
	inc	c
	jr	00105$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
