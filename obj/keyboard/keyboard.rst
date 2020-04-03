                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module keyboard
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_isAnyKeyPressed_f
                             12 	.globl _cpct_isAnyKeyPressed
                             13 	.globl _cpct_isKeyPressed
                             14 	.globl _cpct_scanKeyboard_f
                             15 	.globl _cpct_memcpy
                             16 	.globl _keys2VS
                             17 	.globl _keys1VS
                             18 	.globl _keysSINGLE
                             19 	.globl _initKeys
                             20 	.globl _wait4OneKey
                             21 	.globl _wait4UserKeypress
                             22 	.globl _waitKeyUp
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/keyboard/keyboard.c:48: void initKeys(u8 type)
                             55 ;	---------------------------------
                             56 ; Function initKeys
                             57 ; ---------------------------------
   22BD                      58 _initKeys::
   22BD DD E5         [15]   59 	push	ix
   22BF DD 21 00 00   [14]   60 	ld	ix,#0
   22C3 DD 39         [15]   61 	add	ix,sp
                             62 ;src/keyboard/keyboard.c:50: if (type == SINGLE){
   22C5 DD 7E 04      [19]   63 	ld	a, 4 (ix)
   22C8 B7            [ 4]   64 	or	a, a
   22C9 20 11         [12]   65 	jr	NZ,00102$
                             66 ;src/keyboard/keyboard.c:51: cpct_memcpy(&keys1, &keysSINGLE, sizeof(TKeys));
   22CB 21 1F 00      [10]   67 	ld	hl, #0x001f
   22CE E5            [11]   68 	push	hl
   22CF 21 FD 22      [10]   69 	ld	hl, #_keysSINGLE
   22D2 E5            [11]   70 	push	hl
   22D3 21 DC A8      [10]   71 	ld	hl, #_keys1
   22D6 E5            [11]   72 	push	hl
   22D7 CD C5 26      [17]   73 	call	_cpct_memcpy
   22DA 18 1E         [12]   74 	jr	00104$
   22DC                      75 00102$:
                             76 ;src/keyboard/keyboard.c:53: cpct_memcpy(&keys1, &keys1VS, sizeof(TKeys));
   22DC 21 1F 00      [10]   77 	ld	hl, #0x001f
   22DF E5            [11]   78 	push	hl
   22E0 21 1C 23      [10]   79 	ld	hl, #_keys1VS
   22E3 E5            [11]   80 	push	hl
   22E4 21 DC A8      [10]   81 	ld	hl, #_keys1
   22E7 E5            [11]   82 	push	hl
   22E8 CD C5 26      [17]   83 	call	_cpct_memcpy
                             84 ;src/keyboard/keyboard.c:54: cpct_memcpy(&keys2, &keys2VS, sizeof(TKeys));
   22EB 21 1F 00      [10]   85 	ld	hl, #0x001f
   22EE E5            [11]   86 	push	hl
   22EF 21 3B 23      [10]   87 	ld	hl, #_keys2VS
   22F2 E5            [11]   88 	push	hl
   22F3 21 2B A9      [10]   89 	ld	hl, #_keys2
   22F6 E5            [11]   90 	push	hl
   22F7 CD C5 26      [17]   91 	call	_cpct_memcpy
   22FA                      92 00104$:
   22FA DD E1         [14]   93 	pop	ix
   22FC C9            [10]   94 	ret
   22FD                      95 _keysSINGLE:
   22FD 08 08                96 	.dw #0x0808
   22FF 08 20                97 	.dw #0x2008
   2301 04 04                98 	.dw #0x0404
   2303 03 08                99 	.dw #0x0803
   2305 05 80               100 	.dw #0x8005
   2307 00 40               101 	.dw #0x4000
   2309 09 01               102 	.dw #0x0109
   230B 09 02               103 	.dw #0x0209
   230D 09 04               104 	.dw #0x0409
   230F 09 08               105 	.dw #0x0809
   2311 09 10               106 	.dw #0x1009
   2313 09 20               107 	.dw #0x2009
   2315 05 10               108 	.dw #0x1005
   2317 08 04               109 	.dw #0x0408
   2319 04 40               110 	.dw #0x4004
   231B 00                  111 	.db #0x00	; 0
   231C                     112 _keys1VS:
   231C 04 08               113 	.dw #0x0804
   231E 04 20               114 	.dw #0x2004
   2320 05 20               115 	.dw #0x2005
   2322 04 10               116 	.dw #0x1004
   2324 05 04               117 	.dw #0x0405
   2326 04 04               118 	.dw #0x0404
   2328 09 01               119 	.dw #0x0109
   232A 09 02               120 	.dw #0x0209
   232C 09 04               121 	.dw #0x0409
   232E 09 08               122 	.dw #0x0809
   2330 09 10               123 	.dw #0x1009
   2332 09 20               124 	.dw #0x2009
   2334 05 10               125 	.dw #0x1005
   2336 08 04               126 	.dw #0x0408
   2338 04 40               127 	.dw #0x4004
   233A 00                  128 	.db #0x00	; 0
   233B                     129 _keys2VS:
   233B 07 08               130 	.dw #0x0807
   233D 07 10               131 	.dw #0x1007
   233F 08 20               132 	.dw #0x2008
   2341 07 20               133 	.dw #0x2007
   2343 08 08               134 	.dw #0x0808
   2345 07 04               135 	.dw #0x0407
   2347 06 01               136 	.dw #0x0106
   2349 06 02               137 	.dw #0x0206
   234B 06 04               138 	.dw #0x0406
   234D 06 08               139 	.dw #0x0806
   234F 06 10               140 	.dw #0x1006
   2351 06 20               141 	.dw #0x2006
   2353 05 10               142 	.dw #0x1005
   2355 08 04               143 	.dw #0x0408
   2357 04 40               144 	.dw #0x4004
   2359 00                  145 	.db #0x00	; 0
                            146 ;src/keyboard/keyboard.c:67: void wait4OneKey()
                            147 ;	---------------------------------
                            148 ; Function wait4OneKey
                            149 ; ---------------------------------
   235A                     150 _wait4OneKey::
                            151 ;src/keyboard/keyboard.c:70: while (cpct_isAnyKeyPressed());
   235A                     152 00101$:
   235A CD 4C 26      [17]  153 	call	_cpct_isAnyKeyPressed
   235D 7D            [ 4]  154 	ld	a, l
   235E B7            [ 4]  155 	or	a, a
   235F 20 F9         [12]  156 	jr	NZ,00101$
                            157 ;src/keyboard/keyboard.c:73: while (!cpct_isAnyKeyPressed());
   2361                     158 00104$:
   2361 CD 4C 26      [17]  159 	call	_cpct_isAnyKeyPressed
   2364 7D            [ 4]  160 	ld	a, l
   2365 B7            [ 4]  161 	or	a, a
   2366 28 F9         [12]  162 	jr	Z,00104$
                            163 ;src/keyboard/keyboard.c:75: return;
   2368 C9            [10]  164 	ret
                            165 ;src/keyboard/keyboard.c:86: u32 wait4UserKeypress()
                            166 ;	---------------------------------
                            167 ; Function wait4UserKeypress
                            168 ; ---------------------------------
   2369                     169 _wait4UserKeypress::
                            170 ;src/keyboard/keyboard.c:91: do
   2369 21 00 00      [10]  171 	ld	hl,#0x0000
   236C 5D            [ 4]  172 	ld	e,l
   236D 54            [ 4]  173 	ld	d,h
   236E                     174 00101$:
                            175 ;src/keyboard/keyboard.c:93: c++;                   // One more cycle
   236E 2C            [ 4]  176 	inc	l
   236F 20 07         [12]  177 	jr	NZ,00115$
   2371 24            [ 4]  178 	inc	h
   2372 20 04         [12]  179 	jr	NZ,00115$
   2374 1C            [ 4]  180 	inc	e
   2375 20 01         [12]  181 	jr	NZ,00115$
   2377 14            [ 4]  182 	inc	d
   2378                     183 00115$:
                            184 ;src/keyboard/keyboard.c:94: cpct_scanKeyboard_f(); // Scan the scan the keyboard
   2378 E5            [11]  185 	push	hl
   2379 D5            [11]  186 	push	de
   237A CD BD 23      [17]  187 	call	_cpct_scanKeyboard_f
   237D CD 59 26      [17]  188 	call	_cpct_isAnyKeyPressed_f
   2380 7D            [ 4]  189 	ld	a, l
   2381 D1            [10]  190 	pop	de
   2382 E1            [10]  191 	pop	hl
   2383 B7            [ 4]  192 	or	a, a
   2384 28 E8         [12]  193 	jr	Z,00101$
                            194 ;src/keyboard/keyboard.c:97: return c;
   2386 C9            [10]  195 	ret
                            196 ;src/keyboard/keyboard.c:108: void waitKeyUp(cpct_keyID key) 
                            197 ;	---------------------------------
                            198 ; Function waitKeyUp
                            199 ; ---------------------------------
   2387                     200 _waitKeyUp::
                            201 ;src/keyboard/keyboard.c:111: while (cpct_isKeyPressed(key))
   2387                     202 00101$:
   2387 C1            [10]  203 	pop	bc
   2388 E1            [10]  204 	pop	hl
   2389 E5            [11]  205 	push	hl
   238A C5            [11]  206 	push	bc
   238B CD 27 24      [17]  207 	call	_cpct_isKeyPressed
   238E 7D            [ 4]  208 	ld	a, l
   238F B7            [ 4]  209 	or	a, a
   2390 C8            [11]  210 	ret	Z
                            211 ;src/keyboard/keyboard.c:113: cpct_scanKeyboard_f();
   2391 CD BD 23      [17]  212 	call	_cpct_scanKeyboard_f
   2394 18 F1         [12]  213 	jr	00101$
                            214 	.area _CODE
                            215 	.area _INITIALIZER
                            216 	.area _CABS (ABS)
