                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tools
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _resultYesNo
                             12 	.globl _resultNumber
                             13 	.globl _updateNumber
                             14 	.globl _drawText
                             15 	.globl _strLength
                             16 	.globl _wait4OneKey
                             17 	.globl _sprintf
                             18 	.globl _cpct_zx7b_decrunch_s
                             19 	.globl _cpct_getScreenPtr
                             20 	.globl _cpct_drawSpriteMaskedAlignedTable
                             21 	.globl _cpct_drawSprite
                             22 	.globl _cpct_drawSolidBox
                             23 	.globl _cpct_px2byteM0
                             24 	.globl _cpct_getScreenToSprite
                             25 	.globl _cpct_isKeyPressed
                             26 	.globl _cpct_waitHalts
                             27 	.globl _cpct_memset
                             28 	.globl _clearScreen
                             29 	.globl _drawWindow
                             30 	.globl _showMessage
                             31 	.globl _drawCompressToScreen
                             32 	.globl _winape_breakpoint
                             33 ;--------------------------------------------------------
                             34 ; special function registers
                             35 ;--------------------------------------------------------
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DATA
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _INITIALIZED
                             44 ;--------------------------------------------------------
                             45 ; absolute external ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DABS (ABS)
                             48 ;--------------------------------------------------------
                             49 ; global & static initialisations
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _GSINIT
                             53 	.area _GSFINAL
                             54 	.area _GSINIT
                             55 ;--------------------------------------------------------
                             56 ; Home
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _HOME
                             60 ;--------------------------------------------------------
                             61 ; code
                             62 ;--------------------------------------------------------
                             63 	.area _CODE
                             64 ;src/util/tools.c:32: void clearScreen(u8 bgColor)
                             65 ;	---------------------------------
                             66 ; Function clearScreen
                             67 ; ---------------------------------
   1CED                      68 _clearScreen::
                             69 ;src/util/tools.c:35: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(bgColor, bgColor), 0x4000);
   1CED FD 21 02 00   [14]   70 	ld	iy, #2
   1CF1 FD 39         [15]   71 	add	iy, sp
   1CF3 FD 66 00      [19]   72 	ld	h, 0 (iy)
   1CF6 FD 6E 00      [19]   73 	ld	l, 0 (iy)
   1CF9 E5            [11]   74 	push	hl
   1CFA CD 89 25      [17]   75 	call	_cpct_px2byteM0
   1CFD 45            [ 4]   76 	ld	b, l
   1CFE 21 00 40      [10]   77 	ld	hl, #0x4000
   1D01 E5            [11]   78 	push	hl
   1D02 C5            [11]   79 	push	bc
   1D03 33            [ 6]   80 	inc	sp
   1D04 26 C0         [ 7]   81 	ld	h, #0xc0
   1D06 E5            [11]   82 	push	hl
   1D07 CD A5 25      [17]   83 	call	_cpct_memset
   1D0A C9            [10]   84 	ret
                             85 ;src/util/tools.c:46: void drawWindow(u8 x, u8 y, u8 width, u8 height, u8 fgColor, u8 bgColor)
                             86 ;	---------------------------------
                             87 ; Function drawWindow
                             88 ; ---------------------------------
   1D0B                      89 _drawWindow::
   1D0B DD E5         [15]   90 	push	ix
   1D0D DD 21 00 00   [14]   91 	ld	ix,#0
   1D11 DD 39         [15]   92 	add	ix,sp
   1D13 F5            [11]   93 	push	af
   1D14 F5            [11]   94 	push	af
                             95 ;src/util/tools.c:51: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y);
   1D15 DD 56 04      [19]   96 	ld	d, 4 (ix)
   1D18 14            [ 4]   97 	inc	d
   1D19 D5            [11]   98 	push	de
   1D1A DD 7E 05      [19]   99 	ld	a, 5 (ix)
   1D1D F5            [11]  100 	push	af
   1D1E 33            [ 6]  101 	inc	sp
   1D1F D5            [11]  102 	push	de
   1D20 33            [ 6]  103 	inc	sp
   1D21 21 00 C0      [10]  104 	ld	hl, #0xc000
   1D24 E5            [11]  105 	push	hl
   1D25 CD AF 26      [17]  106 	call	_cpct_getScreenPtr
   1D28 4D            [ 4]  107 	ld	c, l
   1D29 44            [ 4]  108 	ld	b, h
   1D2A D1            [10]  109 	pop	de
                            110 ;src/util/tools.c:52: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
   1D2B DD 7E 06      [19]  111 	ld	a, 6 (ix)
   1D2E C6 FC         [ 7]  112 	add	a, #0xfc
   1D30 5F            [ 4]  113 	ld	e, a
   1D31 C5            [11]  114 	push	bc
   1D32 D5            [11]  115 	push	de
   1D33 DD 66 08      [19]  116 	ld	h, 8 (ix)
   1D36 DD 6E 08      [19]  117 	ld	l, 8 (ix)
   1D39 E5            [11]  118 	push	hl
   1D3A CD 89 25      [17]  119 	call	_cpct_px2byteM0
   1D3D 65            [ 4]  120 	ld	h, l
   1D3E D1            [10]  121 	pop	de
   1D3F C1            [10]  122 	pop	bc
   1D40 69            [ 4]  123 	ld	l, c
   1D41 D5            [11]  124 	push	de
   1D42 16 02         [ 7]  125 	ld	d,#0x02
   1D44 D5            [11]  126 	push	de
   1D45 E5            [11]  127 	push	hl
   1D46 33            [ 6]  128 	inc	sp
   1D47 60            [ 4]  129 	ld	h, b
   1D48 E5            [11]  130 	push	hl
   1D49 CD CB 25      [17]  131 	call	_cpct_drawSolidBox
   1D4C F1            [10]  132 	pop	af
   1D4D F1            [10]  133 	pop	af
   1D4E 33            [ 6]  134 	inc	sp
   1D4F D1            [10]  135 	pop	de
                            136 ;src/util/tools.c:53: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height);
   1D50 DD 7E 05      [19]  137 	ld	a, 5 (ix)
   1D53 DD 86 07      [19]  138 	add	a, 7 (ix)
   1D56 DD 77 FF      [19]  139 	ld	-1 (ix), a
   1D59 D5            [11]  140 	push	de
   1D5A F5            [11]  141 	push	af
   1D5B 33            [ 6]  142 	inc	sp
   1D5C D5            [11]  143 	push	de
   1D5D 33            [ 6]  144 	inc	sp
   1D5E 21 00 C0      [10]  145 	ld	hl, #0xc000
   1D61 E5            [11]  146 	push	hl
   1D62 CD AF 26      [17]  147 	call	_cpct_getScreenPtr
   1D65 4D            [ 4]  148 	ld	c, l
   1D66 44            [ 4]  149 	ld	b, h
   1D67 D1            [10]  150 	pop	de
                            151 ;src/util/tools.c:54: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
   1D68 C5            [11]  152 	push	bc
   1D69 D5            [11]  153 	push	de
   1D6A DD 66 08      [19]  154 	ld	h, 8 (ix)
   1D6D DD 6E 08      [19]  155 	ld	l, 8 (ix)
   1D70 E5            [11]  156 	push	hl
   1D71 CD 89 25      [17]  157 	call	_cpct_px2byteM0
   1D74 DD 75 FE      [19]  158 	ld	-2 (ix), l
   1D77 D1            [10]  159 	pop	de
   1D78 C1            [10]  160 	pop	bc
   1D79 D5            [11]  161 	push	de
   1D7A 16 02         [ 7]  162 	ld	d,#0x02
   1D7C D5            [11]  163 	push	de
   1D7D DD 7E FE      [19]  164 	ld	a, -2 (ix)
   1D80 F5            [11]  165 	push	af
   1D81 33            [ 6]  166 	inc	sp
   1D82 C5            [11]  167 	push	bc
   1D83 CD CB 25      [17]  168 	call	_cpct_drawSolidBox
   1D86 F1            [10]  169 	pop	af
   1D87 F1            [10]  170 	pop	af
   1D88 33            [ 6]  171 	inc	sp
   1D89 D1            [10]  172 	pop	de
                            173 ;src/util/tools.c:56: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 2);
   1D8A DD 7E 05      [19]  174 	ld	a, 5 (ix)
   1D8D C6 02         [ 7]  175 	add	a, #0x02
   1D8F DD 77 FE      [19]  176 	ld	-2 (ix), a
   1D92 D5            [11]  177 	push	de
   1D93 F5            [11]  178 	push	af
   1D94 33            [ 6]  179 	inc	sp
   1D95 D5            [11]  180 	push	de
   1D96 33            [ 6]  181 	inc	sp
   1D97 21 00 C0      [10]  182 	ld	hl, #0xc000
   1D9A E5            [11]  183 	push	hl
   1D9B CD AF 26      [17]  184 	call	_cpct_getScreenPtr
   1D9E D1            [10]  185 	pop	de
                            186 ;src/util/tools.c:57: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
   1D9F E5            [11]  187 	push	hl
   1DA0 D5            [11]  188 	push	de
   1DA1 01 00 00      [10]  189 	ld	bc, #0x0000
   1DA4 C5            [11]  190 	push	bc
   1DA5 CD 89 25      [17]  191 	call	_cpct_px2byteM0
   1DA8 4D            [ 4]  192 	ld	c, l
   1DA9 D1            [10]  193 	pop	de
   1DAA E1            [10]  194 	pop	hl
   1DAB D5            [11]  195 	push	de
   1DAC 16 02         [ 7]  196 	ld	d,#0x02
   1DAE D5            [11]  197 	push	de
   1DAF 79            [ 4]  198 	ld	a, c
   1DB0 F5            [11]  199 	push	af
   1DB1 33            [ 6]  200 	inc	sp
   1DB2 E5            [11]  201 	push	hl
   1DB3 CD CB 25      [17]  202 	call	_cpct_drawSolidBox
   1DB6 F1            [10]  203 	pop	af
   1DB7 F1            [10]  204 	pop	af
   1DB8 33            [ 6]  205 	inc	sp
   1DB9 D1            [10]  206 	pop	de
                            207 ;src/util/tools.c:58: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height - 2);
   1DBA DD 35 FF      [23]  208 	dec	-1 (ix)
   1DBD DD 35 FF      [23]  209 	dec	-1 (ix)
   1DC0 D5            [11]  210 	push	de
   1DC1 DD 7E FF      [19]  211 	ld	a, -1 (ix)
   1DC4 F5            [11]  212 	push	af
   1DC5 33            [ 6]  213 	inc	sp
   1DC6 D5            [11]  214 	push	de
   1DC7 33            [ 6]  215 	inc	sp
   1DC8 21 00 C0      [10]  216 	ld	hl, #0xc000
   1DCB E5            [11]  217 	push	hl
   1DCC CD AF 26      [17]  218 	call	_cpct_getScreenPtr
   1DCF D1            [10]  219 	pop	de
                            220 ;src/util/tools.c:59: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
   1DD0 E5            [11]  221 	push	hl
   1DD1 D5            [11]  222 	push	de
   1DD2 01 00 00      [10]  223 	ld	bc, #0x0000
   1DD5 C5            [11]  224 	push	bc
   1DD6 CD 89 25      [17]  225 	call	_cpct_px2byteM0
   1DD9 4D            [ 4]  226 	ld	c, l
   1DDA D1            [10]  227 	pop	de
   1DDB E1            [10]  228 	pop	hl
   1DDC D5            [11]  229 	push	de
   1DDD 16 02         [ 7]  230 	ld	d,#0x02
   1DDF D5            [11]  231 	push	de
   1DE0 79            [ 4]  232 	ld	a, c
   1DE1 F5            [11]  233 	push	af
   1DE2 33            [ 6]  234 	inc	sp
   1DE3 E5            [11]  235 	push	hl
   1DE4 CD CB 25      [17]  236 	call	_cpct_drawSolidBox
   1DE7 F1            [10]  237 	pop	af
   1DE8 F1            [10]  238 	pop	af
   1DE9 33            [ 6]  239 	inc	sp
   1DEA D1            [10]  240 	pop	de
                            241 ;src/util/tools.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 4);
   1DEB DD 7E 05      [19]  242 	ld	a, 5 (ix)
   1DEE C6 04         [ 7]  243 	add	a, #0x04
   1DF0 DD 77 FD      [19]  244 	ld	-3 (ix), a
   1DF3 D5            [11]  245 	push	de
   1DF4 F5            [11]  246 	push	af
   1DF5 33            [ 6]  247 	inc	sp
   1DF6 D5            [11]  248 	push	de
   1DF7 33            [ 6]  249 	inc	sp
   1DF8 21 00 C0      [10]  250 	ld	hl, #0xc000
   1DFB E5            [11]  251 	push	hl
   1DFC CD AF 26      [17]  252 	call	_cpct_getScreenPtr
   1DFF 4D            [ 4]  253 	ld	c, l
   1E00 44            [ 4]  254 	ld	b, h
   1E01 D1            [10]  255 	pop	de
                            256 ;src/util/tools.c:62: cpct_drawSolidBox(pvideo, cpct_px2byteM0(bgColor, bgColor), width - 4, height - 6);
   1E02 DD 7E 07      [19]  257 	ld	a, 7 (ix)
   1E05 C6 FA         [ 7]  258 	add	a, #0xfa
   1E07 DD 77 FC      [19]  259 	ld	-4 (ix), a
   1E0A C5            [11]  260 	push	bc
   1E0B D5            [11]  261 	push	de
   1E0C DD 66 09      [19]  262 	ld	h, 9 (ix)
   1E0F DD 6E 09      [19]  263 	ld	l, 9 (ix)
   1E12 E5            [11]  264 	push	hl
   1E13 CD 89 25      [17]  265 	call	_cpct_px2byteM0
   1E16 7D            [ 4]  266 	ld	a, l
   1E17 D1            [10]  267 	pop	de
   1E18 57            [ 4]  268 	ld	d, a
   1E19 C1            [10]  269 	pop	bc
   1E1A DD 7E FC      [19]  270 	ld	a, -4 (ix)
   1E1D F5            [11]  271 	push	af
   1E1E 33            [ 6]  272 	inc	sp
   1E1F 7B            [ 4]  273 	ld	a, e
   1E20 F5            [11]  274 	push	af
   1E21 33            [ 6]  275 	inc	sp
   1E22 D5            [11]  276 	push	de
   1E23 33            [ 6]  277 	inc	sp
   1E24 C5            [11]  278 	push	bc
   1E25 CD CB 25      [17]  279 	call	_cpct_drawSolidBox
   1E28 F1            [10]  280 	pop	af
                            281 ;src/util/tools.c:65: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 2);
   1E29 33            [ 6]  282 	inc	sp
   1E2A DD 66 FE      [19]  283 	ld	h, -2 (ix)
   1E2D DD 6E 04      [19]  284 	ld	l, 4 (ix)
   1E30 E3            [19]  285 	ex	(sp),hl
   1E31 21 00 C0      [10]  286 	ld	hl, #0xc000
   1E34 E5            [11]  287 	push	hl
   1E35 CD AF 26      [17]  288 	call	_cpct_getScreenPtr
                            289 ;src/util/tools.c:66: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
   1E38 E5            [11]  290 	push	hl
   1E39 DD 7E 08      [19]  291 	ld	a, 8 (ix)
   1E3C F5            [11]  292 	push	af
   1E3D 33            [ 6]  293 	inc	sp
   1E3E AF            [ 4]  294 	xor	a, a
   1E3F F5            [11]  295 	push	af
   1E40 33            [ 6]  296 	inc	sp
   1E41 CD 89 25      [17]  297 	call	_cpct_px2byteM0
   1E44 55            [ 4]  298 	ld	d, l
   1E45 C1            [10]  299 	pop	bc
   1E46 21 01 02      [10]  300 	ld	hl, #0x0201
   1E49 E5            [11]  301 	push	hl
   1E4A D5            [11]  302 	push	de
   1E4B 33            [ 6]  303 	inc	sp
   1E4C C5            [11]  304 	push	bc
   1E4D CD CB 25      [17]  305 	call	_cpct_drawSolidBox
   1E50 F1            [10]  306 	pop	af
                            307 ;src/util/tools.c:69: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 4);
   1E51 33            [ 6]  308 	inc	sp
   1E52 DD 66 FD      [19]  309 	ld	h, -3 (ix)
   1E55 DD 6E 04      [19]  310 	ld	l, 4 (ix)
   1E58 E3            [19]  311 	ex	(sp),hl
   1E59 21 00 C0      [10]  312 	ld	hl, #0xc000
   1E5C E5            [11]  313 	push	hl
   1E5D CD AF 26      [17]  314 	call	_cpct_getScreenPtr
                            315 ;src/util/tools.c:70: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, height - 6);
   1E60 E5            [11]  316 	push	hl
   1E61 AF            [ 4]  317 	xor	a, a
   1E62 F5            [11]  318 	push	af
   1E63 33            [ 6]  319 	inc	sp
   1E64 DD 7E 08      [19]  320 	ld	a, 8 (ix)
   1E67 F5            [11]  321 	push	af
   1E68 33            [ 6]  322 	inc	sp
   1E69 CD 89 25      [17]  323 	call	_cpct_px2byteM0
   1E6C 55            [ 4]  324 	ld	d, l
   1E6D C1            [10]  325 	pop	bc
   1E6E DD 7E FC      [19]  326 	ld	a, -4 (ix)
   1E71 F5            [11]  327 	push	af
   1E72 33            [ 6]  328 	inc	sp
   1E73 3E 01         [ 7]  329 	ld	a, #0x01
   1E75 F5            [11]  330 	push	af
   1E76 33            [ 6]  331 	inc	sp
   1E77 D5            [11]  332 	push	de
   1E78 33            [ 6]  333 	inc	sp
   1E79 C5            [11]  334 	push	bc
   1E7A CD CB 25      [17]  335 	call	_cpct_drawSolidBox
   1E7D F1            [10]  336 	pop	af
                            337 ;src/util/tools.c:73: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + height - 2);
   1E7E 33            [ 6]  338 	inc	sp
   1E7F DD 66 FF      [19]  339 	ld	h, -1 (ix)
   1E82 DD 6E 04      [19]  340 	ld	l, 4 (ix)
   1E85 E3            [19]  341 	ex	(sp),hl
   1E86 21 00 C0      [10]  342 	ld	hl, #0xc000
   1E89 E5            [11]  343 	push	hl
   1E8A CD AF 26      [17]  344 	call	_cpct_getScreenPtr
                            345 ;src/util/tools.c:74: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
   1E8D E5            [11]  346 	push	hl
   1E8E DD 7E 08      [19]  347 	ld	a, 8 (ix)
   1E91 F5            [11]  348 	push	af
   1E92 33            [ 6]  349 	inc	sp
   1E93 AF            [ 4]  350 	xor	a, a
   1E94 F5            [11]  351 	push	af
   1E95 33            [ 6]  352 	inc	sp
   1E96 CD 89 25      [17]  353 	call	_cpct_px2byteM0
   1E99 55            [ 4]  354 	ld	d, l
   1E9A C1            [10]  355 	pop	bc
   1E9B 21 01 02      [10]  356 	ld	hl, #0x0201
   1E9E E5            [11]  357 	push	hl
   1E9F D5            [11]  358 	push	de
   1EA0 33            [ 6]  359 	inc	sp
   1EA1 C5            [11]  360 	push	bc
   1EA2 CD CB 25      [17]  361 	call	_cpct_drawSolidBox
   1EA5 F1            [10]  362 	pop	af
   1EA6 F1            [10]  363 	pop	af
   1EA7 33            [ 6]  364 	inc	sp
                            365 ;src/util/tools.c:76: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 2);
   1EA8 DD 7E 04      [19]  366 	ld	a, 4 (ix)
   1EAB DD 86 06      [19]  367 	add	a, 6 (ix)
   1EAE C6 FD         [ 7]  368 	add	a, #0xfd
   1EB0 47            [ 4]  369 	ld	b, a
   1EB1 C5            [11]  370 	push	bc
   1EB2 DD 7E FE      [19]  371 	ld	a, -2 (ix)
   1EB5 F5            [11]  372 	push	af
   1EB6 33            [ 6]  373 	inc	sp
   1EB7 C5            [11]  374 	push	bc
   1EB8 33            [ 6]  375 	inc	sp
   1EB9 21 00 C0      [10]  376 	ld	hl, #0xc000
   1EBC E5            [11]  377 	push	hl
   1EBD CD AF 26      [17]  378 	call	_cpct_getScreenPtr
   1EC0 C1            [10]  379 	pop	bc
                            380 ;src/util/tools.c:77: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
   1EC1 E5            [11]  381 	push	hl
   1EC2 C5            [11]  382 	push	bc
   1EC3 AF            [ 4]  383 	xor	a, a
   1EC4 F5            [11]  384 	push	af
   1EC5 33            [ 6]  385 	inc	sp
   1EC6 DD 7E 08      [19]  386 	ld	a, 8 (ix)
   1EC9 F5            [11]  387 	push	af
   1ECA 33            [ 6]  388 	inc	sp
   1ECB CD 89 25      [17]  389 	call	_cpct_px2byteM0
   1ECE 4D            [ 4]  390 	ld	c, l
   1ECF F1            [10]  391 	pop	af
   1ED0 47            [ 4]  392 	ld	b, a
   1ED1 E1            [10]  393 	pop	hl
   1ED2 C5            [11]  394 	push	bc
   1ED3 11 01 02      [10]  395 	ld	de, #0x0201
   1ED6 D5            [11]  396 	push	de
   1ED7 79            [ 4]  397 	ld	a, c
   1ED8 F5            [11]  398 	push	af
   1ED9 33            [ 6]  399 	inc	sp
   1EDA E5            [11]  400 	push	hl
   1EDB CD CB 25      [17]  401 	call	_cpct_drawSolidBox
   1EDE F1            [10]  402 	pop	af
   1EDF F1            [10]  403 	pop	af
   1EE0 33            [ 6]  404 	inc	sp
   1EE1 C1            [10]  405 	pop	bc
                            406 ;src/util/tools.c:79: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 4);
   1EE2 C5            [11]  407 	push	bc
   1EE3 DD 7E FD      [19]  408 	ld	a, -3 (ix)
   1EE6 F5            [11]  409 	push	af
   1EE7 33            [ 6]  410 	inc	sp
   1EE8 C5            [11]  411 	push	bc
   1EE9 33            [ 6]  412 	inc	sp
   1EEA 21 00 C0      [10]  413 	ld	hl, #0xc000
   1EED E5            [11]  414 	push	hl
   1EEE CD AF 26      [17]  415 	call	_cpct_getScreenPtr
   1EF1 E5            [11]  416 	push	hl
   1EF2 DD 7E 08      [19]  417 	ld	a, 8 (ix)
   1EF5 F5            [11]  418 	push	af
   1EF6 33            [ 6]  419 	inc	sp
   1EF7 AF            [ 4]  420 	xor	a, a
   1EF8 F5            [11]  421 	push	af
   1EF9 33            [ 6]  422 	inc	sp
   1EFA CD 89 25      [17]  423 	call	_cpct_px2byteM0
   1EFD 4D            [ 4]  424 	ld	c, l
   1EFE D1            [10]  425 	pop	de
   1EFF F1            [10]  426 	pop	af
   1F00 47            [ 4]  427 	ld	b, a
   1F01 C5            [11]  428 	push	bc
   1F02 DD 7E FC      [19]  429 	ld	a, -4 (ix)
   1F05 F5            [11]  430 	push	af
   1F06 33            [ 6]  431 	inc	sp
   1F07 06 01         [ 7]  432 	ld	b, #0x01
   1F09 C5            [11]  433 	push	bc
   1F0A D5            [11]  434 	push	de
   1F0B CD CB 25      [17]  435 	call	_cpct_drawSolidBox
   1F0E F1            [10]  436 	pop	af
   1F0F F1            [10]  437 	pop	af
   1F10 33            [ 6]  438 	inc	sp
   1F11 C1            [10]  439 	pop	bc
                            440 ;src/util/tools.c:82: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + height - 2);
   1F12 DD 7E FF      [19]  441 	ld	a, -1 (ix)
   1F15 F5            [11]  442 	push	af
   1F16 33            [ 6]  443 	inc	sp
   1F17 C5            [11]  444 	push	bc
   1F18 33            [ 6]  445 	inc	sp
   1F19 21 00 C0      [10]  446 	ld	hl, #0xc000
   1F1C E5            [11]  447 	push	hl
   1F1D CD AF 26      [17]  448 	call	_cpct_getScreenPtr
                            449 ;src/util/tools.c:83: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
   1F20 E5            [11]  450 	push	hl
   1F21 AF            [ 4]  451 	xor	a, a
   1F22 F5            [11]  452 	push	af
   1F23 33            [ 6]  453 	inc	sp
   1F24 DD 7E 08      [19]  454 	ld	a, 8 (ix)
   1F27 F5            [11]  455 	push	af
   1F28 33            [ 6]  456 	inc	sp
   1F29 CD 89 25      [17]  457 	call	_cpct_px2byteM0
   1F2C 55            [ 4]  458 	ld	d, l
   1F2D C1            [10]  459 	pop	bc
   1F2E 21 01 02      [10]  460 	ld	hl, #0x0201
   1F31 E5            [11]  461 	push	hl
   1F32 D5            [11]  462 	push	de
   1F33 33            [ 6]  463 	inc	sp
   1F34 C5            [11]  464 	push	bc
   1F35 CD CB 25      [17]  465 	call	_cpct_drawSolidBox
   1F38 DD F9         [10]  466 	ld	sp,ix
   1F3A DD E1         [14]  467 	pop	ix
   1F3C C9            [10]  468 	ret
                            469 ;src/util/tools.c:94: void updateNumber(u8 number)
                            470 ;	---------------------------------
                            471 ; Function updateNumber
                            472 ; ---------------------------------
   1F3D                     473 _updateNumber::
   1F3D DD E5         [15]  474 	push	ix
   1F3F DD 21 00 00   [14]  475 	ld	ix,#0
   1F43 DD 39         [15]  476 	add	ix,sp
   1F45 F5            [11]  477 	push	af
   1F46 3B            [ 6]  478 	dec	sp
                            479 ;src/util/tools.c:99: pvmem = cpct_getScreenPtr(SCR_VMEM, 58, 80);
   1F47 21 3A 50      [10]  480 	ld	hl, #0x503a
   1F4A E5            [11]  481 	push	hl
   1F4B 21 00 C0      [10]  482 	ld	hl, #0xc000
   1F4E E5            [11]  483 	push	hl
   1F4F CD AF 26      [17]  484 	call	_cpct_getScreenPtr
                            485 ;src/util/tools.c:100: cpct_drawSolidBox(pvmem, cpct_px2byteM0(14, 14), 8, 14);
   1F52 E5            [11]  486 	push	hl
   1F53 21 0E 0E      [10]  487 	ld	hl, #0x0e0e
   1F56 E5            [11]  488 	push	hl
   1F57 CD 89 25      [17]  489 	call	_cpct_px2byteM0
   1F5A 55            [ 4]  490 	ld	d, l
   1F5B C1            [10]  491 	pop	bc
   1F5C 21 08 0E      [10]  492 	ld	hl, #0x0e08
   1F5F E5            [11]  493 	push	hl
   1F60 D5            [11]  494 	push	de
   1F61 33            [ 6]  495 	inc	sp
   1F62 C5            [11]  496 	push	bc
   1F63 CD CB 25      [17]  497 	call	_cpct_drawSolidBox
   1F66 F1            [10]  498 	pop	af
   1F67 F1            [10]  499 	pop	af
   1F68 33            [ 6]  500 	inc	sp
                            501 ;src/util/tools.c:101: sprintf(text, "%02d", number);
   1F69 DD 5E 04      [19]  502 	ld	e, 4 (ix)
   1F6C 16 00         [ 7]  503 	ld	d, #0x00
   1F6E 21 00 00      [10]  504 	ld	hl, #0x0000
   1F71 39            [11]  505 	add	hl, sp
   1F72 4D            [ 4]  506 	ld	c, l
   1F73 44            [ 4]  507 	ld	b, h
   1F74 E5            [11]  508 	push	hl
   1F75 D5            [11]  509 	push	de
   1F76 11 9E 1F      [10]  510 	ld	de, #___str_0
   1F79 D5            [11]  511 	push	de
   1F7A C5            [11]  512 	push	bc
   1F7B CD B8 24      [17]  513 	call	_sprintf
   1F7E 21 06 00      [10]  514 	ld	hl, #6
   1F81 39            [11]  515 	add	hl, sp
   1F82 F9            [ 6]  516 	ld	sp, hl
   1F83 E1            [10]  517 	pop	hl
                            518 ;src/util/tools.c:102: drawText(text, 58, 80, COLORTXT_YELLOW, DOUBLEHEIGHT, TRANSPARENT);
   1F84 01 02 01      [10]  519 	ld	bc, #0x0102
   1F87 C5            [11]  520 	push	bc
   1F88 01 50 01      [10]  521 	ld	bc, #0x0150
   1F8B C5            [11]  522 	push	bc
   1F8C 3E 3A         [ 7]  523 	ld	a, #0x3a
   1F8E F5            [11]  524 	push	af
   1F8F 33            [ 6]  525 	inc	sp
   1F90 E5            [11]  526 	push	hl
   1F91 CD FB 14      [17]  527 	call	_drawText
   1F94 21 07 00      [10]  528 	ld	hl, #7
   1F97 39            [11]  529 	add	hl, sp
   1F98 F9            [ 6]  530 	ld	sp, hl
   1F99 DD F9         [10]  531 	ld	sp, ix
   1F9B DD E1         [14]  532 	pop	ix
   1F9D C9            [10]  533 	ret
   1F9E                     534 ___str_0:
   1F9E 25 30 32 64         535 	.ascii "%02d"
   1FA2 00                  536 	.db 0x00
                            537 ;src/util/tools.c:112: u8 resultNumber()
                            538 ;	---------------------------------
                            539 ; Function resultNumber
                            540 ; ---------------------------------
   1FA3                     541 _resultNumber::
                            542 ;src/util/tools.c:116: selection = 1;
   1FA3 0E 01         [ 7]  543 	ld	c, #0x01
                            544 ;src/util/tools.c:117: drawText("UP/DOWN:CHANGE LEVEL", 16, 92, COLORTXT_MAUVE, NORMALHEIGHT, TRANSPARENT);
   1FA5 C5            [11]  545 	push	bc
   1FA6 21 01 01      [10]  546 	ld	hl, #0x0101
   1FA9 E5            [11]  547 	push	hl
   1FAA 21 5C 05      [10]  548 	ld	hl, #0x055c
   1FAD E5            [11]  549 	push	hl
   1FAE 3E 10         [ 7]  550 	ld	a, #0x10
   1FB0 F5            [11]  551 	push	af
   1FB1 33            [ 6]  552 	inc	sp
   1FB2 21 61 20      [10]  553 	ld	hl, #___str_1
   1FB5 E5            [11]  554 	push	hl
   1FB6 CD FB 14      [17]  555 	call	_drawText
   1FB9 21 07 00      [10]  556 	ld	hl, #7
   1FBC 39            [11]  557 	add	hl, sp
   1FBD F9            [ 6]  558 	ld	sp, hl
   1FBE 21 01 01      [10]  559 	ld	hl, #0x0101
   1FC1 E5            [11]  560 	push	hl
   1FC2 21 68 05      [10]  561 	ld	hl, #0x0568
   1FC5 E5            [11]  562 	push	hl
   1FC6 3E 10         [ 7]  563 	ld	a, #0x10
   1FC8 F5            [11]  564 	push	af
   1FC9 33            [ 6]  565 	inc	sp
   1FCA 21 76 20      [10]  566 	ld	hl, #___str_2
   1FCD E5            [11]  567 	push	hl
   1FCE CD FB 14      [17]  568 	call	_drawText
   1FD1 21 07 00      [10]  569 	ld	hl, #7
   1FD4 39            [11]  570 	add	hl, sp
   1FD5 F9            [ 6]  571 	ld	sp, hl
   1FD6 3E 01         [ 7]  572 	ld	a, #0x01
   1FD8 F5            [11]  573 	push	af
   1FD9 33            [ 6]  574 	inc	sp
   1FDA CD 3D 1F      [17]  575 	call	_updateNumber
   1FDD 33            [ 6]  576 	inc	sp
   1FDE C1            [10]  577 	pop	bc
                            578 ;src/util/tools.c:120: while (1)
   1FDF                     579 00117$:
                            580 ;src/util/tools.c:123: cpct_waitHalts(20);
   1FDF C5            [11]  581 	push	bc
   1FE0 2E 14         [ 7]  582 	ld	l, #0x14
   1FE2 CD E0 23      [17]  583 	call	_cpct_waitHalts
   1FE5 C1            [10]  584 	pop	bc
                            585 ;src/util/tools.c:124: if ((cpct_isKeyPressed(keys1.up)) || (cpct_isKeyPressed(keys1.j_up)))
   1FE6 2A DC A8      [16]  586 	ld	hl, (#_keys1 + 0)
   1FE9 C5            [11]  587 	push	bc
   1FEA CD 81 22      [17]  588 	call	_cpct_isKeyPressed
   1FED C1            [10]  589 	pop	bc
   1FEE 7D            [ 4]  590 	ld	a, l
   1FEF B7            [ 4]  591 	or	a, a
   1FF0 20 0C         [12]  592 	jr	NZ,00108$
   1FF2 2A E8 A8      [16]  593 	ld	hl, (#(_keys1 + 0x000c) + 0)
   1FF5 C5            [11]  594 	push	bc
   1FF6 CD 81 22      [17]  595 	call	_cpct_isKeyPressed
   1FF9 C1            [10]  596 	pop	bc
   1FFA 7D            [ 4]  597 	ld	a, l
   1FFB B7            [ 4]  598 	or	a, a
   1FFC 28 13         [12]  599 	jr	Z,00109$
   1FFE                     600 00108$:
                            601 ;src/util/tools.c:126: selection++;
   1FFE 0C            [ 4]  602 	inc	c
                            603 ;src/util/tools.c:127: if (selection > 17)
   1FFF 3E 11         [ 7]  604 	ld	a, #0x11
   2001 91            [ 4]  605 	sub	a, c
   2002 30 02         [12]  606 	jr	NC,00102$
                            607 ;src/util/tools.c:128: selection = 1;
   2004 0E 01         [ 7]  608 	ld	c, #0x01
   2006                     609 00102$:
                            610 ;src/util/tools.c:129: updateNumber(selection);
   2006 C5            [11]  611 	push	bc
   2007 79            [ 4]  612 	ld	a, c
   2008 F5            [11]  613 	push	af
   2009 33            [ 6]  614 	inc	sp
   200A CD 3D 1F      [17]  615 	call	_updateNumber
   200D 33            [ 6]  616 	inc	sp
   200E C1            [10]  617 	pop	bc
   200F 18 29         [12]  618 	jr	00110$
   2011                     619 00109$:
                            620 ;src/util/tools.c:131: else if ((cpct_isKeyPressed(keys1.down)) || (cpct_isKeyPressed(keys1.j_down)))
   2011 2A DE A8      [16]  621 	ld	hl, (#(_keys1 + 0x0002) + 0)
   2014 C5            [11]  622 	push	bc
   2015 CD 81 22      [17]  623 	call	_cpct_isKeyPressed
   2018 C1            [10]  624 	pop	bc
   2019 7D            [ 4]  625 	ld	a, l
   201A B7            [ 4]  626 	or	a, a
   201B 20 0C         [12]  627 	jr	NZ,00105$
   201D 2A EA A8      [16]  628 	ld	hl, (#(_keys1 + 0x000e) + 0)
   2020 C5            [11]  629 	push	bc
   2021 CD 81 22      [17]  630 	call	_cpct_isKeyPressed
   2024 C1            [10]  631 	pop	bc
   2025 7D            [ 4]  632 	ld	a, l
   2026 B7            [ 4]  633 	or	a, a
   2027 28 11         [12]  634 	jr	Z,00110$
   2029                     635 00105$:
                            636 ;src/util/tools.c:133: selection--;
   2029 0D            [ 4]  637 	dec	c
                            638 ;src/util/tools.c:134: if (selection < 1)
   202A 79            [ 4]  639 	ld	a, c
   202B D6 01         [ 7]  640 	sub	a, #0x01
   202D 30 02         [12]  641 	jr	NC,00104$
                            642 ;src/util/tools.c:135: selection = 17;
   202F 0E 11         [ 7]  643 	ld	c, #0x11
   2031                     644 00104$:
                            645 ;src/util/tools.c:136: updateNumber(selection);
   2031 C5            [11]  646 	push	bc
   2032 79            [ 4]  647 	ld	a, c
   2033 F5            [11]  648 	push	af
   2034 33            [ 6]  649 	inc	sp
   2035 CD 3D 1F      [17]  650 	call	_updateNumber
   2038 33            [ 6]  651 	inc	sp
   2039 C1            [10]  652 	pop	bc
   203A                     653 00110$:
                            654 ;src/util/tools.c:138: if ((cpct_isKeyPressed(keys1.fire1)) || (cpct_isKeyPressed(keys1.j_fire1)) || (cpct_isKeyPressed(keys1.j_fire2)))
   203A 2A E4 A8      [16]  655 	ld	hl, (#(_keys1 + 0x0008) + 0)
   203D C5            [11]  656 	push	bc
   203E CD 81 22      [17]  657 	call	_cpct_isKeyPressed
   2041 C1            [10]  658 	pop	bc
   2042 7D            [ 4]  659 	ld	a, l
   2043 B7            [ 4]  660 	or	a, a
   2044 20 19         [12]  661 	jr	NZ,00112$
   2046 2A F0 A8      [16]  662 	ld	hl, (#(_keys1 + 0x0014) + 0)
   2049 C5            [11]  663 	push	bc
   204A CD 81 22      [17]  664 	call	_cpct_isKeyPressed
   204D C1            [10]  665 	pop	bc
   204E 7D            [ 4]  666 	ld	a, l
   204F B7            [ 4]  667 	or	a, a
   2050 20 0D         [12]  668 	jr	NZ,00112$
   2052 2A F2 A8      [16]  669 	ld	hl, (#(_keys1 + 0x0016) + 0)
   2055 C5            [11]  670 	push	bc
   2056 CD 81 22      [17]  671 	call	_cpct_isKeyPressed
   2059 C1            [10]  672 	pop	bc
   205A 7D            [ 4]  673 	ld	a, l
   205B B7            [ 4]  674 	or	a, a
   205C CA DF 1F      [10]  675 	jp	Z, 00117$
   205F                     676 00112$:
                            677 ;src/util/tools.c:140: return selection;
   205F 69            [ 4]  678 	ld	l, c
   2060 C9            [10]  679 	ret
   2061                     680 ___str_1:
   2061 55 50 2F 44 4F 57   681 	.ascii "UP/DOWN:CHANGE LEVEL"
        4E 3A 43 48 41 4E
        47 45 20 4C 45 56
        45 4C
   2075 00                  682 	.db 0x00
   2076                     683 ___str_2:
   2076 46 49 52 45 3A 20   684 	.ascii "FIRE: CONFIRM"
        43 4F 4E 46 49 52
        4D
   2083 00                  685 	.db 0x00
                            686 ;src/util/tools.c:151: u8 resultYesNo()
                            687 ;	---------------------------------
                            688 ; Function resultYesNo
                            689 ; ---------------------------------
   2084                     690 _resultYesNo::
                            691 ;src/util/tools.c:153: drawText("(YES/NO)", 32, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
   2084 21 01 01      [10]  692 	ld	hl, #0x0101
   2087 E5            [11]  693 	push	hl
   2088 2E 60         [ 7]  694 	ld	l, #0x60
   208A E5            [11]  695 	push	hl
   208B 3E 20         [ 7]  696 	ld	a, #0x20
   208D F5            [11]  697 	push	af
   208E 33            [ 6]  698 	inc	sp
   208F 21 B5 20      [10]  699 	ld	hl, #___str_3
   2092 E5            [11]  700 	push	hl
   2093 CD FB 14      [17]  701 	call	_drawText
   2096 21 07 00      [10]  702 	ld	hl, #7
   2099 39            [11]  703 	add	hl, sp
   209A F9            [ 6]  704 	ld	sp, hl
                            705 ;src/util/tools.c:155: while (1)
   209B                     706 00105$:
                            707 ;src/util/tools.c:157: if ((cpct_isKeyPressed(Key_Y)) || (cpct_isKeyPressed(Key_N)))
   209B 21 05 08      [10]  708 	ld	hl, #0x0805
   209E CD 81 22      [17]  709 	call	_cpct_isKeyPressed
   20A1 7D            [ 4]  710 	ld	a, l
   20A2 B7            [ 4]  711 	or	a, a
   20A3 20 0A         [12]  712 	jr	NZ,00101$
   20A5 21 05 40      [10]  713 	ld	hl, #0x4005
   20A8 CD 81 22      [17]  714 	call	_cpct_isKeyPressed
   20AB 7D            [ 4]  715 	ld	a, l
   20AC B7            [ 4]  716 	or	a, a
   20AD 28 EC         [12]  717 	jr	Z,00105$
   20AF                     718 00101$:
                            719 ;src/util/tools.c:159: return (cpct_isKeyPressed(Key_Y));
   20AF 21 05 08      [10]  720 	ld	hl, #0x0805
                            721 ;src/util/tools.c:160: break;
   20B2 C3 81 22      [10]  722 	jp  _cpct_isKeyPressed
   20B5                     723 ___str_3:
   20B5 28 59 45 53 2F 4E   724 	.ascii "(YES/NO)"
        4F 29
   20BD 00                  725 	.db 0x00
                            726 ;src/util/tools.c:171: u8 showMessage(u8 *message, u8 type)
                            727 ;	---------------------------------
                            728 ; Function showMessage
                            729 ; ---------------------------------
   20BE                     730 _showMessage::
   20BE DD E5         [15]  731 	push	ix
   20C0 DD 21 00 00   [14]  732 	ld	ix,#0
   20C4 DD 39         [15]  733 	add	ix,sp
   20C6 3B            [ 6]  734 	dec	sp
                            735 ;src/util/tools.c:179: if (type == NUMBER)
   20C7 DD 7E 06      [19]  736 	ld	a, 6 (ix)
   20CA D6 02         [ 7]  737 	sub	a, #0x02
   20CC 20 04         [12]  738 	jr	NZ,00142$
   20CE 3E 01         [ 7]  739 	ld	a,#0x01
   20D0 18 01         [12]  740 	jr	00143$
   20D2                     741 00142$:
   20D2 AF            [ 4]  742 	xor	a,a
   20D3                     743 00143$:
   20D3 DD 77 FF      [19]  744 	ld	-1 (ix), a
   20D6 B7            [ 4]  745 	or	a, a
   20D7 28 04         [12]  746 	jr	Z,00102$
                            747 ;src/util/tools.c:180: defaultMax = 56;
   20D9 0E 38         [ 7]  748 	ld	c, #0x38
   20DB 18 02         [12]  749 	jr	00103$
   20DD                     750 00102$:
                            751 ;src/util/tools.c:182: defaultMax = 26;
   20DD 0E 1A         [ 7]  752 	ld	c, #0x1a
   20DF                     753 00103$:
                            754 ;src/util/tools.c:184: messageLength = strLength(message);
   20DF C5            [11]  755 	push	bc
   20E0 DD 6E 04      [19]  756 	ld	l,4 (ix)
   20E3 DD 66 05      [19]  757 	ld	h,5 (ix)
   20E6 E5            [11]  758 	push	hl
   20E7 CD A4 14      [17]  759 	call	_strLength
   20EA F1            [10]  760 	pop	af
   20EB 5D            [ 4]  761 	ld	e, l
   20EC C1            [10]  762 	pop	bc
                            763 ;src/util/tools.c:185: w = max(((messageLength * 2) + 7), defaultMax);
   20ED 6B            [ 4]  764 	ld	l, e
   20EE 26 00         [ 7]  765 	ld	h, #0x00
   20F0 29            [11]  766 	add	hl, hl
   20F1 D5            [11]  767 	push	de
   20F2 11 07 00      [10]  768 	ld	de, #0x0007
   20F5 19            [11]  769 	add	hl, de
   20F6 D1            [10]  770 	pop	de
   20F7 79            [ 4]  771 	ld	a, c
   20F8 16 00         [ 7]  772 	ld	d, #0x00
   20FA 95            [ 4]  773 	sub	a, l
   20FB 7A            [ 4]  774 	ld	a, d
   20FC 9C            [ 4]  775 	sbc	a, h
   20FD E2 02 21      [10]  776 	jp	PO, 00144$
   2100 EE 80         [ 7]  777 	xor	a, #0x80
   2102                     778 00144$:
   2102 F2 0A 21      [10]  779 	jp	P, 00115$
   2105 7B            [ 4]  780 	ld	a, e
   2106 87            [ 4]  781 	add	a, a
   2107 C6 07         [ 7]  782 	add	a, #0x07
   2109 4F            [ 4]  783 	ld	c, a
   210A                     784 00115$:
                            785 ;src/util/tools.c:187: x = ((80 - w) / 2+1);
   210A 59            [ 4]  786 	ld	e, c
   210B 16 00         [ 7]  787 	ld	d, #0x00
   210D 3E 50         [ 7]  788 	ld	a, #0x50
   210F 93            [ 4]  789 	sub	a, e
   2110 6F            [ 4]  790 	ld	l, a
   2111 3E 00         [ 7]  791 	ld	a, #0x00
   2113 9A            [ 4]  792 	sbc	a, d
   2114 67            [ 4]  793 	ld	h, a
   2115 5D            [ 4]  794 	ld	e, l
   2116 54            [ 4]  795 	ld	d, h
   2117 CB 7C         [ 8]  796 	bit	7, h
   2119 28 02         [12]  797 	jr	Z,00117$
   211B EB            [ 4]  798 	ex	de,hl
   211C 13            [ 6]  799 	inc	de
   211D                     800 00117$:
   211D CB 2A         [ 8]  801 	sra	d
   211F CB 1B         [ 8]  802 	rr	e
   2121 43            [ 4]  803 	ld	b, e
   2122 04            [ 4]  804 	inc	b
                            805 ;src/util/tools.c:191: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   2123 C5            [11]  806 	push	bc
   2124 3E 3A         [ 7]  807 	ld	a, #0x3a
   2126 F5            [11]  808 	push	af
   2127 33            [ 6]  809 	inc	sp
   2128 C5            [11]  810 	push	bc
   2129 33            [ 6]  811 	inc	sp
   212A 21 00 C0      [10]  812 	ld	hl, #0xc000
   212D E5            [11]  813 	push	hl
   212E CD AF 26      [17]  814 	call	_cpct_getScreenPtr
   2131 EB            [ 4]  815 	ex	de,hl
   2132 C1            [10]  816 	pop	bc
                            817 ;src/util/tools.c:196: cpct_getScreenToSprite(pvmem, (u8*) &screenBuffer0, w, h);
   2133 21 00 B0      [10]  818 	ld	hl, #_screenBuffer0+0
   2136 C5            [11]  819 	push	bc
   2137 D5            [11]  820 	push	de
   2138 06 3C         [ 7]  821 	ld	b, #0x3c
   213A C5            [11]  822 	push	bc
   213B E5            [11]  823 	push	hl
   213C D5            [11]  824 	push	de
   213D CD 5A 22      [17]  825 	call	_cpct_getScreenToSprite
   2140 D1            [10]  826 	pop	de
   2141 C1            [10]  827 	pop	bc
                            828 ;src/util/tools.c:199: drawWindow(x, y, w, h - 2, 15, 14);
   2142 C5            [11]  829 	push	bc
   2143 D5            [11]  830 	push	de
   2144 21 0F 0E      [10]  831 	ld	hl, #0x0e0f
   2147 E5            [11]  832 	push	hl
   2148 3E 3A         [ 7]  833 	ld	a, #0x3a
   214A F5            [11]  834 	push	af
   214B 33            [ 6]  835 	inc	sp
   214C 51            [ 4]  836 	ld	d, c
   214D 1E 3A         [ 7]  837 	ld	e,#0x3a
   214F D5            [11]  838 	push	de
   2150 C5            [11]  839 	push	bc
   2151 33            [ 6]  840 	inc	sp
   2152 CD 0B 1D      [17]  841 	call	_drawWindow
   2155 21 06 00      [10]  842 	ld	hl, #6
   2158 39            [11]  843 	add	hl, sp
   2159 F9            [ 6]  844 	ld	sp, hl
   215A D1            [10]  845 	pop	de
   215B C1            [10]  846 	pop	bc
                            847 ;src/util/tools.c:200: drawText(message, x + 3, y + 12, COLORTXT_WHITE, DOUBLEHEIGHT, TRANSPARENT);
   215C 04            [ 4]  848 	inc	b
   215D 04            [ 4]  849 	inc	b
   215E 04            [ 4]  850 	inc	b
   215F C5            [11]  851 	push	bc
   2160 D5            [11]  852 	push	de
   2161 21 02 01      [10]  853 	ld	hl, #0x0102
   2164 E5            [11]  854 	push	hl
   2165 21 46 00      [10]  855 	ld	hl, #0x0046
   2168 E5            [11]  856 	push	hl
   2169 C5            [11]  857 	push	bc
   216A 33            [ 6]  858 	inc	sp
   216B DD 6E 04      [19]  859 	ld	l,4 (ix)
   216E DD 66 05      [19]  860 	ld	h,5 (ix)
   2171 E5            [11]  861 	push	hl
   2172 CD FB 14      [17]  862 	call	_drawText
   2175 21 07 00      [10]  863 	ld	hl, #7
   2178 39            [11]  864 	add	hl, sp
   2179 F9            [ 6]  865 	ld	sp, hl
   217A D1            [10]  866 	pop	de
   217B C1            [10]  867 	pop	bc
                            868 ;src/util/tools.c:203: if (type == YESNO)
   217C DD 7E 06      [19]  869 	ld	a, 6 (ix)
   217F 3D            [ 4]  870 	dec	a
   2180 20 09         [12]  871 	jr	NZ,00111$
                            872 ;src/util/tools.c:205: result = resultYesNo();
   2182 C5            [11]  873 	push	bc
   2183 D5            [11]  874 	push	de
   2184 CD 84 20      [17]  875 	call	_resultYesNo
   2187 D1            [10]  876 	pop	de
   2188 C1            [10]  877 	pop	bc
   2189 18 49         [12]  878 	jr	00112$
   218B                     879 00111$:
                            880 ;src/util/tools.c:207: else if (type == NUMBER)
   218B DD 7E FF      [19]  881 	ld	a, -1 (ix)
   218E B7            [ 4]  882 	or	a, a
   218F 28 09         [12]  883 	jr	Z,00108$
                            884 ;src/util/tools.c:209: result = resultNumber();
   2191 C5            [11]  885 	push	bc
   2192 D5            [11]  886 	push	de
   2193 CD A3 1F      [17]  887 	call	_resultNumber
   2196 D1            [10]  888 	pop	de
   2197 C1            [10]  889 	pop	bc
   2198 18 3A         [12]  890 	jr	00112$
   219A                     891 00108$:
                            892 ;src/util/tools.c:210: } else if (type == TEMPORAL){
   219A DD 7E 06      [19]  893 	ld	a, 6 (ix)
   219D D6 03         [ 7]  894 	sub	a, #0x03
   219F 20 0D         [12]  895 	jr	NZ,00105$
                            896 ;src/util/tools.c:211: cpct_waitHalts(100);
   21A1 C5            [11]  897 	push	bc
   21A2 D5            [11]  898 	push	de
   21A3 2E 64         [ 7]  899 	ld	l, #0x64
   21A5 CD E0 23      [17]  900 	call	_cpct_waitHalts
   21A8 D1            [10]  901 	pop	de
   21A9 C1            [10]  902 	pop	bc
                            903 ;src/util/tools.c:212: result = YES;
   21AA 2E 01         [ 7]  904 	ld	l, #0x01
   21AC 18 26         [12]  905 	jr	00112$
   21AE                     906 00105$:
                            907 ;src/util/tools.c:216: drawText("PRESS A KEY", 29, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
   21AE C5            [11]  908 	push	bc
   21AF D5            [11]  909 	push	de
   21B0 21 01 01      [10]  910 	ld	hl, #0x0101
   21B3 E5            [11]  911 	push	hl
   21B4 2E 60         [ 7]  912 	ld	l, #0x60
   21B6 E5            [11]  913 	push	hl
   21B7 3E 1D         [ 7]  914 	ld	a, #0x1d
   21B9 F5            [11]  915 	push	af
   21BA 33            [ 6]  916 	inc	sp
   21BB 21 E5 21      [10]  917 	ld	hl, #___str_4
   21BE E5            [11]  918 	push	hl
   21BF CD FB 14      [17]  919 	call	_drawText
   21C2 21 07 00      [10]  920 	ld	hl, #7
   21C5 39            [11]  921 	add	hl, sp
   21C6 F9            [ 6]  922 	ld	sp, hl
   21C7 D1            [10]  923 	pop	de
   21C8 C1            [10]  924 	pop	bc
                            925 ;src/util/tools.c:217: result = YES;
   21C9 2E 01         [ 7]  926 	ld	l, #0x01
                            927 ;src/util/tools.c:218: wait4OneKey();
   21CB E5            [11]  928 	push	hl
   21CC C5            [11]  929 	push	bc
   21CD D5            [11]  930 	push	de
   21CE CD A7 19      [17]  931 	call	_wait4OneKey
   21D1 D1            [10]  932 	pop	de
   21D2 C1            [10]  933 	pop	bc
   21D3 E1            [10]  934 	pop	hl
   21D4                     935 00112$:
                            936 ;src/util/tools.c:222: cpct_drawSprite((u8 *)0xb000, pvmem, w, h);
   21D4 E5            [11]  937 	push	hl
   21D5 06 3C         [ 7]  938 	ld	b, #0x3c
   21D7 C5            [11]  939 	push	bc
   21D8 D5            [11]  940 	push	de
   21D9 01 00 B0      [10]  941 	ld	bc, #0xb000
   21DC C5            [11]  942 	push	bc
   21DD CD 1A 23      [17]  943 	call	_cpct_drawSprite
   21E0 E1            [10]  944 	pop	hl
                            945 ;src/util/tools.c:224: return result;
   21E1 33            [ 6]  946 	inc	sp
   21E2 DD E1         [14]  947 	pop	ix
   21E4 C9            [10]  948 	ret
   21E5                     949 ___str_4:
   21E5 50 52 45 53 53 20   950 	.ascii "PRESS A KEY"
        41 20 4B 45 59
   21F0 00                  951 	.db 0x00
                            952 ;src/util/tools.c:226: void drawCompressToScreen(u8 x, u8 y, u8 w, u8 h, u16 size, u8* comp_end, u8 trans){
                            953 ;	---------------------------------
                            954 ; Function drawCompressToScreen
                            955 ; ---------------------------------
   21F1                     956 _drawCompressToScreen::
   21F1 DD E5         [15]  957 	push	ix
   21F3 DD 21 00 00   [14]  958 	ld	ix,#0
   21F7 DD 39         [15]  959 	add	ix,sp
   21F9 F5            [11]  960 	push	af
                            961 ;src/util/tools.c:229: pvmem = cpct_getScreenPtr(SCR_VMEM, x, y);
   21FA DD 66 05      [19]  962 	ld	h, 5 (ix)
   21FD DD 6E 04      [19]  963 	ld	l, 4 (ix)
   2200 E5            [11]  964 	push	hl
   2201 21 00 C0      [10]  965 	ld	hl, #0xc000
   2204 E5            [11]  966 	push	hl
   2205 CD AF 26      [17]  967 	call	_cpct_getScreenPtr
   2208 33            [ 6]  968 	inc	sp
   2209 33            [ 6]  969 	inc	sp
   220A E5            [11]  970 	push	hl
                            971 ;src/util/tools.c:230: cpct_zx7b_decrunch_s((u8*) &screenBuffer0 + size - 1, comp_end);
   220B DD 4E 0A      [19]  972 	ld	c,10 (ix)
   220E DD 46 0B      [19]  973 	ld	b,11 (ix)
   2211 11 00 B0      [10]  974 	ld	de, #_screenBuffer0
   2214 DD 6E 08      [19]  975 	ld	l,8 (ix)
   2217 DD 66 09      [19]  976 	ld	h,9 (ix)
   221A 19            [11]  977 	add	hl, de
   221B 2B            [ 6]  978 	dec	hl
   221C C5            [11]  979 	push	bc
   221D E5            [11]  980 	push	hl
   221E CD 1D 25      [17]  981 	call	_cpct_zx7b_decrunch_s
                            982 ;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
   2221 C1            [10]  983 	pop	bc
   2222 C5            [11]  984 	push	bc
                            985 ;src/util/tools.c:231: if (trans)
   2223 DD 7E 0C      [19]  986 	ld	a, 12 (ix)
   2226 B7            [ 4]  987 	or	a, a
   2227 28 15         [12]  988 	jr	Z,00102$
                            989 ;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
   2229 21 00 02      [10]  990 	ld	hl, #_g_tablatrans
   222C E5            [11]  991 	push	hl
   222D DD 66 07      [19]  992 	ld	h, 7 (ix)
   2230 DD 6E 06      [19]  993 	ld	l, 6 (ix)
   2233 E5            [11]  994 	push	hl
   2234 C5            [11]  995 	push	bc
   2235 21 00 B0      [10]  996 	ld	hl, #_screenBuffer0
   2238 E5            [11]  997 	push	hl
   2239 CD CF 26      [17]  998 	call	_cpct_drawSpriteMaskedAlignedTable
   223C 18 0F         [12]  999 	jr	00104$
   223E                    1000 00102$:
                           1001 ;src/util/tools.c:234: cpct_drawSprite(&screenBuffer0, pvmem, w, h);
   223E DD 66 07      [19] 1002 	ld	h, 7 (ix)
   2241 DD 6E 06      [19] 1003 	ld	l, 6 (ix)
   2244 E5            [11] 1004 	push	hl
   2245 C5            [11] 1005 	push	bc
   2246 21 00 B0      [10] 1006 	ld	hl, #_screenBuffer0
   2249 E5            [11] 1007 	push	hl
   224A CD 1A 23      [17] 1008 	call	_cpct_drawSprite
   224D                    1009 00104$:
   224D DD F9         [10] 1010 	ld	sp, ix
   224F DD E1         [14] 1011 	pop	ix
   2251 C9            [10] 1012 	ret
                           1013 ;src/util/tools.c:238: void winape_breakpoint(u16 error_code) __z88dk_callee __naked {
                           1014 ;	---------------------------------
                           1015 ; Function winape_breakpoint
                           1016 ; ---------------------------------
   2252                    1017 _winape_breakpoint::
                           1018 ;src/util/tools.c:241: __asm__("pop iy");  // ret address first because __z88dk_callee convention
   2252 FD E1         [14] 1019 	pop	iy
                           1020 ;src/util/tools.c:242: __asm__("pop hl");
   2254 E1            [10] 1021 	pop	hl
                           1022 ;src/util/tools.c:243: __asm__("push iy"); // ret address last  because __z88dk_callee convention
   2255 FD E5         [15] 1023 	push	iy
                           1024 ;src/util/tools.c:244: __asm__(".db 0xed, 0xff");
   2257 ED FF              1025 	.db	0xed, 0xff
                           1026 ;src/util/tools.c:246: __asm__("ret");
   2259 C9            [10] 1027 	ret
                           1028 	.area _CODE
                           1029 	.area _INITIALIZER
                           1030 	.area _CABS (ABS)
