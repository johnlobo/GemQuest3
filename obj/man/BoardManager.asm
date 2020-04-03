;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module BoardManager
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _man_board_render
	.globl _man_board_update
	.globl _man_board_init
	.globl _man_board_create
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteBlended
	.globl _board
	.globl _tiles
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_board::
	.ds 153
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
;src/man/BoardManager.c:18: void man_board_create(){
;	---------------------------------
; Function man_board_create
; ---------------------------------
_man_board_create::
;src/man/BoardManager.c:21: for (j=0; j<12; j++){
	ld	c, #0x00
;src/man/BoardManager.c:22: for (i=0; i<12; i++){
00109$:
	ld	l, c
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, #<(_board)
	add	a, l
	ld	e, a
	ld	a, #>(_board)
	adc	a, #0x00
	ld	d, a
	ld	b, #0x00
00103$:
;src/man/BoardManager.c:23: board.cells[j][i] = 255;
	ld	l,b
	ld	h,#0x00
	add	hl, de
	ld	(hl), #0xff
;src/man/BoardManager.c:22: for (i=0; i<12; i++){
	inc	b
	ld	a, b
	sub	a, #0x0c
	jr	C,00103$
;src/man/BoardManager.c:21: for (j=0; j<12; j++){
	inc	c
	ld	a, c
	sub	a, #0x0c
	jr	C,00109$
	ret
_tiles:
	.dw _sp_tiles_0
	.dw _sp_tiles_1
	.dw _sp_tiles_2
	.dw _sp_tiles_3
	.dw _sp_tiles_4
	.dw _sp_tiles_5
	.dw _sp_tiles_6
	.dw _sp_tiles_7
	.dw _sp_tiles_8
;src/man/BoardManager.c:34: void man_board_init(u8 x, u8 y, u8 width, u8 height){
;	---------------------------------
; Function man_board_init
; ---------------------------------
_man_board_init::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/man/BoardManager.c:37: board.width = width;
	ld	bc, #_board + 144
	ld	a, 6 (ix)
	ld	(bc), a
;src/man/BoardManager.c:38: board.height = height;
	ld	hl, #(_board + 0x0091)
	ld	a, 7 (ix)
	ld	(hl), a
;src/man/BoardManager.c:39: board.x = x;
	ld	hl, #(_board + 0x0092)
	ld	a, 4 (ix)
	ld	(hl), a
;src/man/BoardManager.c:40: board.y = y;
	ld	hl, #(_board + 0x0093)
	ld	a, 5 (ix)
	ld	(hl), a
;src/man/BoardManager.c:41: board.activeCell.active = 0;
	ld	hl, #(_board + 0x0097)
	ld	(hl), #0x00
;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
	ld	d, #0x00
00107$:
	ld	a, (bc)
	ld	e, a
	ld	a, d
	sub	a, e
	jr	NC,00109$
;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
	ld	l, d
	ld	e, l
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a, #<(_board)
	add	a, l
	ld	-2 (ix), a
	ld	a, #>(_board)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	e, #0x00
00104$:
	ld	hl, #(_board + 0x0091) + 0
	ld	l, (hl)
	ld	a, e
	sub	a, l
	jr	NC,00101$
;src/man/BoardManager.c:45: board.cells[j][i] = (cpct_rand8() % NUM_COLORS);
	ld	a, -2 (ix)
	add	a, e
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	push	bc
	push	de
	call	_cpct_getRandom_mxor_u8
	ld	h, l
	ld	a, #0x06
	push	af
	inc	sp
	push	hl
	inc	sp
	call	__moduchar
	pop	af
	ld	a, l
	pop	de
	pop	bc
	pop	hl
	push	hl
	ld	(hl), a
;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
	inc	e
	jr	00104$
00101$:
;src/man/BoardManager.c:47: board.updated = YES;
	ld	hl, #(_board + 0x0098)
	ld	(hl), #0x01
;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
	inc	d
	jr	00107$
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/man/BoardManager.c:60: void man_board_update(){
;	---------------------------------
; Function man_board_update
; ---------------------------------
_man_board_update::
;src/man/BoardManager.c:62: }
	ret
;src/man/BoardManager.c:70: void man_board_render(){
;	---------------------------------
; Function man_board_render
; ---------------------------------
_man_board_render::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/man/BoardManager.c:73: if (board.updated = YES){
	ld	bc, #_board + 152
	ld	a, #0x01
	ld	(bc), a
;src/man/BoardManager.c:74: for (j=0; j<board.height; j++){
	ld	e, #0x00
00112$:
	ld	hl, #_board + 145
	ld	d, (hl)
	ld	a, e
	sub	a, d
	jp	NC, 00105$
;src/man/BoardManager.c:75: for (i=0; i<board.width; i++){
	push	de
	ld	a, e
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, e
	pop	de
	ld	-3 (ix), a
	push	de
	ld	l, e
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	a, #<(_board)
	add	a, l
	ld	-2 (ix), a
	ld	a, #>(_board)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	d, #0x00
00109$:
	ld	hl, #_board + 144
	ld	l, (hl)
	ld	a, d
	sub	a, l
	jr	NC,00113$
;src/man/BoardManager.c:76: vmem = cpct_getScreenPtr (CPCT_VMEM_START, board.x + (i*5), board.y + (j*13));
	ld	a,(#_board + 147)
	add	a, -3 (ix)
	ld	-4 (ix), a
	ld	hl, #_board + 146
	ld	a, (hl)
	ld	-5 (ix), a
	push	de
	ld	l, d
	ld	e, l
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	ld	a, -5 (ix)
	add	a, l
	ld	-5 (ix), a
	push	bc
	push	de
	ld	h, -4 (ix)
	ld	l, -5 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
;src/man/BoardManager.c:78: if (board.cells[j][i]!=255){
	ld	a, -2 (ix)
	add	a, d
	ld	l, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	h, a
	ld	l, (hl)
;src/man/BoardManager.c:79: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
;src/man/BoardManager.c:78: if (board.cells[j][i]!=255){
	ld	a, l
	inc	a
	jr	Z,00102$
;src/man/BoardManager.c:79: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
	ld	h, #0x00
	add	hl, hl
	ld	a, #<(_tiles)
	add	a, l
	ld	l, a
	ld	a, #>(_tiles)
	adc	a, h
	ld	h, a
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	de
	push	hl
	ld	hl, #0x040c
	push	hl
	push	iy
	call	_cpct_drawSpriteBlended
	pop	de
	pop	bc
	jr	00110$
00102$:
;src/man/BoardManager.c:81: cpct_drawSolidBox (vmem, 0, SP_TILES_0_W, SP_TILES_0_H);	
	push	bc
	push	de
	ld	hl, #0x0c04
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	de
	pop	bc
00110$:
;src/man/BoardManager.c:75: for (i=0; i<board.width; i++){
	inc	d
	jp	00109$
00113$:
;src/man/BoardManager.c:74: for (j=0; j<board.height; j++){
	inc	e
	jp	00112$
00105$:
;src/man/BoardManager.c:85: board.updated = NO;
	xor	a, a
	ld	(bc), a
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
