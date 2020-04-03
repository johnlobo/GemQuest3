;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module tools
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _resultYesNo
	.globl _resultNumber
	.globl _updateNumber
	.globl _drawText
	.globl _strLength
	.globl _wait4OneKey
	.globl _sprintf
	.globl _cpct_zx7b_decrunch_s
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM0
	.globl _cpct_getScreenToSprite
	.globl _cpct_isKeyPressed
	.globl _cpct_waitHalts
	.globl _cpct_memset
	.globl _clearScreen
	.globl _drawWindow
	.globl _showMessage
	.globl _drawCompressToScreen
	.globl _winape_breakpoint
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
;src/util/tools.c:32: void clearScreen(u8 bgColor)
;	---------------------------------
; Function clearScreen
; ---------------------------------
_clearScreen::
;src/util/tools.c:35: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(bgColor, bgColor), 0x4000);
	ld	iy, #2
	add	iy, sp
	ld	h, 0 (iy)
	ld	l, 0 (iy)
	push	hl
	call	_cpct_px2byteM0
	ld	b, l
	ld	hl, #0x4000
	push	hl
	push	bc
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
	ret
;src/util/tools.c:46: void drawWindow(u8 x, u8 y, u8 width, u8 height, u8 fgColor, u8 bgColor)
;	---------------------------------
; Function drawWindow
; ---------------------------------
_drawWindow::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/util/tools.c:51: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y);
	ld	d, 4 (ix)
	inc	d
	push	de
	ld	a, 5 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
	pop	de
;src/util/tools.c:52: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
	ld	a, 6 (ix)
	add	a, #0xfc
	ld	e, a
	push	bc
	push	de
	ld	h, 8 (ix)
	ld	l, 8 (ix)
	push	hl
	call	_cpct_px2byteM0
	ld	h, l
	pop	de
	pop	bc
	ld	l, c
	push	de
	ld	d,#0x02
	push	de
	push	hl
	inc	sp
	ld	h, b
	push	hl
	call	_cpct_drawSolidBox
	pop	de
;src/util/tools.c:53: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height);
	ld	a, 5 (ix)
	add	a, 7 (ix)
	ld	-1 (ix), a
	push	de
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
	pop	de
;src/util/tools.c:54: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
	push	bc
	push	de
	ld	h, 8 (ix)
	ld	l, 8 (ix)
	push	hl
	call	_cpct_px2byteM0
	ld	-2 (ix), l
	pop	de
	pop	bc
	push	de
	ld	d,#0x02
	push	de
	ld	a, -2 (ix)
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	de
;src/util/tools.c:56: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 2);
	ld	a, 5 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	push	de
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/util/tools.c:57: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
	push	hl
	push	de
	ld	bc, #0x0000
	push	bc
	call	_cpct_px2byteM0
	ld	c, l
	pop	de
	pop	hl
	push	de
	ld	d,#0x02
	push	de
	ld	a, c
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	de
;src/util/tools.c:58: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height - 2);
	dec	-1 (ix)
	dec	-1 (ix)
	push	de
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/util/tools.c:59: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
	push	hl
	push	de
	ld	bc, #0x0000
	push	bc
	call	_cpct_px2byteM0
	ld	c, l
	pop	de
	pop	hl
	push	de
	ld	d,#0x02
	push	de
	ld	a, c
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	de
;src/util/tools.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 4);
	ld	a, 5 (ix)
	add	a, #0x04
	ld	-3 (ix), a
	push	de
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
	pop	de
