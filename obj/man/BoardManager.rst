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
   33FC                      28 _board::
   33FC                      29 	.ds 153
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
   1564                      58 _man_board_create::
                             59 ;src/man/BoardManager.c:21: for (j=0; j<12; j++){
   1564 0E 00         [ 7]   60 	ld	c, #0x00
                             61 ;src/man/BoardManager.c:22: for (i=0; i<12; i++){
   1566                      62 00109$:
   1566 69            [ 4]   63 	ld	l, c
   1567 29            [11]   64 	add	hl, hl
   1568 09            [11]   65 	add	hl, bc
   1569 29            [11]   66 	add	hl, hl
   156A 29            [11]   67 	add	hl, hl
   156B 3E FC         [ 7]   68 	ld	a, #<(_board)
   156D 85            [ 4]   69 	add	a, l
   156E 5F            [ 4]   70 	ld	e, a
   156F 3E 33         [ 7]   71 	ld	a, #>(_board)
   1571 CE 00         [ 7]   72 	adc	a, #0x00
   1573 57            [ 4]   73 	ld	d, a
   1574 06 00         [ 7]   74 	ld	b, #0x00
   1576                      75 00103$:
                             76 ;src/man/BoardManager.c:23: board.cells[j][i] = 255;
   1576 68            [ 4]   77 	ld	l,b
   1577 26 00         [ 7]   78 	ld	h,#0x00
   1579 19            [11]   79 	add	hl, de
   157A 36 FF         [10]   80 	ld	(hl), #0xff
                             81 ;src/man/BoardManager.c:22: for (i=0; i<12; i++){
   157C 04            [ 4]   82 	inc	b
   157D 78            [ 4]   83 	ld	a, b
   157E D6 0C         [ 7]   84 	sub	a, #0x0c
   1580 38 F4         [12]   85 	jr	C,00103$
                             86 ;src/man/BoardManager.c:21: for (j=0; j<12; j++){
   1582 0C            [ 4]   87 	inc	c
   1583 79            [ 4]   88 	ld	a, c
   1584 D6 0C         [ 7]   89 	sub	a, #0x0c
   1586 38 DE         [12]   90 	jr	C,00109$
   1588 C9            [10]   91 	ret
   1589                      92 _tiles:
   1589 B4 13                93 	.dw _sp_tiles_0
   158B E4 13                94 	.dw _sp_tiles_1
   158D 14 14                95 	.dw _sp_tiles_2
   158F 44 14                96 	.dw _sp_tiles_3
   1591 74 14                97 	.dw _sp_tiles_4
   1593 A4 14                98 	.dw _sp_tiles_5
   1595 D4 14                99 	.dw _sp_tiles_6
   1597 04 15               100 	.dw _sp_tiles_7
   1599 34 15               101 	.dw _sp_tiles_8
                            102 ;src/man/BoardManager.c:34: void man_board_init(u8 x, u8 y, u8 width, u8 height){
                            103 ;	---------------------------------
                            104 ; Function man_board_init
                            105 ; ---------------------------------
   159B                     106 _man_board_init::
   159B DD E5         [15]  107 	push	ix
   159D DD 21 00 00   [14]  108 	ld	ix,#0
   15A1 DD 39         [15]  109 	add	ix,sp
   15A3 F5            [11]  110 	push	af
   15A4 F5            [11]  111 	push	af
                            112 ;src/man/BoardManager.c:37: board.width = width;
   15A5 01 8C 34      [10]  113 	ld	bc, #_board + 144
   15A8 DD 7E 06      [19]  114 	ld	a, 6 (ix)
   15AB 02            [ 7]  115 	ld	(bc), a
                            116 ;src/man/BoardManager.c:38: board.height = height;
   15AC 21 8D 34      [10]  117 	ld	hl, #(_board + 0x0091)
   15AF DD 7E 07      [19]  118 	ld	a, 7 (ix)
   15B2 77            [ 7]  119 	ld	(hl), a
                            120 ;src/man/BoardManager.c:39: board.x = x;
   15B3 21 8E 34      [10]  121 	ld	hl, #(_board + 0x0092)
   15B6 DD 7E 04      [19]  122 	ld	a, 4 (ix)
   15B9 77            [ 7]  123 	ld	(hl), a
                            124 ;src/man/BoardManager.c:40: board.y = y;
   15BA 21 8F 34      [10]  125 	ld	hl, #(_board + 0x0093)
   15BD DD 7E 05      [19]  126 	ld	a, 5 (ix)
   15C0 77            [ 7]  127 	ld	(hl), a
                            128 ;src/man/BoardManager.c:41: board.activeCell.active = 0;
   15C1 21 93 34      [10]  129 	ld	hl, #(_board + 0x0097)
   15C4 36 00         [10]  130 	ld	(hl), #0x00
                            131 ;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
   15C6 16 00         [ 7]  132 	ld	d, #0x00
   15C8                     133 00107$:
   15C8 0A            [ 7]  134 	ld	a, (bc)
   15C9 5F            [ 4]  135 	ld	e, a
   15CA 7A            [ 4]  136 	ld	a, d
   15CB 93            [ 4]  137 	sub	a, e
   15CC 30 4D         [12]  138 	jr	NC,00109$
                            139 ;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
   15CE 6A            [ 4]  140 	ld	l, d
   15CF 5D            [ 4]  141 	ld	e, l
   15D0 29            [11]  142 	add	hl, hl
   15D1 19            [11]  143 	add	hl, de
   15D2 29            [11]  144 	add	hl, hl
   15D3 29            [11]  145 	add	hl, hl
   15D4 3E FC         [ 7]  146 	ld	a, #<(_board)
   15D6 85            [ 4]  147 	add	a, l
   15D7 DD 77 FE      [19]  148 	ld	-2 (ix), a
   15DA 3E 33         [ 7]  149 	ld	a, #>(_board)
   15DC CE 00         [ 7]  150 	adc	a, #0x00
   15DE DD 77 FF      [19]  151 	ld	-1 (ix), a
   15E1 1E 00         [ 7]  152 	ld	e, #0x00
   15E3                     153 00104$:
   15E3 21 8D 34      [10]  154 	ld	hl, #(_board + 0x0091) + 0
   15E6 6E            [ 7]  155 	ld	l, (hl)
   15E7 7B            [ 4]  156 	ld	a, e
   15E8 95            [ 4]  157 	sub	a, l
   15E9 30 28         [12]  158 	jr	NC,00101$
                            159 ;src/man/BoardManager.c:45: board.cells[j][i] = (cpct_rand8() % NUM_COLORS);
   15EB DD 7E FE      [19]  160 	ld	a, -2 (ix)
   15EE 83            [ 4]  161 	add	a, e
   15EF DD 77 FC      [19]  162 	ld	-4 (ix), a
   15F2 DD 7E FF      [19]  163 	ld	a, -1 (ix)
   15F5 CE 00         [ 7]  164 	adc	a, #0x00
   15F7 DD 77 FD      [19]  165 	ld	-3 (ix), a
   15FA C5            [11]  166 	push	bc
   15FB D5            [11]  167 	push	de
   15FC CD 76 25      [17]  168 	call	_cpct_getRandom_mxor_u8
   15FF 65            [ 4]  169 	ld	h, l
   1600 3E 06         [ 7]  170 	ld	a, #0x06
   1602 F5            [11]  171 	push	af
   1603 33            [ 6]  172 	inc	sp
   1604 E5            [11]  173 	push	hl
   1605 33            [ 6]  174 	inc	sp
   1606 CD FB 24      [17]  175 	call	__moduchar
   1609 F1            [10]  176 	pop	af
   160A 7D            [ 4]  177 	ld	a, l
   160B D1            [10]  178 	pop	de
   160C C1            [10]  179 	pop	bc
   160D E1            [10]  180 	pop	hl
   160E E5            [11]  181 	push	hl
   160F 77            [ 7]  182 	ld	(hl), a
                            183 ;src/man/BoardManager.c:44: for (i=0; i<board.height; i++){
   1610 1C            [ 4]  184 	inc	e
   1611 18 D0         [12]  185 	jr	00104$
   1613                     186 00101$:
                            187 ;src/man/BoardManager.c:47: board.updated = YES;
   1613 21 94 34      [10]  188 	ld	hl, #(_board + 0x0098)
   1616 36 01         [10]  189 	ld	(hl), #0x01
                            190 ;src/man/BoardManager.c:43: for (j=0; j<board.width; j++){
   1618 14            [ 4]  191 	inc	d
   1619 18 AD         [12]  192 	jr	00107$
   161B                     193 00109$:
   161B DD F9         [10]  194 	ld	sp, ix
   161D DD E1         [14]  195 	pop	ix
   161F C9            [10]  196 	ret
                            197 ;src/man/BoardManager.c:60: void man_board_update(){
                            198 ;	---------------------------------
                            199 ; Function man_board_update
                            200 ; ---------------------------------
   1620                     201 _man_board_update::
                            202 ;src/man/BoardManager.c:62: }
   1620 C9            [10]  203 	ret
                            204 ;src/man/BoardManager.c:70: void man_board_render(){
                            205 ;	---------------------------------
                            206 ; Function man_board_render
                            207 ; ---------------------------------
   1621                     208 _man_board_render::
   1621 DD E5         [15]  209 	push	ix
   1623 DD 21 00 00   [14]  210 	ld	ix,#0
   1627 DD 39         [15]  211 	add	ix,sp
   1629 F5            [11]  212 	push	af
   162A F5            [11]  213 	push	af
   162B 3B            [ 6]  214 	dec	sp
                            215 ;src/man/BoardManager.c:73: if (board.updated = YES){
   162C 01 94 34      [10]  216 	ld	bc, #_board + 152
   162F 3E 01         [ 7]  217 	ld	a, #0x01
   1631 02            [ 7]  218 	ld	(bc), a
                            219 ;src/man/BoardManager.c:74: for (j=0; j<board.height; j++){
   1632 1E 00         [ 7]  220 	ld	e, #0x00
   1634                     221 00112$:
   1634 21 8D 34      [10]  222 	ld	hl, #_board + 145
   1637 56            [ 7]  223 	ld	d, (hl)
   1638 7B            [ 4]  224 	ld	a, e
   1639 92            [ 4]  225 	sub	a, d
   163A D2 E0 16      [10]  226 	jp	NC, 00105$
                            227 ;src/man/BoardManager.c:75: for (i=0; i<board.width; i++){
   163D D5            [11]  228 	push	de
   163E 7B            [ 4]  229 	ld	a, e
   163F 87            [ 4]  230 	add	a, a
   1640 83            [ 4]  231 	add	a, e
   1641 87            [ 4]  232 	add	a, a
   1642 87            [ 4]  233 	add	a, a
   1643 83            [ 4]  234 	add	a, e
   1644 D1            [10]  235 	pop	de
   1645 DD 77 FD      [19]  236 	ld	-3 (ix), a
   1648 D5            [11]  237 	push	de
   1649 6B            [ 4]  238 	ld	l, e
   164A 29            [11]  239 	add	hl, hl
   164B 19            [11]  240 	add	hl, de
   164C 29            [11]  241 	add	hl, hl
   164D 29            [11]  242 	add	hl, hl
   164E D1            [10]  243 	pop	de
   164F 3E FC         [ 7]  244 	ld	a, #<(_board)
   1651 85            [ 4]  245 	add	a, l
   1652 DD 77 FE      [19]  246 	ld	-2 (ix), a
   1655 3E 33         [ 7]  247 	ld	a, #>(_board)
   1657 CE 00         [ 7]  248 	adc	a, #0x00
   1659 DD 77 FF      [19]  249 	ld	-1 (ix), a
   165C 16 00         [ 7]  250 	ld	d, #0x00
   165E                     251 00109$:
   165E 21 8C 34      [10]  252 	ld	hl, #_board + 144
   1661 6E            [ 7]  253 	ld	l, (hl)
   1662 7A            [ 4]  254 	ld	a, d
   1663 95            [ 4]  255 	sub	a, l
   1664 30 76         [12]  256 	jr	NC,00113$
                            257 ;src/man/BoardManager.c:76: vmem = cpct_getScreenPtr (CPCT_VMEM_START, board.x + (i*5), board.y + (j*13));
   1666 3A 8F 34      [13]  258 	ld	a,(#_board + 147)
   1669 DD 86 FD      [19]  259 	add	a, -3 (ix)
   166C DD 77 FC      [19]  260 	ld	-4 (ix), a
   166F 21 8E 34      [10]  261 	ld	hl, #_board + 146
   1672 7E            [ 7]  262 	ld	a, (hl)
   1673 DD 77 FB      [19]  263 	ld	-5 (ix), a
   1676 D5            [11]  264 	push	de
   1677 6A            [ 4]  265 	ld	l, d
   1678 5D            [ 4]  266 	ld	e, l
   1679 29            [11]  267 	add	hl, hl
   167A 29            [11]  268 	add	hl, hl
   167B 19            [11]  269 	add	hl, de
   167C D1            [10]  270 	pop	de
   167D DD 7E FB      [19]  271 	ld	a, -5 (ix)
   1680 85            [ 4]  272 	add	a, l
   1681 DD 77 FB      [19]  273 	ld	-5 (ix), a
   1684 C5            [11]  274 	push	bc
   1685 D5            [11]  275 	push	de
   1686 DD 66 FC      [19]  276 	ld	h, -4 (ix)
   1689 DD 6E FB      [19]  277 	ld	l, -5 (ix)
   168C E5            [11]  278 	push	hl
   168D 21 00 C0      [10]  279 	ld	hl, #0xc000
   1690 E5            [11]  280 	push	hl
   1691 CD 19 28      [17]  281 	call	_cpct_getScreenPtr
   1694 D1            [10]  282 	pop	de
   1695 C1            [10]  283 	pop	bc
   1696 E5            [11]  284 	push	hl
   1697 FD E1         [14]  285 	pop	iy
                            286 ;src/man/BoardManager.c:78: if (board.cells[j][i]!=255){
   1699 DD 7E FE      [19]  287 	ld	a, -2 (ix)
   169C 82            [ 4]  288 	add	a, d
   169D 6F            [ 4]  289 	ld	l, a
   169E DD 7E FF      [19]  290 	ld	a, -1 (ix)
   16A1 CE 00         [ 7]  291 	adc	a, #0x00
   16A3 67            [ 4]  292 	ld	h, a
   16A4 6E            [ 7]  293 	ld	l, (hl)
                            294 ;src/man/BoardManager.c:79: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
                            295 ;src/man/BoardManager.c:78: if (board.cells[j][i]!=255){
   16A5 7D            [ 4]  296 	ld	a, l
   16A6 3C            [ 4]  297 	inc	a
   16A7 28 1F         [12]  298 	jr	Z,00102$
                            299 ;src/man/BoardManager.c:79: cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
   16A9 26 00         [ 7]  300 	ld	h, #0x00
   16AB 29            [11]  301 	add	hl, hl
   16AC 3E 89         [ 7]  302 	ld	a, #<(_tiles)
   16AE 85            [ 4]  303 	add	a, l
   16AF 6F            [ 4]  304 	ld	l, a
   16B0 3E 15         [ 7]  305 	ld	a, #>(_tiles)
   16B2 8C            [ 4]  306 	adc	a, h
   16B3 67            [ 4]  307 	ld	h, a
   16B4 7E            [ 7]  308 	ld	a, (hl)
   16B5 23            [ 6]  309 	inc	hl
   16B6 66            [ 7]  310 	ld	h, (hl)
   16B7 6F            [ 4]  311 	ld	l, a
   16B8 C5            [11]  312 	push	bc
   16B9 D5            [11]  313 	push	de
   16BA E5            [11]  314 	push	hl
   16BB 21 0C 04      [10]  315 	ld	hl, #0x040c
   16BE E5            [11]  316 	push	hl
   16BF FD E5         [15]  317 	push	iy
   16C1 CD B2 27      [17]  318 	call	_cpct_drawSpriteBlended
   16C4 D1            [10]  319 	pop	de
   16C5 C1            [10]  320 	pop	bc
   16C6 18 10         [12]  321 	jr	00110$
   16C8                     322 00102$:
                            323 ;src/man/BoardManager.c:81: cpct_drawSolidBox (vmem, 0, SP_TILES_0_W, SP_TILES_0_H);	
   16C8 C5            [11]  324 	push	bc
   16C9 D5            [11]  325 	push	de
   16CA 21 04 0C      [10]  326 	ld	hl, #0x0c04
   16CD E5            [11]  327 	push	hl
   16CE AF            [ 4]  328 	xor	a, a
   16CF F5            [11]  329 	push	af
   16D0 33            [ 6]  330 	inc	sp
   16D1 FD E5         [15]  331 	push	iy
   16D3 CD 07 27      [17]  332 	call	_cpct_drawSolidBox
   16D6 D1            [10]  333 	pop	de
   16D7 C1            [10]  334 	pop	bc
   16D8                     335 00110$:
                            336 ;src/man/BoardManager.c:75: for (i=0; i<board.width; i++){
   16D8 14            [ 4]  337 	inc	d
   16D9 C3 5E 16      [10]  338 	jp	00109$
   16DC                     339 00113$:
                            340 ;src/man/BoardManager.c:74: for (j=0; j<board.height; j++){
   16DC 1C            [ 4]  341 	inc	e
   16DD C3 34 16      [10]  342 	jp	00112$
   16E0                     343 00105$:
                            344 ;src/man/BoardManager.c:85: board.updated = NO;
   16E0 AF            [ 4]  345 	xor	a, a
   16E1 02            [ 7]  346 	ld	(bc), a
   16E2 DD F9         [10]  347 	ld	sp, ix
   16E4 DD E1         [14]  348 	pop	ix
   16E6 C9            [10]  349 	ret
                            350 	.area _CODE
                            351 	.area _INITIALIZER
                            352 	.area _CABS (ABS)
