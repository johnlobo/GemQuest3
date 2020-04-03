                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
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
   190A                      58 _initKeys::
   190A DD E5         [15]   59 	push	ix
   190C DD 21 00 00   [14]   60 	ld	ix,#0
   1910 DD 39         [15]   61 	add	ix,sp
                             62 ;src/keyboard/keyboard.c:50: if (type == SINGLE){
   1912 DD 7E 04      [19]   63 	ld	a, 4 (ix)
   1915 B7            [ 4]   64 	or	a, a
   1916 20 11         [12]   65 	jr	NZ,00102$
                             66 ;src/keyboard/keyboard.c:51: cpct_memcpy(&keys1, &keysSINGLE, sizeof(TKeys));
   1918 21 1F 00      [10]   67 	ld	hl, #0x001f
   191B E5            [11]   68 	push	hl
   191C 21 4A 19      [10]   69 	ld	hl, #_keysSINGLE
   191F E5            [11]   70 	push	hl
   1920 21 DC A8      [10]   71 	ld	hl, #_keys1
   1923 E5            [11]   72 	push	hl
   1924 CD B3 25      [17]   73 	call	_cpct_memcpy
   1927 18 1E         [12]   74 	jr	00104$
   1929                      75 00102$:
                             76 ;src/keyboard/keyboard.c:53: cpct_memcpy(&keys1, &keys1VS, sizeof(TKeys));
   1929 21 1F 00      [10]   77 	ld	hl, #0x001f
   192C E5            [11]   78 	push	hl
   192D 21 69 19      [10]   79 	ld	hl, #_keys1VS
   1930 E5            [11]   80 	push	hl
   1931 21 DC A8      [10]   81 	ld	hl, #_keys1
   1934 E5            [11]   82 	push	hl
   1935 CD B3 25      [17]   83 	call	_cpct_memcpy
                             84 ;src/keyboard/keyboard.c:54: cpct_memcpy(&keys2, &keys2VS, sizeof(TKeys));
   1938 21 1F 00      [10]   85 	ld	hl, #0x001f
   193B E5            [11]   86 	push	hl
   193C 21 88 19      [10]   87 	ld	hl, #_keys2VS
   193F E5            [11]   88 	push	hl
   1940 21 2B A9      [10]   89 	ld	hl, #_keys2
   1943 E5            [11]   90 	push	hl
   1944 CD B3 25      [17]   91 	call	_cpct_memcpy
   1947                      92 00104$:
   1947 DD E1         [14]   93 	pop	ix
   1949 C9            [10]   94 	ret
   194A                      95 _keysSINGLE:
   194A 08 08                96 	.dw #0x0808
   194C 08 20                97 	.dw #0x2008
   194E 04 04                98 	.dw #0x0404
   1950 03 08                99 	.dw #0x0803
   1952 05 80               100 	.dw #0x8005
   1954 00 40               101 	.dw #0x4000
   1956 09 01               102 	.dw #0x0109
   1958 09 02               103 	.dw #0x0209
   195A 09 04               104 	.dw #0x0409
   195C 09 08               105 	.dw #0x0809
   195E 09 10               106 	.dw #0x1009
   1960 09 20               107 	.dw #0x2009
   1962 05 10               108 	.dw #0x1005
   1964 08 04               109 	.dw #0x0408
   1966 04 40               110 	.dw #0x4004
   1968 00                  111 	.db #0x00	; 0
   1969                     112 _keys1VS:
   1969 04 08               113 	.dw #0x0804
   196B 04 20               114 	.dw #0x2004
   196D 05 20               115 	.dw #0x2005
   196F 04 10               116 	.dw #0x1004
   1971 05 04               117 	.dw #0x0405
   1973 04 04               118 	.dw #0x0404
   1975 09 01               119 	.dw #0x0109
   1977 09 02               120 	.dw #0x0209
   1979 09 04               121 	.dw #0x0409
   197B 09 08               122 	.dw #0x0809
   197D 09 10               123 	.dw #0x1009
   197F 09 20               124 	.dw #0x2009
   1981 05 10               125 	.dw #0x1005
   1983 08 04               126 	.dw #0x0408
   1985 04 40               127 	.dw #0x4004
   1987 00                  128 	.db #0x00	; 0
   1988                     129 _keys2VS:
   1988 07 08               130 	.dw #0x0807
   198A 07 10               131 	.dw #0x1007
   198C 08 20               132 	.dw #0x2008
   198E 07 20               133 	.dw #0x2007
   1990 08 08               134 	.dw #0x0808
   1992 07 04               135 	.dw #0x0407
   1994 06 01               136 	.dw #0x0106
   1996 06 02               137 	.dw #0x0206
   1998 06 04               138 	.dw #0x0406
   199A 06 08               139 	.dw #0x0806
   199C 06 10               140 	.dw #0x1006
   199E 06 20               141 	.dw #0x2006
   19A0 05 10               142 	.dw #0x1005
   19A2 08 04               143 	.dw #0x0408
   19A4 04 40               144 	.dw #0x4004
   19A6 00                  145 	.db #0x00	; 0
                            146 ;src/keyboard/keyboard.c:67: void wait4OneKey()
                            147 ;	---------------------------------
                            148 ; Function wait4OneKey
                            149 ; ---------------------------------
   19A7                     150 _wait4OneKey::
                            151 ;src/keyboard/keyboard.c:70: while (cpct_isAnyKeyPressed());
   19A7                     152 00101$:
   19A7 CD 10 25      [17]  153 	call	_cpct_isAnyKeyPressed
   19AA 7D            [ 4]  154 	ld	a, l
   19AB B7            [ 4]  155 	or	a, a
   19AC 20 F9         [12]  156 	jr	NZ,00101$
                            157 ;src/keyboard/keyboard.c:73: while (!cpct_isAnyKeyPressed());
   19AE                     158 00104$:
   19AE CD 10 25      [17]  159 	call	_cpct_isAnyKeyPressed
   19B1 7D            [ 4]  160 	ld	a, l
   19B2 B7            [ 4]  161 	or	a, a
   19B3 28 F9         [12]  162 	jr	Z,00104$
                            163 ;src/keyboard/keyboard.c:75: return;
   19B5 C9            [10]  164 	ret
                            165 ;src/keyboard/keyboard.c:86: u32 wait4UserKeypress()
                            166 ;	---------------------------------
                            167 ; Function wait4UserKeypress
                            168 ; ---------------------------------
   19B6                     169 _wait4UserKeypress::
                            170 ;src/keyboard/keyboard.c:91: do
   19B6 21 00 00      [10]  171 	ld	hl,#0x0000
   19B9 5D            [ 4]  172 	ld	e,l
   19BA 54            [ 4]  173 	ld	d,h
   19BB                     174 00101$:
                            175 ;src/keyboard/keyboard.c:93: c++;                   // One more cycle
   19BB 2C            [ 4]  176 	inc	l
   19BC 20 07         [12]  177 	jr	NZ,00115$
   19BE 24            [ 4]  178 	inc	h
   19BF 20 04         [12]  179 	jr	NZ,00115$
   19C1 1C            [ 4]  180 	inc	e
   19C2 20 01         [12]  181 	jr	NZ,00115$
   19C4 14            [ 4]  182 	inc	d
   19C5                     183 00115$:
                            184 ;src/keyboard/keyboard.c:94: cpct_scanKeyboard_f(); // Scan the scan the keyboard
   19C5 E5            [11]  185 	push	hl
   19C6 D5            [11]  186 	push	de
   19C7 CD 8D 22      [17]  187 	call	_cpct_scanKeyboard_f
   19CA CD 60 25      [17]  188 	call	_cpct_isAnyKeyPressed_f
   19CD 7D            [ 4]  189 	ld	a, l
   19CE D1            [10]  190 	pop	de
   19CF E1            [10]  191 	pop	hl
   19D0 B7            [ 4]  192 	or	a, a
   19D1 28 E8         [12]  193 	jr	Z,00101$
                            194 ;src/keyboard/keyboard.c:97: return c;
   19D3 C9            [10]  195 	ret
                            196 ;src/keyboard/keyboard.c:108: void waitKeyUp(cpct_keyID key) 
                            197 ;	---------------------------------
                            198 ; Function waitKeyUp
                            199 ; ---------------------------------
   19D4                     200 _waitKeyUp::
                            201 ;src/keyboard/keyboard.c:111: while (cpct_isKeyPressed(key))
   19D4                     202 00101$:
   19D4 C1            [10]  203 	pop	bc
   19D5 E1            [10]  204 	pop	hl
   19D6 E5            [11]  205 	push	hl
   19D7 C5            [11]  206 	push	bc
   19D8 CD 81 22      [17]  207 	call	_cpct_isKeyPressed
   19DB 7D            [ 4]  208 	ld	a, l
   19DC B7            [ 4]  209 	or	a, a
   19DD C8            [11]  210 	ret	Z
                            211 ;src/keyboard/keyboard.c:113: cpct_scanKeyboard_f();
   19DE CD 8D 22      [17]  212 	call	_cpct_scanKeyboard_f
   19E1 18 F1         [12]  213 	jr	00101$
                            214 	.area _CODE
                            215 	.area _INITIALIZER
                            216 	.area _CABS (ABS)
