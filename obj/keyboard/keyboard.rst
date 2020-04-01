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
   1FD8                      58 _initKeys::
   1FD8 DD E5         [15]   59 	push	ix
   1FDA DD 21 00 00   [14]   60 	ld	ix,#0
   1FDE DD 39         [15]   61 	add	ix,sp
                             62 ;src/keyboard/keyboard.c:50: if (type == SINGLE){
   1FE0 DD 7E 04      [19]   63 	ld	a, 4 (ix)
   1FE3 B7            [ 4]   64 	or	a, a
   1FE4 20 11         [12]   65 	jr	NZ,00102$
                             66 ;src/keyboard/keyboard.c:51: cpct_memcpy(&keys1, &keysSINGLE, sizeof(TKeys));
   1FE6 21 1F 00      [10]   67 	ld	hl, #0x001f
   1FE9 E5            [11]   68 	push	hl
   1FEA 21 18 20      [10]   69 	ld	hl, #_keysSINGLE
   1FED E5            [11]   70 	push	hl
   1FEE 21 DC A8      [10]   71 	ld	hl, #_keys1
   1FF1 E5            [11]   72 	push	hl
   1FF2 CD E0 23      [17]   73 	call	_cpct_memcpy
   1FF5 18 1E         [12]   74 	jr	00104$
   1FF7                      75 00102$:
                             76 ;src/keyboard/keyboard.c:53: cpct_memcpy(&keys1, &keys1VS, sizeof(TKeys));
   1FF7 21 1F 00      [10]   77 	ld	hl, #0x001f
   1FFA E5            [11]   78 	push	hl
   1FFB 21 37 20      [10]   79 	ld	hl, #_keys1VS
   1FFE E5            [11]   80 	push	hl
   1FFF 21 DC A8      [10]   81 	ld	hl, #_keys1
   2002 E5            [11]   82 	push	hl
   2003 CD E0 23      [17]   83 	call	_cpct_memcpy
                             84 ;src/keyboard/keyboard.c:54: cpct_memcpy(&keys2, &keys2VS, sizeof(TKeys));
   2006 21 1F 00      [10]   85 	ld	hl, #0x001f
   2009 E5            [11]   86 	push	hl
   200A 21 56 20      [10]   87 	ld	hl, #_keys2VS
   200D E5            [11]   88 	push	hl
   200E 21 2B A9      [10]   89 	ld	hl, #_keys2
   2011 E5            [11]   90 	push	hl
   2012 CD E0 23      [17]   91 	call	_cpct_memcpy
   2015                      92 00104$:
   2015 DD E1         [14]   93 	pop	ix
   2017 C9            [10]   94 	ret
   2018                      95 _keysSINGLE:
   2018 08 08                96 	.dw #0x0808
   201A 08 20                97 	.dw #0x2008
   201C 04 04                98 	.dw #0x0404
   201E 03 08                99 	.dw #0x0803
   2020 05 80               100 	.dw #0x8005
   2022 00 40               101 	.dw #0x4000
   2024 09 01               102 	.dw #0x0109
   2026 09 02               103 	.dw #0x0209
   2028 09 04               104 	.dw #0x0409
   202A 09 08               105 	.dw #0x0809
   202C 09 10               106 	.dw #0x1009
   202E 09 20               107 	.dw #0x2009
   2030 05 10               108 	.dw #0x1005
   2032 08 04               109 	.dw #0x0408
   2034 04 40               110 	.dw #0x4004
   2036 00                  111 	.db #0x00	; 0
   2037                     112 _keys1VS:
   2037 04 08               113 	.dw #0x0804
   2039 04 20               114 	.dw #0x2004
   203B 05 20               115 	.dw #0x2005
   203D 04 10               116 	.dw #0x1004
   203F 05 04               117 	.dw #0x0405
   2041 04 04               118 	.dw #0x0404
   2043 09 01               119 	.dw #0x0109
   2045 09 02               120 	.dw #0x0209
   2047 09 04               121 	.dw #0x0409
   2049 09 08               122 	.dw #0x0809
   204B 09 10               123 	.dw #0x1009
   204D 09 20               124 	.dw #0x2009
   204F 05 10               125 	.dw #0x1005
   2051 08 04               126 	.dw #0x0408
   2053 04 40               127 	.dw #0x4004
   2055 00                  128 	.db #0x00	; 0
   2056                     129 _keys2VS:
   2056 07 08               130 	.dw #0x0807
   2058 07 10               131 	.dw #0x1007
   205A 08 20               132 	.dw #0x2008
   205C 07 20               133 	.dw #0x2007
   205E 08 08               134 	.dw #0x0808
   2060 07 04               135 	.dw #0x0407
   2062 06 01               136 	.dw #0x0106
   2064 06 02               137 	.dw #0x0206
   2066 06 04               138 	.dw #0x0406
   2068 06 08               139 	.dw #0x0806
   206A 06 10               140 	.dw #0x1006
   206C 06 20               141 	.dw #0x2006
   206E 05 10               142 	.dw #0x1005
   2070 08 04               143 	.dw #0x0408
   2072 04 40               144 	.dw #0x4004
   2074 00                  145 	.db #0x00	; 0
                            146 ;src/keyboard/keyboard.c:67: void wait4OneKey()
                            147 ;	---------------------------------
                            148 ; Function wait4OneKey
                            149 ; ---------------------------------
   2075                     150 _wait4OneKey::
                            151 ;src/keyboard/keyboard.c:70: while (cpct_isAnyKeyPressed());
   2075                     152 00101$:
   2075 CD 67 23      [17]  153 	call	_cpct_isAnyKeyPressed
   2078 7D            [ 4]  154 	ld	a, l
   2079 B7            [ 4]  155 	or	a, a
   207A 20 F9         [12]  156 	jr	NZ,00101$
                            157 ;src/keyboard/keyboard.c:73: while (!cpct_isAnyKeyPressed());
   207C                     158 00104$:
   207C CD 67 23      [17]  159 	call	_cpct_isAnyKeyPressed
   207F 7D            [ 4]  160 	ld	a, l
   2080 B7            [ 4]  161 	or	a, a
   2081 28 F9         [12]  162 	jr	Z,00104$
                            163 ;src/keyboard/keyboard.c:75: return;
   2083 C9            [10]  164 	ret
                            165 ;src/keyboard/keyboard.c:86: u32 wait4UserKeypress()
                            166 ;	---------------------------------
                            167 ; Function wait4UserKeypress
                            168 ; ---------------------------------
   2084                     169 _wait4UserKeypress::
                            170 ;src/keyboard/keyboard.c:91: do
   2084 21 00 00      [10]  171 	ld	hl,#0x0000
   2087 5D            [ 4]  172 	ld	e,l
   2088 54            [ 4]  173 	ld	d,h
   2089                     174 00101$:
                            175 ;src/keyboard/keyboard.c:93: c++;                   // One more cycle
   2089 2C            [ 4]  176 	inc	l
   208A 20 07         [12]  177 	jr	NZ,00115$
   208C 24            [ 4]  178 	inc	h
   208D 20 04         [12]  179 	jr	NZ,00115$
   208F 1C            [ 4]  180 	inc	e
   2090 20 01         [12]  181 	jr	NZ,00115$
   2092 14            [ 4]  182 	inc	d
   2093                     183 00115$:
                            184 ;src/keyboard/keyboard.c:94: cpct_scanKeyboard_f(); // Scan the scan the keyboard
   2093 E5            [11]  185 	push	hl
   2094 D5            [11]  186 	push	de
   2095 CD D8 20      [17]  187 	call	_cpct_scanKeyboard_f
   2098 CD 74 23      [17]  188 	call	_cpct_isAnyKeyPressed_f
   209B 7D            [ 4]  189 	ld	a, l
   209C D1            [10]  190 	pop	de
   209D E1            [10]  191 	pop	hl
   209E B7            [ 4]  192 	or	a, a
   209F 28 E8         [12]  193 	jr	Z,00101$
                            194 ;src/keyboard/keyboard.c:97: return c;
   20A1 C9            [10]  195 	ret
                            196 ;src/keyboard/keyboard.c:108: void waitKeyUp(cpct_keyID key) 
                            197 ;	---------------------------------
                            198 ; Function waitKeyUp
                            199 ; ---------------------------------
   20A2                     200 _waitKeyUp::
                            201 ;src/keyboard/keyboard.c:111: while (cpct_isKeyPressed(key))
   20A2                     202 00101$:
   20A2 C1            [10]  203 	pop	bc
   20A3 E1            [10]  204 	pop	hl
   20A4 E5            [11]  205 	push	hl
   20A5 C5            [11]  206 	push	bc
   20A6 CD 42 21      [17]  207 	call	_cpct_isKeyPressed
   20A9 7D            [ 4]  208 	ld	a, l
   20AA B7            [ 4]  209 	or	a, a
   20AB C8            [11]  210 	ret	Z
                            211 ;src/keyboard/keyboard.c:113: cpct_scanKeyboard_f();
   20AC CD D8 20      [17]  212 	call	_cpct_scanKeyboard_f
   20AF 18 F1         [12]  213 	jr	00101$
                            214 	.area _CODE
                            215 	.area _INITIALIZER
                            216 	.area _CABS (ABS)