;src/util/tools.c:62: cpct_drawSolidBox(pvideo, cpct_px2byteM0(bgColor, bgColor), width - 4, height - 6);
	ld	a, 7 (ix)
	add	a, #0xfa
	ld	-4 (ix), a
	push	bc
	push	de
	ld	h, 9 (ix)
	ld	l, 9 (ix)
	push	hl
	call	_cpct_px2byteM0
	ld	a, l
	pop	de
	ld	d, a
	pop	bc
	ld	a, -4 (ix)
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
;src/util/tools.c:65: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 2);
	ld	h, -2 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:66: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
	push	hl
	ld	a, 8 (ix)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x0201
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
;src/util/tools.c:69: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 4);
	ld	h, -3 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:70: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, height - 6);
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, 8 (ix)
	push	af
	inc	sp
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	a, -4 (ix)
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
;src/util/tools.c:73: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + height - 2);
	ld	h, -1 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:74: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
	push	hl
	ld	a, 8 (ix)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x0201
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
;src/util/tools.c:76: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 2);
	ld	a, 4 (ix)
	add	a, 6 (ix)
	add	a, #0xfd
	ld	b, a
	push	bc
	ld	a, -2 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/util/tools.c:77: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
	push	hl
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	a, 8 (ix)
	push	af
	inc	sp
	call	_cpct_px2byteM0
	ld	c, l
	pop	af
	ld	b, a
	pop	hl
	push	bc
	ld	de, #0x0201
	push	de
	ld	a, c
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	bc
;src/util/tools.c:79: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 4);
	push	bc
	ld	a, -3 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	push	hl
	ld	a, 8 (ix)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_cpct_px2byteM0
	ld	c, l
	pop	de
	pop	af
	ld	b, a
	push	bc
	ld	a, -4 (ix)
	push	af
	inc	sp
	ld	b, #0x01
	push	bc
	push	de
	call	_cpct_drawSolidBox
	pop	bc
;src/util/tools.c:82: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + height - 2);
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:83: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, 8 (ix)
	push	af
	inc	sp
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x0201
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	ld	sp, ix
	pop	ix
	ret
;src/util/tools.c:94: void updateNumber(u8 number)
;	---------------------------------
; Function updateNumber
; ---------------------------------
_updateNumber::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/util/tools.c:99: pvmem = cpct_getScreenPtr(SCR_VMEM, 58, 80);
	ld	hl, #0x503a
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:100: cpct_drawSolidBox(pvmem, cpct_px2byteM0(14, 14), 8, 14);
	push	hl
	ld	hl, #0x0e0e
	push	hl
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x0e08
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
;src/util/tools.c:101: sprintf(text, "%02d", number);
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	ld	c, l
	ld	b, h
	push	hl
	push	de
	ld	de, #___str_0
	push	de
	push	bc
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	hl
;src/util/tools.c:102: drawText(text, 58, 80, COLORTXT_YELLOW, DOUBLEHEIGHT, TRANSPARENT);
	ld	bc, #0x0102
	push	bc
	ld	bc, #0x0150
	push	bc
	ld	a, #0x3a
	push	af
	inc	sp
	push	hl
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "%02d"
	.db 0x00
;src/util/tools.c:112: u8 resultNumber()
;	---------------------------------
; Function resultNumber
; ---------------------------------
_resultNumber::
;src/util/tools.c:116: selection = 1;
	ld	c, #0x01
;src/util/tools.c:117: drawText("UP/DOWN:CHANGE LEVEL", 16, 92, COLORTXT_MAUVE, NORMALHEIGHT, TRANSPARENT);
	push	bc
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x055c
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	ld	hl, #___str_1
	push	hl
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0568
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	ld	hl, #___str_2
	push	hl
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_updateNumber
	inc	sp
	pop	bc
;src/util/tools.c:120: while (1)
00117$:
;src/util/tools.c:123: cpct_waitHalts(20);
	push	bc
	ld	l, #0x14
	call	_cpct_waitHalts
	pop	bc
