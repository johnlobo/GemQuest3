                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
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
   1B72                      53 _strLength::
                             54 ;src/text/text.c:61: while (str[result] != '\0') {
   1B72 0E 00         [ 7]   55 	ld	c, #0x00
   1B74                      56 00101$:
   1B74 21 02 00      [10]   57 	ld	hl, #2
   1B77 39            [11]   58 	add	hl, sp
   1B78 7E            [ 7]   59 	ld	a, (hl)
   1B79 23            [ 6]   60 	inc	hl
   1B7A 66            [ 7]   61 	ld	h, (hl)
   1B7B 6F            [ 4]   62 	ld	l, a
   1B7C 06 00         [ 7]   63 	ld	b, #0x00
   1B7E 09            [11]   64 	add	hl, bc
   1B7F 7E            [ 7]   65 	ld	a, (hl)
   1B80 B7            [ 4]   66 	or	a, a
   1B81 28 03         [12]   67 	jr	Z,00103$
                             68 ;src/text/text.c:62: result++;
   1B83 0C            [ 4]   69 	inc	c
   1B84 18 EE         [12]   70 	jr	00101$
   1B86                      71 00103$:
                             72 ;src/text/text.c:64: return result;
   1B86 69            [ 4]   73 	ld	l, c
   1B87 C9            [10]   74 	ret
   1B88                      75 _swapColors:
   1B88 55                   76 	.db #0x55	; 85	'U'
   1B89 EE                   77 	.db #0xee	; 238
   1B8A DD                   78 	.db #0xdd	; 221
   1B8B FF                   79 	.db #0xff	; 255
   1B8C 14                   80 	.db #0x14	; 20
   1B8D 6C                   81 	.db #0x6c	; 108	'l'
   1B8E 9C                   82 	.db #0x9c	; 156
   1B8F 3C                   83 	.db #0x3c	; 60
   1B90 50                   84 	.db #0x50	; 80	'P'
   1B91 E4                   85 	.db #0xe4	; 228
   1B92 D8                   86 	.db #0xd8	; 216
   1B93 F0                   87 	.db #0xf0	; 240
   1B94 11                   88 	.db #0x11	; 17
   1B95 66                   89 	.db #0x66	; 102	'f'
   1B96 99                   90 	.db #0x99	; 153
   1B97 33                   91 	.db #0x33	; 51	'3'
   1B98 10                   92 	.db #0x10	; 16
   1B99 35                   93 	.db #0x35	; 53	'5'
   1B9A 3A                   94 	.db #0x3a	; 58
   1B9B 30                   95 	.db #0x30	; 48	'0'
   1B9C 45                   96 	.db #0x45	; 69	'E'
   1B9D CE                   97 	.db #0xce	; 206
   1B9E CD                   98 	.db #0xcd	; 205
   1B9F CF                   99 	.db #0xcf	; 207
                            100 ;src/text/text.c:78: void strCopy(u8 source[], u8 dest[]) 
                            101 ;	---------------------------------
                            102 ; Function strCopy
                            103 ; ---------------------------------
   1BA0                     104 _strCopy::
   1BA0 DD E5         [15]  105 	push	ix
   1BA2 DD 21 00 00   [14]  106 	ld	ix,#0
   1BA6 DD 39         [15]  107 	add	ix,sp
                            108 ;src/text/text.c:81: while ((dest[i] = source[i]) != '\0')
   1BA8 0E 00         [ 7]  109 	ld	c, #0x00
   1BAA                     110 00101$:
   1BAA DD 7E 06      [19]  111 	ld	a, 6 (ix)
   1BAD 81            [ 4]  112 	add	a, c
   1BAE 5F            [ 4]  113 	ld	e, a
   1BAF DD 7E 07      [19]  114 	ld	a, 7 (ix)
   1BB2 CE 00         [ 7]  115 	adc	a, #0x00
   1BB4 57            [ 4]  116 	ld	d, a
   1BB5 DD 6E 04      [19]  117 	ld	l,4 (ix)
   1BB8 DD 66 05      [19]  118 	ld	h,5 (ix)
   1BBB 06 00         [ 7]  119 	ld	b, #0x00
   1BBD 09            [11]  120 	add	hl, bc
   1BBE 7E            [ 7]  121 	ld	a, (hl)
   1BBF 12            [ 7]  122 	ld	(de), a
   1BC0 B7            [ 4]  123 	or	a, a
   1BC1 28 03         [12]  124 	jr	Z,00104$
                            125 ;src/text/text.c:83: i++;
   1BC3 0C            [ 4]  126 	inc	c
   1BC4 18 E4         [12]  127 	jr	00101$
   1BC6                     128 00104$:
   1BC6 DD E1         [14]  129 	pop	ix
   1BC8 C9            [10]  130 	ret
                            131 ;src/text/text.c:88: void drawText(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
                            132 ;	---------------------------------
                            133 ; Function drawText
                            134 ; ---------------------------------
   1BC9                     135 _drawText::
   1BC9 DD E5         [15]  136 	push	ix
   1BCB DD 21 00 00   [14]  137 	ld	ix,#0
   1BCF DD 39         [15]  138 	add	ix,sp
   1BD1 21 AD FF      [10]  139 	ld	hl, #-83
   1BD4 39            [11]  140 	add	hl, sp
   1BD5 F9            [ 6]  141 	ld	sp, hl
                            142 ;src/text/text.c:100: color1 = swapColors[color][0];
   1BD6 01 88 1B      [10]  143 	ld	bc, #_swapColors+0
   1BD9 DD 6E 08      [19]  144 	ld	l, 8 (ix)
   1BDC 26 00         [ 7]  145 	ld	h, #0x00
   1BDE 29            [11]  146 	add	hl, hl
   1BDF 29            [11]  147 	add	hl, hl
   1BE0 09            [11]  148 	add	hl, bc
   1BE1 E5            [11]  149 	push	hl
   1BE2 FD E1         [14]  150 	pop	iy
   1BE4 FD 7E 00      [19]  151 	ld	a, 0 (iy)
   1BE7 DD 77 D5      [19]  152 	ld	-43 (ix), a
                            153 ;src/text/text.c:101: color2 = swapColors[color][1];
   1BEA FD E5         [15]  154 	push	iy
   1BEC E1            [10]  155 	pop	hl
   1BED 23            [ 6]  156 	inc	hl
   1BEE 7E            [ 7]  157 	ld	a, (hl)
   1BEF DD 77 D4      [19]  158 	ld	-44 (ix), a
                            159 ;src/text/text.c:102: color3 = swapColors[color][2];
   1BF2 FD E5         [15]  160 	push	iy
   1BF4 E1            [10]  161 	pop	hl
   1BF5 23            [ 6]  162 	inc	hl
   1BF6 23            [ 6]  163 	inc	hl
   1BF7 7E            [ 7]  164 	ld	a, (hl)
   1BF8 DD 77 D3      [19]  165 	ld	-45 (ix), a
                            166 ;src/text/text.c:103: color4 = swapColors[color][3];
   1BFB FD 7E 03      [19]  167 	ld	a, 3 (iy)
   1BFE DD 77 D2      [19]  168 	ld	-46 (ix), a
                            169 ;src/text/text.c:108: character = text[x];
   1C01 DD 7E 04      [19]  170 	ld	a, 4 (ix)
   1C04 DD 77 FE      [19]  171 	ld	-2 (ix), a
   1C07 DD 7E 05      [19]  172 	ld	a, 5 (ix)
   1C0A DD 77 FF      [19]  173 	ld	-1 (ix), a
   1C0D DD 6E FE      [19]  174 	ld	l,-2 (ix)
   1C10 DD 66 FF      [19]  175 	ld	h,-1 (ix)
   1C13 7E            [ 7]  176 	ld	a, (hl)
   1C14 DD 77 FD      [19]  177 	ld	-3 (ix), a
                            178 ;src/text/text.c:110: while (character != '\0') {
   1C17 21 01 00      [10]  179 	ld	hl, #0x0001
   1C1A 39            [11]  180 	add	hl, sp
   1C1B DD 75 FB      [19]  181 	ld	-5 (ix), l
   1C1E DD 74 FC      [19]  182 	ld	-4 (ix), h
   1C21 DD 7E FB      [19]  183 	ld	a, -5 (ix)
   1C24 DD 77 F9      [19]  184 	ld	-7 (ix), a
   1C27 DD 7E FC      [19]  185 	ld	a, -4 (ix)
   1C2A DD 77 FA      [19]  186 	ld	-6 (ix), a
   1C2D DD 7E FB      [19]  187 	ld	a, -5 (ix)
   1C30 DD 77 F7      [19]  188 	ld	-9 (ix), a
   1C33 DD 7E FC      [19]  189 	ld	a, -4 (ix)
   1C36 DD 77 F8      [19]  190 	ld	-8 (ix), a
   1C39 DD 7E FB      [19]  191 	ld	a, -5 (ix)
   1C3C DD 77 F5      [19]  192 	ld	-11 (ix), a
   1C3F DD 7E FC      [19]  193 	ld	a, -4 (ix)
   1C42 DD 77 F6      [19]  194 	ld	-10 (ix), a
   1C45 DD 7E FB      [19]  195 	ld	a, -5 (ix)
   1C48 DD 77 F3      [19]  196 	ld	-13 (ix), a
   1C4B DD 7E FC      [19]  197 	ld	a, -4 (ix)
   1C4E DD 77 F4      [19]  198 	ld	-12 (ix), a
   1C51 DD 7E FB      [19]  199 	ld	a, -5 (ix)
   1C54 DD 77 F1      [19]  200 	ld	-15 (ix), a
   1C57 DD 7E FC      [19]  201 	ld	a, -4 (ix)
   1C5A DD 77 F2      [19]  202 	ld	-14 (ix), a
   1C5D DD 7E FB      [19]  203 	ld	a, -5 (ix)
   1C60 DD 77 EF      [19]  204 	ld	-17 (ix), a
   1C63 DD 7E FC      [19]  205 	ld	a, -4 (ix)
   1C66 DD 77 F0      [19]  206 	ld	-16 (ix), a
   1C69 DD 7E FB      [19]  207 	ld	a, -5 (ix)
   1C6C DD 77 ED      [19]  208 	ld	-19 (ix), a
   1C6F DD 7E FC      [19]  209 	ld	a, -4 (ix)
   1C72 DD 77 EE      [19]  210 	ld	-18 (ix), a
   1C75 DD 7E FB      [19]  211 	ld	a, -5 (ix)
   1C78 DD 77 EB      [19]  212 	ld	-21 (ix), a
   1C7B DD 7E FC      [19]  213 	ld	a, -4 (ix)
   1C7E DD 77 EC      [19]  214 	ld	-20 (ix), a
   1C81 DD 7E FB      [19]  215 	ld	a, -5 (ix)
   1C84 DD 77 E9      [19]  216 	ld	-23 (ix), a
   1C87 DD 7E FC      [19]  217 	ld	a, -4 (ix)
   1C8A DD 77 EA      [19]  218 	ld	-22 (ix), a
   1C8D DD 7E 09      [19]  219 	ld	a, 9 (ix)
   1C90 3D            [ 4]  220 	dec	a
   1C91 20 04         [12]  221 	jr	NZ,00304$
   1C93 3E 01         [ 7]  222 	ld	a,#0x01
   1C95 18 01         [12]  223 	jr	00305$
   1C97                     224 00304$:
   1C97 AF            [ 4]  225 	xor	a,a
   1C98                     226 00305$:
   1C98 DD 77 E8      [19]  227 	ld	-24 (ix), a
   1C9B DD 7E 09      [19]  228 	ld	a, 9 (ix)
   1C9E 4F            [ 4]  229 	ld	c, a
   1C9F 87            [ 4]  230 	add	a, a
   1CA0 87            [ 4]  231 	add	a, a
   1CA1 87            [ 4]  232 	add	a, a
   1CA2 81            [ 4]  233 	add	a, c
   1CA3 DD 77 E7      [19]  234 	ld	-25 (ix), a
   1CA6 DD 7E FB      [19]  235 	ld	a, -5 (ix)
   1CA9 DD 77 E5      [19]  236 	ld	-27 (ix), a
   1CAC DD 7E FC      [19]  237 	ld	a, -4 (ix)
   1CAF DD 77 E6      [19]  238 	ld	-26 (ix), a
   1CB2 DD 7E E7      [19]  239 	ld	a, -25 (ix)
   1CB5 DD 77 E4      [19]  240 	ld	-28 (ix), a
   1CB8 DD 7E FB      [19]  241 	ld	a, -5 (ix)
   1CBB DD 77 E2      [19]  242 	ld	-30 (ix), a
   1CBE DD 7E FC      [19]  243 	ld	a, -4 (ix)
   1CC1 DD 77 E3      [19]  244 	ld	-29 (ix), a
   1CC4 DD 36 D7 00   [19]  245 	ld	-41 (ix), #0x00
   1CC8                     246 00159$:
   1CC8 DD 7E FD      [19]  247 	ld	a, -3 (ix)
   1CCB B7            [ 4]  248 	or	a, a
   1CCC CA D3 1F      [10]  249 	jp	Z, 00164$
                            250 ;src/text/text.c:113: if ((character == 33) || ((character>43) && (character<47)) || 
   1CCF DD 7E FD      [19]  251 	ld	a, -3 (ix)
   1CD2 D6 21         [ 7]  252 	sub	a, #0x21
   1CD4 20 04         [12]  253 	jr	NZ,00306$
   1CD6 3E 01         [ 7]  254 	ld	a,#0x01
   1CD8 18 01         [12]  255 	jr	00307$
   1CDA                     256 00306$:
   1CDA AF            [ 4]  257 	xor	a,a
   1CDB                     258 00307$:
   1CDB 4F            [ 4]  259 	ld	c,a
   1CDC B7            [ 4]  260 	or	a, a
   1CDD 20 2C         [12]  261 	jr	NZ,00151$
   1CDF 3E 2B         [ 7]  262 	ld	a, #0x2b
   1CE1 DD 96 FD      [19]  263 	sub	a, -3 (ix)
   1CE4 30 07         [12]  264 	jr	NC,00156$
   1CE6 DD 7E FD      [19]  265 	ld	a, -3 (ix)
   1CE9 D6 2F         [ 7]  266 	sub	a, #0x2f
   1CEB 38 1E         [12]  267 	jr	C,00151$
   1CED                     268 00156$:
                            269 ;src/text/text.c:114: ((character>47) && (character<58)) || ((character>62) && (character<91))) { //Allowed characters
   1CED 3E 2F         [ 7]  270 	ld	a, #0x2f
   1CEF DD 96 FD      [19]  271 	sub	a, -3 (ix)
   1CF2 30 07         [12]  272 	jr	NC,00158$
   1CF4 DD 7E FD      [19]  273 	ld	a, -3 (ix)
   1CF7 D6 3A         [ 7]  274 	sub	a, #0x3a
   1CF9 38 10         [12]  275 	jr	C,00151$
   1CFB                     276 00158$:
   1CFB 3E 3E         [ 7]  277 	ld	a, #0x3e
   1CFD DD 96 FD      [19]  278 	sub	a, -3 (ix)
   1D00 D2 B6 1F      [10]  279 	jp	NC, 00152$
   1D03 DD 7E FD      [19]  280 	ld	a, -3 (ix)
   1D06 D6 5B         [ 7]  281 	sub	a, #0x5b
   1D08 D2 B6 1F      [10]  282 	jp	NC, 00152$
   1D0B                     283 00151$:
                            284 ;src/text/text.c:118: switch(character){
   1D0B 79            [ 4]  285 	ld	a, c
   1D0C B7            [ 4]  286 	or	a, a
   1D0D 20 5D         [12]  287 	jr	NZ,00101$
   1D0F DD 7E FD      [19]  288 	ld	a, -3 (ix)
   1D12 D6 2C         [ 7]  289 	sub	a, #0x2c
   1D14 28 5C         [12]  290 	jr	Z,00104$
   1D16 DD 7E FD      [19]  291 	ld	a, -3 (ix)
   1D19 D6 2D         [ 7]  292 	sub	a, #0x2d
   1D1B 28 55         [12]  293 	jr	Z,00104$
   1D1D DD 7E FD      [19]  294 	ld	a, -3 (ix)
   1D20 D6 2E         [ 7]  295 	sub	a, #0x2e
   1D22 28 4E         [12]  296 	jr	Z,00104$
   1D24 DD 7E FD      [19]  297 	ld	a, -3 (ix)
   1D27 D6 30         [ 7]  298 	sub	a, #0x30
   1D29 28 51         [12]  299 	jr	Z,00114$
   1D2B DD 7E FD      [19]  300 	ld	a, -3 (ix)
   1D2E D6 31         [ 7]  301 	sub	a, #0x31
   1D30 28 4A         [12]  302 	jr	Z,00114$
   1D32 DD 7E FD      [19]  303 	ld	a, -3 (ix)
   1D35 D6 32         [ 7]  304 	sub	a, #0x32
   1D37 28 43         [12]  305 	jr	Z,00114$
   1D39 DD 7E FD      [19]  306 	ld	a, -3 (ix)
   1D3C D6 33         [ 7]  307 	sub	a, #0x33
   1D3E 28 3C         [12]  308 	jr	Z,00114$
   1D40 DD 7E FD      [19]  309 	ld	a, -3 (ix)
   1D43 D6 34         [ 7]  310 	sub	a, #0x34
   1D45 28 35         [12]  311 	jr	Z,00114$
   1D47 DD 7E FD      [19]  312 	ld	a, -3 (ix)
   1D4A D6 35         [ 7]  313 	sub	a, #0x35
   1D4C 28 2E         [12]  314 	jr	Z,00114$
   1D4E DD 7E FD      [19]  315 	ld	a, -3 (ix)
   1D51 D6 36         [ 7]  316 	sub	a, #0x36
   1D53 28 27         [12]  317 	jr	Z,00114$
   1D55 DD 7E FD      [19]  318 	ld	a, -3 (ix)
   1D58 D6 37         [ 7]  319 	sub	a, #0x37
   1D5A 28 20         [12]  320 	jr	Z,00114$
   1D5C DD 7E FD      [19]  321 	ld	a, -3 (ix)
   1D5F D6 38         [ 7]  322 	sub	a, #0x38
   1D61 28 19         [12]  323 	jr	Z,00114$
   1D63 DD 7E FD      [19]  324 	ld	a, -3 (ix)
   1D66 D6 39         [ 7]  325 	sub	a, #0x39
   1D68 28 12         [12]  326 	jr	Z,00114$
   1D6A 18 18         [12]  327 	jr	00115$
                            328 ;src/text/text.c:120: case 33:
   1D6C                     329 00101$:
                            330 ;src/text/text.c:121: character=49;
   1D6C DD 36 FD 31   [19]  331 	ld	-3 (ix), #0x31
                            332 ;src/text/text.c:122: break;
   1D70 18 12         [12]  333 	jr	00115$
                            334 ;src/text/text.c:127: case 46:
   1D72                     335 00104$:
                            336 ;src/text/text.c:128: character+=6;
   1D72 DD 7E FD      [19]  337 	ld	a, -3 (ix)
   1D75 C6 06         [ 7]  338 	add	a, #0x06
   1D77 DD 77 FD      [19]  339 	ld	-3 (ix), a
                            340 ;src/text/text.c:129: break;
   1D7A 18 08         [12]  341 	jr	00115$
                            342 ;src/text/text.c:141: case 57:
   1D7C                     343 00114$:
                            344 ;src/text/text.c:142: character+=5;
   1D7C DD 7E FD      [19]  345 	ld	a, -3 (ix)
   1D7F C6 05         [ 7]  346 	add	a, #0x05
   1D81 DD 77 FD      [19]  347 	ld	-3 (ix), a
                            348 ;src/text/text.c:144: }
   1D84                     349 00115$:
                            350 ;src/text/text.c:147: character-=49;
   1D84 DD 7E FD      [19]  351 	ld	a, -3 (ix)
   1D87 C6 CF         [ 7]  352 	add	a, #0xcf
                            353 ;src/text/text.c:150: for(i=0;i<18;i++){
   1D89 DD 77 AD      [19]  354 	ld	-83 (ix), a
   1D8C 4F            [ 4]  355 	ld	c, a
   1D8D 06 00         [ 7]  356 	ld	b,#0x00
   1D8F 69            [ 4]  357 	ld	l, c
   1D90 60            [ 4]  358 	ld	h, b
   1D91 29            [11]  359 	add	hl, hl
   1D92 29            [11]  360 	add	hl, hl
   1D93 29            [11]  361 	add	hl, hl
   1D94 09            [11]  362 	add	hl, bc
   1D95 29            [11]  363 	add	hl, hl
   1D96 4D            [ 4]  364 	ld	c, l
   1D97 44            [ 4]  365 	ld	b, h
   1D98 DD 36 D6 00   [19]  366 	ld	-42 (ix), #0x00
   1D9C                     367 00162$:
                            368 ;src/text/text.c:151: pChar = (u8*) g_font_chars + (character*18) + i;
   1D9C 21 00 10      [10]  369 	ld	hl, #_g_font_chars
   1D9F 09            [11]  370 	add	hl, bc
   1DA0 DD 5E D6      [19]  371 	ld	e,-42 (ix)
   1DA3 16 00         [ 7]  372 	ld	d,#0x00
   1DA5 19            [11]  373 	add	hl, de
                            374 ;src/text/text.c:155: if(*pChar == 0x55) colorchar[i]=color1;
   1DA6 DD 75 D8      [19]  375 	ld	-40 (ix), l
   1DA9 DD 74 D9      [19]  376 	ld	-39 (ix), h
   1DAC 5E            [ 7]  377 	ld	e, (hl)
   1DAD 7B            [ 4]  378 	ld	a, e
   1DAE D6 55         [ 7]  379 	sub	a, #0x55
   1DB0 20 04         [12]  380 	jr	NZ,00321$
   1DB2 3E 01         [ 7]  381 	ld	a,#0x01
   1DB4 18 01         [12]  382 	jr	00322$
   1DB6                     383 00321$:
   1DB6 AF            [ 4]  384 	xor	a,a
   1DB7                     385 00322$:
   1DB7 DD 77 E1      [19]  386 	ld	-31 (ix), a
                            387 ;src/text/text.c:156: else if(*pChar == 0xee) colorchar[i]=color2;
   1DBA 7B            [ 4]  388 	ld	a, e
   1DBB D6 EE         [ 7]  389 	sub	a, #0xee
   1DBD 20 04         [12]  390 	jr	NZ,00323$
   1DBF 3E 01         [ 7]  391 	ld	a,#0x01
   1DC1 18 01         [12]  392 	jr	00324$
   1DC3                     393 00323$:
   1DC3 AF            [ 4]  394 	xor	a,a
   1DC4                     395 00324$:
   1DC4 DD 77 E0      [19]  396 	ld	-32 (ix), a
                            397 ;src/text/text.c:157: else if(*pChar == 0xdd) colorchar[i]=color3;
   1DC7 7B            [ 4]  398 	ld	a, e
   1DC8 D6 DD         [ 7]  399 	sub	a, #0xdd
   1DCA 20 04         [12]  400 	jr	NZ,00325$
   1DCC 3E 01         [ 7]  401 	ld	a,#0x01
   1DCE 18 01         [12]  402 	jr	00326$
   1DD0                     403 00325$:
   1DD0 AF            [ 4]  404 	xor	a,a
   1DD1                     405 00326$:
   1DD1 DD 77 DF      [19]  406 	ld	-33 (ix), a
                            407 ;src/text/text.c:158: else if(*pChar == 0xff) colorchar[i]=color4;
   1DD4 7B            [ 4]  408 	ld	a, e
   1DD5 3C            [ 4]  409 	inc	a
   1DD6 20 04         [12]  410 	jr	NZ,00327$
   1DD8 3E 01         [ 7]  411 	ld	a,#0x01
   1DDA 18 01         [12]  412 	jr	00328$
   1DDC                     413 00327$:
   1DDC AF            [ 4]  414 	xor	a,a
   1DDD                     415 00328$:
   1DDD DD 77 DE      [19]  416 	ld	-34 (ix), a
                            417 ;src/text/text.c:153: if(size==1) {
   1DE0 DD 7E E8      [19]  418 	ld	a, -24 (ix)
   1DE3 B7            [ 4]  419 	or	a, a
   1DE4 CA 60 1E      [10]  420 	jp	Z, 00141$
                            421 ;src/text/text.c:155: if(*pChar == 0x55) colorchar[i]=color1;
   1DE7 DD 7E E1      [19]  422 	ld	a, -31 (ix)
   1DEA B7            [ 4]  423 	or	a, a
   1DEB 28 14         [12]  424 	jr	Z,00126$
   1DED DD 7E E9      [19]  425 	ld	a, -23 (ix)
   1DF0 DD 86 D6      [19]  426 	add	a, -42 (ix)
   1DF3 5F            [ 4]  427 	ld	e, a
   1DF4 DD 7E EA      [19]  428 	ld	a, -22 (ix)
   1DF7 CE 00         [ 7]  429 	adc	a, #0x00
   1DF9 57            [ 4]  430 	ld	d, a
   1DFA DD 7E D5      [19]  431 	ld	a, -43 (ix)
   1DFD 12            [ 7]  432 	ld	(de), a
   1DFE C3 39 1F      [10]  433 	jp	00163$
   1E01                     434 00126$:
                            435 ;src/text/text.c:156: else if(*pChar == 0xee) colorchar[i]=color2;
   1E01 DD 7E E0      [19]  436 	ld	a, -32 (ix)
   1E04 B7            [ 4]  437 	or	a, a
   1E05 28 14         [12]  438 	jr	Z,00123$
   1E07 DD 7E EB      [19]  439 	ld	a, -21 (ix)
   1E0A DD 86 D6      [19]  440 	add	a, -42 (ix)
   1E0D 5F            [ 4]  441 	ld	e, a
   1E0E DD 7E EC      [19]  442 	ld	a, -20 (ix)
   1E11 CE 00         [ 7]  443 	adc	a, #0x00
   1E13 57            [ 4]  444 	ld	d, a
   1E14 DD 7E D4      [19]  445 	ld	a, -44 (ix)
   1E17 12            [ 7]  446 	ld	(de), a
   1E18 C3 39 1F      [10]  447 	jp	00163$
   1E1B                     448 00123$:
                            449 ;src/text/text.c:157: else if(*pChar == 0xdd) colorchar[i]=color3;
   1E1B DD 7E DF      [19]  450 	ld	a, -33 (ix)
   1E1E B7            [ 4]  451 	or	a, a
   1E1F 28 14         [12]  452 	jr	Z,00120$
   1E21 DD 7E ED      [19]  453 	ld	a, -19 (ix)
   1E24 DD 86 D6      [19]  454 	add	a, -42 (ix)
   1E27 5F            [ 4]  455 	ld	e, a
   1E28 DD 7E EE      [19]  456 	ld	a, -18 (ix)
   1E2B CE 00         [ 7]  457 	adc	a, #0x00
   1E2D 57            [ 4]  458 	ld	d, a
   1E2E DD 7E D3      [19]  459 	ld	a, -45 (ix)
   1E31 12            [ 7]  460 	ld	(de), a
   1E32 C3 39 1F      [10]  461 	jp	00163$
   1E35                     462 00120$:
                            463 ;src/text/text.c:158: else if(*pChar == 0xff) colorchar[i]=color4;
   1E35 DD 7E DE      [19]  464 	ld	a, -34 (ix)
   1E38 B7            [ 4]  465 	or	a, a
   1E39 28 14         [12]  466 	jr	Z,00117$
   1E3B DD 7E EF      [19]  467 	ld	a, -17 (ix)
   1E3E DD 86 D6      [19]  468 	add	a, -42 (ix)
   1E41 5F            [ 4]  469 	ld	e, a
   1E42 DD 7E F0      [19]  470 	ld	a, -16 (ix)
   1E45 CE 00         [ 7]  471 	adc	a, #0x00
   1E47 57            [ 4]  472 	ld	d, a
   1E48 DD 7E D2      [19]  473 	ld	a, -46 (ix)
   1E4B 12            [ 7]  474 	ld	(de), a
   1E4C C3 39 1F      [10]  475 	jp	00163$
   1E4F                     476 00117$:
                            477 ;src/text/text.c:159: else colorchar[i]=*pChar;
   1E4F DD 7E F1      [19]  478 	ld	a, -15 (ix)
   1E52 DD 86 D6      [19]  479 	add	a, -42 (ix)
   1E55 6F            [ 4]  480 	ld	l, a
   1E56 DD 7E F2      [19]  481 	ld	a, -14 (ix)
   1E59 CE 00         [ 7]  482 	adc	a, #0x00
   1E5B 67            [ 4]  483 	ld	h, a
   1E5C 73            [ 7]  484 	ld	(hl), e
   1E5D C3 39 1F      [10]  485 	jp	00163$
   1E60                     486 00141$:
                            487 ;src/text/text.c:164: pos=(i*size)-(i%FONT2_W);
   1E60 D5            [11]  488 	push	de
   1E61 C5            [11]  489 	push	bc
   1E62 DD 5E 09      [19]  490 	ld	e, 9 (ix)
   1E65 DD 66 D6      [19]  491 	ld	h, -42 (ix)
   1E68 2E 00         [ 7]  492 	ld	l, #0x00
   1E6A 55            [ 4]  493 	ld	d, l
   1E6B 06 08         [ 7]  494 	ld	b, #0x08
   1E6D                     495 00329$:
   1E6D 29            [11]  496 	add	hl, hl
   1E6E 30 01         [12]  497 	jr	NC,00330$
   1E70 19            [11]  498 	add	hl, de
   1E71                     499 00330$:
   1E71 10 FA         [13]  500 	djnz	00329$
   1E73 C1            [10]  501 	pop	bc
   1E74 D1            [10]  502 	pop	de
   1E75 DD 7E D6      [19]  503 	ld	a, -42 (ix)
   1E78 E6 01         [ 7]  504 	and	a, #0x01
   1E7A 57            [ 4]  505 	ld	d, a
   1E7B 7D            [ 4]  506 	ld	a, l
   1E7C 92            [ 4]  507 	sub	a, d
   1E7D 6F            [ 4]  508 	ld	l, a
                            509 ;src/text/text.c:168: colorchar[pos+FONT2_W]=color1;
   1E7E 55            [ 4]  510 	ld	d, l
   1E7F 14            [ 4]  511 	inc	d
   1E80 14            [ 4]  512 	inc	d
                            513 ;src/text/text.c:166: if(*pChar == 0x55) {
   1E81 DD 7E E1      [19]  514 	ld	a, -31 (ix)
   1E84 B7            [ 4]  515 	or	a, a
   1E85 28 21         [12]  516 	jr	Z,00138$
                            517 ;src/text/text.c:167: colorchar[pos]=color1;
   1E87 DD 7E F3      [19]  518 	ld	a, -13 (ix)
   1E8A 85            [ 4]  519 	add	a, l
   1E8B 6F            [ 4]  520 	ld	l, a
   1E8C DD 7E F4      [19]  521 	ld	a, -12 (ix)
   1E8F CE 00         [ 7]  522 	adc	a, #0x00
   1E91 67            [ 4]  523 	ld	h, a
   1E92 DD 7E D5      [19]  524 	ld	a, -43 (ix)
   1E95 77            [ 7]  525 	ld	(hl), a
                            526 ;src/text/text.c:168: colorchar[pos+FONT2_W]=color1;
   1E96 DD 7E F3      [19]  527 	ld	a, -13 (ix)
   1E99 82            [ 4]  528 	add	a, d
   1E9A 5F            [ 4]  529 	ld	e, a
   1E9B DD 7E F4      [19]  530 	ld	a, -12 (ix)
   1E9E CE 00         [ 7]  531 	adc	a, #0x00
   1EA0 57            [ 4]  532 	ld	d, a
   1EA1 DD 7E D5      [19]  533 	ld	a, -43 (ix)
   1EA4 12            [ 7]  534 	ld	(de), a
   1EA5 C3 39 1F      [10]  535 	jp	00163$
   1EA8                     536 00138$:
                            537 ;src/text/text.c:170: else if(*pChar == 0xee) {
   1EA8 DD 7E E0      [19]  538 	ld	a, -32 (ix)
   1EAB B7            [ 4]  539 	or	a, a
   1EAC 28 20         [12]  540 	jr	Z,00135$
                            541 ;src/text/text.c:171: colorchar[pos]=color2;
   1EAE DD 7E F5      [19]  542 	ld	a, -11 (ix)
   1EB1 85            [ 4]  543 	add	a, l
   1EB2 6F            [ 4]  544 	ld	l, a
   1EB3 DD 7E F6      [19]  545 	ld	a, -10 (ix)
   1EB6 CE 00         [ 7]  546 	adc	a, #0x00
   1EB8 67            [ 4]  547 	ld	h, a
   1EB9 DD 7E D4      [19]  548 	ld	a, -44 (ix)
   1EBC 77            [ 7]  549 	ld	(hl), a
                            550 ;src/text/text.c:172: colorchar[pos+FONT2_W]=color2;
   1EBD DD 7E F5      [19]  551 	ld	a, -11 (ix)
   1EC0 82            [ 4]  552 	add	a, d
   1EC1 5F            [ 4]  553 	ld	e, a
   1EC2 DD 7E F6      [19]  554 	ld	a, -10 (ix)
   1EC5 CE 00         [ 7]  555 	adc	a, #0x00
   1EC7 57            [ 4]  556 	ld	d, a
   1EC8 DD 7E D4      [19]  557 	ld	a, -44 (ix)
   1ECB 12            [ 7]  558 	ld	(de), a
   1ECC 18 6B         [12]  559 	jr	00163$
   1ECE                     560 00135$:
                            561 ;src/text/text.c:174: else if(*pChar == 0xdd) {
   1ECE DD 7E DF      [19]  562 	ld	a, -33 (ix)
   1ED1 B7            [ 4]  563 	or	a, a
   1ED2 28 20         [12]  564 	jr	Z,00132$
                            565 ;src/text/text.c:175: colorchar[pos]=color3;
   1ED4 DD 7E F7      [19]  566 	ld	a, -9 (ix)
   1ED7 85            [ 4]  567 	add	a, l
   1ED8 6F            [ 4]  568 	ld	l, a
   1ED9 DD 7E F8      [19]  569 	ld	a, -8 (ix)
   1EDC CE 00         [ 7]  570 	adc	a, #0x00
   1EDE 67            [ 4]  571 	ld	h, a
   1EDF DD 7E D3      [19]  572 	ld	a, -45 (ix)
   1EE2 77            [ 7]  573 	ld	(hl), a
                            574 ;src/text/text.c:176: colorchar[pos+FONT2_W]=color3;
   1EE3 DD 7E F7      [19]  575 	ld	a, -9 (ix)
   1EE6 82            [ 4]  576 	add	a, d
   1EE7 5F            [ 4]  577 	ld	e, a
   1EE8 DD 7E F8      [19]  578 	ld	a, -8 (ix)
   1EEB CE 00         [ 7]  579 	adc	a, #0x00
   1EED 57            [ 4]  580 	ld	d, a
   1EEE DD 7E D3      [19]  581 	ld	a, -45 (ix)
   1EF1 12            [ 7]  582 	ld	(de), a
   1EF2 18 45         [12]  583 	jr	00163$
   1EF4                     584 00132$:
                            585 ;src/text/text.c:178: else if(*pChar == 0xff) {
   1EF4 DD 7E DE      [19]  586 	ld	a, -34 (ix)
   1EF7 B7            [ 4]  587 	or	a, a
   1EF8 28 20         [12]  588 	jr	Z,00129$
                            589 ;src/text/text.c:179: colorchar[pos]=color4;
   1EFA DD 7E F9      [19]  590 	ld	a, -7 (ix)
   1EFD 85            [ 4]  591 	add	a, l
   1EFE 6F            [ 4]  592 	ld	l, a
   1EFF DD 7E FA      [19]  593 	ld	a, -6 (ix)
   1F02 CE 00         [ 7]  594 	adc	a, #0x00
   1F04 67            [ 4]  595 	ld	h, a
   1F05 DD 7E D2      [19]  596 	ld	a, -46 (ix)
   1F08 77            [ 7]  597 	ld	(hl), a
                            598 ;src/text/text.c:180: colorchar[pos+FONT2_W]=color4;
   1F09 DD 7E F9      [19]  599 	ld	a, -7 (ix)
   1F0C 82            [ 4]  600 	add	a, d
   1F0D 5F            [ 4]  601 	ld	e, a
   1F0E DD 7E FA      [19]  602 	ld	a, -6 (ix)
   1F11 CE 00         [ 7]  603 	adc	a, #0x00
   1F13 57            [ 4]  604 	ld	d, a
   1F14 DD 7E D2      [19]  605 	ld	a, -46 (ix)
   1F17 12            [ 7]  606 	ld	(de), a
   1F18 18 1F         [12]  607 	jr	00163$
   1F1A                     608 00129$:
                            609 ;src/text/text.c:183: colorchar[pos]=*pChar;
   1F1A DD 7E FB      [19]  610 	ld	a, -5 (ix)
   1F1D 85            [ 4]  611 	add	a, l
   1F1E 6F            [ 4]  612 	ld	l, a
   1F1F DD 7E FC      [19]  613 	ld	a, -4 (ix)
   1F22 CE 00         [ 7]  614 	adc	a, #0x00
   1F24 67            [ 4]  615 	ld	h, a
   1F25 73            [ 7]  616 	ld	(hl), e
                            617 ;src/text/text.c:184: colorchar[pos+FONT2_W]=*pChar;
   1F26 DD 7E FB      [19]  618 	ld	a, -5 (ix)
   1F29 82            [ 4]  619 	add	a, d
   1F2A 5F            [ 4]  620 	ld	e, a
   1F2B DD 7E FC      [19]  621 	ld	a, -4 (ix)
   1F2E CE 00         [ 7]  622 	adc	a, #0x00
   1F30 57            [ 4]  623 	ld	d, a
   1F31 DD 6E D8      [19]  624 	ld	l,-40 (ix)
   1F34 DD 66 D9      [19]  625 	ld	h,-39 (ix)
   1F37 7E            [ 7]  626 	ld	a, (hl)
   1F38 12            [ 7]  627 	ld	(de), a
   1F39                     628 00163$:
                            629 ;src/text/text.c:150: for(i=0;i<18;i++){
   1F39 DD 34 D6      [23]  630 	inc	-42 (ix)
   1F3C DD 7E D6      [19]  631 	ld	a, -42 (ix)
   1F3F D6 12         [ 7]  632 	sub	a, #0x12
   1F41 DA 9C 1D      [10]  633 	jp	C, 00162$
                            634 ;src/text/text.c:193: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   1F44 DD 66 07      [19]  635 	ld	h, 7 (ix)
   1F47 DD 6E 06      [19]  636 	ld	l, 6 (ix)
   1F4A E5            [11]  637 	push	hl
   1F4B 21 00 C0      [10]  638 	ld	hl, #0xc000
   1F4E E5            [11]  639 	push	hl
   1F4F CD 34 25      [17]  640 	call	_cpct_getScreenPtr
                            641 ;src/text/text.c:194: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
   1F52 DD 75 DC      [19]  642 	ld	-36 (ix), l
   1F55 DD 74 DD      [19]  643 	ld	-35 (ix), h
   1F58 DD 7E 0A      [19]  644 	ld	a, 10 (ix)
   1F5B B7            [ 4]  645 	or	a, a
   1F5C 28 1D         [12]  646 	jr	Z,00145$
   1F5E 11 00 02      [10]  647 	ld	de, #_g_tablatrans
   1F61 DD 4E E2      [19]  648 	ld	c,-30 (ix)
   1F64 DD 46 E3      [19]  649 	ld	b,-29 (ix)
   1F67 D5            [11]  650 	push	de
   1F68 DD 56 E4      [19]  651 	ld	d, -28 (ix)
   1F6B 1E 02         [ 7]  652 	ld	e,#0x02
   1F6D D5            [11]  653 	push	de
   1F6E DD 6E DC      [19]  654 	ld	l,-36 (ix)
   1F71 DD 66 DD      [19]  655 	ld	h,-35 (ix)
   1F74 E5            [11]  656 	push	hl
   1F75 C5            [11]  657 	push	bc
   1F76 CD F9 24      [17]  658 	call	_cpct_drawSpriteMaskedAlignedTable
   1F79 18 23         [12]  659 	jr	00146$
   1F7B                     660 00145$:
                            661 ;src/text/text.c:195: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
   1F7B DD 7E E5      [19]  662 	ld	a, -27 (ix)
   1F7E DD 77 DA      [19]  663 	ld	-38 (ix), a
   1F81 DD 7E E6      [19]  664 	ld	a, -26 (ix)
   1F84 DD 77 DB      [19]  665 	ld	-37 (ix), a
   1F87 DD 56 E7      [19]  666 	ld	d, -25 (ix)
   1F8A 1E 02         [ 7]  667 	ld	e,#0x02
   1F8C D5            [11]  668 	push	de
   1F8D DD 6E DC      [19]  669 	ld	l,-36 (ix)
   1F90 DD 66 DD      [19]  670 	ld	h,-35 (ix)
   1F93 E5            [11]  671 	push	hl
   1F94 DD 6E DA      [19]  672 	ld	l,-38 (ix)
   1F97 DD 66 DB      [19]  673 	ld	h,-37 (ix)
   1F9A E5            [11]  674 	push	hl
   1F9B CD 71 21      [17]  675 	call	_cpct_drawSprite
   1F9E                     676 00146$:
                            677 ;src/text/text.c:198: if(character == 48 || character == 60 || character == 57) xPos--;
   1F9E DD 7E AD      [19]  678 	ld	a, -83 (ix)
   1FA1 D6 30         [ 7]  679 	sub	a, #0x30
   1FA3 28 0E         [12]  680 	jr	Z,00147$
   1FA5 DD 7E AD      [19]  681 	ld	a, -83 (ix)
   1FA8 D6 3C         [ 7]  682 	sub	a, #0x3c
   1FAA 28 07         [12]  683 	jr	Z,00147$
   1FAC DD 7E AD      [19]  684 	ld	a, -83 (ix)
   1FAF D6 39         [ 7]  685 	sub	a, #0x39
   1FB1 20 03         [12]  686 	jr	NZ,00152$
   1FB3                     687 00147$:
   1FB3 DD 35 06      [23]  688 	dec	6 (ix)
   1FB6                     689 00152$:
                            690 ;src/text/text.c:201: character = text[++x];
   1FB6 DD 34 D7      [23]  691 	inc	-41 (ix)
   1FB9 DD 7E FE      [19]  692 	ld	a, -2 (ix)
   1FBC DD 86 D7      [19]  693 	add	a, -41 (ix)
   1FBF 6F            [ 4]  694 	ld	l, a
   1FC0 DD 7E FF      [19]  695 	ld	a, -1 (ix)
   1FC3 CE 00         [ 7]  696 	adc	a, #0x00
   1FC5 67            [ 4]  697 	ld	h, a
   1FC6 7E            [ 7]  698 	ld	a, (hl)
   1FC7 DD 77 FD      [19]  699 	ld	-3 (ix), a
                            700 ;src/text/text.c:202: xPos+=FONT2_W;
   1FCA DD 34 06      [23]  701 	inc	6 (ix)
   1FCD DD 34 06      [23]  702 	inc	6 (ix)
   1FD0 C3 C8 1C      [10]  703 	jp	00159$
   1FD3                     704 00164$:
   1FD3 DD F9         [10]  705 	ld	sp, ix
   1FD5 DD E1         [14]  706 	pop	ix
   1FD7 C9            [10]  707 	ret
                            708 	.area _CODE
                            709 	.area _INITIALIZER
                            710 	.area _CABS (ABS)
