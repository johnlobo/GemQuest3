;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module keyboard
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memcpy
	.globl _keys2VS
	.globl _keys1VS
	.globl _keysSINGLE
	.globl _initKeys
	.globl _wait4OneKey
	.globl _wait4UserKeypress
	.globl _waitKeyUp
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
;src/keyboard/keyboard.c:48: void initKeys(u8 type)
;	---------------------------------
; Function initKeys
; ---------------------------------
_initKeys::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/keyboard/keyboard.c:50: if (type == SINGLE){
	ld	a, 4 (ix)
	or	a, a
	jr	NZ,00102$
;src/keyboard/keyboard.c:51: cpct_memcpy(&keys1, &keysSINGLE, sizeof(TKeys));
	ld	hl, #0x001f
	push	hl
	ld	hl, #_keysSINGLE
	push	hl
	ld	hl, #_keys1
	push	hl
	call	_cpct_memcpy
	jr	00104$
00102$:
;src/keyboard/keyboard.c:53: cpct_memcpy(&keys1, &keys1VS, sizeof(TKeys));
	ld	hl, #0x001f
	push	hl
	ld	hl, #_keys1VS
	push	hl
	ld	hl, #_keys1
	push	hl
	call	_cpct_memcpy
;src/keyboard/keyboard.c:54: cpct_memcpy(&keys2, &keys2VS, sizeof(TKeys));
	ld	hl, #0x001f
	push	hl
	ld	hl, #_keys2VS
	push	hl
	ld	hl, #_keys2
	push	hl
	call	_cpct_memcpy
00104$:
	pop	ix
	ret
_keysSINGLE:
	.dw #0x0808
	.dw #0x2008
	.dw #0x0404
	.dw #0x0803
	.dw #0x8005
	.dw #0x4000
	.dw #0x0109
	.dw #0x0209
	.dw #0x0409
	.dw #0x0809
	.dw #0x1009
	.dw #0x2009
	.dw #0x1005
	.dw #0x0408
	.dw #0x4004
	.db #0x00	; 0
_keys1VS:
	.dw #0x0804
	.dw #0x2004
	.dw #0x2005
	.dw #0x1004
	.dw #0x0405
	.dw #0x0404
	.dw #0x0109
	.dw #0x0209
	.dw #0x0409
	.dw #0x0809
	.dw #0x1009
	.dw #0x2009
	.dw #0x1005
	.dw #0x0408
	.dw #0x4004
	.db #0x00	; 0
_keys2VS:
	.dw #0x0807
	.dw #0x1007
	.dw #0x2008
	.dw #0x2007
	.dw #0x0808
	.dw #0x0407
	.dw #0x0106
	.dw #0x0206
	.dw #0x0406
	.dw #0x0806
	.dw #0x1006
	.dw #0x2006
	.dw #0x1005
	.dw #0x0408
	.dw #0x4004
	.db #0x00	; 0
;src/keyboard/keyboard.c:67: void wait4OneKey()
;	---------------------------------
; Function wait4OneKey
; ---------------------------------
_wait4OneKey::
;src/keyboard/keyboard.c:70: while (cpct_isAnyKeyPressed());
00101$:
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00101$
;src/keyboard/keyboard.c:73: while (!cpct_isAnyKeyPressed());
00104$:
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/keyboard/keyboard.c:75: return;
	ret
;src/keyboard/keyboard.c:86: u32 wait4UserKeypress()
;	---------------------------------
; Function wait4UserKeypress
; ---------------------------------
_wait4UserKeypress::
;src/keyboard/keyboard.c:91: do
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
00101$:
;src/keyboard/keyboard.c:93: c++;                   // One more cycle
	inc	l
	jr	NZ,00115$
	inc	h
	jr	NZ,00115$
	inc	e
	jr	NZ,00115$
	inc	d
00115$:
;src/keyboard/keyboard.c:94: cpct_scanKeyboard_f(); // Scan the scan the keyboard
	push	hl
	push	de
	call	_cpct_scanKeyboard_f
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	pop	de
	pop	hl
	or	a, a
	jr	Z,00101$
;src/keyboard/keyboard.c:97: return c;
	ret
;src/keyboard/keyboard.c:108: void waitKeyUp(cpct_keyID key) 
;	---------------------------------
; Function waitKeyUp
; ---------------------------------
_waitKeyUp::
;src/keyboard/keyboard.c:111: while (cpct_isKeyPressed(key))
00101$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	Z
;src/keyboard/keyboard.c:113: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
