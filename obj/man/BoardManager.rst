                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module BoardManager
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _man_board_render
                             12 	.globl _man_board_update
                             13 	.globl _man_board_init
                             14 	.globl _man_board_create
                             15 	.globl _cpct_getRandom_mxor_u8
                             16 	.globl _cpct_getScreenPtr
                             17 	.globl _cpct_drawSolidBox
                             18 	.globl _cpct_drawSpriteBlended
                             19 	.globl _board
                             20 	.globl _tiles
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
   32CD                      28 _board::
   32CD                      29 	.ds 153
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
                             54 ;src/man/BoardManager.c:18: void man_board_create(){
                             55 ;	---------------------------------
                             56 ; Function man_board_create
                             57 ; ---------------------------------
   1A39                      58 _man_board_create::
                             59 ;src/man/BoardManager.c:21: for (j=0; j<12; j++){
   1A39 0E 00         [ 7]   60 	ld	c, #0x00
                             61 ;src/man/BoardManager.c:22: for (i=0; i<12; i++){
   1A3B                      62 00109$:
   1A3B 69            [ 4]   63 	ld	l, c
   1A3C 29            [11]   64 	add	hl, hl
   1A3D 09            [11]   65 	add	hl, bc
   1A3E 29            [11]   66 	add	hl, hl
   1A3F 29            [11]   67 	add	hl, hl
   1A40 3E CD         [ 7]   68 	ld	a, #<(_board)
   1A42 85            [ 4]   69 	add	a, l
   1A43 5F            [ 4]   70 	ld	e, a
   1A44 3E 32         [ 7]   71 	ld	a, #>(_board)
   1A46 CE 00         [ 7]   72 	adc	a, #0x00
   1A48 57            [ 4]   73 	ld	d, a
   1A49 06 00         [ 7]   74 	ld	b, #0x00
   1A4B                      75 00103$:
                             76 ;src/man/BoardManager.c:23: board.cells[j][i] = 255;
   1A4B 68            [ 4]   77 	ld	l,b
   1A4C 26 00         [ 7]   78 	ld	h,#0x00
   1A4E 19            [11]   79 	add	hl, de
   1A4F 36 FF         [10]   80 	ld	(hl), #0xff
                             81 ;src/man/BoardManager.c:22: for (i=0; i<12; i++){
   1A51 04            [ 4]   82 	inc	b
   1A52 78            [ 4]   83 	ld	a, b
   1A53 D6 0C         [ 7]   84 	sub	a, #0x0c
   1A55 38 F4         [12]   85 	jr	C,00103$
                             86 ;src/man/BoardManager.c:21: for (j=0; j<12; j++){
   1A57 0C            [ 4]   87 	inc	c
   1A58 79            [ 4]   88 	ld	a, c
   1A59 D6 0C         [ 7]   89 	sub	a, #0x0c
   1A5B 38 DE         [12]   90 	jr	C,00109$
   1A5D C9            [10]   91 	ret
   1A5E                      92 _tiles:
   1A5E F4 12                93 	.dw _sp_tiles_0
   1A60 24 13                94 	.dw _sp_tiles_1
   1A62 54 13                95 	.dw _sp_tiles_2
   1A64 84 13                96 	.dw _sp_tiles_3
   1A66 B4 13                97 	.dw _sp_tiles_4
   1A68 E4 13                98 	.dw _sp_tiles_5
   1A6A 14 14                99 	.dw _sp_tiles_6
   1A6C 44 14               100 	.dw _sp_tiles_7
   1A6E 74 14               101 	.dw _sp_tiles_8
                            102 ;src/man/BoardManager.c:34: void man_board_init(u8 x, u8 y, u8 width, u8 height){
                            103 ;	---------------------------------
                            104 ; Function man_board_init
                            105 ; ---------------------------------
   1A70                     106 _man_board_init::
   1A70 DD E5         [15]  107 	push	ix
   1A72 DD 21 00 00   [14]  108 	ld	ix,#0
   1A76 DD 39         [15]  109 	add	ix,sp
   1A78 F5            [11]  110 	push	af
   1A79 F5            [11]  111 	push	af
                            112 ;src/man/BoardManager.c:37: board.width = width;
   1A7A 01 5D 33      [10]  113 	ld	bc, #_board + 144
   1A7D DD 7E 06      [19]  114 	ld	a, 6 (ix)
   1A80 02            [ 7]  115 	ld	(bc), a
                            116 ;src/man/BoardManager.c:38: board.height = height;
   1A81 21 5E 33      [10]  117 	ld	hl, #(_board + 0x0091)
   1A84 DD 7E 07      [19]  118 	ld	a, 7 (ix)
   1A87 77            [ 7]  119 	ld	(hl), a
                            120 ;src/man/BoardManager.c:39: board.x = x;
   1A88 21 5F 33      [10]  121 	ld	hl, #(_board + 0x0092)
   1A8B DD 7E 04      [19]  122 	ld	a, 4 (ix)
   1A8E 77            [ 7]  123 	ld	(hl), a
                            124 ;src/man/BoardManager.c:40: board.y = y;
   1A8F 21 60 33      [10]  125 	ld	hl, #(_board + 0x0093)
   1A92 DD 7E 05      [19]  126 	ld	a, 5 (ix)
   1A95 77            [ 7]  127 	ld	(hl), a
                            128 ;src/man/BoardManager.c:41: board.activeCell.active = 0;
   1A96 21 64 33      [10]  129 	ld	hl, #(_board + 0x0097)
   1A99 36 00         [10]  130 	ld	(hl), #0x00
                            131 ;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
   1A9B 16 00         [ 7]  132 	ld	d, #0x00
   1A9D                     133 00107$:
   1A9D 0A            [ 7]  134 	ld	a, (bc)
   1A9E 5F            [ 4]  135 	ld	e, a
   1A9F 7A            [ 4]  136 	ld	a, d
   1AA0 93            [ 4]  137 	sub	a, e
   1AA1 30 4D         [12]  138 	jr	NC,00109$
                            139 ;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
   1AA3 6A            [ 4]  140 	ld	l, d
   1AA4 5D            [ 4]  141 	ld	e, l
   1AA5 29            [11]  142 	add	hl, hl
   1AA6 19            [11]  143 	add	hl, de
   1AA7 29            [11]  144 	add	hl, hl
   1AA8 29            [11]  145 	add	hl, hl
   1AA9 3E CD         [ 7]  146 	ld	a, #<(_board)
   1AAB 85            [ 4]  147 	add	a, l
   1AAC DD 77 FE      [19]  148 	ld	-2 (ix), a
   1AAF 3E 32         [ 7]  149 	ld	a, #>(_board)
   1AB1 CE 00         [ 7]  150 	adc	a, #0x00
   1AB3 DD 77 FF      [19]  151 	ld	-1 (ix), a
   1AB6 1E 00         [ 7]  152 	ld	e, #0x00
   1AB8                     153 00104$:
   1AB8 21 5E 33      [10]  154 	ld	hl, #(_board + 0x0091) + 0
   1ABB 6E            [ 7]  155 	ld	l, (hl)
   1ABC 7B            [ 4]  156 	ld	a, e
   1ABD 95            [ 4]  157 	sub	a, l
   1ABE 30 28         [12]  158 	jr	NC,00101$
                            159 ;src/man/BoardManager.c:45: board.cells[j][i] = (cpct_rand8() % NUM_COLORS);
   1AC0 DD 7E FE      [19]  160 	ld	a, -2 (ix)
   1AC3 83            [ 4]  161 	add	a, e
   1AC4 DD 77 FC      [19]  162 	ld	-4 (ix), a
   1AC7 DD 7E FF      [19]  163 	ld	a, -1 (ix)
   1ACA CE 00         [ 7]  164 	adc	a, #0x00
   1ACC DD 77 FD      [19]  165 	ld	-3 (ix), a
   1ACF C5            [11]  166 	push	bc
   1AD0 D5            [11]  167 	push	de
   1AD1 CD 3A 24      [17]  168 	call	_cpct_getRandom_mxor_u8
   1AD4 65            [ 4]  169 	ld	h, l
   1AD5 3E 06         [ 7]  170 	ld	a, #0x06
   1AD7 F5            [11]  171 	push	af
   1AD8 33            [ 6]  172 	inc	sp
   1AD9 E5            [11]  173 	push	hl
   1ADA 33            [ 6]  174 	inc	sp
   1ADB CD BF 23      [17]  175 	call	__moduchar
   1ADE F1            [10]  176 	pop	af
   1ADF 7D            [ 4]  177 	ld	a, l
   1AE0 D1            [10]  178 	pop	de
   1AE1 C1            [10]  179 	pop	bc
   1AE2 E1            [10]  180 	pop	hl
   1AE3 E5            [11]  181 	push	hl
   1AE4 77            [ 7]  182 	ld	(hl), a
                            183 ;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
   1AE5 1C            [ 4]  184 	inc	e
   1AE6 18 D0         [12]  185 	jr	00104$
   1AE8                     186 00101$:
                            187 ;src/man/BoardManager.c:47: board.updated = YES;
   1AE8 21 65 33      [10]  188 	ld	hl, #(_board + 0x0098)
   1AEB 36 01         [10]  189 	ld	(hl), #0x01
                            190 ;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
   1AED 14            [ 4]  191 	inc	d
   1AEE 18 AD         [12]  192 	jr	00107$
   1AF0                     193 00109$:
   1AF0 DD F9         [10]  194 	ld	sp, ix
   1AF2 DD E1         [14]  195 	pop	ix
   1AF4 C9            [10]  196 	ret
                            197 ;src/man/BoardManager.c:60: void man_board_update(){
                            198 ;	---------------------------------
                            199 ; Function man_board_update
                            200 ; ---------------------------------
   1AF5                     201 _man_board_update::
                            202 ;src/man/BoardManager.c:62: }
   1AF5 C9            [10]  203 	ret
                            204 ;src/man/BoardManager.c:70: void man_board_render(){
                            205 ;	---------------------------------
                            206 ; Function man_board_render
                            207 ; ---------------------------------
   1AF6                     208 _man_board_render::
   1AF6 DD E5         [15]  209 	push	ix
   1AF8 DD 21 00 00   [14]  210 	ld	ix,#0
   1AFC DD 39         [15]  211 	add	ix,sp
   1AFE F5            [11]  212 	push	af
   1AFF F5            [11]  213 	push	af
   1B00 3B            [ 6]  214 	dec	sp
                            215 ;src/man/BoardManager.c:73: if (board.updated = YES){
   1B01 01 65 33      [10]  216 	ld	bc, #_board + 152
   1B04 3E 01         [ 7]  217 	ld	a, #0x01
   1B06 02            [ 7]  218 	ld	(bc), a
                            219 ;src/man/BoardManager.c:74: for (j=0; j<board.height; j++){
   1B07 1E 00         [ 7]  220 	ld	e, #0x00
   1B09                     221 00112$:
   1B09 21 5E 33      [10]  222 	ld	hl, #_board + 145
   1B0C 56            [ 7]  223 	ld	d, (hl)
   1B0D 7B            [ 4]  224 	ld	a, e
   1B0E 92            [ 4]  225 	sub	a, d
   1B0F D2 B8 1B      [10]  226 	jp	NC, 00105$
                            227 ;src/man/BoardManager.c:75: for (i=0; i<board.width; i++){
   1B12 D5            [11]  228 	push	de
   1B13 7B            [ 4]  229 	ld	a, e
   1B14 87            [ 4]  230 	add	a, a
   1B15 83            [ 4]  231 	add	a, e
   1B16 87            [ 4]  232 	add	a, a
   1B17 87            [ 4]  233 	add	a, a
   1B18 83            [ 4]  234 	add	a, e
   1B19 D1            [10]  235 	pop	de
   1B1A DD 77 FC      [19]  236 	ld	-4 (ix), a
   1B1D D5            [11]  237 	push	de
   1B1E 6B            [ 4]  238 	ld	l, e
   1B1F 29            [11]  239 	add	hl, hl
   1B20 19            [11]  240 	add	hl, de
   1B21 29            [11]  241 	add	hl, hl
   1B22 29            [11]  242 	add	hl, hl
   1B23 D1            [10]  243 	pop	de
   1B24 3E CD         [ 7]  244 	ld	a, #<(_board)
   1B26 85            [ 4]  245 	add	a, l
   1B27 DD 77 FE      [19]  246 	ld	-2 (ix), a
   1B2A 3E 32         [ 7]  247 	ld	a, #>(_board)
   1B2C CE 00         [ 7]  248 	adc	a, #0x00
   1B2E DD 77 FF      [19]  249 	ld	-1 (ix), a
   1B31 16 00         [ 7]  250 	ld	d, #0x00
   1B33                     251 00109$:
   1B33 21 5D 33      [10]  252 	ld	hl, #_board + 144
   1B36 6E            [ 7]  253 	ld	l, (hl)
   1B37 7A            [ 4]  254 	ld	a, d
   1B38 95            [ 4]  255 	sub	a, l
   1B39 30 79         [12]  256 	jr	NC,00113$
                            257 ;src/man/BoardManager.c:76: vmem = cpct_getScreenPtr (CPCT_VMEM_START, board.x + (i*5), board.y + (j*13));
   1B3B 3A 60 33      [13]  258 	ld	a,(#_board + 147)
   1B3E DD 86 FC      [19]  259 	add	a, -4 (ix)
   1B41 DD 77 FB      [19]  260 	ld	-5 (ix), a
   1B44 21 5F 33      [10]  261 	ld	hl, #_board + 146
   1B47 7E            [ 7]  262 	ld	a, (hl)
   1B48 DD 77 FD      [19]  263 	ld	-3 (ix), a
   1B4B D5            [11]  264 	push	de
   1B4C 6A            [ 4]  265 	ld	l, d
   1B4D 5D            [ 4]  266 	ld	e, l
   1B4E 29            [11]  267 	add	hl, hl
   1B4F 29            [11]  268 	add	hl, hl
   1B50 19            [11]  269 	add	hl, de
   1B51 D1            [10]  270 	pop	de
   1B52 DD 7E FD      [19]  271 	ld	a, -3 (ix)
   1B55 85            [ 4]  272 	add	a, l
   1B56 DD 77 FD      [19]  273 	ld	-3 (ix), a
   1B59 C5            [11]  274 	push	bc
   1B5A D5            [11]  275 	push	de
   1B5B DD 66 FB      [19]  276 	ld	h, -5 (ix)
   1B5E DD 6E FD      [19]  277 	ld	l, -3 (ix)
   1B61 E5            [11]  278 	push	hl
   1B62 21 00 C0      [10]  279 	ld	hl, #0xc000
   1B65 E5            [11]  280 	push	hl
   1B66 CD AF 26      [17]  281 	call	_cpct_getScreenPtr
   1B69 D1            [10]  282 	pop	de
   1B6A C1            [10]  283 	pop	bc
   1B6B E5            [11]  284 	push	hl
   1B6C FD E1         [14]  285 	pop	iy
                            286 ;src/man/BoardManager.c:78: if (board.cells[j][i]!=255){
   1B6E DD 7E FE      [19]  287 	ld	a, -2 (ix)
   1B71 82            [ 4]  288 	add	a, d
   1B72 6F            [ 4]  289 	ld	l, a
   1B73 DD 7E FF      [19]  290 	ld	a, -1 (ix)
   1B76 CE 00         [ 7]  291 	adc	a, #0x00
   1B78 67            [ 4]  292 	ld	h, a
   1B79 6E            [ 7]  293 	ld	l, (hl)
                            294 ;src/man/BoardManager.c:79: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
                            295 ;src/man/BoardManager.c:78: if (board.cells[j][i]!=255){
   1B7A 7D            [ 4]  296 	ld	a, l
   1B7B 3C            [ 4]  297 	inc	a
   1B7C 28 1F         [12]  298 	jr	Z,00102$
                            299 ;src/man/BoardManager.c:79: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
   1B7E 26 00         [ 7]  300 	ld	h, #0x00
   1B80 29            [11]  301 	add	hl, hl
   1B81 3E 5E         [ 7]  302 	ld	a, #<(_tiles)
   1B83 85            [ 4]  303 	add	a, l
   1B84 6F            [ 4]  304 	ld	l, a
   1B85 3E 1A         [ 7]  305 	ld	a, #>(_tiles)
   1B87 8C            [ 4]  306 	adc	a, h
   1B88 67            [ 4]  307 	ld	h, a
   1B89 7E            [ 7]  308 	ld	a, (hl)
   1B8A 23            [ 6]  309 	inc	hl
   1B8B 66            [ 7]  310 	ld	h, (hl)
   1B8C 6F            [ 4]  311 	ld	l, a
   1B8D C5            [11]  312 	push	bc
   1B8E D5            [11]  313 	push	de
   1B8F E5            [11]  314 	push	hl
   1B90 21 0C 04      [10]  315 	ld	hl, #0x040c
   1B93 E5            [11]  316 	push	hl
   1B94 FD E5         [15]  317 	push	iy
   1B96 CD 83 26      [17]  318 	call	_cpct_drawSpriteBlended
   1B99 D1            [10]  319 	pop	de
   1B9A C1            [10]  320 	pop	bc
   1B9B 18 13         [12]  321 	jr	00110$
   1B9D                     322 00102$:
                            323 ;src/man/BoardManager.c:81: cpct_drawSolidBox (vmem, 0, SP_TILES_0_W, SP_TILES_0_H);	
   1B9D C5            [11]  324 	push	bc
   1B9E D5            [11]  325 	push	de
   1B9F 21 04 0C      [10]  326 	ld	hl, #0x0c04
   1BA2 E5            [11]  327 	push	hl
   1BA3 AF            [ 4]  328 	xor	a, a
   1BA4 F5            [11]  329 	push	af
   1BA5 33            [ 6]  330 	inc	sp
   1BA6 FD E5         [15]  331 	push	iy
   1BA8 CD CB 25      [17]  332 	call	_cpct_drawSolidBox
   1BAB F1            [10]  333 	pop	af
   1BAC F1            [10]  334 	pop	af
   1BAD 33            [ 6]  335 	inc	sp
   1BAE D1            [10]  336 	pop	de
   1BAF C1            [10]  337 	pop	bc
   1BB0                     338 00110$:
                            339 ;src/man/BoardManager.c:75: for (i=0; i<board.width; i++){
   1BB0 14            [ 4]  340 	inc	d
   1BB1 C3 33 1B      [10]  341 	jp	00109$
   1BB4                     342 00113$:
                            343 ;src/man/BoardManager.c:74: for (j=0; j<board.height; j++){
   1BB4 1C            [ 4]  344 	inc	e
   1BB5 C3 09 1B      [10]  345 	jp	00112$
   1BB8                     346 00105$:
                            347 ;src/man/BoardManager.c:85: board.updated = NO;
   1BB8 AF            [ 4]  348 	xor	a, a
   1BB9 02            [ 7]  349 	ld	(bc), a
   1BBA DD F9         [10]  350 	ld	sp, ix
   1BBC DD E1         [14]  351 	pop	ix
   1BBE C9            [10]  352 	ret
                            353 	.area _CODE
                            354 	.area _INITIALIZER
                            355 	.area _CABS (ABS)