;src/util/tools.c:124: if ((cpct_isKeyPressed(keys1.up)) || (cpct_isKeyPressed(keys1.j_up)))
	ld	hl, (#_keys1 + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00108$
	ld	hl, (#(_keys1 + 0x000c) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00109$
00108$:
;src/util/tools.c:126: selection++;
	inc	c
;src/util/tools.c:127: if (selection > 17)
	ld	a, #0x11
	sub	a, c
	jr	NC,00102$
;src/util/tools.c:128: selection = 1;
	ld	c, #0x01
00102$:
;src/util/tools.c:129: updateNumber(selection);
	push	bc
	ld	a, c
	push	af
	inc	sp
	call	_updateNumber
	inc	sp
	pop	bc
	jr	00110$
00109$:
;src/util/tools.c:131: else if ((cpct_isKeyPressed(keys1.down)) || (cpct_isKeyPressed(keys1.j_down)))
	ld	hl, (#(_keys1 + 0x0002) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00105$
	ld	hl, (#(_keys1 + 0x000e) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00110$
00105$:
;src/util/tools.c:133: selection--;
	dec	c
;src/util/tools.c:134: if (selection < 1)
	ld	a, c
	sub	a, #0x01
	jr	NC,00104$
;src/util/tools.c:135: selection = 17;
	ld	c, #0x11
00104$:
;src/util/tools.c:136: updateNumber(selection);
	push	bc
	ld	a, c
	push	af
	inc	sp
	call	_updateNumber
	inc	sp
	pop	bc
00110$:
;src/util/tools.c:138: if ((cpct_isKeyPressed(keys1.fire1)) || (cpct_isKeyPressed(keys1.j_fire1)) || (cpct_isKeyPressed(keys1.j_fire2)))
	ld	hl, (#(_keys1 + 0x0008) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00112$
	ld	hl, (#(_keys1 + 0x0014) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00112$
	ld	hl, (#(_keys1 + 0x0016) + 0)
	push	bc
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jp	Z, 00117$
00112$:
;src/util/tools.c:140: return selection;
	ld	l, c
	ret
___str_1:
	.ascii "UP/DOWN:CHANGE LEVEL"
	.db 0x00
___str_2:
	.ascii "FIRE: CONFIRM"
	.db 0x00
;src/util/tools.c:151: u8 resultYesNo()
;	---------------------------------
; Function resultYesNo
; ---------------------------------
_resultYesNo::
;src/util/tools.c:153: drawText("(YES/NO)", 32, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
	ld	hl, #0x0101
	push	hl
	ld	l, #0x60
	push	hl
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #___str_3
	push	hl
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/util/tools.c:155: while (1)
00105$:
;src/util/tools.c:157: if ((cpct_isKeyPressed(Key_Y)) || (cpct_isKeyPressed(Key_N)))
	ld	hl, #0x0805
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00101$
	ld	hl, #0x4005
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00105$
00101$:
;src/util/tools.c:159: return (cpct_isKeyPressed(Key_Y));
	ld	hl, #0x0805
;src/util/tools.c:160: break;
	jp  _cpct_isKeyPressed
___str_3:
	.ascii "(YES/NO)"
	.db 0x00
;src/util/tools.c:171: u8 showMessage(u8 *message, u8 type)
;	---------------------------------
; Function showMessage
; ---------------------------------
_showMessage::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/util/tools.c:179: if (type == NUMBER)
	ld	a, 6 (ix)
	sub	a, #0x02
	jr	NZ,00142$
	ld	a,#0x01
	jr	00143$
00142$:
	xor	a,a
00143$:
	ld	-1 (ix), a
	or	a, a
	jr	Z,00102$
;src/util/tools.c:180: defaultMax = 56;
	ld	c, #0x38
	jr	00103$
00102$:
;src/util/tools.c:182: defaultMax = 26;
	ld	c, #0x1a
00103$:
;src/util/tools.c:184: messageLength = strLength(message);
	push	bc
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_strLength
	pop	af
	ld	e, l
	pop	bc
;src/util/tools.c:185: w = max(((messageLength * 2) + 7), defaultMax);
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	push	de
	ld	de, #0x0007
	add	hl, de
	pop	de
	ld	a, c
	ld	d, #0x00
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	P, 00115$
	ld	a, e
	add	a, a
	add	a, #0x07
	ld	c, a
00115$:
;src/util/tools.c:187: x = ((80 - w) / 2+1);
	ld	e, c
	ld	d, #0x00
	ld	a, #0x50
	sub	a, e
	ld	l, a
	ld	a, #0x00
	sbc	a, d
	ld	h, a
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00117$
	ex	de,hl
	inc	de
00117$:
	sra	d
	rr	e
	ld	b, e
	inc	b
;src/util/tools.c:191: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	push	bc
	ld	a, #0x3a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
	pop	bc
;src/util/tools.c:196: cpct_getScreenToSprite(pvmem, (u8*) &screenBuffer0, w, h);
	ld	hl, #_screenBuffer0+0
	push	bc
	push	de
	ld	b, #0x3c
	push	bc
	push	hl
	push	de
	call	_cpct_getScreenToSprite
	pop	de
	pop	bc
;src/util/tools.c:199: drawWindow(x, y, w, h - 2, 15, 14);
	push	bc
	push	de
	ld	hl, #0x0e0f
	push	hl
	ld	a, #0x3a
	push	af
	inc	sp
	ld	d, c
	ld	e,#0x3a
	push	de
	push	bc
	inc	sp
	call	_drawWindow
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/util/tools.c:200: drawText(message, x + 3, y + 12, COLORTXT_WHITE, DOUBLEHEIGHT, TRANSPARENT);
	inc	b
	inc	b
	inc	b
	push	bc
	push	de
	ld	hl, #0x0102
	push	hl
	ld	hl, #0x0046
	push	hl
	push	bc
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/util/tools.c:203: if (type == YESNO)
	ld	a, 6 (ix)
	dec	a
	jr	NZ,00111$
;src/util/tools.c:205: result = resultYesNo();
	push	bc
	push	de
	call	_resultYesNo
	pop	de
	pop	bc
	jr	00112$
00111$:
;src/util/tools.c:207: else if (type == NUMBER)
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00108$
;src/util/tools.c:209: result = resultNumber();
	push	bc
	push	de
	call	_resultNumber
	pop	de
	pop	bc
	jr	00112$
00108$:
;src/util/tools.c:210: } else if (type == TEMPORAL){
	ld	a, 6 (ix)
	sub	a, #0x03
	jr	NZ,00105$
;src/util/tools.c:211: cpct_waitHalts(100);
	push	bc
	push	de
	ld	l, #0x64
	call	_cpct_waitHalts
	pop	de
	pop	bc
;src/util/tools.c:212: result = YES;
	ld	l, #0x01
	jr	00112$
00105$:
;src/util/tools.c:216: drawText("PRESS A KEY", 29, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
	push	bc
	push	de
	ld	hl, #0x0101
	push	hl
	ld	l, #0x60
	push	hl
	ld	a, #0x1d
	push	af
	inc	sp
	ld	hl, #___str_4
	push	hl
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/util/tools.c:217: result = YES;
	ld	l, #0x01
;src/util/tools.c:218: wait4OneKey();
	push	hl
	push	bc
	push	de
	call	_wait4OneKey
	pop	de
	pop	bc
	pop	hl
00112$:
;src/util/tools.c:222: cpct_drawSprite((u8 *)0xb000, pvmem, w, h);
	push	hl
	ld	b, #0x3c
	push	bc
	push	de
	ld	bc, #0xb000
	push	bc
	call	_cpct_drawSprite
	pop	hl
;src/util/tools.c:224: return result;
	inc	sp
	pop	ix
	ret
___str_4:
	.ascii "PRESS A KEY"
	.db 0x00
;src/util/tools.c:226: void drawCompressToScreen(u8 x, u8 y, u8 w, u8 h, u16 size, u8* comp_end, u8 trans){
;	---------------------------------
; Function drawCompressToScreen
; ---------------------------------
_drawCompressToScreen::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/util/tools.c:229: pvmem = cpct_getScreenPtr(SCR_VMEM, x, y);
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	inc	sp
	inc	sp
	push	hl
;src/util/tools.c:230: cpct_zx7b_decrunch_s((u8*) &screenBuffer0 + size - 1, comp_end);
	ld	c,10 (ix)
	ld	b,11 (ix)
	ld	de, #_screenBuffer0
	ld	l,8 (ix)
	ld	h,9 (ix)
	add	hl, de
	dec	hl
	push	bc
	push	hl
	call	_cpct_zx7b_decrunch_s
;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
	pop	bc
	push	bc
;src/util/tools.c:231: if (trans)
	ld	a, 12 (ix)
	or	a, a
	jr	Z,00102$
;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
	ld	hl, #_g_tablatrans
	push	hl
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	push	bc
	ld	hl, #_screenBuffer0
	push	hl
	call	_cpct_drawSpriteMaskedAlignedTable
	jr	00104$
00102$:
;src/util/tools.c:234: cpct_drawSprite(&screenBuffer0, pvmem, w, h);
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	push	bc
	ld	hl, #_screenBuffer0
	push	hl
	call	_cpct_drawSprite
00104$:
	ld	sp, ix
	pop	ix
	ret
;src/util/tools.c:238: void winape_breakpoint(u16 error_code) __z88dk_callee __naked {
;	---------------------------------
; Function winape_breakpoint
; ---------------------------------
_winape_breakpoint::
;src/util/tools.c:241: __asm__("pop iy");  // ret address first because __z88dk_callee convention
	pop	iy
;src/util/tools.c:242: __asm__("pop hl");
	pop	hl
;src/util/tools.c:243: __asm__("push iy"); // ret address last  because __z88dk_callee convention
	push	iy
;src/util/tools.c:244: __asm__(".db 0xed, 0xff");
	.db	0xed, 0xff
;src/util/tools.c:246: __asm__("ret");
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
