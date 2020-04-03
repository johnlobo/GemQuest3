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
   1E57                      53 _strLength::
                             54 ;src/text/text.c:61: while (str[result] != '\0') {
   1E57 0E 00         [ 7]   55 	ld	c, #0x00
   1E59                      56 00101$:
   1E59 21 02 00      [10]   57 	ld	hl, #2
   1E5C 39            [11]   58 	add	hl, sp
   1E5D 7E            [ 7]   59 	ld	a, (hl)
   1E5E 23            [ 6]   60 	inc	hl
   1E5F 66            [ 7]   61 	ld	h, (hl)
   1E60 6F            [ 4]   62 	ld	l, a
   1E61 06 00         [ 7]   63 	ld	b, #0x00
   1E63 09            [11]   64 	add	hl, bc
   1E64 7E            [ 7]   65 	ld	a, (hl)
   1E65 B7            [ 4]   66 	or	a, a
   1E66 28 03         [12]   67 	jr	Z,00103$
                             68 ;src/text/text.c:62: result++;
   1E68 0C            [ 4]   69 	inc	c
   1E69 18 EE         [12]   70 	jr	00101$
   1E6B                      71 00103$:
                             72 ;src/text/text.c:64: return result;
   1E6B 69            [ 4]   73 	ld	l, c
   1E6C C9            [10]   74 	ret
   1E6D                      75 _swapColors:
   1E6D 55                   76 	.db #0x55	; 85	'U'
   1E6E EE                   77 	.db #0xee	; 238
   1E6F DD                   78 	.db #0xdd	; 221
   1E70 FF                   79 	.db #0xff	; 255
   1E71 14                   80 	.db #0x14	; 20
   1E72 6C                   81 	.db #0x6c	; 108	'l'
   1E73 9C                   82 	.db #0x9c	; 156
   1E74 3C                   83 	.db #0x3c	; 60
   1E75 50                   84 	.db #0x50	; 80	'P'
   1E76 E4                   85 	.db #0xe4	; 228
   1E77 D8                   86 	.db #0xd8	; 216
   1E78 F0                   87 	.db #0xf0	; 240
   1E79 11                   88 	.db #0x11	; 17
   1E7A 66                   89 	.db #0x66	; 102	'f'
   1E7B 99                   90 	.db #0x99	; 153
   1E7C 33                   91 	.db #0x33	; 51	'3'
   1E7D 10                   92 	.db #0x10	; 16
   1E7E 35                   93 	.db #0x35	; 53	'5'
   1E7F 3A                   94 	.db #0x3a	; 58
   1E80 30                   95 	.db #0x30	; 48	'0'
   1E81 45                   96 	.db #0x45	; 69	'E'
   1E82 CE                   97 	.db #0xce	; 206
   1E83 CD                   98 	.db #0xcd	; 205
   1E84 CF                   99 	.db #0xcf	; 207
                            100 ;src/text/text.c:78: void strCopy(u8 source[], u8 dest[]) 
                            101 ;	---------------------------------
                            102 ; Function strCopy
                            103 ; ---------------------------------
   1E85                     104 _strCopy::
   1E85 DD E5         [15]  105 	push	ix
   1E87 DD 21 00 00   [14]  106 	ld	ix,#0
   1E8B DD 39         [15]  107 	add	ix,sp
                            108 ;src/text/text.c:81: while ((dest[i] = source[i]) != '\0')
   1E8D 0E 00         [ 7]  109 	ld	c, #0x00
   1E8F                     110 00101$:
   1E8F DD 7E 06      [19]  111 	ld	a, 6 (ix)
   1E92 81            [ 4]  112 	add	a, c
   1E93 5F            [ 4]  113 	ld	e, a
   1E94 DD 7E 07      [19]  114 	ld	a, 7 (ix)
   1E97 CE 00         [ 7]  115 	adc	a, #0x00
   1E99 57            [ 4]  116 	ld	d, a
   1E9A DD 6E 04      [19]  117 	ld	l,4 (ix)
   1E9D DD 66 05      [19]  118 	ld	h,5 (ix)
   1EA0 06 00         [ 7]  119 	ld	b, #0x00
   1EA2 09            [11]  120 	add	hl, bc
   1EA3 7E            [ 7]  121 	ld	a, (hl)
   1EA4 12            [ 7]  122 	ld	(de), a
   1EA5 B7            [ 4]  123 	or	a, a
   1EA6 28 03         [12]  124 	jr	Z,00104$
                            125 ;src/text/text.c:83: i++;
   1EA8 0C            [ 4]  126 	inc	c
   1EA9 18 E4         [12]  127 	jr	00101$
   1EAB                     128 00104$:
   1EAB DD E1         [14]  129 	pop	ix
   1EAD C9            [10]  130 	ret
                            131 ;src/text/text.c:88: void drawText(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
                            132 ;	---------------------------------
                            133 ; Function drawText
                            134 ; ---------------------------------
   1EAE                     135 _drawText::
   1EAE DD E5         [15]  136 	push	ix
   1EB0 DD 21 00 00   [14]  137 	ld	ix,#0
   1EB4 DD 39         [15]  138 	add	ix,sp
   1EB6 21 AD FF      [10]  139 	ld	hl, #-83
   1EB9 39            [11]  140 	add	hl, sp
   1EBA F9            [ 6]  141 	ld	sp, hl
                            142 ;src/text/text.c:100: color1 = swapColors[color][0];
   1EBB 01 6D 1E      [10]  143 	ld	bc, #_swapColors+0
   1EBE DD 6E 08      [19]  144 	ld	l, 8 (ix)
   1EC1 26 00         [ 7]  145 	ld	h, #0x00
   1EC3 29            [11]  146 	add	hl, hl
   1EC4 29            [11]  147 	add	hl, hl
   1EC5 09            [11]  148 	add	hl, bc
   1EC6 E5            [11]  149 	push	hl
   1EC7 FD E1         [14]  150 	pop	iy
   1EC9 FD 7E 00      [19]  151 	ld	a, 0 (iy)
   1ECC DD 77 D5      [19]  152 	ld	-43 (ix), a
                            153 ;src/text/text.c:101: color2 = swapColors[color][1];
   1ECF FD E5         [15]  154 	push	iy
   1ED1 E1            [10]  155 	pop	hl
   1ED2 23            [ 6]  156 	inc	hl
   1ED3 7E            [ 7]  157 	ld	a, (hl)
   1ED4 DD 77 D4      [19]  158 	ld	-44 (ix), a
                            159 ;src/text/text.c:102: color3 = swapColors[color][2];
   1ED7 FD E5         [15]  160 	push	iy
   1ED9 E1            [10]  161 	pop	hl
   1EDA 23            [ 6]  162 	inc	hl
   1EDB 23            [ 6]  163 	inc	hl
   1EDC 7E            [ 7]  164 	ld	a, (hl)
   1EDD DD 77 D3      [19]  165 	ld	-45 (ix), a
                            166 ;src/text/text.c:103: color4 = swapColors[color][3];
   1EE0 FD 7E 03      [19]  167 	ld	a, 3 (iy)
   1EE3 DD 77 D2      [19]  168 	ld	-46 (ix), a
                            169 ;src/text/text.c:108: character = text[x];
   1EE6 DD 7E 04      [19]  170 	ld	a, 4 (ix)
   1EE9 DD 77 FE      [19]  171 	ld	-2 (ix), a
   1EEC DD 7E 05      [19]  172 	ld	a, 5 (ix)
   1EEF DD 77 FF      [19]  173 	ld	-1 (ix), a
   1EF2 DD 6E FE      [19]  174 	ld	l,-2 (ix)
   1EF5 DD 66 FF      [19]  175 	ld	h,-1 (ix)
   1EF8 7E            [ 7]  176 	ld	a, (hl)
   1EF9 DD 77 FD      [19]  177 	ld	-3 (ix), a
                            178 ;src/text/text.c:110: while (character != '\0') {
   1EFC 21 01 00      [10]  179 	ld	hl, #0x0001
   1EFF 39            [11]  180 	add	hl, sp
   1F00 DD 75 FB      [19]  181 	ld	-5 (ix), l
   1F03 DD 74 FC      [19]  182 	ld	-4 (ix), h
   1F06 DD 7E FB      [19]  183 	ld	a, -5 (ix)
   1F09 DD 77 F9      [19]  184 	ld	-7 (ix), a
   1F0C DD 7E FC      [19]  185 	ld	a, -4 (ix)
   1F0F DD 77 FA      [19]  186 	ld	-6 (ix), a
   1F12 DD 7E FB      [19]  187 	ld	a, -5 (ix)
   1F15 DD 77 F7      [19]  188 	ld	-9 (ix), a
   1F18 DD 7E FC      [19]  189 	ld	a, -4 (ix)
   1F1B DD 77 F8      [19]  190 	ld	-8 (ix), a
   1F1E DD 7E FB      [19]  191 	ld	a, -5 (ix)
   1F21 DD 77 F5      [19]  192 	ld	-11 (ix), a
   1F24 DD 7E FC      [19]  193 	ld	a, -4 (ix)
   1F27 DD 77 F6      [19]  194 	ld	-10 (ix), a
   1F2A DD 7E FB      [19]  195 	ld	a, -5 (ix)
   1F2D DD 77 F3      [19]  196 	ld	-13 (ix), a
   1F30 DD 7E FC      [19]  197 	ld	a, -4 (ix)
   1F33 DD 77 F4      [19]  198 	ld	-12 (ix), a
   1F36 DD 7E FB      [19]  199 	ld	a, -5 (ix)
   1F39 DD 77 F1      [19]  200 	ld	-15 (ix), a
   1F3C DD 7E FC      [19]  201 	ld	a, -4 (ix)
   1F3F DD 77 F2      [19]  202 	ld	-14 (ix), a
   1F42 DD 7E FB      [19]  203 	ld	a, -5 (ix)
   1F45 DD 77 EF      [19]  204 	ld	-17 (ix), a
   1F48 DD 7E FC      [19]  205 	ld	a, -4 (ix)
   1F4B DD 77 F0      [19]  206 	ld	-16 (ix), a
   1F4E DD 7E FB      [19]  207 	ld	a, -5 (ix)
   1F51 DD 77 ED      [19]  208 	ld	-19 (ix), a
   1F54 DD 7E FC      [19]  209 	ld	a, -4 (ix)
   1F57 DD 77 EE      [19]  210 	ld	-18 (ix), a
   1F5A DD 7E FB      [19]  211 	ld	a, -5 (ix)
   1F5D DD 77 EB      [19]  212 	ld	-21 (ix), a
   1F60 DD 7E FC      [19]  213 	ld	a, -4 (ix)
   1F63 DD 77 EC      [19]  214 	ld	-20 (ix), a
   1F66 DD 7E FB      [19]  215 	ld	a, -5 (ix)
   1F69 DD 77 E9      [19]  216 	ld	-23 (ix), a
   1F6C DD 7E FC      [19]  217 	ld	a, -4 (ix)
   1F6F DD 77 EA      [19]  218 	ld	-22 (ix), a
   1F72 DD 7E 09      [19]  219 	ld	a, 9 (ix)
   1F75 3D            [ 4]  220 	dec	a
   1F76 20 04         [12]  221 	jr	NZ,00304$
   1F78 3E 01         [ 7]  222 	ld	a,#0x01
   1F7A 18 01         [12]  223 	jr	00305$
   1F7C                     224 00304$:
   1F7C AF            [ 4]  225 	xor	a,a
   1F7D                     226 00305$:
   1F7D DD 77 E8      [19]  227 	ld	-24 (ix), a
   1F80 DD 7E 09      [19]  228 	ld	a, 9 (ix)
   1F83 4F            [ 4]  229 	ld	c, a
   1F84 87            [ 4]  230 	add	a, a
   1F85 87            [ 4]  231 	add	a, a
   1F86 87            [ 4]  232 	add	a, a
   1F87 81            [ 4]  233 	add	a, c
   1F88 DD 77 E7      [19]  234 	ld	-25 (ix), a
   1F8B DD 7E FB      [19]  235 	ld	a, -5 (ix)
   1F8E DD 77 E5      [19]  236 	ld	-27 (ix), a
   1F91 DD 7E FC      [19]  237 	ld	a, -4 (ix)
   1F94 DD 77 E6      [19]  238 	ld	-26 (ix), a
   1F97 DD 7E E7      [19]  239 	ld	a, -25 (ix)
   1F9A DD 77 E4      [19]  240 	ld	-28 (ix), a
   1F9D DD 7E FB      [19]  241 	ld	a, -5 (ix)
   1FA0 DD 77 E2      [19]  242 	ld	-30 (ix), a
   1FA3 DD 7E FC      [19]  243 	ld	a, -4 (ix)
   1FA6 DD 77 E3      [19]  244 	ld	-29 (ix), a
   1FA9 DD 36 D7 00   [19]  245 	ld	-41 (ix), #0x00
   1FAD                     246 00159$:
   1FAD DD 7E FD      [19]  247 	ld	a, -3 (ix)
   1FB0 B7            [ 4]  248 	or	a, a
   1FB1 CA B8 22      [10]  249 	jp	Z, 00164$
                            250 ;src/text/text.c:113: if ((character == 33) || ((character>43) && (character<47)) || 
   1FB4 DD 7E FD      [19]  251 	ld	a, -3 (ix)
   1FB7 D6 21         [ 7]  252 	sub	a, #0x21
   1FB9 20 04         [12]  253 	jr	NZ,00306$
   1FBB 3E 01         [ 7]  254 	ld	a,#0x01
   1FBD 18 01         [12]  255 	jr	00307$
   1FBF                     256 00306$:
   1FBF AF            [ 4]  257 	xor	a,a
   1FC0                     258 00307$:
   1FC0 4F            [ 4]  259 	ld	c,a
   1FC1 B7            [ 4]  260 	or	a, a
   1FC2 20 2C         [12]  261 	jr	NZ,00151$
   1FC4 3E 2B         [ 7]  262 	ld	a, #0x2b
   1FC6 DD 96 FD      [19]  263 	sub	a, -3 (ix)
   1FC9 30 07         [12]  264 	jr	NC,00156$
   1FCB DD 7E FD      [19]  265 	ld	a, -3 (ix)
   1FCE D6 2F         [ 7]  266 	sub	a, #0x2f
   1FD0 38 1E         [12]  267 	jr	C,00151$
   1FD2                     268 00156$:
                            269 ;src/text/text.c:114: ((character>47) && (character<58)) || ((character>62) && (character<91))) { //Allowed characters
   1FD2 3E 2F         [ 7]  270 	ld	a, #0x2f
   1FD4 DD 96 FD      [19]  271 	sub	a, -3 (ix)
   1FD7 30 07         [12]  272 	jr	NC,00158$
   1FD9 DD 7E FD      [19]  273 	ld	a, -3 (ix)
   1FDC D6 3A         [ 7]  274 	sub	a, #0x3a
   1FDE 38 10         [12]  275 	jr	C,00151$
   1FE0                     276 00158$:
   1FE0 3E 3E         [ 7]  277 	ld	a, #0x3e
   1FE2 DD 96 FD      [19]  278 	sub	a, -3 (ix)
   1FE5 D2 9B 22      [10]  279 	jp	NC, 00152$
   1FE8 DD 7E FD      [19]  280 	ld	a, -3 (ix)
   1FEB D6 5B         [ 7]  281 	sub	a, #0x5b
   1FED D2 9B 22      [10]  282 	jp	NC, 00152$
   1FF0                     283 00151$:
                            284 ;src/text/text.c:118: switch(character){
   1FF0 79            [ 4]  285 	ld	a, c
   1FF1 B7            [ 4]  286 	or	a, a
   1FF2 20 5D         [12]  287 	jr	NZ,00101$
   1FF4 DD 7E FD      [19]  288 	ld	a, -3 (ix)
   1FF7 D6 2C         [ 7]  289 	sub	a, #0x2c
   1FF9 28 5C         [12]  290 	jr	Z,00104$
   1FFB DD 7E FD      [19]  291 	ld	a, -3 (ix)
   1FFE D6 2D         [ 7]  292 	sub	a, #0x2d
   2000 28 55         [12]  293 	jr	Z,00104$
   2002 DD 7E FD      [19]  294 	ld	a, -3 (ix)
   2005 D6 2E         [ 7]  295 	sub	a, #0x2e
   2007 28 4E         [12]  296 	jr	Z,00104$
   2009 DD 7E FD      [19]  297 	ld	a, -3 (ix)
   200C D6 30         [ 7]  298 	sub	a, #0x30
   200E 28 51         [12]  299 	jr	Z,00114$
   2010 DD 7E FD      [19]  300 	ld	a, -3 (ix)
   2013 D6 31         [ 7]  301 	sub	a, #0x31
   2015 28 4A         [12]  302 	jr	Z,00114$
   2017 DD 7E FD      [19]  303 	ld	a, -3 (ix)
   201A D6 32         [ 7]  304 	sub	a, #0x32
   201C 28 43         [12]  305 	jr	Z,00114$
   201E DD 7E FD      [19]  306 	ld	a, -3 (ix)
   2021 D6 33         [ 7]  307 	sub	a, #0x33
   2023 28 3C         [12]  308 	jr	Z,00114$
   2025 DD 7E FD      [19]  309 	ld	a, -3 (ix)
   2028 D6 34         [ 7]  310 	sub	a, #0x34
   202A 28 35         [12]  311 	jr	Z,00114$
   202C DD 7E FD      [19]  312 	ld	a, -3 (ix)
   202F D6 35         [ 7]  313 	sub	a, #0x35
   2031 28 2E         [12]  314 	jr	Z,00114$
   2033 DD 7E FD      [19]  315 	ld	a, -3 (ix)
   2036 D6 36         [ 7]  316 	sub	a, #0x36
   2038 28 27         [12]  317 	jr	Z,00114$
   203A DD 7E FD      [19]  318 	ld	a, -3 (ix)
   203D D6 37         [ 7]  319 	sub	a, #0x37
   203F 28 20         [12]  320 	jr	Z,00114$
   2041 DD 7E FD      [19]  321 	ld	a, -3 (ix)
   2044 D6 38         [ 7]  322 	sub	a, #0x38
   2046 28 19         [12]  323 	jr	Z,00114$
   2048 DD 7E FD      [19]  324 	ld	a, -3 (ix)
   204B D6 39         [ 7]  325 	sub	a, #0x39
   204D 28 12         [12]  326 	jr	Z,00114$
   204F 18 18         [12]  327 	jr	00115$
                            328 ;src/text/text.c:120: case 33:
   2051                     329 00101$:
                            330 ;src/text/text.c:121: character=49;
   2051 DD 36 FD 31   [19]  331 	ld	-3 (ix), #0x31
                            332 ;src/text/text.c:122: break;
   2055 18 12         [12]  333 	jr	00115$
                            334 ;src/text/text.c:127: case 46:
   2057                     335 00104$:
                            336 ;src/text/text.c:128: character+=6;
   2057 DD 7E FD      [19]  337 	ld	a, -3 (ix)
   205A C6 06         [ 7]  338 	add	a, #0x06
   205C DD 77 FD      [19]  339 	ld	-3 (ix), a
                            340 ;src/text/text.c:129: break;
   205F 18 08         [12]  341 	jr	00115$
                            342 ;src/text/text.c:141: case 57:
   2061                     343 00114$:
                            344 ;src/text/text.c:142: character+=5;
   2061 DD 7E FD      [19]  345 	ld	a, -3 (ix)
   2064 C6 05         [ 7]  346 	add	a, #0x05
   2066 DD 77 FD      [19]  347 	ld	-3 (ix), a
                            348 ;src/text/text.c:144: }
   2069                     349 00115$:
                            350 ;src/text/text.c:147: character-=49;
   2069 DD 7E FD      [19]  351 	ld	a, -3 (ix)
   206C C6 CF         [ 7]  352 	add	a, #0xcf
                            353 ;src/text/text.c:150: for(i=0;i<18;i++){
   206E DD 77 AD      [19]  354 	ld	-83 (ix), a
   2071 4F            [ 4]  355 	ld	c, a
   2072 06 00         [ 7]  356 	ld	b,#0x00
   2074 69            [ 4]  357 	ld	l, c
   2075 60            [ 4]  358 	ld	h, b
   2076 29            [11]  359 	add	hl, hl
   2077 29            [11]  360 	add	hl, hl
   2078 29            [11]  361 	add	hl, hl
   2079 09            [11]  362 	add	hl, bc
   207A 29            [11]  363 	add	hl, hl
   207B 4D            [ 4]  364 	ld	c, l
   207C 44            [ 4]  365 	ld	b, h
   207D DD 36 D6 00   [19]  366 	ld	-42 (ix), #0x00
   2081                     367 00162$:
                            368 ;src/text/text.c:151: pChar = (u8*) g_font_chars + (character*18) + i;
   2081 21 00 10      [10]  369 	ld	hl, #_g_font_chars
   2084 09            [11]  370 	add	hl, bc
   2085 DD 5E D6      [19]  371 	ld	e,-42 (ix)
   2088 16 00         [ 7]  372 	ld	d,#0x00
   208A 19            [11]  373 	add	hl, de
                            374 ;src/text/text.c:155: if(*pChar == 0x55) colorchar[i]=color1;
   208B DD 75 D8      [19]  375 	ld	-40 (ix), l
   208E DD 74 D9      [19]  376 	ld	-39 (ix), h
   2091 5E            [ 7]  377 	ld	e, (hl)
   2092 7B            [ 4]  378 	ld	a, e
   2093 D6 55         [ 7]  379 	sub	a, #0x55
   2095 20 04         [12]  380 	jr	NZ,00321$
   2097 3E 01         [ 7]  381 	ld	a,#0x01
   2099 18 01         [12]  382 	jr	00322$
   209B                     383 00321$:
   209B AF            [ 4]  384 	xor	a,a
   209C                     385 00322$:
   209C DD 77 E1      [19]  386 	ld	-31 (ix), a
                            387 ;src/text/text.c:156: else if(*pChar == 0xee) colorchar[i]=color2;
   209F 7B            [ 4]  388 	ld	a, e
   20A0 D6 EE         [ 7]  389 	sub	a, #0xee
   20A2 20 04         [12]  390 	jr	NZ,00323$
   20A4 3E 01         [ 7]  391 	ld	a,#0x01
   20A6 18 01         [12]  392 	jr	00324$
   20A8                     393 00323$:
   20A8 AF            [ 4]  394 	xor	a,a
   20A9                     395 00324$:
   20A9 DD 77 E0      [19]  396 	ld	-32 (ix), a
                            397 ;src/text/text.c:157: else if(*pChar == 0xdd) colorchar[i]=color3;
   20AC 7B            [ 4]  398 	ld	a, e
   20AD D6 DD         [ 7]  399 	sub	a, #0xdd
   20AF 20 04         [12]  400 	jr	NZ,00325$
   20B1 3E 01         [ 7]  401 	ld	a,#0x01
   20B3 18 01         [12]  402 	jr	00326$
   20B5                     403 00325$:
   20B5 AF            [ 4]  404 	xor	a,a
   20B6                     405 00326$:
   20B6 DD 77 DF      [19]  406 	ld	-33 (ix), a
                            407 ;src/text/text.c:158: else if(*pChar == 0xff) colorchar[i]=color4;
   20B9 7B            [ 4]  408 	ld	a, e
   20BA 3C            [ 4]  409 	inc	a
   20BB 20 04         [12]  410 	jr	NZ,00327$
   20BD 3E 01         [ 7]  411 	ld	a,#0x01
   20BF 18 01         [12]  412 	jr	00328$
   20C1                     413 00327$:
   20C1 AF            [ 4]  414 	xor	a,a
   20C2                     415 00328$:
   20C2 DD 77 DE      [19]  416 	ld	-34 (ix), a
                            417 ;src/text/text.c:153: if(size==1) {
   20C5 DD 7E E8      [19]  418 	ld	a, -24 (ix)
   20C8 B7            [ 4]  419 	or	a, a
   20C9 CA 45 21      [10]  420 	jp	Z, 00141$
                            421 ;src/text/text.c:155: if(*pChar == 0x55) colorchar[i]=color1;
   20CC DD 7E E1      [19]  422 	ld	a, -31 (ix)
   20CF B7            [ 4]  423 	or	a, a
   20D0 28 14         [12]  424 	jr	Z,00126$
   20D2 DD 7E E9      [19]  425 	ld	a, -23 (ix)
   20D5 DD 86 D6      [19]  426 	add	a, -42 (ix)
   20D8 5F            [ 4]  427 	ld	e, a
   20D9 DD 7E EA      [19]  428 	ld	a, -22 (ix)
   20DC CE 00         [ 7]  429 	adc	a, #0x00
   20DE 57            [ 4]  430 	ld	d, a
   20DF DD 7E D5      [19]  431 	ld	a, -43 (ix)
   20E2 12            [ 7]  432 	ld	(de), a
   20E3 C3 1E 22      [10]  433 	jp	00163$
   20E6                     434 00126$:
                            435 ;src/text/text.c:156: else if(*pChar == 0xee) colorchar[i]=color2;
   20E6 DD 7E E0      [19]  436 	ld	a, -32 (ix)
   20E9 B7            [ 4]  437 	or	a, a
   20EA 28 14         [12]  438 	jr	Z,00123$
   20EC DD 7E EB      [19]  439 	ld	a, -21 (ix)
   20EF DD 86 D6      [19]  440 	add	a, -42 (ix)
   20F2 5F            [ 4]  441 	ld	e, a
   20F3 DD 7E EC      [19]  442 	ld	a, -20 (ix)
   20F6 CE 00         [ 7]  443 	adc	a, #0x00
   20F8 57            [ 4]  444 	ld	d, a
   20F9 DD 7E D4      [19]  445 	ld	a, -44 (ix)
   20FC 12            [ 7]  446 	ld	(de), a
   20FD C3 1E 22      [10]  447 	jp	00163$
   2100                     448 00123$:
                            449 ;src/text/text.c:157: else if(*pChar == 0xdd) colorchar[i]=color3;
   2100 DD 7E DF      [19]  450 	ld	a, -33 (ix)
   2103 B7            [ 4]  451 	or	a, a
   2104 28 14         [12]  452 	jr	Z,00120$
   2106 DD 7E ED      [19]  453 	ld	a, -19 (ix)
   2109 DD 86 D6      [19]  454 	add	a, -42 (ix)
   210C 5F            [ 4]  455 	ld	e, a
   210D DD 7E EE      [19]  456 	ld	a, -18 (ix)
   2110 CE 00         [ 7]  457 	adc	a, #0x00
   2112 57            [ 4]  458 	ld	d, a
   2113 DD 7E D3      [19]  459 	ld	a, -45 (ix)
   2116 12            [ 7]  460 	ld	(de), a
   2117 C3 1E 22      [10]  461 	jp	00163$
   211A                     462 00120$:
                            463 ;src/text/text.c:158: else if(*pChar == 0xff) colorchar[i]=color4;
   211A DD 7E DE      [19]  464 	ld	a, -34 (ix)
   211D B7            [ 4]  465 	or	a, a
   211E 28 14         [12]  466 	jr	Z,00117$
   2120 DD 7E EF      [19]  467 	ld	a, -17 (ix)
   2123 DD 86 D6      [19]  468 	add	a, -42 (ix)
   2126 5F            [ 4]  469 	ld	e, a
   2127 DD 7E F0      [19]  470 	ld	a, -16 (ix)
   212A CE 00         [ 7]  471 	adc	a, #0x00
   212C 57            [ 4]  472 	ld	d, a
   212D DD 7E D2      [19]  473 	ld	a, -46 (ix)
   2130 12            [ 7]  474 	ld	(de), a
   2131 C3 1E 22      [10]  475 	jp	00163$
   2134                     476 00117$:
                            477 ;src/text/text.c:159: else colorchar[i]=*pChar;
   2134 DD 7E F1      [19]  478 	ld	a, -15 (ix)
   2137 DD 86 D6      [19]  479 	add	a, -42 (ix)
   213A 6F            [ 4]  480 	ld	l, a
   213B DD 7E F2      [19]  481 	ld	a, -14 (ix)
   213E CE 00         [ 7]  482 	adc	a, #0x00
   2140 67            [ 4]  483 	ld	h, a
   2141 73            [ 7]  484 	ld	(hl), e
   2142 C3 1E 22      [10]  485 	jp	00163$
   2145                     486 00141$:
                            487 ;src/text/text.c:164: pos=(i*size)-(i%FONT2_W);
   2145 D5            [11]  488 	push	de
   2146 C5            [11]  489 	push	bc
   2147 DD 5E 09      [19]  490 	ld	e, 9 (ix)
   214A DD 66 D6      [19]  491 	ld	h, -42 (ix)
   214D 2E 00         [ 7]  492 	ld	l, #0x00
   214F 55            [ 4]  493 	ld	d, l
   2150 06 08         [ 7]  494 	ld	b, #0x08
   2152                     495 00329$:
   2152 29            [11]  496 	add	hl, hl
   2153 30 01         [12]  497 	jr	NC,00330$
   2155 19            [11]  498 	add	hl, de
   2156                     499 00330$:
   2156 10 FA         [13]  500 	djnz	00329$
   2158 C1            [10]  501 	pop	bc
   2159 D1            [10]  502 	pop	de
   215A DD 7E D6      [19]  503 	ld	a, -42 (ix)
   215D E6 01         [ 7]  504 	and	a, #0x01
   215F 57            [ 4]  505 	ld	d, a
   2160 7D            [ 4]  506 	ld	a, l
   2161 92            [ 4]  507 	sub	a, d
   2162 6F            [ 4]  508 	ld	l, a
                            509 ;src/text/text.c:168: colorchar[pos+FONT2_W]=color1;
   2163 55            [ 4]  510 	ld	d, l
   2164 14            [ 4]  511 	inc	d
   2165 14            [ 4]  512 	inc	d
                            513 ;src/text/text.c:166: if(*pChar == 0x55) {
   2166 DD 7E E1      [19]  514 	ld	a, -31 (ix)
   2169 B7            [ 4]  515 	or	a, a
   216A 28 21         [12]  516 	jr	Z,00138$
                            517 ;src/text/text.c:167: colorchar[pos]=color1;
   216C DD 7E F3      [19]  518 	ld	a, -13 (ix)
   216F 85            [ 4]  519 	add	a, l
   2170 6F            [ 4]  520 	ld	l, a
   2171 DD 7E F4      [19]  521 	ld	a, -12 (ix)
   2174 CE 00         [ 7]  522 	adc	a, #0x00
   2176 67            [ 4]  523 	ld	h, a
   2177 DD 7E D5      [19]  524 	ld	a, -43 (ix)
   217A 77            [ 7]  525 	ld	(hl), a
                            526 ;src/text/text.c:168: colorchar[pos+FONT2_W]=color1;
   217B DD 7E F3      [19]  527 	ld	a, -13 (ix)
   217E 82            [ 4]  528 	add	a, d
   217F 5F            [ 4]  529 	ld	e, a
   2180 DD 7E F4      [19]  530 	ld	a, -12 (ix)
   2183 CE 00         [ 7]  531 	adc	a, #0x00
   2185 57            [ 4]  532 	ld	d, a
   2186 DD 7E D5      [19]  533 	ld	a, -43 (ix)
   2189 12            [ 7]  534 	ld	(de), a
   218A C3 1E 22      [10]  535 	jp	00163$
   218D                     536 00138$:
                            537 ;src/text/text.c:170: else if(*pChar == 0xee) {
   218D DD 7E E0      [19]  538 	ld	a, -32 (ix)
   2190 B7            [ 4]  539 	or	a, a
   2191 28 20         [12]  540 	jr	Z,00135$
                            541 ;src/text/text.c:171: colorchar[pos]=color2;
   2193 DD 7E F5      [19]  542 	ld	a, -11 (ix)
   2196 85            [ 4]  543 	add	a, l
   2197 6F            [ 4]  544 	ld	l, a
   2198 DD 7E F6      [19]  545 	ld	a, -10 (ix)
   219B CE 00         [ 7]  546 	adc	a, #0x00
   219D 67            [ 4]  547 	ld	h, a
   219E DD 7E D4      [19]  548 	ld	a, -44 (ix)
   21A1 77            [ 7]  549 	ld	(hl), a
                            550 ;src/text/text.c:172: colorchar[pos+FONT2_W]=color2;
   21A2 DD 7E F5      [19]  551 	ld	a, -11 (ix)
   21A5 82            [ 4]  552 	add	a, d
   21A6 5F            [ 4]  553 	ld	e, a
   21A7 DD 7E F6      [19]  554 	ld	a, -10 (ix)
   21AA CE 00         [ 7]  555 	adc	a, #0x00
   21AC 57            [ 4]  556 	ld	d, a
   21AD DD 7E D4      [19]  557 	ld	a, -44 (ix)
   21B0 12            [ 7]  558 	ld	(de), a
   21B1 18 6B         [12]  559 	jr	00163$
   21B3                     560 00135$:
                            561 ;src/text/text.c:174: else if(*pChar == 0xdd) {
   21B3 DD 7E DF      [19]  562 	ld	a, -33 (ix)
   21B6 B7            [ 4]  563 	or	a, a
   21B7 28 20         [12]  564 	jr	Z,00132$
                            565 ;src/text/text.c:175: colorchar[pos]=color3;
   21B9 DD 7E F7      [19]  566 	ld	a, -9 (ix)
   21BC 85            [ 4]  567 	add	a, l
   21BD 6F            [ 4]  568 	ld	l, a
   21BE DD 7E F8      [19]  569 	ld	a, -8 (ix)
   21C1 CE 00         [ 7]  570 	adc	a, #0x00
   21C3 67            [ 4]  571 	ld	h, a
   21C4 DD 7E D3      [19]  572 	ld	a, -45 (ix)
   21C7 77            [ 7]  573 	ld	(hl), a
                            574 ;src/text/text.c:176: colorchar[pos+FONT2_W]=color3;
   21C8 DD 7E F7      [19]  575 	ld	a, -9 (ix)
   21CB 82            [ 4]  576 	add	a, d
   21CC 5F            [ 4]  577 	ld	e, a
   21CD DD 7E F8      [19]  578 	ld	a, -8 (ix)
   21D0 CE 00         [ 7]  579 	adc	a, #0x00
   21D2 57            [ 4]  580 	ld	d, a
   21D3 DD 7E D3      [19]  581 	ld	a, -45 (ix)
   21D6 12            [ 7]  582 	ld	(de), a
   21D7 18 45         [12]  583 	jr	00163$
   21D9                     584 00132$:
                            585 ;src/text/text.c:178: else if(*pChar == 0xff) {
   21D9 DD 7E DE      [19]  586 	ld	a, -34 (ix)
   21DC B7            [ 4]  587 	or	a, a
   21DD 28 20         [12]  588 	jr	Z,00129$
                            589 ;src/text/text.c:179: colorchar[pos]=color4;
   21DF DD 7E F9      [19]  590 	ld	a, -7 (ix)
   21E2 85            [ 4]  591 	add	a, l
   21E3 6F            [ 4]  592 	ld	l, a
   21E4 DD 7E FA      [19]  593 	ld	a, -6 (ix)
   21E7 CE 00         [ 7]  594 	adc	a, #0x00
   21E9 67            [ 4]  595 	ld	h, a
   21EA DD 7E D2      [19]  596 	ld	a, -46 (ix)
   21ED 77            [ 7]  597 	ld	(hl), a
                            598 ;src/text/text.c:180: colorchar[pos+FONT2_W]=color4;
   21EE DD 7E F9      [19]  599 	ld	a, -7 (ix)
   21F1 82            [ 4]  600 	add	a, d
   21F2 5F            [ 4]  601 	ld	e, a
   21F3 DD 7E FA      [19]  602 	ld	a, -6 (ix)
   21F6 CE 00         [ 7]  603 	adc	a, #0x00
   21F8 57            [ 4]  604 	ld	d, a
   21F9 DD 7E D2      [19]  605 	ld	a, -46 (ix)
   21FC 12            [ 7]  606 	ld	(de), a
   21FD 18 1F         [12]  607 	jr	00163$
   21FF                     608 00129$:
                            609 ;src/text/text.c:183: colorchar[pos]=*pChar;
   21FF DD 7E FB      [19]  610 	ld	a, -5 (ix)
   2202 85            [ 4]  611 	add	a, l
   2203 6F            [ 4]  612 	ld	l, a
   2204 DD 7E FC      [19]  613 	ld	a, -4 (ix)
   2207 CE 00         [ 7]  614 	adc	a, #0x00
   2209 67            [ 4]  615 	ld	h, a
   220A 73            [ 7]  616 	ld	(hl), e
                            617 ;src/text/text.c:184: colorchar[pos+FONT2_W]=*pChar;
   220B DD 7E FB      [19]  618 	ld	a, -5 (ix)
   220E 82            [ 4]  619 	add	a, d
   220F 5F            [ 4]  620 	ld	e, a
   2210 DD 7E FC      [19]  621 	ld	a, -4 (ix)
   2213 CE 00         [ 7]  622 	adc	a, #0x00
   2215 57            [ 4]  623 	ld	d, a
   2216 DD 6E D8      [19]  624 	ld	l,-40 (ix)
   2219 DD 66 D9      [19]  625 	ld	h,-39 (ix)
   221C 7E            [ 7]  626 	ld	a, (hl)
   221D 12            [ 7]  627 	ld	(de), a
   221E                     628 00163$:
                            629 ;src/text/text.c:150: for(i=0;i<18;i++){
   221E DD 34 D6      [23]  630 	inc	-42 (ix)
   2221 DD 7E D6      [19]  631 	ld	a, -42 (ix)
   2224 D6 12         [ 7]  632 	sub	a, #0x12
   2226 DA 81 20      [10]  633 	jp	C, 00162$
                            634 ;src/text/text.c:193: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   2229 DD 66 07      [19]  635 	ld	h, 7 (ix)
   222C DD 6E 06      [19]  636 	ld	l, 6 (ix)
   222F E5            [11]  637 	push	hl
   2230 21 00 C0      [10]  638 	ld	hl, #0xc000
   2233 E5            [11]  639 	push	hl
   2234 CD 19 28      [17]  640 	call	_cpct_getScreenPtr
                            641 ;src/text/text.c:194: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
   2237 DD 75 DC      [19]  642 	ld	-36 (ix), l
   223A DD 74 DD      [19]  643 	ld	-35 (ix), h
   223D DD 7E 0A      [19]  644 	ld	a, 10 (ix)
   2240 B7            [ 4]  645 	or	a, a
   2241 28 1D         [12]  646 	jr	Z,00145$
   2243 11 00 02      [10]  647 	ld	de, #_g_tablatrans
   2246 DD 4E E2      [19]  648 	ld	c,-30 (ix)
   2249 DD 46 E3      [19]  649 	ld	b,-29 (ix)
   224C D5            [11]  650 	push	de
   224D DD 56 E4      [19]  651 	ld	d, -28 (ix)
   2250 1E 02         [ 7]  652 	ld	e,#0x02
   2252 D5            [11]  653 	push	de
   2253 DD 6E DC      [19]  654 	ld	l,-36 (ix)
   2256 DD 66 DD      [19]  655 	ld	h,-35 (ix)
   2259 E5            [11]  656 	push	hl
   225A C5            [11]  657 	push	bc
   225B CD DE 27      [17]  658 	call	_cpct_drawSpriteMaskedAlignedTable
   225E 18 23         [12]  659 	jr	00146$
   2260                     660 00145$:
                            661 ;src/text/text.c:195: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
   2260 DD 7E E5      [19]  662 	ld	a, -27 (ix)
   2263 DD 77 DA      [19]  663 	ld	-38 (ix), a
   2266 DD 7E E6      [19]  664 	ld	a, -26 (ix)
   2269 DD 77 DB      [19]  665 	ld	-37 (ix), a
   226C DD 56 E7      [19]  666 	ld	d, -25 (ix)
   226F 1E 02         [ 7]  667 	ld	e,#0x02
   2271 D5            [11]  668 	push	de
   2272 DD 6E DC      [19]  669 	ld	l,-36 (ix)
   2275 DD 66 DD      [19]  670 	ld	h,-35 (ix)
   2278 E5            [11]  671 	push	hl
   2279 DD 6E DA      [19]  672 	ld	l,-38 (ix)
   227C DD 66 DB      [19]  673 	ld	h,-37 (ix)
   227F E5            [11]  674 	push	hl
   2280 CD 56 24      [17]  675 	call	_cpct_drawSprite
   2283                     676 00146$:
                            677 ;src/text/text.c:198: if(character == 48 || character == 60 || character == 57) xPos--;
   2283 DD 7E AD      [19]  678 	ld	a, -83 (ix)
   2286 D6 30         [ 7]  679 	sub	a, #0x30
   2288 28 0E         [12]  680 	jr	Z,00147$
   228A DD 7E AD      [19]  681 	ld	a, -83 (ix)
   228D D6 3C         [ 7]  682 	sub	a, #0x3c
   228F 28 07         [12]  683 	jr	Z,00147$
   2291 DD 7E AD      [19]  684 	ld	a, -83 (ix)
   2294 D6 39         [ 7]  685 	sub	a, #0x39
   2296 20 03         [12]  686 	jr	NZ,00152$
   2298                     687 00147$:
   2298 DD 35 06      [23]  688 	dec	6 (ix)
   229B                     689 00152$:
                            690 ;src/text/text.c:201: character = text[++x];
   229B DD 34 D7      [23]  691 	inc	-41 (ix)
   229E DD 7E FE      [19]  692 	ld	a, -2 (ix)
   22A1 DD 86 D7      [19]  693 	add	a, -41 (ix)
   22A4 6F            [ 4]  694 	ld	l, a
   22A5 DD 7E FF      [19]  695 	ld	a, -1 (ix)
   22A8 CE 00         [ 7]  696 	adc	a, #0x00
   22AA 67            [ 4]  697 	ld	h, a
   22AB 7E            [ 7]  698 	ld	a, (hl)
   22AC DD 77 FD      [19]  699 	ld	-3 (ix), a
                            700 ;src/text/text.c:202: xPos+=FONT2_W;
   22AF DD 34 06      [23]  701 	inc	6 (ix)
   22B2 DD 34 06      [23]  702 	inc	6 (ix)
   22B5 C3 AD 1F      [10]  703 	jp	00159$
   22B8                     704 00164$:
   22B8 DD F9         [10]  705 	ld	sp, ix
   22BA DD E1         [14]  706 	pop	ix
   22BC C9            [10]  707 	ret
                            708 	.area _CODE
                            709 	.area _INITIALIZER
                            710 	.area _CABS (ABS)
