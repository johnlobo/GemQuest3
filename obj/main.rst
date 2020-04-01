                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _initMain
                             13 	.globl _myInterruptHandler
                             14 	.globl _man_game_render
                             15 	.globl _man_game_update
                             16 	.globl _man_game_init
                             17 	.globl _showMessage
                             18 	.globl _clearScreen
                             19 	.globl _initKeys
                             20 	.globl _cpct_restoreState_mxor_u8
                             21 	.globl _cpct_setSeed_mxor
                             22 	.globl _cpct_setPALColour
                             23 	.globl _cpct_setPalette
                             24 	.globl _cpct_setVideoMode
                             25 	.globl _cpct_setBlendMode
                             26 	.globl _cpct_scanKeyboard
                             27 	.globl _cpct_setStackLocation
                             28 	.globl _cpct_setInterruptHandler
                             29 	.globl _cpct_disableFirmware
                             30 	.globl _screenBuffer0
                             31 	.globl _keys2
                             32 	.globl _keys1
                             33 	.globl _i_time
                             34 	.globl _g_nInterrupt
                             35 	.globl _sp_palette0
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   3112                      43 _g_nInterrupt::
   3112                      44 	.ds 1
   3113                      45 _i_time::
   3113                      46 	.ds 4
                     A8DC    47 _keys1	=	0xa8dc
                     A92B    48 _keys2	=	0xa92b
                     B000    49 _screenBuffer0	=	0xb000
                             50 ;--------------------------------------------------------
                             51 ; ram data
                             52 ;--------------------------------------------------------
                             53 	.area _INITIALIZED
                             54 ;--------------------------------------------------------
                             55 ; absolute external ram data
                             56 ;--------------------------------------------------------
                             57 	.area _DABS (ABS)
                             58 ;--------------------------------------------------------
                             59 ; global & static initialisations
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _GSINIT
                             63 	.area _GSFINAL
                             64 	.area _GSINIT
                             65 ;--------------------------------------------------------
                             66 ; Home
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _HOME
                             70 ;--------------------------------------------------------
                             71 ; code
                             72 ;--------------------------------------------------------
                             73 	.area _CODE
                             74 ;src/main.c:50: cpctm_createTransparentMaskTable(g_tablatrans, 0x200, M0, 0);
                             75 ;	---------------------------------
                             76 ; Function dummy_cpct_transparentMaskTable0M0_container
                             77 ; ---------------------------------
   14A4                      78 _dummy_cpct_transparentMaskTable0M0_container::
                             79 	.area _g_tablatrans_ (ABS) 
   0200                      80 	.org 0x200 
   0200                      81 	 _g_tablatrans::
   0200 FF AA 55 00 AA AA    82 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0208 55 00 55 00 00 00    83 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0210 AA AA 00 00 AA AA    84 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0218 00 00 00 00 00 00    85 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0220 55 00 55 00 00 00    86 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0228 55 00 55 00 00 00    87 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0230 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0238 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0240 AA AA 00 00 AA AA    90 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0248 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0250 AA AA 00 00 AA AA    92 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0258 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0260 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0268 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0270 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0278 00 00 00 00 00 00    97 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0280 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0288 55 00 55 00 00 00    99 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0290 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0298 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02A0 55 00 55 00 00 00   102 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02A8 55 00 55 00 00 00   103 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02B0 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02B8 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02C0 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02C8 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02D0 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02D8 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02E0 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02E8 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02F0 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02F8 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            114 	.area _CSEG (REL, CON) 
                            115 ;src/main.c:67: void myInterruptHandler()
                            116 ;	---------------------------------
                            117 ; Function myInterruptHandler
                            118 ; ---------------------------------
   31AF                     119 _myInterruptHandler::
                            120 ;src/main.c:69: i_time++;
   31AF FD 21 13 31   [14]  121 	ld	iy, #_i_time
   31B3 FD 34 00      [23]  122 	inc	0 (iy)
   31B6 20 0D         [12]  123 	jr	NZ,00109$
   31B8 FD 34 01      [23]  124 	inc	1 (iy)
   31BB 20 08         [12]  125 	jr	NZ,00109$
   31BD FD 34 02      [23]  126 	inc	2 (iy)
   31C0 20 03         [12]  127 	jr	NZ,00109$
   31C2 FD 34 03      [23]  128 	inc	3 (iy)
   31C5                     129 00109$:
                            130 ;src/main.c:71: if (++g_nInterrupt == 6)
   31C5 FD 21 12 31   [14]  131 	ld	iy, #_g_nInterrupt
   31C9 FD 34 00      [23]  132 	inc	0 (iy)
   31CC FD 7E 00      [19]  133 	ld	a, 0 (iy)
   31CF D6 06         [ 7]  134 	sub	a, #0x06
   31D1 C0            [11]  135 	ret	NZ
                            136 ;src/main.c:73: cpct_scanKeyboard();
   31D2 CD 54 25      [17]  137 	call	_cpct_scanKeyboard
                            138 ;src/main.c:74: g_nInterrupt = 0;
   31D5 21 12 31      [10]  139 	ld	hl,#_g_nInterrupt + 0
   31D8 36 00         [10]  140 	ld	(hl), #0x00
   31DA C9            [10]  141 	ret
   31DB                     142 _sp_palette0:
   31DB 54                  143 	.db #0x54	; 84	'T'
   31DC 4D                  144 	.db #0x4d	; 77	'M'
   31DD 40                  145 	.db #0x40	; 64
   31DE 5C                  146 	.db #0x5c	; 92
   31DF 4C                  147 	.db #0x4c	; 76	'L'
   31E0 4E                  148 	.db #0x4e	; 78	'N'
   31E1 4A                  149 	.db #0x4a	; 74	'J'
   31E2 52                  150 	.db #0x52	; 82	'R'
   31E3 56                  151 	.db #0x56	; 86	'V'
   31E4 5E                  152 	.db #0x5e	; 94
   31E5 53                  153 	.db #0x53	; 83	'S'
   31E6 5F                  154 	.db #0x5f	; 95
   31E7 55                  155 	.db #0x55	; 85	'U'
   31E8 58                  156 	.db #0x58	; 88	'X'
   31E9 44                  157 	.db #0x44	; 68	'D'
   31EA 4B                  158 	.db #0x4b	; 75	'K'
                            159 ;src/main.c:78: void initMain()
                            160 ;	---------------------------------
                            161 ; Function initMain
                            162 ; ---------------------------------
   31EB                     163 _initMain::
                            164 ;src/main.c:83: cpct_setBlendMode(CPCT_BLEND_XOR);
   31EB 2E AE         [ 7]  165 	ld	l, #0xae
   31ED CD 8B 22      [17]  166 	call	_cpct_setBlendMode
                            167 ;src/main.c:84: cpct_setVideoMode(0);
   31F0 2E 00         [ 7]  168 	ld	l, #0x00
   31F2 CD D2 23      [17]  169 	call	_cpct_setVideoMode
                            170 ;src/main.c:85: cpct_setPalette(sp_palette0, 16);
   31F5 21 10 00      [10]  171 	ld	hl, #0x0010
   31F8 E5            [11]  172 	push	hl
   31F9 21 DB 31      [10]  173 	ld	hl, #_sp_palette0
   31FC E5            [11]  174 	push	hl
   31FD CD 4E 21      [17]  175 	call	_cpct_setPalette
                            176 ;src/main.c:86: cpct_setBorder(HW_BLACK);
   3200 21 10 14      [10]  177 	ld	hl, #0x1410
   3203 E5            [11]  178 	push	hl
   3204 CD 65 21      [17]  179 	call	_cpct_setPALColour
                            180 ;src/main.c:88: clearScreen(BG_COLOR);
   3207 AF            [ 4]  181 	xor	a, a
   3208 F5            [11]  182 	push	af
   3209 33            [ 6]  183 	inc	sp
   320A CD 23 16      [17]  184 	call	_clearScreen
   320D 33            [ 6]  185 	inc	sp
                            186 ;src/main.c:94: showMessage("GEMQUEST3 IS LOADED!!", MESSAGE);
   320E AF            [ 4]  187 	xor	a, a
   320F F5            [11]  188 	push	af
   3210 33            [ 6]  189 	inc	sp
   3211 21 48 32      [10]  190 	ld	hl, #___str_0
   3214 E5            [11]  191 	push	hl
   3215 CD D6 19      [17]  192 	call	_showMessage
   3218 F1            [10]  193 	pop	af
   3219 33            [ 6]  194 	inc	sp
                            195 ;src/main.c:96: seed = i_time;
   321A FD 21 13 31   [14]  196 	ld	iy, #_i_time
   321E FD 6E 00      [19]  197 	ld	l, 0 (iy)
   3221 FD 66 01      [19]  198 	ld	h, 1 (iy)
   3224 FD 5E 02      [19]  199 	ld	e, 2 (iy)
   3227 FD 56 03      [19]  200 	ld	d, 3 (iy)
                            201 ;src/main.c:98: if (!seed)
   322A 7A            [ 4]  202 	ld	a, d
   322B B3            [ 4]  203 	or	a, e
   322C B4            [ 4]  204 	or	a, h
   322D B5            [ 4]  205 	or	a,l
   322E 20 0A         [12]  206 	jr	NZ,00102$
                            207 ;src/main.c:99: seed++;
   3230 2C            [ 4]  208 	inc	l
   3231 20 07         [12]  209 	jr	NZ,00109$
   3233 24            [ 4]  210 	inc	h
   3234 20 04         [12]  211 	jr	NZ,00109$
   3236 1C            [ 4]  212 	inc	e
   3237 20 01         [12]  213 	jr	NZ,00109$
   3239 14            [ 4]  214 	inc	d
   323A                     215 00109$:
   323A                     216 00102$:
                            217 ;src/main.c:100: cpct_srand(seed);
   323A CD 3C 22      [17]  218 	call	_cpct_setSeed_mxor
   323D CD 85 22      [17]  219 	call	_cpct_restoreState_mxor_u8
                            220 ;src/main.c:103: initKeys(SINGLE); 
   3240 AF            [ 4]  221 	xor	a, a
   3241 F5            [11]  222 	push	af
   3242 33            [ 6]  223 	inc	sp
   3243 CD D8 1F      [17]  224 	call	_initKeys
   3246 33            [ 6]  225 	inc	sp
   3247 C9            [10]  226 	ret
   3248                     227 ___str_0:
   3248 47 45 4D 51 55 45   228 	.ascii "GEMQUEST3 IS LOADED!!"
        53 54 33 20 49 53
        20 4C 4F 41 44 45
        44 21 21
   325D 00                  229 	.db 0x00
                            230 ;src/main.c:106: void main(void) {
                            231 ;	---------------------------------
                            232 ; Function main
                            233 ; ---------------------------------
   325E                     234 _main::
                            235 ;src/main.c:108: cpct_setStackLocation(NEW_STACK_LOCATION);
   325E 21 00 01      [10]  236 	ld	hl, #0x0100
   3261 CD B6 22      [17]  237 	call	_cpct_setStackLocation
                            238 ;src/main.c:110: cpct_disableFirmware();
   3264 CD 12 24      [17]  239 	call	_cpct_disableFirmware
                            240 ;src/main.c:112: cpct_setInterruptHandler((void*) myInterruptHandler);
   3267 21 AF 31      [10]  241 	ld	hl, #_myInterruptHandler
   326A CD 85 25      [17]  242 	call	_cpct_setInterruptHandler
                            243 ;src/main.c:115: initMain();
   326D CD EB 31      [17]  244 	call	_initMain
                            245 ;src/main.c:116: man_game_init();
   3270 CD 07 16      [17]  246 	call	_man_game_init
                            247 ;src/main.c:119: man_game_update();
   3273 CD 1F 16      [17]  248 	call	_man_game_update
                            249 ;src/main.c:120: man_game_render();
   3276 CD 20 16      [17]  250 	call	_man_game_render
                            251 ;src/main.c:121: while (1){
   3279                     252 00102$:
   3279 18 FE         [12]  253 	jr	00102$
                            254 	.area _CODE
                            255 	.area _INITIALIZER
                            256 	.area _CABS (ABS)
