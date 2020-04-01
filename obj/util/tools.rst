                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
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
   1623                      68 _clearScreen::
                             69 ;src/util/tools.c:35: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(bgColor, bgColor), 0x4000);
   1623 FD 21 02 00   [14]   70 	ld	iy, #2
   1627 FD 39         [15]   71 	add	iy, sp
   1629 FD 66 00      [19]   72 	ld	h, 0 (iy)
   162C FD 6E 00      [19]   73 	ld	l, 0 (iy)
   162F E5            [11]   74 	push	hl
   1630 CD E8 23      [17]   75 	call	_cpct_px2byteM0
   1633 45            [ 4]   76 	ld	b, l
   1634 21 00 40      [10]   77 	ld	hl, #0x4000
   1637 E5            [11]   78 	push	hl
   1638 C5            [11]   79 	push	bc
   1639 33            [ 6]   80 	inc	sp
   163A 26 C0         [ 7]   81 	ld	h, #0xc0
   163C E5            [11]   82 	push	hl
   163D CD 04 24      [17]   83 	call	_cpct_memset
   1640 C9            [10]   84 	ret
                             85 ;src/util/tools.c:46: void drawWindow(u8 x, u8 y, u8 width, u8 height, u8 fgColor, u8 bgColor)
                             86 ;	---------------------------------
                             87 ; Function drawWindow
                             88 ; ---------------------------------
   1641                      89 _drawWindow::
   1641 DD E5         [15]   90 	push	ix
   1643 DD 21 00 00   [14]   91 	ld	ix,#0
   1647 DD 39         [15]   92 	add	ix,sp
   1649 F5            [11]   93 	push	af
   164A F5            [11]   94 	push	af
                             95 ;src/util/tools.c:51: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y);
   164B DD 56 04      [19]   96 	ld	d, 4 (ix)
   164E 14            [ 4]   97 	inc	d
   164F D5            [11]   98 	push	de
   1650 DD 7E 05      [19]   99 	ld	a, 5 (ix)
   1653 F5            [11]  100 	push	af
   1654 33            [ 6]  101 	inc	sp
   1655 D5            [11]  102 	push	de
   1656 33            [ 6]  103 	inc	sp
   1657 21 00 C0      [10]  104 	ld	hl, #0xc000
   165A E5            [11]  105 	push	hl
   165B CD 34 25      [17]  106 	call	_cpct_getScreenPtr
   165E 4D            [ 4]  107 	ld	c, l
   165F 44            [ 4]  108 	ld	b, h
   1660 D1            [10]  109 	pop	de
                            110 ;src/util/tools.c:52: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
   1661 DD 7E 06      [19]  111 	ld	a, 6 (ix)
   1664 C6 FC         [ 7]  112 	add	a, #0xfc
   1666 5F            [ 4]  113 	ld	e, a
   1667 C5            [11]  114 	push	bc
   1668 D5            [11]  115 	push	de
   1669 DD 66 08      [19]  116 	ld	h, 8 (ix)
   166C DD 6E 08      [19]  117 	ld	l, 8 (ix)
   166F E5            [11]  118 	push	hl
   1670 CD E8 23      [17]  119 	call	_cpct_px2byteM0
   1673 65            [ 4]  120 	ld	h, l
   1674 D1            [10]  121 	pop	de
   1675 C1            [10]  122 	pop	bc
   1676 69            [ 4]  123 	ld	l, c
   1677 D5            [11]  124 	push	de
   1678 16 02         [ 7]  125 	ld	d,#0x02
   167A D5            [11]  126 	push	de
   167B E5            [11]  127 	push	hl
   167C 33            [ 6]  128 	inc	sp
   167D 60            [ 4]  129 	ld	h, b
   167E E5            [11]  130 	push	hl
   167F CD 22 24      [17]  131 	call	_cpct_drawSolidBox
   1682 D1            [10]  132 	pop	de
                            133 ;src/util/tools.c:53: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height);
   1683 DD 7E 05      [19]  134 	ld	a, 5 (ix)
   1686 DD 86 07      [19]  135 	add	a, 7 (ix)
   1689 DD 77 FF      [19]  136 	ld	-1 (ix), a
   168C D5            [11]  137 	push	de
   168D F5            [11]  138 	push	af
   168E 33            [ 6]  139 	inc	sp
   168F D5            [11]  140 	push	de
   1690 33            [ 6]  141 	inc	sp
   1691 21 00 C0      [10]  142 	ld	hl, #0xc000
   1694 E5            [11]  143 	push	hl
   1695 CD 34 25      [17]  144 	call	_cpct_getScreenPtr
   1698 4D            [ 4]  145 	ld	c, l
   1699 44            [ 4]  146 	ld	b, h
   169A D1            [10]  147 	pop	de
                            148 ;src/util/tools.c:54: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
   169B C5            [11]  149 	push	bc
   169C D5            [11]  150 	push	de
   169D DD 66 08      [19]  151 	ld	h, 8 (ix)
   16A0 DD 6E 08      [19]  152 	ld	l, 8 (ix)
   16A3 E5            [11]  153 	push	hl
   16A4 CD E8 23      [17]  154 	call	_cpct_px2byteM0
   16A7 DD 75 FE      [19]  155 	ld	-2 (ix), l
   16AA D1            [10]  156 	pop	de
   16AB C1            [10]  157 	pop	bc
   16AC D5            [11]  158 	push	de
   16AD 16 02         [ 7]  159 	ld	d,#0x02
   16AF D5            [11]  160 	push	de
   16B0 DD 7E FE      [19]  161 	ld	a, -2 (ix)
   16B3 F5            [11]  162 	push	af
   16B4 33            [ 6]  163 	inc	sp
   16B5 C5            [11]  164 	push	bc
   16B6 CD 22 24      [17]  165 	call	_cpct_drawSolidBox
   16B9 D1            [10]  166 	pop	de
                            167 ;src/util/tools.c:56: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 2);
   16BA DD 7E 05      [19]  168 	ld	a, 5 (ix)
   16BD C6 02         [ 7]  169 	add	a, #0x02
   16BF DD 77 FE      [19]  170 	ld	-2 (ix), a
   16C2 D5            [11]  171 	push	de
   16C3 F5            [11]  172 	push	af
   16C4 33            [ 6]  173 	inc	sp
   16C5 D5            [11]  174 	push	de
   16C6 33            [ 6]  175 	inc	sp
   16C7 21 00 C0      [10]  176 	ld	hl, #0xc000
   16CA E5            [11]  177 	push	hl
   16CB CD 34 25      [17]  178 	call	_cpct_getScreenPtr
   16CE D1            [10]  179 	pop	de
                            180 ;src/util/tools.c:57: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
   16CF E5            [11]  181 	push	hl
   16D0 D5            [11]  182 	push	de
   16D1 01 00 00      [10]  183 	ld	bc, #0x0000
   16D4 C5            [11]  184 	push	bc
   16D5 CD E8 23      [17]  185 	call	_cpct_px2byteM0
   16D8 4D            [ 4]  186 	ld	c, l
   16D9 D1            [10]  187 	pop	de
   16DA E1            [10]  188 	pop	hl
   16DB D5            [11]  189 	push	de
   16DC 16 02         [ 7]  190 	ld	d,#0x02
   16DE D5            [11]  191 	push	de
   16DF 79            [ 4]  192 	ld	a, c
   16E0 F5            [11]  193 	push	af
   16E1 33            [ 6]  194 	inc	sp
   16E2 E5            [11]  195 	push	hl
   16E3 CD 22 24      [17]  196 	call	_cpct_drawSolidBox
   16E6 D1            [10]  197 	pop	de
                            198 ;src/util/tools.c:58: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height - 2);
   16E7 DD 35 FF      [23]  199 	dec	-1 (ix)
   16EA DD 35 FF      [23]  200 	dec	-1 (ix)
   16ED D5            [11]  201 	push	de
   16EE DD 7E FF      [19]  202 	ld	a, -1 (ix)
   16F1 F5            [11]  203 	push	af
   16F2 33            [ 6]  204 	inc	sp
   16F3 D5            [11]  205 	push	de
   16F4 33            [ 6]  206 	inc	sp
   16F5 21 00 C0      [10]  207 	ld	hl, #0xc000
   16F8 E5            [11]  208 	push	hl
   16F9 CD 34 25      [17]  209 	call	_cpct_getScreenPtr
   16FC D1            [10]  210 	pop	de
                            211 ;src/util/tools.c:59: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
   16FD E5            [11]  212 	push	hl
   16FE D5            [11]  213 	push	de
   16FF 01 00 00      [10]  214 	ld	bc, #0x0000
   1702 C5            [11]  215 	push	bc
   1703 CD E8 23      [17]  216 	call	_cpct_px2byteM0
   1706 4D            [ 4]  217 	ld	c, l
   1707 D1            [10]  218 	pop	de
   1708 E1            [10]  219 	pop	hl
   1709 D5            [11]  220 	push	de
   170A 16 02         [ 7]  221 	ld	d,#0x02
   170C D5            [11]  222 	push	de
   170D 79            [ 4]  223 	ld	a, c
   170E F5            [11]  224 	push	af
   170F 33            [ 6]  225 	inc	sp
   1710 E5            [11]  226 	push	hl
   1711 CD 22 24      [17]  227 	call	_cpct_drawSolidBox
   1714 D1            [10]  228 	pop	de
                            229 ;src/util/tools.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 4);
   1715 DD 7E 05      [19]  230 	ld	a, 5 (ix)
   1718 C6 04         [ 7]  231 	add	a, #0x04
   171A DD 77 FD      [19]  232 	ld	-3 (ix), a
   171D D5            [11]  233 	push	de
   171E F5            [11]  234 	push	af
   171F 33            [ 6]  235 	inc	sp
   1720 D5            [11]  236 	push	de
   1721 33            [ 6]  237 	inc	sp
   1722 21 00 C0      [10]  238 	ld	hl, #0xc000
   1725 E5            [11]  239 	push	hl
   1726 CD 34 25      [17]  240 	call	_cpct_getScreenPtr
   1729 4D            [ 4]  241 	ld	c, l
   172A 44            [ 4]  242 	ld	b, h
   172B D1            [10]  243 	pop	de
                            244 ;src/util/tools.c:62: cpct_drawSolidBox(pvideo, cpct_px2byteM0(bgColor, bgColor), width - 4, height - 6);
   172C DD 7E 07      [19]  245 	ld	a, 7 (ix)
   172F C6 FA         [ 7]  246 	add	a, #0xfa
   1731 DD 77 FC      [19]  247 	ld	-4 (ix), a
   1734 C5            [11]  248 	push	bc
   1735 D5            [11]  249 	push	de
   1736 DD 66 09      [19]  250 	ld	h, 9 (ix)
   1739 DD 6E 09      [19]  251 	ld	l, 9 (ix)
   173C E5            [11]  252 	push	hl
   173D CD E8 23      [17]  253 	call	_cpct_px2byteM0
   1740 7D            [ 4]  254 	ld	a, l
   1741 D1            [10]  255 	pop	de
   1742 57            [ 4]  256 	ld	d, a
   1743 C1            [10]  257 	pop	bc
   1744 DD 7E FC      [19]  258 	ld	a, -4 (ix)
   1747 F5            [11]  259 	push	af
   1748 33            [ 6]  260 	inc	sp
   1749 7B            [ 4]  261 	ld	a, e
   174A F5            [11]  262 	push	af
   174B 33            [ 6]  263 	inc	sp
   174C D5            [11]  264 	push	de
   174D 33            [ 6]  265 	inc	sp
   174E C5            [11]  266 	push	bc
   174F CD 22 24      [17]  267 	call	_cpct_drawSolidBox
                            268 ;src/util/tools.c:65: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 2);
   1752 DD 66 FE      [19]  269 	ld	h, -2 (ix)
   1755 DD 6E 04      [19]  270 	ld	l, 4 (ix)
   1758 E5            [11]  271 	push	hl
   1759 21 00 C0      [10]  272 	ld	hl, #0xc000
   175C E5            [11]  273 	push	hl
   175D CD 34 25      [17]  274 	call	_cpct_getScreenPtr
                            275 ;src/util/tools.c:66: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
   1760 E5            [11]  276 	push	hl
   1761 DD 7E 08      [19]  277 	ld	a, 8 (ix)
   1764 F5            [11]  278 	push	af
   1765 33            [ 6]  279 	inc	sp
   1766 AF            [ 4]  280 	xor	a, a
   1767 F5            [11]  281 	push	af
   1768 33            [ 6]  282 	inc	sp
   1769 CD E8 23      [17]  283 	call	_cpct_px2byteM0
   176C 55            [ 4]  284 	ld	d, l
   176D C1            [10]  285 	pop	bc
   176E 21 01 02      [10]  286 	ld	hl, #0x0201
   1771 E5            [11]  287 	push	hl
   1772 D5            [11]  288 	push	de
   1773 33            [ 6]  289 	inc	sp
   1774 C5            [11]  290 	push	bc
   1775 CD 22 24      [17]  291 	call	_cpct_drawSolidBox
                            292 ;src/util/tools.c:69: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 4);
   1778 DD 66 FD      [19]  293 	ld	h, -3 (ix)
   177B DD 6E 04      [19]  294 	ld	l, 4 (ix)
   177E E5            [11]  295 	push	hl
   177F 21 00 C0      [10]  296 	ld	hl, #0xc000
   1782 E5            [11]  297 	push	hl
   1783 CD 34 25      [17]  298 	call	_cpct_getScreenPtr
                            299 ;src/util/tools.c:70: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, height - 6);
   1786 E5            [11]  300 	push	hl
   1787 AF            [ 4]  301 	xor	a, a
   1788 F5            [11]  302 	push	af
   1789 33            [ 6]  303 	inc	sp
   178A DD 7E 08      [19]  304 	ld	a, 8 (ix)
   178D F5            [11]  305 	push	af
   178E 33            [ 6]  306 	inc	sp
   178F CD E8 23      [17]  307 	call	_cpct_px2byteM0
   1792 55            [ 4]  308 	ld	d, l
   1793 C1            [10]  309 	pop	bc
   1794 DD 7E FC      [19]  310 	ld	a, -4 (ix)
   1797 F5            [11]  311 	push	af
   1798 33            [ 6]  312 	inc	sp
   1799 3E 01         [ 7]  313 	ld	a, #0x01
   179B F5            [11]  314 	push	af
   179C 33            [ 6]  315 	inc	sp
   179D D5            [11]  316 	push	de
   179E 33            [ 6]  317 	inc	sp
   179F C5            [11]  318 	push	bc
   17A0 CD 22 24      [17]  319 	call	_cpct_drawSolidBox
                            320 ;src/util/tools.c:73: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + height - 2);
   17A3 DD 66 FF      [19]  321 	ld	h, -1 (ix)
   17A6 DD 6E 04      [19]  322 	ld	l, 4 (ix)
   17A9 E5            [11]  323 	push	hl
   17AA 21 00 C0      [10]  324 	ld	hl, #0xc000
   17AD E5            [11]  325 	push	hl
   17AE CD 34 25      [17]  326 	call	_cpct_getScreenPtr
                            327 ;src/util/tools.c:74: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
   17B1 E5            [11]  328 	push	hl
   17B2 DD 7E 08      [19]  329 	ld	a, 8 (ix)
   17B5 F5            [11]  330 	push	af
   17B6 33            [ 6]  331 	inc	sp
   17B7 AF            [ 4]  332 	xor	a, a
   17B8 F5            [11]  333 	push	af
   17B9 33            [ 6]  334 	inc	sp
   17BA CD E8 23      [17]  335 	call	_cpct_px2byteM0
   17BD 55            [ 4]  336 	ld	d, l
   17BE C1            [10]  337 	pop	bc
   17BF 21 01 02      [10]  338 	ld	hl, #0x0201
   17C2 E5            [11]  339 	push	hl
   17C3 D5            [11]  340 	push	de
   17C4 33            [ 6]  341 	inc	sp
   17C5 C5            [11]  342 	push	bc
   17C6 CD 22 24      [17]  343 	call	_cpct_drawSolidBox
                            344 ;src/util/tools.c:76: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 2);
   17C9 DD 7E 04      [19]  345 	ld	a, 4 (ix)
   17CC DD 86 06      [19]  346 	add	a, 6 (ix)
   17CF C6 FD         [ 7]  347 	add	a, #0xfd
   17D1 47            [ 4]  348 	ld	b, a
   17D2 C5            [11]  349 	push	bc
   17D3 DD 7E FE      [19]  350 	ld	a, -2 (ix)
   17D6 F5            [11]  351 	push	af
   17D7 33            [ 6]  352 	inc	sp
   17D8 C5            [11]  353 	push	bc
   17D9 33            [ 6]  354 	inc	sp
   17DA 21 00 C0      [10]  355 	ld	hl, #0xc000
   17DD E5            [11]  356 	push	hl
   17DE CD 34 25      [17]  357 	call	_cpct_getScreenPtr
   17E1 C1            [10]  358 	pop	bc
                            359 ;src/util/tools.c:77: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
   17E2 E5            [11]  360 	push	hl
   17E3 C5            [11]  361 	push	bc
   17E4 AF            [ 4]  362 	xor	a, a
   17E5 F5            [11]  363 	push	af
   17E6 33            [ 6]  364 	inc	sp
   17E7 DD 7E 08      [19]  365 	ld	a, 8 (ix)
   17EA F5            [11]  366 	push	af
   17EB 33            [ 6]  367 	inc	sp
   17EC CD E8 23      [17]  368 	call	_cpct_px2byteM0
   17EF 4D            [ 4]  369 	ld	c, l
   17F0 F1            [10]  370 	pop	af
   17F1 47            [ 4]  371 	ld	b, a
   17F2 E1            [10]  372 	pop	hl
   17F3 C5            [11]  373 	push	bc
   17F4 11 01 02      [10]  374 	ld	de, #0x0201
   17F7 D5            [11]  375 	push	de
   17F8 79            [ 4]  376 	ld	a, c
   17F9 F5            [11]  377 	push	af
   17FA 33            [ 6]  378 	inc	sp
   17FB E5            [11]  379 	push	hl
   17FC CD 22 24      [17]  380 	call	_cpct_drawSolidBox
   17FF C1            [10]  381 	pop	bc
                            382 ;src/util/tools.c:79: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 4);
   1800 C5            [11]  383 	push	bc
   1801 DD 7E FD      [19]  384 	ld	a, -3 (ix)
   1804 F5            [11]  385 	push	af
   1805 33            [ 6]  386 	inc	sp
   1806 C5            [11]  387 	push	bc
   1807 33            [ 6]  388 	inc	sp
   1808 21 00 C0      [10]  389 	ld	hl, #0xc000
   180B E5            [11]  390 	push	hl
   180C CD 34 25      [17]  391 	call	_cpct_getScreenPtr
   180F E5            [11]  392 	push	hl
   1810 DD 7E 08      [19]  393 	ld	a, 8 (ix)
   1813 F5            [11]  394 	push	af
   1814 33            [ 6]  395 	inc	sp
   1815 AF            [ 4]  396 	xor	a, a
   1816 F5            [11]  397 	push	af
   1817 33            [ 6]  398 	inc	sp
   1818 CD E8 23      [17]  399 	call	_cpct_px2byteM0
   181B 4D            [ 4]  400 	ld	c, l
   181C D1            [10]  401 	pop	de
   181D F1            [10]  402 	pop	af
   181E 47            [ 4]  403 	ld	b, a
   181F C5            [11]  404 	push	bc
   1820 DD 7E FC      [19]  405 	ld	a, -4 (ix)
   1823 F5            [11]  406 	push	af
   1824 33            [ 6]  407 	inc	sp
   1825 06 01         [ 7]  408 	ld	b, #0x01
   1827 C5            [11]  409 	push	bc
   1828 D5            [11]  410 	push	de
   1829 CD 22 24      [17]  411 	call	_cpct_drawSolidBox
   182C C1            [10]  412 	pop	bc
                            413 ;src/util/tools.c:82: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + height - 2);
   182D DD 7E FF      [19]  414 	ld	a, -1 (ix)
   1830 F5            [11]  415 	push	af
   1831 33            [ 6]  416 	inc	sp
   1832 C5            [11]  417 	push	bc
   1833 33            [ 6]  418 	inc	sp
   1834 21 00 C0      [10]  419 	ld	hl, #0xc000
   1837 E5            [11]  420 	push	hl
   1838 CD 34 25      [17]  421 	call	_cpct_getScreenPtr
                            422 ;src/util/tools.c:83: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
   183B E5            [11]  423 	push	hl
   183C AF            [ 4]  424 	xor	a, a
   183D F5            [11]  425 	push	af
   183E 33            [ 6]  426 	inc	sp
   183F DD 7E 08      [19]  427 	ld	a, 8 (ix)
   1842 F5            [11]  428 	push	af
   1843 33            [ 6]  429 	inc	sp
   1844 CD E8 23      [17]  430 	call	_cpct_px2byteM0
   1847 55            [ 4]  431 	ld	d, l
   1848 C1            [10]  432 	pop	bc
   1849 21 01 02      [10]  433 	ld	hl, #0x0201
   184C E5            [11]  434 	push	hl
   184D D5            [11]  435 	push	de
   184E 33            [ 6]  436 	inc	sp
   184F C5            [11]  437 	push	bc
   1850 CD 22 24      [17]  438 	call	_cpct_drawSolidBox
   1853 DD F9         [10]  439 	ld	sp, ix
   1855 DD E1         [14]  440 	pop	ix
   1857 C9            [10]  441 	ret
                            442 ;src/util/tools.c:94: void updateNumber(u8 number)
                            443 ;	---------------------------------
                            444 ; Function updateNumber
                            445 ; ---------------------------------
   1858                     446 _updateNumber::
   1858 DD E5         [15]  447 	push	ix
   185A DD 21 00 00   [14]  448 	ld	ix,#0
   185E DD 39         [15]  449 	add	ix,sp
   1860 F5            [11]  450 	push	af
   1861 3B            [ 6]  451 	dec	sp
                            452 ;src/util/tools.c:99: pvmem = cpct_getScreenPtr(SCR_VMEM, 58, 80);
   1862 21 3A 50      [10]  453 	ld	hl, #0x503a
   1865 E5            [11]  454 	push	hl
   1866 21 00 C0      [10]  455 	ld	hl, #0xc000
   1869 E5            [11]  456 	push	hl
   186A CD 34 25      [17]  457 	call	_cpct_getScreenPtr
                            458 ;src/util/tools.c:100: cpct_drawSolidBox(pvmem, cpct_px2byteM0(14, 14), 8, 14);
   186D E5            [11]  459 	push	hl
   186E 21 0E 0E      [10]  460 	ld	hl, #0x0e0e
   1871 E5            [11]  461 	push	hl
   1872 CD E8 23      [17]  462 	call	_cpct_px2byteM0
   1875 55            [ 4]  463 	ld	d, l
   1876 C1            [10]  464 	pop	bc
   1877 21 08 0E      [10]  465 	ld	hl, #0x0e08
   187A E5            [11]  466 	push	hl
   187B D5            [11]  467 	push	de
   187C 33            [ 6]  468 	inc	sp
   187D C5            [11]  469 	push	bc
   187E CD 22 24      [17]  470 	call	_cpct_drawSolidBox
                            471 ;src/util/tools.c:101: sprintf(text, "%02d", number);
   1881 DD 5E 04      [19]  472 	ld	e, 4 (ix)
   1884 16 00         [ 7]  473 	ld	d, #0x00
   1886 21 00 00      [10]  474 	ld	hl, #0x0000
   1889 39            [11]  475 	add	hl, sp
   188A 4D            [ 4]  476 	ld	c, l
   188B 44            [ 4]  477 	ld	b, h
   188C E5            [11]  478 	push	hl
   188D D5            [11]  479 	push	de
   188E 11 B6 18      [10]  480 	ld	de, #___str_0
   1891 D5            [11]  481 	push	de
   1892 C5            [11]  482 	push	bc
   1893 CD 0F 23      [17]  483 	call	_sprintf
   1896 21 06 00      [10]  484 	ld	hl, #6
   1899 39            [11]  485 	add	hl, sp
   189A F9            [ 6]  486 	ld	sp, hl
   189B E1            [10]  487 	pop	hl
                            488 ;src/util/tools.c:102: drawText(text, 58, 80, COLORTXT_YELLOW, DOUBLEHEIGHT, TRANSPARENT);
   189C 01 02 01      [10]  489 	ld	bc, #0x0102
   189F C5            [11]  490 	push	bc
   18A0 01 50 01      [10]  491 	ld	bc, #0x0150
   18A3 C5            [11]  492 	push	bc
   18A4 3E 3A         [ 7]  493 	ld	a, #0x3a
   18A6 F5            [11]  494 	push	af
   18A7 33            [ 6]  495 	inc	sp
   18A8 E5            [11]  496 	push	hl
   18A9 CD C9 1B      [17]  497 	call	_drawText
   18AC 21 07 00      [10]  498 	ld	hl, #7
   18AF 39            [11]  499 	add	hl, sp
   18B0 F9            [ 6]  500 	ld	sp, hl
   18B1 DD F9         [10]  501 	ld	sp, ix
   18B3 DD E1         [14]  502 	pop	ix
   18B5 C9            [10]  503 	ret
   18B6                     504 ___str_0:
   18B6 25 30 32 64         505 	.ascii "%02d"
   18BA 00                  506 	.db 0x00
                            507 ;src/util/tools.c:112: u8 resultNumber()
                            508 ;	---------------------------------
                            509 ; Function resultNumber
                            510 ; ---------------------------------
   18BB                     511 _resultNumber::
                            512 ;src/util/tools.c:116: selection = 1;
   18BB 0E 01         [ 7]  513 	ld	c, #0x01
                            514 ;src/util/tools.c:117: drawText("UP/DOWN:CHANGE LEVEL", 16, 92, COLORTXT_MAUVE, NORMALHEIGHT, TRANSPARENT);
   18BD C5            [11]  515 	push	bc
   18BE 21 01 01      [10]  516 	ld	hl, #0x0101
   18C1 E5            [11]  517 	push	hl
   18C2 21 5C 05      [10]  518 	ld	hl, #0x055c
   18C5 E5            [11]  519 	push	hl
   18C6 3E 10         [ 7]  520 	ld	a, #0x10
   18C8 F5            [11]  521 	push	af
   18C9 33            [ 6]  522 	inc	sp
   18CA 21 79 19      [10]  523 	ld	hl, #___str_1
   18CD E5            [11]  524 	push	hl
   18CE CD C9 1B      [17]  525 	call	_drawText
   18D1 21 07 00      [10]  526 	ld	hl, #7
   18D4 39            [11]  527 	add	hl, sp
   18D5 F9            [ 6]  528 	ld	sp, hl
   18D6 21 01 01      [10]  529 	ld	hl, #0x0101
   18D9 E5            [11]  530 	push	hl
   18DA 21 68 05      [10]  531 	ld	hl, #0x0568
   18DD E5            [11]  532 	push	hl
   18DE 3E 10         [ 7]  533 	ld	a, #0x10
   18E0 F5            [11]  534 	push	af
   18E1 33            [ 6]  535 	inc	sp
   18E2 21 8E 19      [10]  536 	ld	hl, #___str_2
   18E5 E5            [11]  537 	push	hl
   18E6 CD C9 1B      [17]  538 	call	_drawText
   18E9 21 07 00      [10]  539 	ld	hl, #7
   18EC 39            [11]  540 	add	hl, sp
   18ED F9            [ 6]  541 	ld	sp, hl
   18EE 3E 01         [ 7]  542 	ld	a, #0x01
   18F0 F5            [11]  543 	push	af
   18F1 33            [ 6]  544 	inc	sp
   18F2 CD 58 18      [17]  545 	call	_updateNumber
   18F5 33            [ 6]  546 	inc	sp
   18F6 C1            [10]  547 	pop	bc
                            548 ;src/util/tools.c:120: while (1)
   18F7                     549 00117$:
                            550 ;src/util/tools.c:123: cpct_waitHalts(20);
   18F7 C5            [11]  551 	push	bc
   18F8 2E 14         [ 7]  552 	ld	l, #0x14
   18FA CD 37 22      [17]  553 	call	_cpct_waitHalts
   18FD C1            [10]  554 	pop	bc
                            555 ;src/util/tools.c:124: if ((cpct_isKeyPressed(keys1.up)) || (cpct_isKeyPressed(keys1.j_up)))
   18FE 2A DC A8      [16]  556 	ld	hl, (#_keys1 + 0)
   1901 C5            [11]  557 	push	bc
   1902 CD 42 21      [17]  558 	call	_cpct_isKeyPressed
   1905 C1            [10]  559 	pop	bc
   1906 7D            [ 4]  560 	ld	a, l
   1907 B7            [ 4]  561 	or	a, a
   1908 20 0C         [12]  562 	jr	NZ,00108$
   190A 2A E8 A8      [16]  563 	ld	hl, (#(_keys1 + 0x000c) + 0)
   190D C5            [11]  564 	push	bc
   190E CD 42 21      [17]  565 	call	_cpct_isKeyPressed
   1911 C1            [10]  566 	pop	bc
   1912 7D            [ 4]  567 	ld	a, l
   1913 B7            [ 4]  568 	or	a, a
   1914 28 13         [12]  569 	jr	Z,00109$
   1916                     570 00108$:
                            571 ;src/util/tools.c:126: selection++;
   1916 0C            [ 4]  572 	inc	c
                            573 ;src/util/tools.c:127: if (selection > 17)
   1917 3E 11         [ 7]  574 	ld	a, #0x11
   1919 91            [ 4]  575 	sub	a, c
   191A 30 02         [12]  576 	jr	NC,00102$
                            577 ;src/util/tools.c:128: selection = 1;
   191C 0E 01         [ 7]  578 	ld	c, #0x01
   191E                     579 00102$:
                            580 ;src/util/tools.c:129: updateNumber(selection);
   191E C5            [11]  581 	push	bc
   191F 79            [ 4]  582 	ld	a, c
   1920 F5            [11]  583 	push	af
   1921 33            [ 6]  584 	inc	sp
   1922 CD 58 18      [17]  585 	call	_updateNumber
   1925 33            [ 6]  586 	inc	sp
   1926 C1            [10]  587 	pop	bc
   1927 18 29         [12]  588 	jr	00110$
   1929                     589 00109$:
                            590 ;src/util/tools.c:131: else if ((cpct_isKeyPressed(keys1.down)) || (cpct_isKeyPressed(keys1.j_down)))
   1929 2A DE A8      [16]  591 	ld	hl, (#(_keys1 + 0x0002) + 0)
   192C C5            [11]  592 	push	bc
   192D CD 42 21      [17]  593 	call	_cpct_isKeyPressed
   1930 C1            [10]  594 	pop	bc
   1931 7D            [ 4]  595 	ld	a, l
   1932 B7            [ 4]  596 	or	a, a
   1933 20 0C         [12]  597 	jr	NZ,00105$
   1935 2A EA A8      [16]  598 	ld	hl, (#(_keys1 + 0x000e) + 0)
   1938 C5            [11]  599 	push	bc
   1939 CD 42 21      [17]  600 	call	_cpct_isKeyPressed
   193C C1            [10]  601 	pop	bc
   193D 7D            [ 4]  602 	ld	a, l
   193E B7            [ 4]  603 	or	a, a
   193F 28 11         [12]  604 	jr	Z,00110$
   1941                     605 00105$:
                            606 ;src/util/tools.c:133: selection--;
   1941 0D            [ 4]  607 	dec	c
                            608 ;src/util/tools.c:134: if (selection < 1)
   1942 79            [ 4]  609 	ld	a, c
   1943 D6 01         [ 7]  610 	sub	a, #0x01
   1945 30 02         [12]  611 	jr	NC,00104$
                            612 ;src/util/tools.c:135: selection = 17;
   1947 0E 11         [ 7]  613 	ld	c, #0x11
   1949                     614 00104$:
                            615 ;src/util/tools.c:136: updateNumber(selection);
   1949 C5            [11]  616 	push	bc
   194A 79            [ 4]  617 	ld	a, c
   194B F5            [11]  618 	push	af
   194C 33            [ 6]  619 	inc	sp
   194D CD 58 18      [17]  620 	call	_updateNumber
   1950 33            [ 6]  621 	inc	sp
   1951 C1            [10]  622 	pop	bc
   1952                     623 00110$:
                            624 ;src/util/tools.c:138: if ((cpct_isKeyPressed(keys1.fire1)) || (cpct_isKeyPressed(keys1.j_fire1)) || (cpct_isKeyPressed(keys1.j_fire2)))
   1952 2A E4 A8      [16]  625 	ld	hl, (#(_keys1 + 0x0008) + 0)
   1955 C5            [11]  626 	push	bc
   1956 CD 42 21      [17]  627 	call	_cpct_isKeyPressed
   1959 C1            [10]  628 	pop	bc
   195A 7D            [ 4]  629 	ld	a, l
   195B B7            [ 4]  630 	or	a, a
   195C 20 19         [12]  631 	jr	NZ,00112$
   195E 2A F0 A8      [16]  632 	ld	hl, (#(_keys1 + 0x0014) + 0)
   1961 C5            [11]  633 	push	bc
   1962 CD 42 21      [17]  634 	call	_cpct_isKeyPressed
   1965 C1            [10]  635 	pop	bc
   1966 7D            [ 4]  636 	ld	a, l
   1967 B7            [ 4]  637 	or	a, a
   1968 20 0D         [12]  638 	jr	NZ,00112$
   196A 2A F2 A8      [16]  639 	ld	hl, (#(_keys1 + 0x0016) + 0)
   196D C5            [11]  640 	push	bc
   196E CD 42 21      [17]  641 	call	_cpct_isKeyPressed
   1971 C1            [10]  642 	pop	bc
   1972 7D            [ 4]  643 	ld	a, l
   1973 B7            [ 4]  644 	or	a, a
   1974 CA F7 18      [10]  645 	jp	Z, 00117$
   1977                     646 00112$:
                            647 ;src/util/tools.c:140: return selection;
   1977 69            [ 4]  648 	ld	l, c
   1978 C9            [10]  649 	ret
   1979                     650 ___str_1:
   1979 55 50 2F 44 4F 57   651 	.ascii "UP/DOWN:CHANGE LEVEL"
        4E 3A 43 48 41 4E
        47 45 20 4C 45 56
        45 4C
   198D 00                  652 	.db 0x00
   198E                     653 ___str_2:
   198E 46 49 52 45 3A 20   654 	.ascii "FIRE: CONFIRM"
        43 4F 4E 46 49 52
        4D
   199B 00                  655 	.db 0x00
                            656 ;src/util/tools.c:151: u8 resultYesNo()
                            657 ;	---------------------------------
                            658 ; Function resultYesNo
                            659 ; ---------------------------------
   199C                     660 _resultYesNo::
                            661 ;src/util/tools.c:153: drawText("(YES/NO)", 32, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
   199C 21 01 01      [10]  662 	ld	hl, #0x0101
   199F E5            [11]  663 	push	hl
   19A0 2E 60         [ 7]  664 	ld	l, #0x60
   19A2 E5            [11]  665 	push	hl
   19A3 3E 20         [ 7]  666 	ld	a, #0x20
   19A5 F5            [11]  667 	push	af
   19A6 33            [ 6]  668 	inc	sp
   19A7 21 CD 19      [10]  669 	ld	hl, #___str_3
   19AA E5            [11]  670 	push	hl
   19AB CD C9 1B      [17]  671 	call	_drawText
   19AE 21 07 00      [10]  672 	ld	hl, #7
   19B1 39            [11]  673 	add	hl, sp
   19B2 F9            [ 6]  674 	ld	sp, hl
                            675 ;src/util/tools.c:155: while (1)
   19B3                     676 00105$:
                            677 ;src/util/tools.c:157: if ((cpct_isKeyPressed(Key_Y)) || (cpct_isKeyPressed(Key_N)))
   19B3 21 05 08      [10]  678 	ld	hl, #0x0805
   19B6 CD 42 21      [17]  679 	call	_cpct_isKeyPressed
   19B9 7D            [ 4]  680 	ld	a, l
   19BA B7            [ 4]  681 	or	a, a
   19BB 20 0A         [12]  682 	jr	NZ,00101$
   19BD 21 05 40      [10]  683 	ld	hl, #0x4005
   19C0 CD 42 21      [17]  684 	call	_cpct_isKeyPressed
   19C3 7D            [ 4]  685 	ld	a, l
   19C4 B7            [ 4]  686 	or	a, a
   19C5 28 EC         [12]  687 	jr	Z,00105$
   19C7                     688 00101$:
                            689 ;src/util/tools.c:159: return (cpct_isKeyPressed(Key_Y));
   19C7 21 05 08      [10]  690 	ld	hl, #0x0805
                            691 ;src/util/tools.c:160: break;
   19CA C3 42 21      [10]  692 	jp  _cpct_isKeyPressed
   19CD                     693 ___str_3:
   19CD 28 59 45 53 2F 4E   694 	.ascii "(YES/NO)"
        4F 29
   19D5 00                  695 	.db 0x00
                            696 ;src/util/tools.c:171: u8 showMessage(u8 *message, u8 type)
                            697 ;	---------------------------------
                            698 ; Function showMessage
                            699 ; ---------------------------------
   19D6                     700 _showMessage::
   19D6 DD E5         [15]  701 	push	ix
   19D8 DD 21 00 00   [14]  702 	ld	ix,#0
   19DC DD 39         [15]  703 	add	ix,sp
   19DE 3B            [ 6]  704 	dec	sp
                            705 ;src/util/tools.c:179: if (type == NUMBER)
   19DF DD 7E 06      [19]  706 	ld	a, 6 (ix)
   19E2 D6 02         [ 7]  707 	sub	a, #0x02
   19E4 20 04         [12]  708 	jr	NZ,00142$
   19E6 3E 01         [ 7]  709 	ld	a,#0x01
   19E8 18 01         [12]  710 	jr	00143$
   19EA                     711 00142$:
   19EA AF            [ 4]  712 	xor	a,a
   19EB                     713 00143$:
   19EB DD 77 FF      [19]  714 	ld	-1 (ix), a
   19EE B7            [ 4]  715 	or	a, a
   19EF 28 04         [12]  716 	jr	Z,00102$
                            717 ;src/util/tools.c:180: defaultMax = 56;
   19F1 0E 38         [ 7]  718 	ld	c, #0x38
   19F3 18 02         [12]  719 	jr	00103$
   19F5                     720 00102$:
                            721 ;src/util/tools.c:182: defaultMax = 26;
   19F5 0E 1A         [ 7]  722 	ld	c, #0x1a
   19F7                     723 00103$:
                            724 ;src/util/tools.c:184: messageLength = strLength(message);
   19F7 C5            [11]  725 	push	bc
   19F8 DD 6E 04      [19]  726 	ld	l,4 (ix)
   19FB DD 66 05      [19]  727 	ld	h,5 (ix)
   19FE E5            [11]  728 	push	hl
   19FF CD 72 1B      [17]  729 	call	_strLength
   1A02 F1            [10]  730 	pop	af
   1A03 5D            [ 4]  731 	ld	e, l
   1A04 C1            [10]  732 	pop	bc
                            733 ;src/util/tools.c:185: w = max(((messageLength * 2) + 7), defaultMax);
   1A05 6B            [ 4]  734 	ld	l, e
   1A06 26 00         [ 7]  735 	ld	h, #0x00
   1A08 29            [11]  736 	add	hl, hl
   1A09 D5            [11]  737 	push	de
   1A0A 11 07 00      [10]  738 	ld	de, #0x0007
   1A0D 19            [11]  739 	add	hl, de
   1A0E D1            [10]  740 	pop	de
   1A0F 79            [ 4]  741 	ld	a, c
   1A10 16 00         [ 7]  742 	ld	d, #0x00
   1A12 95            [ 4]  743 	sub	a, l
   1A13 7A            [ 4]  744 	ld	a, d
   1A14 9C            [ 4]  745 	sbc	a, h
   1A15 E2 1A 1A      [10]  746 	jp	PO, 00144$
   1A18 EE 80         [ 7]  747 	xor	a, #0x80
   1A1A                     748 00144$:
   1A1A F2 22 1A      [10]  749 	jp	P, 00115$
   1A1D 7B            [ 4]  750 	ld	a, e
   1A1E 87            [ 4]  751 	add	a, a
   1A1F C6 07         [ 7]  752 	add	a, #0x07
   1A21 4F            [ 4]  753 	ld	c, a
   1A22                     754 00115$:
                            755 ;src/util/tools.c:187: x = ((80 - w) / 2+1);
   1A22 59            [ 4]  756 	ld	e, c
   1A23 16 00         [ 7]  757 	ld	d, #0x00
   1A25 3E 50         [ 7]  758 	ld	a, #0x50
   1A27 93            [ 4]  759 	sub	a, e
   1A28 6F            [ 4]  760 	ld	l, a
   1A29 3E 00         [ 7]  761 	ld	a, #0x00
   1A2B 9A            [ 4]  762 	sbc	a, d
   1A2C 67            [ 4]  763 	ld	h, a
   1A2D 5D            [ 4]  764 	ld	e, l
   1A2E 54            [ 4]  765 	ld	d, h
   1A2F CB 7C         [ 8]  766 	bit	7, h
   1A31 28 02         [12]  767 	jr	Z,00117$
   1A33 EB            [ 4]  768 	ex	de,hl
   1A34 13            [ 6]  769 	inc	de
   1A35                     770 00117$:
   1A35 CB 2A         [ 8]  771 	sra	d
   1A37 CB 1B         [ 8]  772 	rr	e
   1A39 43            [ 4]  773 	ld	b, e
   1A3A 04            [ 4]  774 	inc	b
                            775 ;src/util/tools.c:191: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   1A3B C5            [11]  776 	push	bc
   1A3C 3E 3A         [ 7]  777 	ld	a, #0x3a
   1A3E F5            [11]  778 	push	af
   1A3F 33            [ 6]  779 	inc	sp
   1A40 C5            [11]  780 	push	bc
   1A41 33            [ 6]  781 	inc	sp
   1A42 21 00 C0      [10]  782 	ld	hl, #0xc000
   1A45 E5            [11]  783 	push	hl
   1A46 CD 34 25      [17]  784 	call	_cpct_getScreenPtr
   1A49 EB            [ 4]  785 	ex	de,hl
   1A4A C1            [10]  786 	pop	bc
                            787 ;src/util/tools.c:196: cpct_getScreenToSprite(pvmem, (u8*) &screenBuffer0, w, h);
   1A4B 21 00 B0      [10]  788 	ld	hl, #_screenBuffer0+0
   1A4E C5            [11]  789 	push	bc
   1A4F D5            [11]  790 	push	de
   1A50 06 3C         [ 7]  791 	ld	b, #0x3c
   1A52 C5            [11]  792 	push	bc
   1A53 E5            [11]  793 	push	hl
   1A54 D5            [11]  794 	push	de
   1A55 CD B1 20      [17]  795 	call	_cpct_getScreenToSprite
   1A58 D1            [10]  796 	pop	de
   1A59 C1            [10]  797 	pop	bc
                            798 ;src/util/tools.c:199: drawWindow(x, y, w, h - 2, 15, 14);
   1A5A C5            [11]  799 	push	bc
   1A5B D5            [11]  800 	push	de
   1A5C 21 0F 0E      [10]  801 	ld	hl, #0x0e0f
   1A5F E5            [11]  802 	push	hl
   1A60 3E 3A         [ 7]  803 	ld	a, #0x3a
   1A62 F5            [11]  804 	push	af
   1A63 33            [ 6]  805 	inc	sp
   1A64 51            [ 4]  806 	ld	d, c
   1A65 1E 3A         [ 7]  807 	ld	e,#0x3a
   1A67 D5            [11]  808 	push	de
   1A68 C5            [11]  809 	push	bc
   1A69 33            [ 6]  810 	inc	sp
   1A6A CD 41 16      [17]  811 	call	_drawWindow
   1A6D 21 06 00      [10]  812 	ld	hl, #6
   1A70 39            [11]  813 	add	hl, sp
   1A71 F9            [ 6]  814 	ld	sp, hl
   1A72 D1            [10]  815 	pop	de
   1A73 C1            [10]  816 	pop	bc
                            817 ;src/util/tools.c:200: drawText(message, x + 3, y + 12, COLORTXT_WHITE, DOUBLEHEIGHT, TRANSPARENT);
   1A74 04            [ 4]  818 	inc	b
   1A75 04            [ 4]  819 	inc	b
   1A76 04            [ 4]  820 	inc	b
   1A77 C5            [11]  821 	push	bc
   1A78 D5            [11]  822 	push	de
   1A79 21 02 01      [10]  823 	ld	hl, #0x0102
   1A7C E5            [11]  824 	push	hl
   1A7D 21 46 00      [10]  825 	ld	hl, #0x0046
   1A80 E5            [11]  826 	push	hl
   1A81 C5            [11]  827 	push	bc
   1A82 33            [ 6]  828 	inc	sp
   1A83 DD 6E 04      [19]  829 	ld	l,4 (ix)
   1A86 DD 66 05      [19]  830 	ld	h,5 (ix)
   1A89 E5            [11]  831 	push	hl
   1A8A CD C9 1B      [17]  832 	call	_drawText
   1A8D 21 07 00      [10]  833 	ld	hl, #7
   1A90 39            [11]  834 	add	hl, sp
   1A91 F9            [ 6]  835 	ld	sp, hl
   1A92 D1            [10]  836 	pop	de
   1A93 C1            [10]  837 	pop	bc
                            838 ;src/util/tools.c:203: if (type == YESNO)
   1A94 DD 7E 06      [19]  839 	ld	a, 6 (ix)
   1A97 3D            [ 4]  840 	dec	a
   1A98 20 09         [12]  841 	jr	NZ,00111$
                            842 ;src/util/tools.c:205: result = resultYesNo();
   1A9A C5            [11]  843 	push	bc
   1A9B D5            [11]  844 	push	de
   1A9C CD 9C 19      [17]  845 	call	_resultYesNo
   1A9F D1            [10]  846 	pop	de
   1AA0 C1            [10]  847 	pop	bc
   1AA1 18 49         [12]  848 	jr	00112$
   1AA3                     849 00111$:
                            850 ;src/util/tools.c:207: else if (type == NUMBER)
   1AA3 DD 7E FF      [19]  851 	ld	a, -1 (ix)
   1AA6 B7            [ 4]  852 	or	a, a
   1AA7 28 09         [12]  853 	jr	Z,00108$
                            854 ;src/util/tools.c:209: result = resultNumber();
   1AA9 C5            [11]  855 	push	bc
   1AAA D5            [11]  856 	push	de
   1AAB CD BB 18      [17]  857 	call	_resultNumber
   1AAE D1            [10]  858 	pop	de
   1AAF C1            [10]  859 	pop	bc
   1AB0 18 3A         [12]  860 	jr	00112$
   1AB2                     861 00108$:
                            862 ;src/util/tools.c:210: } else if (type == TEMPORAL){
   1AB2 DD 7E 06      [19]  863 	ld	a, 6 (ix)
   1AB5 D6 03         [ 7]  864 	sub	a, #0x03
   1AB7 20 0D         [12]  865 	jr	NZ,00105$
                            866 ;src/util/tools.c:211: cpct_waitHalts(100);
   1AB9 C5            [11]  867 	push	bc
   1ABA D5            [11]  868 	push	de
   1ABB 2E 64         [ 7]  869 	ld	l, #0x64
   1ABD CD 37 22      [17]  870 	call	_cpct_waitHalts
   1AC0 D1            [10]  871 	pop	de
   1AC1 C1            [10]  872 	pop	bc
                            873 ;src/util/tools.c:212: result = YES;
   1AC2 2E 01         [ 7]  874 	ld	l, #0x01
   1AC4 18 26         [12]  875 	jr	00112$
   1AC6                     876 00105$:
                            877 ;src/util/tools.c:216: drawText("PRESS A KEY", 29, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
   1AC6 C5            [11]  878 	push	bc
   1AC7 D5            [11]  879 	push	de
   1AC8 21 01 01      [10]  880 	ld	hl, #0x0101
   1ACB E5            [11]  881 	push	hl
   1ACC 2E 60         [ 7]  882 	ld	l, #0x60
   1ACE E5            [11]  883 	push	hl
   1ACF 3E 1D         [ 7]  884 	ld	a, #0x1d
   1AD1 F5            [11]  885 	push	af
   1AD2 33            [ 6]  886 	inc	sp
   1AD3 21 FD 1A      [10]  887 	ld	hl, #___str_4
   1AD6 E5            [11]  888 	push	hl
   1AD7 CD C9 1B      [17]  889 	call	_drawText
   1ADA 21 07 00      [10]  890 	ld	hl, #7
   1ADD 39            [11]  891 	add	hl, sp
   1ADE F9            [ 6]  892 	ld	sp, hl
   1ADF D1            [10]  893 	pop	de
   1AE0 C1            [10]  894 	pop	bc
                            895 ;src/util/tools.c:217: result = YES;
   1AE1 2E 01         [ 7]  896 	ld	l, #0x01
                            897 ;src/util/tools.c:218: wait4OneKey();
   1AE3 E5            [11]  898 	push	hl
   1AE4 C5            [11]  899 	push	bc
   1AE5 D5            [11]  900 	push	de
   1AE6 CD 75 20      [17]  901 	call	_wait4OneKey
   1AE9 D1            [10]  902 	pop	de
   1AEA C1            [10]  903 	pop	bc
   1AEB E1            [10]  904 	pop	hl
   1AEC                     905 00112$:
                            906 ;src/util/tools.c:222: cpct_drawSprite((u8 *)0xb000, pvmem, w, h);
   1AEC E5            [11]  907 	push	hl
   1AED 06 3C         [ 7]  908 	ld	b, #0x3c
   1AEF C5            [11]  909 	push	bc
   1AF0 D5            [11]  910 	push	de
   1AF1 01 00 B0      [10]  911 	ld	bc, #0xb000
   1AF4 C5            [11]  912 	push	bc
   1AF5 CD 71 21      [17]  913 	call	_cpct_drawSprite
   1AF8 E1            [10]  914 	pop	hl
                            915 ;src/util/tools.c:224: return result;
   1AF9 33            [ 6]  916 	inc	sp
   1AFA DD E1         [14]  917 	pop	ix
   1AFC C9            [10]  918 	ret
   1AFD                     919 ___str_4:
   1AFD 50 52 45 53 53 20   920 	.ascii "PRESS A KEY"
        41 20 4B 45 59
   1B08 00                  921 	.db 0x00
                            922 ;src/util/tools.c:226: void drawCompressToScreen(u8 x, u8 y, u8 w, u8 h, u16 size, u8* comp_end, u8 trans){
                            923 ;	---------------------------------
                            924 ; Function drawCompressToScreen
                            925 ; ---------------------------------
   1B09                     926 _drawCompressToScreen::
   1B09 DD E5         [15]  927 	push	ix
   1B0B DD 21 00 00   [14]  928 	ld	ix,#0
   1B0F DD 39         [15]  929 	add	ix,sp
   1B11 F5            [11]  930 	push	af
                            931 ;src/util/tools.c:229: pvmem = cpct_getScreenPtr(SCR_VMEM, x, y);
   1B12 DD 66 05      [19]  932 	ld	h, 5 (ix)
   1B15 DD 6E 04      [19]  933 	ld	l, 4 (ix)
   1B18 E5            [11]  934 	push	hl
   1B19 21 00 C0      [10]  935 	ld	hl, #0xc000
   1B1C E5            [11]  936 	push	hl
   1B1D CD 34 25      [17]  937 	call	_cpct_getScreenPtr
   1B20 33            [ 6]  938 	inc	sp
   1B21 33            [ 6]  939 	inc	sp
   1B22 E5            [11]  940 	push	hl
                            941 ;src/util/tools.c:230: cpct_zx7b_decrunch_s((u8*) &screenBuffer0 + size - 1, comp_end);
   1B23 DD 4E 0A      [19]  942 	ld	c,10 (ix)
   1B26 DD 46 0B      [19]  943 	ld	b,11 (ix)
   1B29 11 00 B0      [10]  944 	ld	de, #_screenBuffer0
   1B2C DD 6E 08      [19]  945 	ld	l,8 (ix)
   1B2F DD 66 09      [19]  946 	ld	h,9 (ix)
   1B32 19            [11]  947 	add	hl, de
   1B33 2B            [ 6]  948 	dec	hl
   1B34 C5            [11]  949 	push	bc
   1B35 E5            [11]  950 	push	hl
   1B36 CD 8F 23      [17]  951 	call	_cpct_zx7b_decrunch_s
                            952 ;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
   1B39 C1            [10]  953 	pop	bc
   1B3A C5            [11]  954 	push	bc
                            955 ;src/util/tools.c:231: if (trans)
   1B3B DD 7E 0C      [19]  956 	ld	a, 12 (ix)
   1B3E B7            [ 4]  957 	or	a, a
   1B3F 28 15         [12]  958 	jr	Z,00102$
                            959 ;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
   1B41 21 00 02      [10]  960 	ld	hl, #_g_tablatrans
   1B44 E5            [11]  961 	push	hl
   1B45 DD 66 07      [19]  962 	ld	h, 7 (ix)
   1B48 DD 6E 06      [19]  963 	ld	l, 6 (ix)
   1B4B E5            [11]  964 	push	hl
   1B4C C5            [11]  965 	push	bc
   1B4D 21 00 B0      [10]  966 	ld	hl, #_screenBuffer0
   1B50 E5            [11]  967 	push	hl
   1B51 CD F9 24      [17]  968 	call	_cpct_drawSpriteMaskedAlignedTable
   1B54 18 0F         [12]  969 	jr	00104$
   1B56                     970 00102$:
                            971 ;src/util/tools.c:234: cpct_drawSprite(&screenBuffer0, pvmem, w, h);
   1B56 DD 66 07      [19]  972 	ld	h, 7 (ix)
   1B59 DD 6E 06      [19]  973 	ld	l, 6 (ix)
   1B5C E5            [11]  974 	push	hl
   1B5D C5            [11]  975 	push	bc
   1B5E 21 00 B0      [10]  976 	ld	hl, #_screenBuffer0
   1B61 E5            [11]  977 	push	hl
   1B62 CD 71 21      [17]  978 	call	_cpct_drawSprite
   1B65                     979 00104$:
   1B65 DD F9         [10]  980 	ld	sp, ix
   1B67 DD E1         [14]  981 	pop	ix
   1B69 C9            [10]  982 	ret
                            983 ;src/util/tools.c:238: void winape_breakpoint(u16 error_code) __z88dk_callee __naked {
                            984 ;	---------------------------------
                            985 ; Function winape_breakpoint
                            986 ; ---------------------------------
   1B6A                     987 _winape_breakpoint::
                            988 ;src/util/tools.c:241: __asm__("pop iy");  // ret address first because __z88dk_callee convention
   1B6A FD E1         [14]  989 	pop	iy
                            990 ;src/util/tools.c:242: __asm__("pop hl");
   1B6C E1            [10]  991 	pop	hl
                            992 ;src/util/tools.c:243: __asm__("push iy"); // ret address last  because __z88dk_callee convention
   1B6D FD E5         [15]  993 	push	iy
                            994 ;src/util/tools.c:244: __asm__(".db 0xed, 0xff");
   1B6F ED FF               995 	.db	0xed, 0xff
                            996 ;src/util/tools.c:246: __asm__("ret");
   1B71 C9            [10]  997 	ret
                            998 	.area _CODE
                            999 	.area _INITIALIZER
                           1000 	.area _CABS (ABS)
