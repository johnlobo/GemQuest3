                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
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
   3117                      28 _board::
   3117                      29 	.ds 152
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
   14A4                      58 _man_board_create::
                             59 ;src/man/BoardManager.c:21: for (j=0; j<12; j++){
   14A4 0E 00         [ 7]   60 	ld	c, #0x00
                             61 ;src/man/BoardManager.c:22: for (i=0; i<12; i++){
   14A6                      62 00109$:
   14A6 69            [ 4]   63 	ld	l, c
   14A7 29            [11]   64 	add	hl, hl
   14A8 09            [11]   65 	add	hl, bc
   14A9 29            [11]   66 	add	hl, hl
   14AA 29            [11]   67 	add	hl, hl
   14AB 3E 17         [ 7]   68 	ld	a, #<(_board)
   14AD 85            [ 4]   69 	add	a, l
   14AE 5F            [ 4]   70 	ld	e, a
   14AF 3E 31         [ 7]   71 	ld	a, #>(_board)
   14B1 CE 00         [ 7]   72 	adc	a, #0x00
   14B3 57            [ 4]   73 	ld	d, a
   14B4 06 00         [ 7]   74 	ld	b, #0x00
   14B6                      75 00103$:
                             76 ;src/man/BoardManager.c:23: board.cells[j][i] = 255;
   14B6 68            [ 4]   77 	ld	l,b
   14B7 26 00         [ 7]   78 	ld	h,#0x00
   14B9 19            [11]   79 	add	hl, de
   14BA 36 FF         [10]   80 	ld	(hl), #0xff
                             81 ;src/man/BoardManager.c:22: for (i=0; i<12; i++){
   14BC 04            [ 4]   82 	inc	b
   14BD 78            [ 4]   83 	ld	a, b
   14BE D6 0C         [ 7]   84 	sub	a, #0x0c
   14C0 38 F4         [12]   85 	jr	C,00103$
                             86 ;src/man/BoardManager.c:21: for (j=0; j<12; j++){
   14C2 0C            [ 4]   87 	inc	c
   14C3 79            [ 4]   88 	ld	a, c
   14C4 D6 0C         [ 7]   89 	sub	a, #0x0c
   14C6 38 DE         [12]   90 	jr	C,00109$
   14C8 C9            [10]   91 	ret
   14C9                      92 _tiles:
   14C9 F4 12                93 	.dw _sp_tiles_0
   14CB 24 13                94 	.dw _sp_tiles_1
   14CD 54 13                95 	.dw _sp_tiles_2
   14CF 84 13                96 	.dw _sp_tiles_3
   14D1 B4 13                97 	.dw _sp_tiles_4
   14D3 E4 13                98 	.dw _sp_tiles_5
   14D5 14 14                99 	.dw _sp_tiles_6
   14D7 44 14               100 	.dw _sp_tiles_7
   14D9 74 14               101 	.dw _sp_tiles_8
                            102 ;src/man/BoardManager.c:34: void man_board_init(u8 x, u8 y, u8 width, u8 height){
                            103 ;	---------------------------------
                            104 ; Function man_board_init
                            105 ; ---------------------------------
   14DB                     106 _man_board_init::
   14DB DD E5         [15]  107 	push	ix
   14DD DD 21 00 00   [14]  108 	ld	ix,#0
   14E1 DD 39         [15]  109 	add	ix,sp
   14E3 F5            [11]  110 	push	af
   14E4 F5            [11]  111 	push	af
                            112 ;src/man/BoardManager.c:37: board.width = width;
   14E5 01 A7 31      [10]  113 	ld	bc, #_board + 144
   14E8 DD 7E 06      [19]  114 	ld	a, 6 (ix)
   14EB 02            [ 7]  115 	ld	(bc), a
                            116 ;src/man/BoardManager.c:38: board.height = height;
   14EC 21 A8 31      [10]  117 	ld	hl, #(_board + 0x0091)
   14EF DD 7E 07      [19]  118 	ld	a, 7 (ix)
   14F2 77            [ 7]  119 	ld	(hl), a
                            120 ;src/man/BoardManager.c:39: board.x = x;
   14F3 21 A9 31      [10]  121 	ld	hl, #(_board + 0x0092)
   14F6 DD 7E 04      [19]  122 	ld	a, 4 (ix)
   14F9 77            [ 7]  123 	ld	(hl), a
                            124 ;src/man/BoardManager.c:40: board.y = y;
   14FA 21 AA 31      [10]  125 	ld	hl, #(_board + 0x0093)
   14FD DD 7E 05      [19]  126 	ld	a, 5 (ix)
   1500 77            [ 7]  127 	ld	(hl), a
                            128 ;src/man/BoardManager.c:41: board.activeCell.active = 0;
   1501 21 AE 31      [10]  129 	ld	hl, #(_board + 0x0097)
   1504 36 00         [10]  130 	ld	(hl), #0x00
                            131 ;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
   1506 16 00         [ 7]  132 	ld	d, #0x00
   1508                     133 00107$:
   1508 0A            [ 7]  134 	ld	a, (bc)
   1509 5F            [ 4]  135 	ld	e, a
   150A 7A            [ 4]  136 	ld	a, d
   150B 93            [ 4]  137 	sub	a, e
   150C 30 48         [12]  138 	jr	NC,00109$
                            139 ;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
   150E 6A            [ 4]  140 	ld	l, d
   150F 5D            [ 4]  141 	ld	e, l
   1510 29            [11]  142 	add	hl, hl
   1511 19            [11]  143 	add	hl, de
   1512 29            [11]  144 	add	hl, hl
   1513 29            [11]  145 	add	hl, hl
   1514 3E 17         [ 7]  146 	ld	a, #<(_board)
   1516 85            [ 4]  147 	add	a, l
   1517 DD 77 FE      [19]  148 	ld	-2 (ix), a
   151A 3E 31         [ 7]  149 	ld	a, #>(_board)
   151C CE 00         [ 7]  150 	adc	a, #0x00
   151E DD 77 FF      [19]  151 	ld	-1 (ix), a
   1521 1E 00         [ 7]  152 	ld	e, #0x00
   1523                     153 00104$:
   1523 21 A8 31      [10]  154 	ld	hl, #(_board + 0x0091) + 0
   1526 6E            [ 7]  155 	ld	l, (hl)
   1527 7B            [ 4]  156 	ld	a, e
   1528 95            [ 4]  157 	sub	a, l
   1529 30 28         [12]  158 	jr	NC,00108$
                            159 ;src/man/BoardManager.c:45: board.cells[j][i] = (cpct_rand8() % NUM_COLORS);
   152B DD 7E FE      [19]  160 	ld	a, -2 (ix)
   152E 83            [ 4]  161 	add	a, e
   152F DD 77 FC      [19]  162 	ld	-4 (ix), a
   1532 DD 7E FF      [19]  163 	ld	a, -1 (ix)
   1535 CE 00         [ 7]  164 	adc	a, #0x00
   1537 DD 77 FD      [19]  165 	ld	-3 (ix), a
   153A C5            [11]  166 	push	bc
   153B D5            [11]  167 	push	de
   153C CD 91 22      [17]  168 	call	_cpct_getRandom_mxor_u8
   153F 65            [ 4]  169 	ld	h, l
   1540 3E 06         [ 7]  170 	ld	a, #0x06
   1542 F5            [11]  171 	push	af
   1543 33            [ 6]  172 	inc	sp
   1544 E5            [11]  173 	push	hl
   1545 33            [ 6]  174 	inc	sp
   1546 CD 16 22      [17]  175 	call	__moduchar
   1549 F1            [10]  176 	pop	af
   154A 7D            [ 4]  177 	ld	a, l
   154B D1            [10]  178 	pop	de
   154C C1            [10]  179 	pop	bc
   154D E1            [10]  180 	pop	hl
   154E E5            [11]  181 	push	hl
   154F 77            [ 7]  182 	ld	(hl), a
                            183 ;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
   1550 1C            [ 4]  184 	inc	e
   1551 18 D0         [12]  185 	jr	00104$
   1553                     186 00108$:
                            187 ;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
   1553 14            [ 4]  188 	inc	d
   1554 18 B2         [12]  189 	jr	00107$
   1556                     190 00109$:
   1556 DD F9         [10]  191 	ld	sp, ix
   1558 DD E1         [14]  192 	pop	ix
   155A C9            [10]  193 	ret
                            194 ;src/man/BoardManager.c:59: void man_board_update(){
                            195 ;	---------------------------------
                            196 ; Function man_board_update
                            197 ; ---------------------------------
   155B                     198 _man_board_update::
                            199 ;src/man/BoardManager.c:61: }
   155B C9            [10]  200 	ret
                            201 ;src/man/BoardManager.c:69: void man_board_render(){
                            202 ;	---------------------------------
                            203 ; Function man_board_render
                            204 ; ---------------------------------
   155C                     205 _man_board_render::
   155C DD E5         [15]  206 	push	ix
   155E DD 21 00 00   [14]  207 	ld	ix,#0
   1562 DD 39         [15]  208 	add	ix,sp
   1564 F5            [11]  209 	push	af
   1565 F5            [11]  210 	push	af
   1566 3B            [ 6]  211 	dec	sp
                            212 ;src/man/BoardManager.c:73: for (j=0; j<board.height; j++){
   1567 DD 36 FB 00   [19]  213 	ld	-5 (ix), #0x00
   156B                     214 00110$:
   156B 21 A8 31      [10]  215 	ld	hl, #_board + 145
   156E DD 7E FB      [19]  216 	ld	a,-5 (ix)
   1571 96            [ 7]  217 	sub	a,(hl)
   1572 D2 02 16      [10]  218 	jp	NC, 00112$
                            219 ;src/man/BoardManager.c:74: for (i=0; i<board.width; i++){
   1575 DD 7E FB      [19]  220 	ld	a, -5 (ix)
   1578 4F            [ 4]  221 	ld	c, a
   1579 87            [ 4]  222 	add	a, a
   157A 81            [ 4]  223 	add	a, c
   157B 87            [ 4]  224 	add	a, a
   157C 87            [ 4]  225 	add	a, a
   157D 81            [ 4]  226 	add	a, c
   157E DD 77 FF      [19]  227 	ld	-1 (ix), a
   1581 DD 6E FB      [19]  228 	ld	l, -5 (ix)
   1584 4D            [ 4]  229 	ld	c, l
   1585 29            [11]  230 	add	hl, hl
   1586 09            [11]  231 	add	hl, bc
   1587 29            [11]  232 	add	hl, hl
   1588 29            [11]  233 	add	hl, hl
   1589 3E 17         [ 7]  234 	ld	a, #<(_board)
   158B 85            [ 4]  235 	add	a, l
   158C DD 77 FD      [19]  236 	ld	-3 (ix), a
   158F 3E 31         [ 7]  237 	ld	a, #>(_board)
   1591 CE 00         [ 7]  238 	adc	a, #0x00
   1593 DD 77 FE      [19]  239 	ld	-2 (ix), a
   1596 0E 00         [ 7]  240 	ld	c, #0x00
   1598                     241 00107$:
   1598 21 A7 31      [10]  242 	ld	hl, #_board + 144
   159B 46            [ 7]  243 	ld	b, (hl)
   159C 79            [ 4]  244 	ld	a, c
   159D 90            [ 4]  245 	sub	a, b
   159E 30 5C         [12]  246 	jr	NC,00111$
                            247 ;src/man/BoardManager.c:75: vmem = cpct_getScreenPtr (CPCT_VMEM_START, board.x + (i*5), board.y + (j*13));
   15A0 3A AA 31      [13]  248 	ld	a,(#_board + 147)
   15A3 DD 86 FF      [19]  249 	add	a, -1 (ix)
   15A6 57            [ 4]  250 	ld	d, a
   15A7 21 A9 31      [10]  251 	ld	hl, #_board + 146
   15AA 46            [ 7]  252 	ld	b, (hl)
   15AB 69            [ 4]  253 	ld	l, c
   15AC 29            [11]  254 	add	hl, hl
   15AD 29            [11]  255 	add	hl, hl
   15AE 09            [11]  256 	add	hl, bc
   15AF 78            [ 4]  257 	ld	a, b
   15B0 85            [ 4]  258 	add	a, l
   15B1 47            [ 4]  259 	ld	b, a
   15B2 C5            [11]  260 	push	bc
   15B3 58            [ 4]  261 	ld	e, b
   15B4 D5            [11]  262 	push	de
   15B5 21 00 C0      [10]  263 	ld	hl, #0xc000
   15B8 E5            [11]  264 	push	hl
   15B9 CD 34 25      [17]  265 	call	_cpct_getScreenPtr
   15BC C1            [10]  266 	pop	bc
   15BD E5            [11]  267 	push	hl
   15BE FD E1         [14]  268 	pop	iy
                            269 ;src/man/BoardManager.c:77: if (board.cells[j][i]!=255){
   15C0 DD 6E FD      [19]  270 	ld	l,-3 (ix)
   15C3 DD 66 FE      [19]  271 	ld	h,-2 (ix)
   15C6 06 00         [ 7]  272 	ld	b, #0x00
   15C8 09            [11]  273 	add	hl, bc
   15C9 7E            [ 7]  274 	ld	a, (hl)
                            275 ;src/man/BoardManager.c:78: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
                            276 ;src/man/BoardManager.c:77: if (board.cells[j][i]!=255){
   15CA DD 77 FC      [19]  277 	ld	-4 (ix), a
   15CD 3C            [ 4]  278 	inc	a
   15CE 28 1B         [12]  279 	jr	Z,00102$
                            280 ;src/man/BoardManager.c:78: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
   15D0 DD 6E FC      [19]  281 	ld	l, -4 (ix)
   15D3 26 00         [ 7]  282 	ld	h, #0x00
   15D5 29            [11]  283 	add	hl, hl
   15D6 11 C9 14      [10]  284 	ld	de, #_tiles
   15D9 19            [11]  285 	add	hl, de
   15DA 5E            [ 7]  286 	ld	e, (hl)
   15DB 23            [ 6]  287 	inc	hl
   15DC 56            [ 7]  288 	ld	d, (hl)
   15DD C5            [11]  289 	push	bc
   15DE D5            [11]  290 	push	de
   15DF 21 0C 04      [10]  291 	ld	hl, #0x040c
   15E2 E5            [11]  292 	push	hl
   15E3 FD E5         [15]  293 	push	iy
   15E5 CD CD 24      [17]  294 	call	_cpct_drawSpriteBlended
   15E8 C1            [10]  295 	pop	bc
   15E9 18 0E         [12]  296 	jr	00108$
   15EB                     297 00102$:
                            298 ;src/man/BoardManager.c:80: cpct_drawSolidBox (vmem, 0, SP_TILES_0_W, SP_TILES_0_H);	
   15EB C5            [11]  299 	push	bc
   15EC 21 04 0C      [10]  300 	ld	hl, #0x0c04
   15EF E5            [11]  301 	push	hl
   15F0 AF            [ 4]  302 	xor	a, a
   15F1 F5            [11]  303 	push	af
   15F2 33            [ 6]  304 	inc	sp
   15F3 FD E5         [15]  305 	push	iy
   15F5 CD 22 24      [17]  306 	call	_cpct_drawSolidBox
   15F8 C1            [10]  307 	pop	bc
   15F9                     308 00108$:
                            309 ;src/man/BoardManager.c:74: for (i=0; i<board.width; i++){
   15F9 0C            [ 4]  310 	inc	c
   15FA 18 9C         [12]  311 	jr	00107$
   15FC                     312 00111$:
                            313 ;src/man/BoardManager.c:73: for (j=0; j<board.height; j++){
   15FC DD 34 FB      [23]  314 	inc	-5 (ix)
   15FF C3 6B 15      [10]  315 	jp	00110$
   1602                     316 00112$:
   1602 DD F9         [10]  317 	ld	sp, ix
   1604 DD E1         [14]  318 	pop	ix
   1606 C9            [10]  319 	ret
                            320 	.area _CODE
                            321 	.area _INITIALIZER
                            322 	.area _CABS (ABS)
