                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module text
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawSpriteMaskedAlignedTable
                             13 	.globl _cpct_drawSprite
                             14 	.globl _swapColors
                             15 	.globl _strLength
                             16 	.globl _strCopy
                             17 	.globl _drawText
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/text/text.c:57: u8 strLength(u8 str[]) {
                             50 ;	---------------------------------
                             51 ; Function strLength
                             52 ; ---------------------------------
   14A4                      53 _strLength::
                             54 ;src/text/text.c:61: while (str[result] != '\0') {
   14A4 0E 00         [ 7]   55 	ld	c, #0x00
   14A6                      56 00101$:
   14A6 21 02 00      [10]   57 	ld	hl, #2
   14A9 39            [11]   58 	add	hl, sp
   14AA 7E            [ 7]   59 	ld	a, (hl)
   14AB 23            [ 6]   60 	inc	hl
   14AC 66            [ 7]   61 	ld	h, (hl)
   14AD 6F            [ 4]   62 	ld	l, a
   14AE 06 00         [ 7]   63 	ld	b, #0x00
   14B0 09            [11]   64 	add	hl, bc
   14B1 7E            [ 7]   65 	ld	a, (hl)
   14B2 B7            [ 4]   66 	or	a, a
   14B3 28 03         [12]   67 	jr	Z,00103$
                             68 ;src/text/text.c:62: result++;
   14B5 0C            [ 4]   69 	inc	c
   14B6 18 EE         [12]   70 	jr	00101$
   14B8                      71 00103$:
                             72 ;src/text/text.c:64: return result;
   14B8 69            [ 4]   73 	ld	l, c
   14B9 C9            [10]   74 	ret
   14BA                      75 _swapColors:
   14BA 55                   76 	.db #0x55	; 85	'U'
   14BB EE                   77 	.db #0xee	; 238
   14BC DD                   78 	.db #0xdd	; 221
   14BD FF                   79 	.db #0xff	; 255
   14BE 14                   80 	.db #0x14	; 20
   14BF 6C                   81 	.db #0x6c	; 108	'l'
   14C0 9C                   82 	.db #0x9c	; 156
   14C1 3C                   83 	.db #0x3c	; 60
   14C2 50                   84 	.db #0x50	; 80	'P'
   14C3 E4                   85 	.db #0xe4	; 228
   14C4 D8                   86 	.db #0xd8	; 216
   14C5 F0                   87 	.db #0xf0	; 240
   14C6 11                   88 	.db #0x11	; 17
   14C7 66                   89 	.db #0x66	; 102	'f'
   14C8 99                   90 	.db #0x99	; 153
   14C9 33                   91 	.db #0x33	; 51	'3'
   14CA 10                   92 	.db #0x10	; 16
   14CB 35                   93 	.db #0x35	; 53	'5'
   14CC 3A                   94 	.db #0x3a	; 58
   14CD 30                   95 	.db #0x30	; 48	'0'
   14CE 45                   96 	.db #0x45	; 69	'E'
   14CF CE                   97 	.db #0xce	; 206
   14D0 CD                   98 	.db #0xcd	; 205
   14D1 CF                   99 	.db #0xcf	; 207
                            100 ;src/text/text.c:78: void strCopy(u8 source[], u8 dest[]) 
                            101 ;	---------------------------------
                            102 ; Function strCopy
                            103 ; ---------------------------------
   14D2                     104 _strCopy::
   14D2 DD E5         [15]  105 	push	ix
   14D4 DD 21 00 00   [14]  106 	ld	ix,#0
   14D8 DD 39         [15]  107 	add	ix,sp
                            108 ;src/text/text.c:81: while ((dest[i] = source[i]) != '\0')
   14DA 0E 00         [ 7]  109 	ld	c, #0x00
   14DC                     110 00101$:
   14DC DD 7E 06      [19]  111 	ld	a, 6 (ix)
   14DF 81            [ 4]  112 	add	a, c
   14E0 5F            [ 4]  113 	ld	e, a
   14E1 DD 7E 07      [19]  114 	ld	a, 7 (ix)
   14E4 CE 00         [ 7]  115 	adc	a, #0x00
   14E6 57            [ 4]  116 	ld	d, a
   14E7 DD 6E 04      [19]  117 	ld	l,4 (ix)
   14EA DD 66 05      [19]  118 	ld	h,5 (ix)
   14ED 06 00         [ 7]  119 	ld	b, #0x00
   14EF 09            [11]  120 	add	hl, bc
   14F0 7E            [ 7]  121 	ld	a, (hl)
   14F1 12            [ 7]  122 	ld	(de), a
   14F2 B7            [ 4]  123 	or	a, a
   14F3 28 03         [12]  124 	jr	Z,00104$
                            125 ;src/text/text.c:83: i++;
   14F5 0C            [ 4]  126 	inc	c
   14F6 18 E4         [12]  127 	jr	00101$
   14F8                     128 00104$:
   14F8 DD E1         [14]  129 	pop	ix
   14FA C9            [10]  130 	ret
                            131 ;src/text/text.c:88: void drawText(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
                            132 ;	---------------------------------
                            133 ; Function drawText
                            134 ; ---------------------------------
   14FB                     135 _drawText::
   14FB DD E5         [15]  136 	push	ix
   14FD DD 21 00 00   [14]  137 	ld	ix,#0
   1501 DD 39         [15]  138 	add	ix,sp
   1503 21 AD FF      [10]  139 	ld	hl, #-83
   1506 39            [11]  140 	add	hl, sp
   1507 F9            [ 6]  141 	ld	sp, hl
                            142 ;src/text/text.c:100: color1 = swapColors[color][0];
   1508 01 BA 14      [10]  143 	ld	bc, #_swapColors+0
   150B DD 6E 08      [19]  144 	ld	l, 8 (ix)
   150E 26 00         [ 7]  145 	ld	h, #0x00
   1510 29            [11]  146 	add	hl, hl
   1511 29            [11]  147 	add	hl, hl
   1512 09            [11]  148 	add	hl, bc
   1513 E5            [11]  149 	push	hl
   1514 FD E1         [14]  150 	pop	iy
   1516 FD 7E 00      [19]  151 	ld	a, 0 (iy)
   1519 DD 77 D5      [19]  152 	ld	-43 (ix), a
                            153 ;src/text/text.c:101: color2 = swapColors[color][1];
   151C FD E5         [15]  154 	push	iy
   151E E1            [10]  155 	pop	hl
   151F 23            [ 6]  156 	inc	hl
   1520 7E            [ 7]  157 	ld	a, (hl)
   1521 DD 77 D4      [19]  158 	ld	-44 (ix), a
                            159 ;src/text/text.c:102: color3 = swapColors[color][2];
   1524 FD E5         [15]  160 	push	iy
   1526 E1            [10]  161 	pop	hl
   1527 23            [ 6]  162 	inc	hl
   1528 23            [ 6]  163 	inc	hl
   1529 7E            [ 7]  164 	ld	a, (hl)
   152A DD 77 D3      [19]  165 	ld	-45 (ix), a
                            166 ;src/text/text.c:103: color4 = swapColors[color][3];
   152D FD 7E 03      [19]  167 	ld	a, 3 (iy)
   1530 DD 77 D2      [19]  168 	ld	-46 (ix), a
                            169 ;src/text/text.c:108: character = text[x];
   1533 DD 7E 04      [19]  170 	ld	a, 4 (ix)
   1536 DD 77 DC      [19]  171 	ld	-36 (ix), a
   1539 DD 7E 05      [19]  172 	ld	a, 5 (ix)
   153C DD 77 DD      [19]  173 	ld	-35 (ix), a
   153F DD 6E DC      [19]  174 	ld	l,-36 (ix)
   1542 DD 66 DD      [19]  175 	ld	h,-35 (ix)
   1545 7E            [ 7]  176 	ld	a, (hl)
   1546 DD 77 FD      [19]  177 	ld	-3 (ix), a
                            178 ;src/text/text.c:110: while (character != '\0') {
   1549 21 01 00      [10]  179 	ld	hl, #0x0001
   154C 39            [11]  180 	add	hl, sp
   154D DD 75 E1      [19]  181 	ld	-31 (ix), l
   1550 DD 74 E2      [19]  182 	ld	-30 (ix), h
   1553 DD 7E E1      [19]  183 	ld	a, -31 (ix)
   1556 DD 77 DA      [19]  184 	ld	-38 (ix), a
   1559 DD 7E E2      [19]  185 	ld	a, -30 (ix)
   155C DD 77 DB      [19]  186 	ld	-37 (ix), a
   155F DD 7E E1      [19]  187 	ld	a, -31 (ix)
   1562 DD 77 F9      [19]  188 	ld	-7 (ix), a
   1565 DD 7E E2      [19]  189 	ld	a, -30 (ix)
   1568 DD 77 FA      [19]  190 	ld	-6 (ix), a
   156B DD 7E E1      [19]  191 	ld	a, -31 (ix)
   156E DD 77 E3      [19]  192 	ld	-29 (ix), a
   1571 DD 7E E2      [19]  193 	ld	a, -30 (ix)
   1574 DD 77 E4      [19]  194 	ld	-28 (ix), a
   1577 DD 7E E1      [19]  195 	ld	a, -31 (ix)
   157A DD 77 E9      [19]  196 	ld	-23 (ix), a
   157D DD 7E E2      [19]  197 	ld	a, -30 (ix)
   1580 DD 77 EA      [19]  198 	ld	-22 (ix), a
   1583 DD 7E E1      [19]  199 	ld	a, -31 (ix)
   1586 DD 77 F3      [19]  200 	ld	-13 (ix), a
   1589 DD 7E E2      [19]  201 	ld	a, -30 (ix)
   158C DD 77 F4      [19]  202 	ld	-12 (ix), a
   158F DD 7E E1      [19]  203 	ld	a, -31 (ix)
   1592 DD 77 FB      [19]  204 	ld	-5 (ix), a
   1595 DD 7E E2      [19]  205 	ld	a, -30 (ix)
   1598 DD 77 FC      [19]  206 	ld	-4 (ix), a
   159B DD 7E E1      [19]  207 	ld	a, -31 (ix)
   159E DD 77 E5      [19]  208 	ld	-27 (ix), a
   15A1 DD 7E E2      [19]  209 	ld	a, -30 (ix)
   15A4 DD 77 E6      [19]  210 	ld	-26 (ix), a
   15A7 DD 7E E1      [19]  211 	ld	a, -31 (ix)
   15AA DD 77 EE      [19]  212 	ld	-18 (ix), a
   15AD DD 7E E2      [19]  213 	ld	a, -30 (ix)
   15B0 DD 77 EF      [19]  214 	ld	-17 (ix), a
   15B3 DD 7E E1      [19]  215 	ld	a, -31 (ix)
   15B6 DD 77 E7      [19]  216 	ld	-25 (ix), a
   15B9 DD 7E E2      [19]  217 	ld	a, -30 (ix)
   15BC DD 77 E8      [19]  218 	ld	-24 (ix), a
   15BF DD 7E 09      [19]  219 	ld	a, 9 (ix)
   15C2 3D            [ 4]  220 	dec	a
   15C3 20 04         [12]  221 	jr	NZ,00304$
   15C5 3E 01         [ 7]  222 	ld	a,#0x01
   15C7 18 01         [12]  223 	jr	00305$
   15C9                     224 00304$:
   15C9 AF            [ 4]  225 	xor	a,a
   15CA                     226 00305$:
   15CA DD 77 E0      [19]  227 	ld	-32 (ix), a
   15CD DD 7E 09      [19]  228 	ld	a, 9 (ix)
   15D0 4F            [ 4]  229 	ld	c, a
   15D1 87            [ 4]  230 	add	a, a
   15D2 87            [ 4]  231 	add	a, a
   15D3 87            [ 4]  232 	add	a, a
   15D4 81            [ 4]  233 	add	a, c
   15D5 DD 77 F2      [19]  234 	ld	-14 (ix), a
   15D8 DD 7E E1      [19]  235 	ld	a, -31 (ix)
   15DB DD 77 F0      [19]  236 	ld	-16 (ix), a
   15DE DD 7E E2      [19]  237 	ld	a, -30 (ix)
   15E1 DD 77 F1      [19]  238 	ld	-15 (ix), a
   15E4 DD 7E F2      [19]  239 	ld	a, -14 (ix)
   15E7 DD 77 ED      [19]  240 	ld	-19 (ix), a
   15EA DD 7E E1      [19]  241 	ld	a, -31 (ix)
   15ED DD 77 EB      [19]  242 	ld	-21 (ix), a
   15F0 DD 7E E2      [19]  243 	ld	a, -30 (ix)
   15F3 DD 77 EC      [19]  244 	ld	-20 (ix), a
   15F6 DD 36 D7 00   [19]  245 	ld	-41 (ix), #0x00
   15FA                     246 00159$:
   15FA DD 7E FD      [19]  247 	ld	a, -3 (ix)
   15FD B7            [ 4]  248 	or	a, a
   15FE CA 05 19      [10]  249 	jp	Z, 00164$
                            250 ;src/text/text.c:113: if ((character == 33) || ((character>43) && (character<47)) || 
   1601 DD 7E FD      [19]  251 	ld	a, -3 (ix)
   1604 D6 21         [ 7]  252 	sub	a, #0x21
   1606 20 04         [12]  253 	jr	NZ,00306$
   1608 3E 01         [ 7]  254 	ld	a,#0x01
   160A 18 01         [12]  255 	jr	00307$
   160C                     256 00306$:
   160C AF            [ 4]  257 	xor	a,a
   160D                     258 00307$:
   160D 4F            [ 4]  259 	ld	c,a
   160E B7            [ 4]  260 	or	a, a
   160F 20 2C         [12]  261 	jr	NZ,00151$
   1611 3E 2B         [ 7]  262 	ld	a, #0x2b
   1613 DD 96 FD      [19]  263 	sub	a, -3 (ix)
   1616 30 07         [12]  264 	jr	NC,00156$
   1618 DD 7E FD      [19]  265 	ld	a, -3 (ix)
   161B D6 2F         [ 7]  266 	sub	a, #0x2f
   161D 38 1E         [12]  267 	jr	C,00151$
   161F                     268 00156$:
                            269 ;src/text/text.c:114: ((character>47) && (character<58)) || ((character>62) && (character<91))) { //Allowed characters
   161F 3E 2F         [ 7]  270 	ld	a, #0x2f
   1621 DD 96 FD      [19]  271 	sub	a, -3 (ix)
   1624 30 07         [12]  272 	jr	NC,00158$
   1626 DD 7E FD      [19]  273 	ld	a, -3 (ix)
   1629 D6 3A         [ 7]  274 	sub	a, #0x3a
   162B 38 10         [12]  275 	jr	C,00151$
   162D                     276 00158$:
   162D 3E 3E         [ 7]  277 	ld	a, #0x3e
   162F DD 96 FD      [19]  278 	sub	a, -3 (ix)
   1632 D2 E8 18      [10]  279 	jp	NC, 00152$
   1635 DD 7E FD      [19]  280 	ld	a, -3 (ix)
   1638 D6 5B         [ 7]  281 	sub	a, #0x5b
   163A D2 E8 18      [10]  282 	jp	NC, 00152$
   163D                     283 00151$:
                            284 ;src/text/text.c:118: switch(character){
   163D 79            [ 4]  285 	ld	a, c
   163E B7            [ 4]  286 	or	a, a
   163F 20 5D         [12]  287 	jr	NZ,00101$
   1641 DD 7E FD      [19]  288 	ld	a, -3 (ix)
   1644 D6 2C         [ 7]  289 	sub	a, #0x2c
   1646 28 5C         [12]  290 	jr	Z,00104$
   1648 DD 7E FD      [19]  291 	ld	a, -3 (ix)
   164B D6 2D         [ 7]  292 	sub	a, #0x2d
   164D 28 55         [12]  293 	jr	Z,00104$
   164F DD 7E FD      [19]  294 	ld	a, -3 (ix)
   1652 D6 2E         [ 7]  295 	sub	a, #0x2e
   1654 28 4E         [12]  296 	jr	Z,00104$
   1656 DD 7E FD      [19]  297 	ld	a, -3 (ix)
   1659 D6 30         [ 7]  298 	sub	a, #0x30
   165B 28 51         [12]  299 	jr	Z,00114$
   165D DD 7E FD      [19]  300 	ld	a, -3 (ix)
   1660 D6 31         [ 7]  301 	sub	a, #0x31
   1662 28 4A         [12]  302 	jr	Z,00114$
   1664 DD 7E FD      [19]  303 	ld	a, -3 (ix)
   1667 D6 32         [ 7]  304 	sub	a, #0x32
   1669 28 43         [12]  305 	jr	Z,00114$
   166B DD 7E FD      [19]  306 	ld	a, -3 (ix)
   166E D6 33         [ 7]  307 	sub	a, #0x33
   1670 28 3C         [12]  308 	jr	Z,00114$
   1672 DD 7E FD      [19]  309 	ld	a, -3 (ix)
   1675 D6 34         [ 7]  310 	sub	a, #0x34
   1677 28 35         [12]  311 	jr	Z,00114$
   1679 DD 7E FD      [19]  312 	ld	a, -3 (ix)
   167C D6 35         [ 7]  313 	sub	a, #0x35
   167E 28 2E         [12]  314 	jr	Z,00114$
   1680 DD 7E FD      [19]  315 	ld	a, -3 (ix)
   1683 D6 36         [ 7]  316 	sub	a, #0x36
   1685 28 27         [12]  317 	jr	Z,00114$
   1687 DD 7E FD      [19]  318 	ld	a, -3 (ix)
   168A D6 37         [ 7]  319 	sub	a, #0x37
   168C 28 20         [12]  320 	jr	Z,00114$
   168E DD 7E FD      [19]  321 	ld	a, -3 (ix)
   1691 D6 38         [ 7]  322 	sub	a, #0x38
   1693 28 19         [12]  323 	jr	Z,00114$
   1695 DD 7E FD      [19]  324 	ld	a, -3 (ix)
   1698 D6 39         [ 7]  325 	sub	a, #0x39
   169A 28 12         [12]  326 	jr	Z,00114$
   169C 18 18         [12]  327 	jr	00115$
                            328 ;src/text/text.c:120: case 33:
   169E                     329 00101$:
                            330 ;src/text/text.c:121: character=49;
   169E DD 36 FD 31   [19]  331 	ld	-3 (ix), #0x31
                            332 ;src/text/text.c:122: break;
   16A2 18 12         [12]  333 	jr	00115$
                            334 ;src/text/text.c:127: case 46:
   16A4                     335 00104$:
                            336 ;src/text/text.c:128: character+=6;
   16A4 DD 7E FD      [19]  337 	ld	a, -3 (ix)
   16A7 C6 06         [ 7]  338 	add	a, #0x06
   16A9 DD 77 FD      [19]  339 	ld	-3 (ix), a
                            340 ;src/text/text.c:129: break;
   16AC 18 08         [12]  341 	jr	00115$
                            342 ;src/text/text.c:141: case 57:
   16AE                     343 00114$:
                            344 ;src/text/text.c:142: character+=5;
   16AE DD 7E FD      [19]  345 	ld	a, -3 (ix)
   16B1 C6 05         [ 7]  346 	add	a, #0x05
   16B3 DD 77 FD      [19]  347 	ld	-3 (ix), a
                            348 ;src/text/text.c:144: }
   16B6                     349 00115$:
                            350 ;src/text/text.c:147: character-=49;
   16B6 DD 7E FD      [19]  351 	ld	a, -3 (ix)
   16B9 C6 CF         [ 7]  352 	add	a, #0xcf
                            353 ;src/text/text.c:150: for(i=0;i<18;i++){
   16BB DD 77 AD      [19]  354 	ld	-83 (ix), a
   16BE 4F            [ 4]  355 	ld	c, a
   16BF 06 00         [ 7]  356 	ld	b,#0x00
   16C1 69            [ 4]  357 	ld	l, c
   16C2 60            [ 4]  358 	ld	h, b
   16C3 29            [11]  359 	add	hl, hl
   16C4 29            [11]  360 	add	hl, hl
   16C5 29            [11]  361 	add	hl, hl
   16C6 09            [11]  362 	add	hl, bc
   16C7 29            [11]  363 	add	hl, hl
   16C8 4D            [ 4]  364 	ld	c, l
   16C9 44            [ 4]  365 	ld	b, h
   16CA DD 36 D6 00   [19]  366 	ld	-42 (ix), #0x00
   16CE                     367 00162$:
                            368 ;src/text/text.c:151: pChar = (u8*) g_font_chars + (character*18) + i;
   16CE 21 00 10      [10]  369 	ld	hl, #_g_font_chars
   16D1 09            [11]  370 	add	hl, bc
   16D2 DD 5E D6      [19]  371 	ld	e,-42 (ix)
   16D5 16 00         [ 7]  372 	ld	d,#0x00
   16D7 19            [11]  373 	add	hl, de
                            374 ;src/text/text.c:155: if(*pChar == 0x55) colorchar[i]=color1;
   16D8 DD 75 D8      [19]  375 	ld	-40 (ix), l
   16DB DD 74 D9      [19]  376 	ld	-39 (ix), h
   16DE 5E            [ 7]  377 	ld	e, (hl)
   16DF 7B            [ 4]  378 	ld	a, e
   16E0 D6 55         [ 7]  379 	sub	a, #0x55
   16E2 20 04         [12]  380 	jr	NZ,00321$
   16E4 3E 01         [ 7]  381 	ld	a,#0x01
   16E6 18 01         [12]  382 	jr	00322$
   16E8                     383 00321$:
   16E8 AF            [ 4]  384 	xor	a,a
   16E9                     385 00322$:
   16E9 DD 77 DF      [19]  386 	ld	-33 (ix), a
                            387 ;src/text/text.c:156: else if(*pChar == 0xee) colorchar[i]=color2;
   16EC 7B            [ 4]  388 	ld	a, e
   16ED D6 EE         [ 7]  389 	sub	a, #0xee
   16EF 20 04         [12]  390 	jr	NZ,00323$
   16F1 3E 01         [ 7]  391 	ld	a,#0x01
   16F3 18 01         [12]  392 	jr	00324$
   16F5                     393 00323$:
   16F5 AF            [ 4]  394 	xor	a,a
   16F6                     395 00324$:
   16F6 DD 77 DE      [19]  396 	ld	-34 (ix), a
                            397 ;src/text/text.c:157: else if(*pChar == 0xdd) colorchar[i]=color3;
   16F9 7B            [ 4]  398 	ld	a, e
   16FA D6 DD         [ 7]  399 	sub	a, #0xdd
   16FC 20 04         [12]  400 	jr	NZ,00325$
   16FE 3E 01         [ 7]  401 	ld	a,#0x01
   1700 18 01         [12]  402 	jr	00326$
   1702                     403 00325$:
   1702 AF            [ 4]  404 	xor	a,a
   1703                     405 00326$:
   1703 DD 77 FF      [19]  406 	ld	-1 (ix), a
                            407 ;src/text/text.c:158: else if(*pChar == 0xff) colorchar[i]=color4;
   1706 7B            [ 4]  408 	ld	a, e
   1707 3C            [ 4]  409 	inc	a
   1708 20 04         [12]  410 	jr	NZ,00327$
   170A 3E 01         [ 7]  411 	ld	a,#0x01
   170C 18 01         [12]  412 	jr	00328$
   170E                     413 00327$:
   170E AF            [ 4]  414 	xor	a,a
   170F                     415 00328$:
   170F DD 77 FE      [19]  416 	ld	-2 (ix), a
                            417 ;src/text/text.c:153: if(size==1) {
   1712 DD 7E E0      [19]  418 	ld	a, -32 (ix)
   1715 B7            [ 4]  419 	or	a, a
   1716 CA 92 17      [10]  420 	jp	Z, 00141$
                            421 ;src/text/text.c:155: if(*pChar == 0x55) colorchar[i]=color1;
   1719 DD 7E DF      [19]  422 	ld	a, -33 (ix)
   171C B7            [ 4]  423 	or	a, a
   171D 28 14         [12]  424 	jr	Z,00126$
   171F DD 7E E7      [19]  425 	ld	a, -25 (ix)
   1722 DD 86 D6      [19]  426 	add	a, -42 (ix)
   1725 5F            [ 4]  427 	ld	e, a
   1726 DD 7E E8      [19]  428 	ld	a, -24 (ix)
   1729 CE 00         [ 7]  429 	adc	a, #0x00
   172B 57            [ 4]  430 	ld	d, a
   172C DD 7E D5      [19]  431 	ld	a, -43 (ix)
   172F 12            [ 7]  432 	ld	(de), a
   1730 C3 6B 18      [10]  433 	jp	00163$
   1733                     434 00126$:
                            435 ;src/text/text.c:156: else if(*pChar == 0xee) colorchar[i]=color2;
   1733 DD 7E DE      [19]  436 	ld	a, -34 (ix)
   1736 B7            [ 4]  437 	or	a, a
   1737 28 14         [12]  438 	jr	Z,00123$
   1739 DD 7E EE      [19]  439 	ld	a, -18 (ix)
   173C DD 86 D6      [19]  440 	add	a, -42 (ix)
   173F 5F            [ 4]  441 	ld	e, a
   1740 DD 7E EF      [19]  442 	ld	a, -17 (ix)
   1743 CE 00         [ 7]  443 	adc	a, #0x00
   1745 57            [ 4]  444 	ld	d, a
   1746 DD 7E D4      [19]  445 	ld	a, -44 (ix)
   1749 12            [ 7]  446 	ld	(de), a
   174A C3 6B 18      [10]  447 	jp	00163$
   174D                     448 00123$:
                            449 ;src/text/text.c:157: else if(*pChar == 0xdd) colorchar[i]=color3;
   174D DD 7E FF      [19]  450 	ld	a, -1 (ix)
   1750 B7            [ 4]  451 	or	a, a
   1751 28 14         [12]  452 	jr	Z,00120$
   1753 DD 7E E5      [19]  453 	ld	a, -27 (ix)
   1756 DD 86 D6      [19]  454 	add	a, -42 (ix)
   1759 5F            [ 4]  455 	ld	e, a
   175A DD 7E E6      [19]  456 	ld	a, -26 (ix)
   175D CE 00         [ 7]  457 	adc	a, #0x00
   175F 57            [ 4]  458 	ld	d, a
   1760 DD 7E D3      [19]  459 	ld	a, -45 (ix)
   1763 12            [ 7]  460 	ld	(de), a
   1764 C3 6B 18      [10]  461 	jp	00163$
   1767                     462 00120$:
                            463 ;src/text/text.c:158: else if(*pChar == 0xff) colorchar[i]=color4;
   1767 DD 7E FE      [19]  464 	ld	a, -2 (ix)
   176A B7            [ 4]  465 	or	a, a
   176B 28 14         [12]  466 	jr	Z,00117$
   176D DD 7E FB      [19]  467 	ld	a, -5 (ix)
   1770 DD 86 D6      [19]  468 	add	a, -42 (ix)
   1773 5F            [ 4]  469 	ld	e, a
   1774 DD 7E FC      [19]  470 	ld	a, -4 (ix)
   1777 CE 00         [ 7]  471 	adc	a, #0x00
   1779 57            [ 4]  472 	ld	d, a
   177A DD 7E D2      [19]  473 	ld	a, -46 (ix)
   177D 12            [ 7]  474 	ld	(de), a
   177E C3 6B 18      [10]  475 	jp	00163$
   1781                     476 00117$:
                            477 ;src/text/text.c:159: else colorchar[i]=*pChar;
   1781 DD 7E F3      [19]  478 	ld	a, -13 (ix)
   1784 DD 86 D6      [19]  479 	add	a, -42 (ix)
   1787 6F            [ 4]  480 	ld	l, a
   1788 DD 7E F4      [19]  481 	ld	a, -12 (ix)
   178B CE 00         [ 7]  482 	adc	a, #0x00
   178D 67            [ 4]  483 	ld	h, a
   178E 73            [ 7]  484 	ld	(hl), e
   178F C3 6B 18      [10]  485 	jp	00163$
   1792                     486 00141$:
                            487 ;src/text/text.c:164: pos=(i*size)-(i%FONT2_W);
   1792 D5            [11]  488 	push	de
   1793 C5            [11]  489 	push	bc
   1794 DD 5E 09      [19]  490 	ld	e, 9 (ix)
   1797 DD 66 D6      [19]  491 	ld	h, -42 (ix)
   179A 2E 00         [ 7]  492 	ld	l, #0x00
   179C 55            [ 4]  493 	ld	d, l
   179D 06 08         [ 7]  494 	ld	b, #0x08
   179F                     495 00329$:
   179F 29            [11]  496 	add	hl, hl
   17A0 30 01         [12]  497 	jr	NC,00330$
   17A2 19            [11]  498 	add	hl, de
   17A3                     499 00330$:
   17A3 10 FA         [13]  500 	djnz	00329$
   17A5 C1            [10]  501 	pop	bc
   17A6 D1            [10]  502 	pop	de
   17A7 DD 7E D6      [19]  503 	ld	a, -42 (ix)
   17AA E6 01         [ 7]  504 	and	a, #0x01
   17AC 57            [ 4]  505 	ld	d, a
   17AD 7D            [ 4]  506 	ld	a, l
   17AE 92            [ 4]  507 	sub	a, d
   17AF 6F            [ 4]  508 	ld	l, a
                            509 ;src/text/text.c:168: colorchar[pos+FONT2_W]=color1;
   17B0 55            [ 4]  510 	ld	d, l
   17B1 14            [ 4]  511 	inc	d
   17B2 14            [ 4]  512 	inc	d
                            513 ;src/text/text.c:166: if(*pChar == 0x55) {
   17B3 DD 7E DF      [19]  514 	ld	a, -33 (ix)
   17B6 B7            [ 4]  515 	or	a, a
   17B7 28 21         [12]  516 	jr	Z,00138$
                            517 ;src/text/text.c:167: colorchar[pos]=color1;
   17B9 DD 7E E9      [19]  518 	ld	a, -23 (ix)
   17BC 85            [ 4]  519 	add	a, l
   17BD 6F            [ 4]  520 	ld	l, a
   17BE DD 7E EA      [19]  521 	ld	a, -22 (ix)
   17C1 CE 00         [ 7]  522 	adc	a, #0x00
   17C3 67            [ 4]  523 	ld	h, a
   17C4 DD 7E D5      [19]  524 	ld	a, -43 (ix)
   17C7 77            [ 7]  525 	ld	(hl), a
                            526 ;src/text/text.c:168: colorchar[pos+FONT2_W]=color1;
   17C8 DD 7E E9      [19]  527 	ld	a, -23 (ix)
   17CB 82            [ 4]  528 	add	a, d
   17CC 5F            [ 4]  529 	ld	e, a
   17CD DD 7E EA      [19]  530 	ld	a, -22 (ix)
   17D0 CE 00         [ 7]  531 	adc	a, #0x00
   17D2 57            [ 4]  532 	ld	d, a
   17D3 DD 7E D5      [19]  533 	ld	a, -43 (ix)
   17D6 12            [ 7]  534 	ld	(de), a
   17D7 C3 6B 18      [10]  535 	jp	00163$
   17DA                     536 00138$:
                            537 ;src/text/text.c:170: else if(*pChar == 0xee) {
   17DA DD 7E DE      [19]  538 	ld	a, -34 (ix)
   17DD B7            [ 4]  539 	or	a, a
   17DE 28 20         [12]  540 	jr	Z,00135$
                            541 ;src/text/text.c:171: colorchar[pos]=color2;
   17E0 DD 7E E3      [19]  542 	ld	a, -29 (ix)
   17E3 85            [ 4]  543 	add	a, l
   17E4 6F            [ 4]  544 	ld	l, a
   17E5 DD 7E E4      [19]  545 	ld	a, -28 (ix)
   17E8 CE 00         [ 7]  546 	adc	a, #0x00
   17EA 67            [ 4]  547 	ld	h, a
   17EB DD 7E D4      [19]  548 	ld	a, -44 (ix)
   17EE 77            [ 7]  549 	ld	(hl), a
                            550 ;src/text/text.c:172: colorchar[pos+FONT2_W]=color2;
   17EF DD 7E E3      [19]  551 	ld	a, -29 (ix)
   17F2 82            [ 4]  552 	add	a, d
   17F3 5F            [ 4]  553 	ld	e, a
   17F4 DD 7E E4      [19]  554 	ld	a, -28 (ix)
   17F7 CE 00         [ 7]  555 	adc	a, #0x00
   17F9 57            [ 4]  556 	ld	d, a
   17FA DD 7E D4      [19]  557 	ld	a, -44 (ix)
   17FD 12            [ 7]  558 	ld	(de), a
   17FE 18 6B         [12]  559 	jr	00163$
   1800                     560 00135$:
                            561 ;src/text/text.c:174: else if(*pChar == 0xdd) {
   1800 DD 7E FF      [19]  562 	ld	a, -1 (ix)
   1803 B7            [ 4]  563 	or	a, a
   1804 28 20         [12]  564 	jr	Z,00132$
                            565 ;src/text/text.c:175: colorchar[pos]=color3;
   1806 DD 7E F9      [19]  566 	ld	a, -7 (ix)
   1809 85            [ 4]  567 	add	a, l
   180A 6F            [ 4]  568 	ld	l, a
   180B DD 7E FA      [19]  569 	ld	a, -6 (ix)
   180E CE 00         [ 7]  570 	adc	a, #0x00
   1810 67            [ 4]  571 	ld	h, a
   1811 DD 7E D3      [19]  572 	ld	a, -45 (ix)
   1814 77            [ 7]  573 	ld	(hl), a
                            574 ;src/text/text.c:176: colorchar[pos+FONT2_W]=color3;
   1815 DD 7E F9      [19]  575 	ld	a, -7 (ix)
   1818 82            [ 4]  576 	add	a, d
   1819 5F            [ 4]  577 	ld	e, a
   181A DD 7E FA      [19]  578 	ld	a, -6 (ix)
   181D CE 00         [ 7]  579 	adc	a, #0x00
   181F 57            [ 4]  580 	ld	d, a
   1820 DD 7E D3      [19]  581 	ld	a, -45 (ix)
   1823 12            [ 7]  582 	ld	(de), a
   1824 18 45         [12]  583 	jr	00163$
   1826                     584 00132$:
                            585 ;src/text/text.c:178: else if(*pChar == 0xff) {
   1826 DD 7E FE      [19]  586 	ld	a, -2 (ix)
   1829 B7            [ 4]  587 	or	a, a
   182A 28 20         [12]  588 	jr	Z,00129$
                            589 ;src/text/text.c:179: colorchar[pos]=color4;
   182C DD 7E DA      [19]  590 	ld	a, -38 (ix)
   182F 85            [ 4]  591 	add	a, l
   1830 6F            [ 4]  592 	ld	l, a
   1831 DD 7E DB      [19]  593 	ld	a, -37 (ix)
   1834 CE 00         [ 7]  594 	adc	a, #0x00
   1836 67            [ 4]  595 	ld	h, a
   1837 DD 7E D2      [19]  596 	ld	a, -46 (ix)
   183A 77            [ 7]  597 	ld	(hl), a
                            598 ;src/text/text.c:180: colorchar[pos+FONT2_W]=color4;
   183B DD 7E DA      [19]  599 	ld	a, -38 (ix)
   183E 82            [ 4]  600 	add	a, d
   183F 5F            [ 4]  601 	ld	e, a
   1840 DD 7E DB      [19]  602 	ld	a, -37 (ix)
   1843 CE 00         [ 7]  603 	adc	a, #0x00
   1845 57            [ 4]  604 	ld	d, a
   1846 DD 7E D2      [19]  605 	ld	a, -46 (ix)
   1849 12            [ 7]  606 	ld	(de), a
   184A 18 1F         [12]  607 	jr	00163$
   184C                     608 00129$:
                            609 ;src/text/text.c:183: colorchar[pos]=*pChar;
   184C DD 7E E1      [19]  610 	ld	a, -31 (ix)
   184F 85            [ 4]  611 	add	a, l
   1850 6F            [ 4]  612 	ld	l, a
   1851 DD 7E E2      [19]  613 	ld	a, -30 (ix)
   1854 CE 00         [ 7]  614 	adc	a, #0x00
   1856 67            [ 4]  615 	ld	h, a
   1857 73            [ 7]  616 	ld	(hl), e
                            617 ;src/text/text.c:184: colorchar[pos+FONT2_W]=*pChar;
   1858 DD 7E E1      [19]  618 	ld	a, -31 (ix)
   185B 82            [ 4]  619 	add	a, d
   185C 5F            [ 4]  620 	ld	e, a
   185D DD 7E E2      [19]  621 	ld	a, -30 (ix)
   1860 CE 00         [ 7]  622 	adc	a, #0x00
   1862 57            [ 4]  623 	ld	d, a
   1863 DD 6E D8      [19]  624 	ld	l,-40 (ix)
   1866 DD 66 D9      [19]  625 	ld	h,-39 (ix)
   1869 7E            [ 7]  626 	ld	a, (hl)
   186A 12            [ 7]  627 	ld	(de), a
   186B                     628 00163$:
                            629 ;src/text/text.c:150: for(i=0;i<18;i++){
   186B DD 34 D6      [23]  630 	inc	-42 (ix)
   186E DD 7E D6      [19]  631 	ld	a, -42 (ix)
   1871 D6 12         [ 7]  632 	sub	a, #0x12
   1873 DA CE 16      [10]  633 	jp	C, 00162$
                            634 ;src/text/text.c:193: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   1876 DD 66 07      [19]  635 	ld	h, 7 (ix)
   1879 DD 6E 06      [19]  636 	ld	l, 6 (ix)
   187C E5            [11]  637 	push	hl
   187D 21 00 C0      [10]  638 	ld	hl, #0xc000
   1880 E5            [11]  639 	push	hl
   1881 CD AF 26      [17]  640 	call	_cpct_getScreenPtr
                            641 ;src/text/text.c:194: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
   1884 DD 75 F7      [19]  642 	ld	-9 (ix), l
   1887 DD 74 F8      [19]  643 	ld	-8 (ix), h
   188A DD 7E 0A      [19]  644 	ld	a, 10 (ix)
   188D B7            [ 4]  645 	or	a, a
   188E 28 1D         [12]  646 	jr	Z,00145$
   1890 11 00 02      [10]  647 	ld	de, #_g_tablatrans
   1893 DD 4E EB      [19]  648 	ld	c,-21 (ix)
   1896 DD 46 EC      [19]  649 	ld	b,-20 (ix)
   1899 D5            [11]  650 	push	de
   189A DD 56 ED      [19]  651 	ld	d, -19 (ix)
   189D 1E 02         [ 7]  652 	ld	e,#0x02
   189F D5            [11]  653 	push	de
   18A0 DD 6E F7      [19]  654 	ld	l,-9 (ix)
   18A3 DD 66 F8      [19]  655 	ld	h,-8 (ix)
   18A6 E5            [11]  656 	push	hl
   18A7 C5            [11]  657 	push	bc
   18A8 CD CF 26      [17]  658 	call	_cpct_drawSpriteMaskedAlignedTable
   18AB 18 23         [12]  659 	jr	00146$
   18AD                     660 00145$:
                            661 ;src/text/text.c:195: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
   18AD DD 7E F0      [19]  662 	ld	a, -16 (ix)
   18B0 DD 77 F5      [19]  663 	ld	-11 (ix), a
   18B3 DD 7E F1      [19]  664 	ld	a, -15 (ix)
   18B6 DD 77 F6      [19]  665 	ld	-10 (ix), a
   18B9 DD 56 F2      [19]  666 	ld	d, -14 (ix)
   18BC 1E 02         [ 7]  667 	ld	e,#0x02
   18BE D5            [11]  668 	push	de
   18BF DD 6E F7      [19]  669 	ld	l,-9 (ix)
   18C2 DD 66 F8      [19]  670 	ld	h,-8 (ix)
   18C5 E5            [11]  671 	push	hl
   18C6 DD 6E F5      [19]  672 	ld	l,-11 (ix)
   18C9 DD 66 F6      [19]  673 	ld	h,-10 (ix)
   18CC E5            [11]  674 	push	hl
   18CD CD 1A 23      [17]  675 	call	_cpct_drawSprite
   18D0                     676 00146$:
                            677 ;src/text/text.c:198: if(character == 48 || character == 60 || character == 57) xPos--;
   18D0 DD 7E AD      [19]  678 	ld	a, -83 (ix)
   18D3 D6 30         [ 7]  679 	sub	a, #0x30
   18D5 28 0E         [12]  680 	jr	Z,00147$
   18D7 DD 7E AD      [19]  681 	ld	a, -83 (ix)
   18DA D6 3C         [ 7]  682 	sub	a, #0x3c
   18DC 28 07         [12]  683 	jr	Z,00147$
   18DE DD 7E AD      [19]  684 	ld	a, -83 (ix)
   18E1 D6 39         [ 7]  685 	sub	a, #0x39
   18E3 20 03         [12]  686 	jr	NZ,00152$
   18E5                     687 00147$:
   18E5 DD 35 06      [23]  688 	dec	6 (ix)
   18E8                     689 00152$:
                            690 ;src/text/text.c:201: character = text[++x];
   18E8 DD 34 D7      [23]  691 	inc	-41 (ix)
   18EB DD 7E DC      [19]  692 	ld	a, -36 (ix)
   18EE DD 86 D7      [19]  693 	add	a, -41 (ix)
   18F1 6F            [ 4]  694 	ld	l, a
   18F2 DD 7E DD      [19]  695 	ld	a, -35 (ix)
   18F5 CE 00         [ 7]  696 	adc	a, #0x00
   18F7 67            [ 4]  697 	ld	h, a
   18F8 7E            [ 7]  698 	ld	a, (hl)
   18F9 DD 77 FD      [19]  699 	ld	-3 (ix), a
                            700 ;src/text/text.c:202: xPos+=FONT2_W;
   18FC DD 34 06      [23]  701 	inc	6 (ix)
   18FF DD 34 06      [23]  702 	inc	6 (ix)
   1902 C3 FA 15      [10]  703 	jp	00159$
   1905                     704 00164$:
   1905 DD F9         [10]  705 	ld	sp, ix
   1907 DD E1         [14]  706 	pop	ix
   1909 C9            [10]  707 	ret
                            708 	.area _CODE
                            709 	.area _INITIALIZER
                            710 	.area _CABS (ABS)
