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
   1811                      68 _clearScreen::
                             69 ;src/util/tools.c:35: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(bgColor, bgColor), 0x4000);
   1811 FD 21 02 00   [14]   70 	ld	iy, #2
   1815 FD 39         [15]   71 	add	iy, sp
   1817 FD 66 00      [19]   72 	ld	h, 0 (iy)
   181A FD 6E 00      [19]   73 	ld	l, 0 (iy)
   181D E5            [11]   74 	push	hl
   181E CD CD 26      [17]   75 	call	_cpct_px2byteM0
   1821 45            [ 4]   76 	ld	b, l
   1822 21 00 40      [10]   77 	ld	hl, #0x4000
   1825 E5            [11]   78 	push	hl
   1826 C5            [11]   79 	push	bc
   1827 33            [ 6]   80 	inc	sp
   1828 26 C0         [ 7]   81 	ld	h, #0xc0
   182A E5            [11]   82 	push	hl
   182B CD E9 26      [17]   83 	call	_cpct_memset
   182E C9            [10]   84 	ret
                             85 ;src/util/tools.c:46: void drawWindow(u8 x, u8 y, u8 width, u8 height, u8 fgColor, u8 bgColor)
                             86 ;	---------------------------------
                             87 ; Function drawWindow
                             88 ; ---------------------------------
   182F                      89 _drawWindow::
   182F DD E5         [15]   90 	push	ix
   1831 DD 21 00 00   [14]   91 	ld	ix,#0
   1835 DD 39         [15]   92 	add	ix,sp
   1837 F5            [11]   93 	push	af
   1838 F5            [11]   94 	push	af
                             95 ;src/util/tools.c:51: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y);
   1839 DD 56 04      [19]   96 	ld	d, 4 (ix)
   183C 14            [ 4]   97 	inc	d
   183D D5            [11]   98 	push	de
   183E DD 7E 05      [19]   99 	ld	a, 5 (ix)
   1841 F5            [11]  100 	push	af
   1842 33            [ 6]  101 	inc	sp
   1843 D5            [11]  102 	push	de
   1844 33            [ 6]  103 	inc	sp
   1845 21 00 C0      [10]  104 	ld	hl, #0xc000
   1848 E5            [11]  105 	push	hl
   1849 CD 19 28      [17]  106 	call	_cpct_getScreenPtr
   184C 4D            [ 4]  107 	ld	c, l
   184D 44            [ 4]  108 	ld	b, h
   184E D1            [10]  109 	pop	de
                            110 ;src/util/tools.c:52: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
   184F DD 7E 06      [19]  111 	ld	a, 6 (ix)
   1852 C6 FC         [ 7]  112 	add	a, #0xfc
   1854 5F            [ 4]  113 	ld	e, a
   1855 C5            [11]  114 	push	bc
   1856 D5            [11]  115 	push	de
   1857 DD 66 08      [19]  116 	ld	h, 8 (ix)
   185A DD 6E 08      [19]  117 	ld	l, 8 (ix)
   185D E5            [11]  118 	push	hl
   185E CD CD 26      [17]  119 	call	_cpct_px2byteM0
   1861 65            [ 4]  120 	ld	h, l
   1862 D1            [10]  121 	pop	de
   1863 C1            [10]  122 	pop	bc
   1864 69            [ 4]  123 	ld	l, c
   1865 D5            [11]  124 	push	de
   1866 16 02         [ 7]  125 	ld	d,#0x02
   1868 D5            [11]  126 	push	de
   1869 E5            [11]  127 	push	hl
   186A 33            [ 6]  128 	inc	sp
   186B 60            [ 4]  129 	ld	h, b
   186C E5            [11]  130 	push	hl
   186D CD 07 27      [17]  131 	call	_cpct_drawSolidBox
   1870 D1            [10]  132 	pop	de
                            133 ;src/util/tools.c:53: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height);
   1871 DD 7E 05      [19]  134 	ld	a, 5 (ix)
   1874 DD 86 07      [19]  135 	add	a, 7 (ix)
   1877 DD 77 FF      [19]  136 	ld	-1 (ix), a
   187A D5            [11]  137 	push	de
   187B F5            [11]  138 	push	af
   187C 33            [ 6]  139 	inc	sp
   187D D5            [11]  140 	push	de
   187E 33            [ 6]  141 	inc	sp
   187F 21 00 C0      [10]  142 	ld	hl, #0xc000
   1882 E5            [11]  143 	push	hl
   1883 CD 19 28      [17]  144 	call	_cpct_getScreenPtr
   1886 4D            [ 4]  145 	ld	c, l
   1887 44            [ 4]  146 	ld	b, h
   1888 D1            [10]  147 	pop	de
                            148 ;src/util/tools.c:54: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
   1889 C5            [11]  149 	push	bc
   188A D5            [11]  150 	push	de
   188B DD 66 08      [19]  151 	ld	h, 8 (ix)
   188E DD 6E 08      [19]  152 	ld	l, 8 (ix)
   1891 E5            [11]  153 	push	hl
   1892 CD CD 26      [17]  154 	call	_cpct_px2byteM0
   1895 DD 75 FE      [19]  155 	ld	-2 (ix), l
   1898 D1            [10]  156 	pop	de
   1899 C1            [10]  157 	pop	bc
   189A D5            [11]  158 	push	de
   189B 16 02         [ 7]  159 	ld	d,#0x02
   189D D5            [11]  160 	push	de
   189E DD 7E FE      [19]  161 	ld	a, -2 (ix)
   18A1 F5            [11]  162 	push	af
   18A2 33            [ 6]  163 	inc	sp
   18A3 C5            [11]  164 	push	bc
   18A4 CD 07 27      [17]  165 	call	_cpct_drawSolidBox
   18A7 D1            [10]  166 	pop	de
                            167 ;src/util/tools.c:56: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 2);
   18A8 DD 7E 05      [19]  168 	ld	a, 5 (ix)
   18AB C6 02         [ 7]  169 	add	a, #0x02
   18AD DD 77 FE      [19]  170 	ld	-2 (ix), a
   18B0 D5            [11]  171 	push	de
   18B1 F5            [11]  172 	push	af
   18B2 33            [ 6]  173 	inc	sp
   18B3 D5            [11]  174 	push	de
   18B4 33            [ 6]  175 	inc	sp
   18B5 21 00 C0      [10]  176 	ld	hl, #0xc000
   18B8 E5            [11]  177 	push	hl
   18B9 CD 19 28      [17]  178 	call	_cpct_getScreenPtr
   18BC D1            [10]  179 	pop	de
                            180 ;src/util/tools.c:57: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
   18BD E5            [11]  181 	push	hl
   18BE D5            [11]  182 	push	de
   18BF 01 00 00      [10]  183 	ld	bc, #0x0000
   18C2 C5            [11]  184 	push	bc
   18C3 CD CD 26      [17]  185 	call	_cpct_px2byteM0
   18C6 4D            [ 4]  186 	ld	c, l
   18C7 D1            [10]  187 	pop	de
   18C8 E1            [10]  188 	pop	hl
   18C9 D5            [11]  189 	push	de
   18CA 16 02         [ 7]  190 	ld	d,#0x02
   18CC D5            [11]  191 	push	de
   18CD 79            [ 4]  192 	ld	a, c
   18CE F5            [11]  193 	push	af
   18CF 33            [ 6]  194 	inc	sp
   18D0 E5            [11]  195 	push	hl
   18D1 CD 07 27      [17]  196 	call	_cpct_drawSolidBox
   18D4 D1            [10]  197 	pop	de
                            198 ;src/util/tools.c:58: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height - 2);
   18D5 DD 35 FF      [23]  199 	dec	-1 (ix)
   18D8 DD 35 FF      [23]  200 	dec	-1 (ix)
   18DB D5            [11]  201 	push	de
   18DC DD 7E FF      [19]  202 	ld	a, -1 (ix)
   18DF F5            [11]  203 	push	af
   18E0 33            [ 6]  204 	inc	sp
   18E1 D5            [11]  205 	push	de
   18E2 33            [ 6]  206 	inc	sp
   18E3 21 00 C0      [10]  207 	ld	hl, #0xc000
   18E6 E5            [11]  208 	push	hl
   18E7 CD 19 28      [17]  209 	call	_cpct_getScreenPtr
   18EA D1            [10]  210 	pop	de
                            211 ;src/util/tools.c:59: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
   18EB E5            [11]  212 	push	hl
   18EC D5            [11]  213 	push	de
   18ED 01 00 00      [10]  214 	ld	bc, #0x0000
   18F0 C5            [11]  215 	push	bc
   18F1 CD CD 26      [17]  216 	call	_cpct_px2byteM0
   18F4 4D            [ 4]  217 	ld	c, l
   18F5 D1            [10]  218 	pop	de
   18F6 E1            [10]  219 	pop	hl
   18F7 D5            [11]  220 	push	de
   18F8 16 02         [ 7]  221 	ld	d,#0x02
   18FA D5            [11]  222 	push	de
   18FB 79            [ 4]  223 	ld	a, c
   18FC F5            [11]  224 	push	af
   18FD 33            [ 6]  225 	inc	sp
   18FE E5            [11]  226 	push	hl
   18FF CD 07 27      [17]  227 	call	_cpct_drawSolidBox
   1902 D1            [10]  228 	pop	de
                            229 ;src/util/tools.c:61: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 4);
   1903 DD 7E 05      [19]  230 	ld	a, 5 (ix)
   1906 C6 04         [ 7]  231 	add	a, #0x04
   1908 DD 77 FD      [19]  232 	ld	-3 (ix), a
   190B D5            [11]  233 	push	de
   190C F5            [11]  234 	push	af
   190D 33            [ 6]  235 	inc	sp
   190E D5            [11]  236 	push	de
   190F 33            [ 6]  237 	inc	sp
   1910 21 00 C0      [10]  238 	ld	hl, #0xc000
   1913 E5            [11]  239 	push	hl
   1914 CD 19 28      [17]  240 	call	_cpct_getScreenPtr
   1917 4D            [ 4]  241 	ld	c, l
   1918 44            [ 4]  242 	ld	b, h
   1919 D1            [10]  243 	pop	de
                            244 ;src/util/tools.c:62: cpct_drawSolidBox(pvideo, cpct_px2byteM0(bgColor, bgColor), width - 4, height - 6);
   191A DD 7E 07      [19]  245 	ld	a, 7 (ix)
   191D C6 FA         [ 7]  246 	add	a, #0xfa
   191F DD 77 FC      [19]  247 	ld	-4 (ix), a
   1922 C5            [11]  248 	push	bc
   1923 D5            [11]  249 	push	de
   1924 DD 66 09      [19]  250 	ld	h, 9 (ix)
   1927 DD 6E 09      [19]  251 	ld	l, 9 (ix)
   192A E5            [11]  252 	push	hl
   192B CD CD 26      [17]  253 	call	_cpct_px2byteM0
   192E 7D            [ 4]  254 	ld	a, l
   192F D1            [10]  255 	pop	de
   1930 57            [ 4]  256 	ld	d, a
   1931 C1            [10]  257 	pop	bc
   1932 DD 7E FC      [19]  258 	ld	a, -4 (ix)
   1935 F5            [11]  259 	push	af
   1936 33            [ 6]  260 	inc	sp
   1937 7B            [ 4]  261 	ld	a, e
   1938 F5            [11]  262 	push	af
   1939 33            [ 6]  263 	inc	sp
   193A D5            [11]  264 	push	de
   193B 33            [ 6]  265 	inc	sp
   193C C5            [11]  266 	push	bc
   193D CD 07 27      [17]  267 	call	_cpct_drawSolidBox
                            268 ;src/util/tools.c:65: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 2);
   1940 DD 66 FE      [19]  269 	ld	h, -2 (ix)
   1943 DD 6E 04      [19]  270 	ld	l, 4 (ix)
   1946 E5            [11]  271 	push	hl
   1947 21 00 C0      [10]  272 	ld	hl, #0xc000
   194A E5            [11]  273 	push	hl
   194B CD 19 28      [17]  274 	call	_cpct_getScreenPtr
                            275 ;src/util/tools.c:66: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
   194E E5            [11]  276 	push	hl
   194F DD 7E 08      [19]  277 	ld	a, 8 (ix)
   1952 F5            [11]  278 	push	af
   1953 33            [ 6]  279 	inc	sp
   1954 AF            [ 4]  280 	xor	a, a
   1955 F5            [11]  281 	push	af
   1956 33            [ 6]  282 	inc	sp
   1957 CD CD 26      [17]  283 	call	_cpct_px2byteM0
   195A 55            [ 4]  284 	ld	d, l
   195B C1            [10]  285 	pop	bc
   195C 21 01 02      [10]  286 	ld	hl, #0x0201
   195F E5            [11]  287 	push	hl
   1960 D5            [11]  288 	push	de
   1961 33            [ 6]  289 	inc	sp
   1962 C5            [11]  290 	push	bc
   1963 CD 07 27      [17]  291 	call	_cpct_drawSolidBox
                            292 ;src/util/tools.c:69: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 4);
   1966 DD 66 FD      [19]  293 	ld	h, -3 (ix)
   1969 DD 6E 04      [19]  294 	ld	l, 4 (ix)
   196C E5            [11]  295 	push	hl
   196D 21 00 C0      [10]  296 	ld	hl, #0xc000
   1970 E5            [11]  297 	push	hl
   1971 CD 19 28      [17]  298 	call	_cpct_getScreenPtr
                            299 ;src/util/tools.c:70: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, height - 6);
   1974 E5            [11]  300 	push	hl
   1975 AF            [ 4]  301 	xor	a, a
   1976 F5            [11]  302 	push	af
   1977 33            [ 6]  303 	inc	sp
   1978 DD 7E 08      [19]  304 	ld	a, 8 (ix)
   197B F5            [11]  305 	push	af
   197C 33            [ 6]  306 	inc	sp
   197D CD CD 26      [17]  307 	call	_cpct_px2byteM0
   1980 55            [ 4]  308 	ld	d, l
   1981 C1            [10]  309 	pop	bc
   1982 DD 7E FC      [19]  310 	ld	a, -4 (ix)
   1985 F5            [11]  311 	push	af
   1986 33            [ 6]  312 	inc	sp
   1987 3E 01         [ 7]  313 	ld	a, #0x01
   1989 F5            [11]  314 	push	af
   198A 33            [ 6]  315 	inc	sp
   198B D5            [11]  316 	push	de
   198C 33            [ 6]  317 	inc	sp
   198D C5            [11]  318 	push	bc
   198E CD 07 27      [17]  319 	call	_cpct_drawSolidBox
                            320 ;src/util/tools.c:73: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + height - 2);
   1991 DD 66 FF      [19]  321 	ld	h, -1 (ix)
   1994 DD 6E 04      [19]  322 	ld	l, 4 (ix)
   1997 E5            [11]  323 	push	hl
   1998 21 00 C0      [10]  324 	ld	hl, #0xc000
   199B E5            [11]  325 	push	hl
   199C CD 19 28      [17]  326 	call	_cpct_getScreenPtr
                            327 ;src/util/tools.c:74: cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
   199F E5            [11]  328 	push	hl
   19A0 DD 7E 08      [19]  329 	ld	a, 8 (ix)
   19A3 F5            [11]  330 	push	af
   19A4 33            [ 6]  331 	inc	sp
   19A5 AF            [ 4]  332 	xor	a, a
   19A6 F5            [11]  333 	push	af
   19A7 33            [ 6]  334 	inc	sp
   19A8 CD CD 26      [17]  335 	call	_cpct_px2byteM0
   19AB 55            [ 4]  336 	ld	d, l
   19AC C1            [10]  337 	pop	bc
   19AD 21 01 02      [10]  338 	ld	hl, #0x0201
   19B0 E5            [11]  339 	push	hl
   19B1 D5            [11]  340 	push	de
   19B2 33            [ 6]  341 	inc	sp
   19B3 C5            [11]  342 	push	bc
   19B4 CD 07 27      [17]  343 	call	_cpct_drawSolidBox
                            344 ;src/util/tools.c:76: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 2);
   19B7 DD 7E 04      [19]  345 	ld	a, 4 (ix)
   19BA DD 86 06      [19]  346 	add	a, 6 (ix)
   19BD C6 FD         [ 7]  347 	add	a, #0xfd
   19BF 47            [ 4]  348 	ld	b, a
   19C0 C5            [11]  349 	push	bc
   19C1 DD 7E FE      [19]  350 	ld	a, -2 (ix)
   19C4 F5            [11]  351 	push	af
   19C5 33            [ 6]  352 	inc	sp
   19C6 C5            [11]  353 	push	bc
   19C7 33            [ 6]  354 	inc	sp
   19C8 21 00 C0      [10]  355 	ld	hl, #0xc000
   19CB E5            [11]  356 	push	hl
   19CC CD 19 28      [17]  357 	call	_cpct_getScreenPtr
   19CF C1            [10]  358 	pop	bc
                            359 ;src/util/tools.c:77: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
   19D0 E5            [11]  360 	push	hl
   19D1 C5            [11]  361 	push	bc
   19D2 AF            [ 4]  362 	xor	a, a
   19D3 F5            [11]  363 	push	af
   19D4 33            [ 6]  364 	inc	sp
   19D5 DD 7E 08      [19]  365 	ld	a, 8 (ix)
   19D8 F5            [11]  366 	push	af
   19D9 33            [ 6]  367 	inc	sp
   19DA CD CD 26      [17]  368 	call	_cpct_px2byteM0
   19DD 4D            [ 4]  369 	ld	c, l
   19DE F1            [10]  370 	pop	af
   19DF 47            [ 4]  371 	ld	b, a
   19E0 E1            [10]  372 	pop	hl
   19E1 C5            [11]  373 	push	bc
   19E2 11 01 02      [10]  374 	ld	de, #0x0201
   19E5 D5            [11]  375 	push	de
   19E6 79            [ 4]  376 	ld	a, c
   19E7 F5            [11]  377 	push	af
   19E8 33            [ 6]  378 	inc	sp
   19E9 E5            [11]  379 	push	hl
   19EA CD 07 27      [17]  380 	call	_cpct_drawSolidBox
   19ED C1            [10]  381 	pop	bc
                            382 ;src/util/tools.c:79: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 4);
   19EE C5            [11]  383 	push	bc
   19EF DD 7E FD      [19]  384 	ld	a, -3 (ix)
   19F2 F5            [11]  385 	push	af
   19F3 33            [ 6]  386 	inc	sp
   19F4 C5            [11]  387 	push	bc
   19F5 33            [ 6]  388 	inc	sp
   19F6 21 00 C0      [10]  389 	ld	hl, #0xc000
   19F9 E5            [11]  390 	push	hl
   19FA CD 19 28      [17]  391 	call	_cpct_getScreenPtr
   19FD E5            [11]  392 	push	hl
   19FE DD 7E 08      [19]  393 	ld	a, 8 (ix)
   1A01 F5            [11]  394 	push	af
   1A02 33            [ 6]  395 	inc	sp
   1A03 AF            [ 4]  396 	xor	a, a
   1A04 F5            [11]  397 	push	af
   1A05 33            [ 6]  398 	inc	sp
   1A06 CD CD 26      [17]  399 	call	_cpct_px2byteM0
   1A09 4D            [ 4]  400 	ld	c, l
   1A0A D1            [10]  401 	pop	de
   1A0B F1            [10]  402 	pop	af
   1A0C 47            [ 4]  403 	ld	b, a
   1A0D C5            [11]  404 	push	bc
   1A0E DD 7E FC      [19]  405 	ld	a, -4 (ix)
   1A11 F5            [11]  406 	push	af
   1A12 33            [ 6]  407 	inc	sp
   1A13 06 01         [ 7]  408 	ld	b, #0x01
   1A15 C5            [11]  409 	push	bc
   1A16 D5            [11]  410 	push	de
   1A17 CD 07 27      [17]  411 	call	_cpct_drawSolidBox
   1A1A C1            [10]  412 	pop	bc
                            413 ;src/util/tools.c:82: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + height - 2);
   1A1B DD 7E FF      [19]  414 	ld	a, -1 (ix)
   1A1E F5            [11]  415 	push	af
   1A1F 33            [ 6]  416 	inc	sp
   1A20 C5            [11]  417 	push	bc
   1A21 33            [ 6]  418 	inc	sp
   1A22 21 00 C0      [10]  419 	ld	hl, #0xc000
   1A25 E5            [11]  420 	push	hl
   1A26 CD 19 28      [17]  421 	call	_cpct_getScreenPtr
                            422 ;src/util/tools.c:83: cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
   1A29 E5            [11]  423 	push	hl
   1A2A AF            [ 4]  424 	xor	a, a
   1A2B F5            [11]  425 	push	af
   1A2C 33            [ 6]  426 	inc	sp
   1A2D DD 7E 08      [19]  427 	ld	a, 8 (ix)
   1A30 F5            [11]  428 	push	af
   1A31 33            [ 6]  429 	inc	sp
   1A32 CD CD 26      [17]  430 	call	_cpct_px2byteM0
   1A35 55            [ 4]  431 	ld	d, l
   1A36 C1            [10]  432 	pop	bc
   1A37 21 01 02      [10]  433 	ld	hl, #0x0201
   1A3A E5            [11]  434 	push	hl
   1A3B D5            [11]  435 	push	de
   1A3C 33            [ 6]  436 	inc	sp
   1A3D C5            [11]  437 	push	bc
   1A3E CD 07 27      [17]  438 	call	_cpct_drawSolidBox
   1A41 DD F9         [10]  439 	ld	sp, ix
   1A43 DD E1         [14]  440 	pop	ix
   1A45 C9            [10]  441 	ret
                            442 ;src/util/tools.c:94: void updateNumber(u8 number)
                            443 ;	---------------------------------
                            444 ; Function updateNumber
                            445 ; ---------------------------------
   1A46                     446 _updateNumber::
   1A46 DD E5         [15]  447 	push	ix
   1A48 DD 21 00 00   [14]  448 	ld	ix,#0
   1A4C DD 39         [15]  449 	add	ix,sp
   1A4E F5            [11]  450 	push	af
   1A4F 3B            [ 6]  451 	dec	sp
                            452 ;src/util/tools.c:99: pvmem = cpct_getScreenPtr(SCR_VMEM, 58, 80);
   1A50 21 3A 50      [10]  453 	ld	hl, #0x503a
   1A53 E5            [11]  454 	push	hl
   1A54 21 00 C0      [10]  455 	ld	hl, #0xc000
   1A57 E5            [11]  456 	push	hl
   1A58 CD 19 28      [17]  457 	call	_cpct_getScreenPtr
                            458 ;src/util/tools.c:100: cpct_drawSolidBox(pvmem, cpct_px2byteM0(14, 14), 8, 14);
   1A5B E5            [11]  459 	push	hl
   1A5C 21 0E 0E      [10]  460 	ld	hl, #0x0e0e
   1A5F E5            [11]  461 	push	hl
   1A60 CD CD 26      [17]  462 	call	_cpct_px2byteM0
   1A63 55            [ 4]  463 	ld	d, l
   1A64 C1            [10]  464 	pop	bc
   1A65 21 08 0E      [10]  465 	ld	hl, #0x0e08
   1A68 E5            [11]  466 	push	hl
   1A69 D5            [11]  467 	push	de
   1A6A 33            [ 6]  468 	inc	sp
   1A6B C5            [11]  469 	push	bc
   1A6C CD 07 27      [17]  470 	call	_cpct_drawSolidBox
                            471 ;src/util/tools.c:101: sprintf(text, "%02d", number);
   1A6F DD 5E 04      [19]  472 	ld	e, 4 (ix)
   1A72 16 00         [ 7]  473 	ld	d, #0x00
   1A74 21 00 00      [10]  474 	ld	hl, #0x0000
   1A77 39            [11]  475 	add	hl, sp
   1A78 4D            [ 4]  476 	ld	c, l
   1A79 44            [ 4]  477 	ld	b, h
   1A7A E5            [11]  478 	push	hl
   1A7B D5            [11]  479 	push	de
   1A7C 11 A4 1A      [10]  480 	ld	de, #___str_0
   1A7F D5            [11]  481 	push	de
   1A80 C5            [11]  482 	push	bc
   1A81 CD F4 25      [17]  483 	call	_sprintf
   1A84 21 06 00      [10]  484 	ld	hl, #6
   1A87 39            [11]  485 	add	hl, sp
   1A88 F9            [ 6]  486 	ld	sp, hl
   1A89 E1            [10]  487 	pop	hl
                            488 ;src/util/tools.c:102: drawText(text, 58, 80, COLORTXT_YELLOW, DOUBLEHEIGHT, TRANSPARENT);
   1A8A 01 02 01      [10]  489 	ld	bc, #0x0102
   1A8D C5            [11]  490 	push	bc
   1A8E 01 50 01      [10]  491 	ld	bc, #0x0150
   1A91 C5            [11]  492 	push	bc
   1A92 3E 3A         [ 7]  493 	ld	a, #0x3a
   1A94 F5            [11]  494 	push	af
   1A95 33            [ 6]  495 	inc	sp
   1A96 E5            [11]  496 	push	hl
   1A97 CD AE 1E      [17]  497 	call	_drawText
   1A9A 21 07 00      [10]  498 	ld	hl, #7
   1A9D 39            [11]  499 	add	hl, sp
   1A9E F9            [ 6]  500 	ld	sp, hl
   1A9F DD F9         [10]  501 	ld	sp, ix
   1AA1 DD E1         [14]  502 	pop	ix
   1AA3 C9            [10]  503 	ret
   1AA4                     504 ___str_0:
   1AA4 25 30 32 64         505 	.ascii "%02d"
   1AA8 00                  506 	.db 0x00
                            507 ;src/util/tools.c:112: u8 resultNumber()
                            508 ;	---------------------------------
                            509 ; Function resultNumber
                            510 ; ---------------------------------
   1AA9                     511 _resultNumber::
                            512 ;src/util/tools.c:116: selection = 1;
   1AA9 0E 01         [ 7]  513 	ld	c, #0x01
                            514 ;src/util/tools.c:117: drawText("UP/DOWN:CHANGE LEVEL", 16, 92, COLORTXT_MAUVE, NORMALHEIGHT, TRANSPARENT);
   1AAB C5            [11]  515 	push	bc
   1AAC 21 01 01      [10]  516 	ld	hl, #0x0101
   1AAF E5            [11]  517 	push	hl
   1AB0 21 5C 05      [10]  518 	ld	hl, #0x055c
   1AB3 E5            [11]  519 	push	hl
   1AB4 3E 10         [ 7]  520 	ld	a, #0x10
   1AB6 F5            [11]  521 	push	af
   1AB7 33            [ 6]  522 	inc	sp
   1AB8 21 67 1B      [10]  523 	ld	hl, #___str_1
   1ABB E5            [11]  524 	push	hl
   1ABC CD AE 1E      [17]  525 	call	_drawText
   1ABF 21 07 00      [10]  526 	ld	hl, #7
   1AC2 39            [11]  527 	add	hl, sp
   1AC3 F9            [ 6]  528 	ld	sp, hl
   1AC4 21 01 01      [10]  529 	ld	hl, #0x0101
   1AC7 E5            [11]  530 	push	hl
   1AC8 21 68 05      [10]  531 	ld	hl, #0x0568
   1ACB E5            [11]  532 	push	hl
   1ACC 3E 10         [ 7]  533 	ld	a, #0x10
   1ACE F5            [11]  534 	push	af
   1ACF 33            [ 6]  535 	inc	sp
   1AD0 21 7C 1B      [10]  536 	ld	hl, #___str_2
   1AD3 E5            [11]  537 	push	hl
   1AD4 CD AE 1E      [17]  538 	call	_drawText
   1AD7 21 07 00      [10]  539 	ld	hl, #7
   1ADA 39            [11]  540 	add	hl, sp
   1ADB F9            [ 6]  541 	ld	sp, hl
   1ADC 3E 01         [ 7]  542 	ld	a, #0x01
   1ADE F5            [11]  543 	push	af
   1ADF 33            [ 6]  544 	inc	sp
   1AE0 CD 46 1A      [17]  545 	call	_updateNumber
   1AE3 33            [ 6]  546 	inc	sp
   1AE4 C1            [10]  547 	pop	bc
                            548 ;src/util/tools.c:120: while (1)
   1AE5                     549 00117$:
                            550 ;src/util/tools.c:123: cpct_waitHalts(20);
   1AE5 C5            [11]  551 	push	bc
   1AE6 2E 14         [ 7]  552 	ld	l, #0x14
   1AE8 CD 1C 25      [17]  553 	call	_cpct_waitHalts
   1AEB C1            [10]  554 	pop	bc
                            555 ;src/util/tools.c:124: if ((cpct_isKeyPressed(keys1.up)) || (cpct_isKeyPressed(keys1.j_up)))
   1AEC 2A DC A8      [16]  556 	ld	hl, (#_keys1 + 0)
   1AEF C5            [11]  557 	push	bc
   1AF0 CD 27 24      [17]  558 	call	_cpct_isKeyPressed
   1AF3 C1            [10]  559 	pop	bc
   1AF4 7D            [ 4]  560 	ld	a, l
   1AF5 B7            [ 4]  561 	or	a, a
   1AF6 20 0C         [12]  562 	jr	NZ,00108$
   1AF8 2A E8 A8      [16]  563 	ld	hl, (#(_keys1 + 0x000c) + 0)
   1AFB C5            [11]  564 	push	bc
   1AFC CD 27 24      [17]  565 	call	_cpct_isKeyPressed
   1AFF C1            [10]  566 	pop	bc
   1B00 7D            [ 4]  567 	ld	a, l
   1B01 B7            [ 4]  568 	or	a, a
   1B02 28 13         [12]  569 	jr	Z,00109$
   1B04                     570 00108$:
                            571 ;src/util/tools.c:126: selection++;
   1B04 0C            [ 4]  572 	inc	c
                            573 ;src/util/tools.c:127: if (selection > 17)
   1B05 3E 11         [ 7]  574 	ld	a, #0x11
   1B07 91            [ 4]  575 	sub	a, c
   1B08 30 02         [12]  576 	jr	NC,00102$
                            577 ;src/util/tools.c:128: selection = 1;
   1B0A 0E 01         [ 7]  578 	ld	c, #0x01
   1B0C                     579 00102$:
                            580 ;src/util/tools.c:129: updateNumber(selection);
   1B0C C5            [11]  581 	push	bc
   1B0D 79            [ 4]  582 	ld	a, c
   1B0E F5            [11]  583 	push	af
   1B0F 33            [ 6]  584 	inc	sp
   1B10 CD 46 1A      [17]  585 	call	_updateNumber
   1B13 33            [ 6]  586 	inc	sp
   1B14 C1            [10]  587 	pop	bc
   1B15 18 29         [12]  588 	jr	00110$
   1B17                     589 00109$:
                            590 ;src/util/tools.c:131: else if ((cpct_isKeyPressed(keys1.down)) || (cpct_isKeyPressed(keys1.j_down)))
   1B17 2A DE A8      [16]  591 	ld	hl, (#(_keys1 + 0x0002) + 0)
   1B1A C5            [11]  592 	push	bc
   1B1B CD 27 24      [17]  593 	call	_cpct_isKeyPressed
   1B1E C1            [10]  594 	pop	bc
   1B1F 7D            [ 4]  595 	ld	a, l
   1B20 B7            [ 4]  596 	or	a, a
   1B21 20 0C         [12]  597 	jr	NZ,00105$
   1B23 2A EA A8      [16]  598 	ld	hl, (#(_keys1 + 0x000e) + 0)
   1B26 C5            [11]  599 	push	bc
   1B27 CD 27 24      [17]  600 	call	_cpct_isKeyPressed
   1B2A C1            [10]  601 	pop	bc
   1B2B 7D            [ 4]  602 	ld	a, l
   1B2C B7            [ 4]  603 	or	a, a
   1B2D 28 11         [12]  604 	jr	Z,00110$
   1B2F                     605 00105$:
                            606 ;src/util/tools.c:133: selection--;
   1B2F 0D            [ 4]  607 	dec	c
                            608 ;src/util/tools.c:134: if (selection < 1)
   1B30 79            [ 4]  609 	ld	a, c
   1B31 D6 01         [ 7]  610 	sub	a, #0x01
   1B33 30 02         [12]  611 	jr	NC,00104$
                            612 ;src/util/tools.c:135: selection = 17;
   1B35 0E 11         [ 7]  613 	ld	c, #0x11
   1B37                     614 00104$:
                            615 ;src/util/tools.c:136: updateNumber(selection);
   1B37 C5            [11]  616 	push	bc
   1B38 79            [ 4]  617 	ld	a, c
   1B39 F5            [11]  618 	push	af
   1B3A 33            [ 6]  619 	inc	sp
   1B3B CD 46 1A      [17]  620 	call	_updateNumber
   1B3E 33            [ 6]  621 	inc	sp
   1B3F C1            [10]  622 	pop	bc
   1B40                     623 00110$:
                            624 ;src/util/tools.c:138: if ((cpct_isKeyPressed(keys1.fire1)) || (cpct_isKeyPressed(keys1.j_fire1)) || (cpct_isKeyPressed(keys1.j_fire2)))
   1B40 2A E4 A8      [16]  625 	ld	hl, (#(_keys1 + 0x0008) + 0)
   1B43 C5            [11]  626 	push	bc
   1B44 CD 27 24      [17]  627 	call	_cpct_isKeyPressed
   1B47 C1            [10]  628 	pop	bc
   1B48 7D            [ 4]  629 	ld	a, l
   1B49 B7            [ 4]  630 	or	a, a
   1B4A 20 19         [12]  631 	jr	NZ,00112$
   1B4C 2A F0 A8      [16]  632 	ld	hl, (#(_keys1 + 0x0014) + 0)
   1B4F C5            [11]  633 	push	bc
   1B50 CD 27 24      [17]  634 	call	_cpct_isKeyPressed
   1B53 C1            [10]  635 	pop	bc
   1B54 7D            [ 4]  636 	ld	a, l
   1B55 B7            [ 4]  637 	or	a, a
   1B56 20 0D         [12]  638 	jr	NZ,00112$
   1B58 2A F2 A8      [16]  639 	ld	hl, (#(_keys1 + 0x0016) + 0)
   1B5B C5            [11]  640 	push	bc
   1B5C CD 27 24      [17]  641 	call	_cpct_isKeyPressed
   1B5F C1            [10]  642 	pop	bc
   1B60 7D            [ 4]  643 	ld	a, l
   1B61 B7            [ 4]  644 	or	a, a
   1B62 CA E5 1A      [10]  645 	jp	Z, 00117$
   1B65                     646 00112$:
                            647 ;src/util/tools.c:140: return selection;
   1B65 69            [ 4]  648 	ld	l, c
   1B66 C9            [10]  649 	ret
   1B67                     650 ___str_1:
   1B67 55 50 2F 44 4F 57   651 	.ascii "UP/DOWN:CHANGE LEVEL"
        4E 3A 43 48 41 4E
        47 45 20 4C 45 56
        45 4C
   1B7B 00                  652 	.db 0x00
   1B7C                     653 ___str_2:
   1B7C 46 49 52 45 3A 20   654 	.ascii "FIRE: CONFIRM"
        43 4F 4E 46 49 52
        4D
   1B89 00                  655 	.db 0x00
                            656 ;src/util/tools.c:151: u8 resultYesNo()
                            657 ;	---------------------------------
                            658 ; Function resultYesNo
                            659 ; ---------------------------------
   1B8A                     660 _resultYesNo::
                            661 ;src/util/tools.c:153: drawText("(YES/NO)", 32, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
   1B8A 21 01 01      [10]  662 	ld	hl, #0x0101
   1B8D E5            [11]  663 	push	hl
   1B8E 2E 60         [ 7]  664 	ld	l, #0x60
   1B90 E5            [11]  665 	push	hl
   1B91 3E 20         [ 7]  666 	ld	a, #0x20
   1B93 F5            [11]  667 	push	af
   1B94 33            [ 6]  668 	inc	sp
   1B95 21 BB 1B      [10]  669 	ld	hl, #___str_3
   1B98 E5            [11]  670 	push	hl
   1B99 CD AE 1E      [17]  671 	call	_drawText
   1B9C 21 07 00      [10]  672 	ld	hl, #7
   1B9F 39            [11]  673 	add	hl, sp
   1BA0 F9            [ 6]  674 	ld	sp, hl
                            675 ;src/util/tools.c:155: while (1)
   1BA1                     676 00105$:
                            677 ;src/util/tools.c:157: if ((cpct_isKeyPressed(Key_Y)) || (cpct_isKeyPressed(Key_N)))
   1BA1 21 05 08      [10]  678 	ld	hl, #0x0805
   1BA4 CD 27 24      [17]  679 	call	_cpct_isKeyPressed
   1BA7 7D            [ 4]  680 	ld	a, l
   1BA8 B7            [ 4]  681 	or	a, a
   1BA9 20 0A         [12]  682 	jr	NZ,00101$
   1BAB 21 05 40      [10]  683 	ld	hl, #0x4005
   1BAE CD 27 24      [17]  684 	call	_cpct_isKeyPressed
   1BB1 7D            [ 4]  685 	ld	a, l
   1BB2 B7            [ 4]  686 	or	a, a
   1BB3 28 EC         [12]  687 	jr	Z,00105$
   1BB5                     688 00101$:
                            689 ;src/util/tools.c:159: return (cpct_isKeyPressed(Key_Y));
   1BB5 21 05 08      [10]  690 	ld	hl, #0x0805
                            691 ;src/util/tools.c:160: break;
   1BB8 C3 27 24      [10]  692 	jp  _cpct_isKeyPressed
   1BBB                     693 ___str_3:
   1BBB 28 59 45 53 2F 4E   694 	.ascii "(YES/NO)"
        4F 29
   1BC3 00                  695 	.db 0x00
                            696 ;src/util/tools.c:171: u8 showMessage(u8 *message, u8 type)
                            697 ;	---------------------------------
                            698 ; Function showMessage
                            699 ; ---------------------------------
   1BC4                     700 _showMessage::
   1BC4 DD E5         [15]  701 	push	ix
   1BC6 DD 21 00 00   [14]  702 	ld	ix,#0
   1BCA DD 39         [15]  703 	add	ix,sp
   1BCC 3B            [ 6]  704 	dec	sp
                            705 ;src/util/tools.c:179: if (type == NUMBER)
   1BCD DD 7E 06      [19]  706 	ld	a, 6 (ix)
   1BD0 D6 02         [ 7]  707 	sub	a, #0x02
   1BD2 20 04         [12]  708 	jr	NZ,00142$
   1BD4 3E 01         [ 7]  709 	ld	a,#0x01
   1BD6 18 01         [12]  710 	jr	00143$
   1BD8                     711 00142$:
   1BD8 AF            [ 4]  712 	xor	a,a
   1BD9                     713 00143$:
   1BD9 DD 77 FF      [19]  714 	ld	-1 (ix), a
   1BDC B7            [ 4]  715 	or	a, a
   1BDD 28 04         [12]  716 	jr	Z,00102$
                            717 ;src/util/tools.c:180: defaultMax = 56;
   1BDF 0E 38         [ 7]  718 	ld	c, #0x38
   1BE1 18 02         [12]  719 	jr	00103$
   1BE3                     720 00102$:
                            721 ;src/util/tools.c:182: defaultMax = 26;
   1BE3 0E 1A         [ 7]  722 	ld	c, #0x1a
   1BE5                     723 00103$:
                            724 ;src/util/tools.c:184: messageLength = strLength(message);
   1BE5 C5            [11]  725 	push	bc
   1BE6 DD 6E 04      [19]  726 	ld	l,4 (ix)
   1BE9 DD 66 05      [19]  727 	ld	h,5 (ix)
   1BEC E5            [11]  728 	push	hl
   1BED CD 57 1E      [17]  729 	call	_strLength
   1BF0 F1            [10]  730 	pop	af
   1BF1 5D            [ 4]  731 	ld	e, l
   1BF2 C1            [10]  732 	pop	bc
                            733 ;src/util/tools.c:185: w = max(((messageLength * 2) + 7), defaultMax);
   1BF3 6B            [ 4]  734 	ld	l, e
   1BF4 26 00         [ 7]  735 	ld	h, #0x00
   1BF6 29            [11]  736 	add	hl, hl
   1BF7 D5            [11]  737 	push	de
   1BF8 11 07 00      [10]  738 	ld	de, #0x0007
   1BFB 19            [11]  739 	add	hl, de
   1BFC D1            [10]  740 	pop	de
   1BFD 79            [ 4]  741 	ld	a, c
   1BFE 16 00         [ 7]  742 	ld	d, #0x00
   1C00 95            [ 4]  743 	sub	a, l
   1C01 7A            [ 4]  744 	ld	a, d
   1C02 9C            [ 4]  745 	sbc	a, h
   1C03 E2 08 1C      [10]  746 	jp	PO, 00144$
   1C06 EE 80         [ 7]  747 	xor	a, #0x80
   1C08                     748 00144$:
   1C08 F2 10 1C      [10]  749 	jp	P, 00115$
   1C0B 7B            [ 4]  750 	ld	a, e
   1C0C 87            [ 4]  751 	add	a, a
   1C0D C6 07         [ 7]  752 	add	a, #0x07
   1C0F 4F            [ 4]  753 	ld	c, a
   1C10                     754 00115$:
                            755 ;src/util/tools.c:187: x = ((80 - w) / 2+1);
   1C10 59            [ 4]  756 	ld	e, c
   1C11 16 00         [ 7]  757 	ld	d, #0x00
   1C13 3E 50         [ 7]  758 	ld	a, #0x50
   1C15 93            [ 4]  759 	sub	a, e
   1C16 6F            [ 4]  760 	ld	l, a
   1C17 3E 00         [ 7]  761 	ld	a, #0x00
   1C19 9A            [ 4]  762 	sbc	a, d
   1C1A 67            [ 4]  763 	ld	h, a
   1C1B 5D            [ 4]  764 	ld	e, l
   1C1C 54            [ 4]  765 	ld	d, h
   1C1D CB 7C         [ 8]  766 	bit	7, h
   1C1F 28 02         [12]  767 	jr	Z,00117$
   1C21 EB            [ 4]  768 	ex	de,hl
   1C22 13            [ 6]  769 	inc	de
   1C23                     770 00117$:
   1C23 CB 2A         [ 8]  771 	sra	d
   1C25 CB 1B         [ 8]  772 	rr	e
   1C27 43            [ 4]  773 	ld	b, e
   1C28 04            [ 4]  774 	inc	b
                            775 ;src/util/tools.c:191: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   1C29 C5            [11]  776 	push	bc
   1C2A 3E 3A         [ 7]  777 	ld	a, #0x3a
   1C2C F5            [11]  778 	push	af
   1C2D 33            [ 6]  779 	inc	sp
   1C2E C5            [11]  780 	push	bc
   1C2F 33            [ 6]  781 	inc	sp
   1C30 21 00 C0      [10]  782 	ld	hl, #0xc000
   1C33 E5            [11]  783 	push	hl
   1C34 CD 19 28      [17]  784 	call	_cpct_getScreenPtr
   1C37 EB            [ 4]  785 	ex	de,hl
   1C38 C1            [10]  786 	pop	bc
                            787 ;src/util/tools.c:196: cpct_getScreenToSprite(pvmem, (u8*) &screenBuffer0, w, h);
   1C39 21 00 B0      [10]  788 	ld	hl, #_screenBuffer0+0
   1C3C C5            [11]  789 	push	bc
   1C3D D5            [11]  790 	push	de
   1C3E 06 3C         [ 7]  791 	ld	b, #0x3c
   1C40 C5            [11]  792 	push	bc
   1C41 E5            [11]  793 	push	hl
   1C42 D5            [11]  794 	push	de
   1C43 CD 96 23      [17]  795 	call	_cpct_getScreenToSprite
   1C46 D1            [10]  796 	pop	de
   1C47 C1            [10]  797 	pop	bc
                            798 ;src/util/tools.c:199: drawWindow(x, y, w, h - 2, 15, 14);
   1C48 C5            [11]  799 	push	bc
   1C49 D5            [11]  800 	push	de
   1C4A 21 0F 0E      [10]  801 	ld	hl, #0x0e0f
   1C4D E5            [11]  802 	push	hl
   1C4E 3E 3A         [ 7]  803 	ld	a, #0x3a
   1C50 F5            [11]  804 	push	af
   1C51 33            [ 6]  805 	inc	sp
   1C52 51            [ 4]  806 	ld	d, c
   1C53 1E 3A         [ 7]  807 	ld	e,#0x3a
   1C55 D5            [11]  808 	push	de
   1C56 C5            [11]  809 	push	bc
   1C57 33            [ 6]  810 	inc	sp
   1C58 CD 2F 18      [17]  811 	call	_drawWindow
   1C5B 21 06 00      [10]  812 	ld	hl, #6
   1C5E 39            [11]  813 	add	hl, sp
   1C5F F9            [ 6]  814 	ld	sp, hl
   1C60 D1            [10]  815 	pop	de
   1C61 C1            [10]  816 	pop	bc
                            817 ;src/util/tools.c:200: drawText(message, x + 3, y + 12, COLORTXT_WHITE, DOUBLEHEIGHT, TRANSPARENT);
   1C62 04            [ 4]  818 	inc	b
   1C63 04            [ 4]  819 	inc	b
   1C64 04            [ 4]  820 	inc	b
   1C65 C5            [11]  821 	push	bc
   1C66 D5            [11]  822 	push	de
   1C67 21 02 01      [10]  823 	ld	hl, #0x0102
   1C6A E5            [11]  824 	push	hl
   1C6B 21 46 00      [10]  825 	ld	hl, #0x0046
   1C6E E5            [11]  826 	push	hl
   1C6F C5            [11]  827 	push	bc
   1C70 33            [ 6]  828 	inc	sp
   1C71 DD 6E 04      [19]  829 	ld	l,4 (ix)
   1C74 DD 66 05      [19]  830 	ld	h,5 (ix)
   1C77 E5            [11]  831 	push	hl
   1C78 CD AE 1E      [17]  832 	call	_drawText
   1C7B 21 07 00      [10]  833 	ld	hl, #7
   1C7E 39            [11]  834 	add	hl, sp
   1C7F F9            [ 6]  835 	ld	sp, hl
   1C80 D1            [10]  836 	pop	de
   1C81 C1            [10]  837 	pop	bc
                            838 ;src/util/tools.c:203: if (type == YESNO)
   1C82 DD 7E 06      [19]  839 	ld	a, 6 (ix)
   1C85 3D            [ 4]  840 	dec	a
   1C86 20 09         [12]  841 	jr	NZ,00111$
                            842 ;src/util/tools.c:205: result = resultYesNo();
   1C88 C5            [11]  843 	push	bc
   1C89 D5            [11]  844 	push	de
   1C8A CD 8A 1B      [17]  845 	call	_resultYesNo
   1C8D D1            [10]  846 	pop	de
   1C8E C1            [10]  847 	pop	bc
   1C8F 18 49         [12]  848 	jr	00112$
   1C91                     849 00111$:
                            850 ;src/util/tools.c:207: else if (type == NUMBER)
   1C91 DD 7E FF      [19]  851 	ld	a, -1 (ix)
   1C94 B7            [ 4]  852 	or	a, a
   1C95 28 09         [12]  853 	jr	Z,00108$
                            854 ;src/util/tools.c:209: result = resultNumber();
   1C97 C5            [11]  855 	push	bc
   1C98 D5            [11]  856 	push	de
   1C99 CD A9 1A      [17]  857 	call	_resultNumber
   1C9C D1            [10]  858 	pop	de
   1C9D C1            [10]  859 	pop	bc
   1C9E 18 3A         [12]  860 	jr	00112$
   1CA0                     861 00108$:
                            862 ;src/util/tools.c:210: } else if (type == TEMPORAL){
   1CA0 DD 7E 06      [19]  863 	ld	a, 6 (ix)
   1CA3 D6 03         [ 7]  864 	sub	a, #0x03
   1CA5 20 0D         [12]  865 	jr	NZ,00105$
                            866 ;src/util/tools.c:211: cpct_waitHalts(100);
   1CA7 C5            [11]  867 	push	bc
   1CA8 D5            [11]  868 	push	de
   1CA9 2E 64         [ 7]  869 	ld	l, #0x64
   1CAB CD 1C 25      [17]  870 	call	_cpct_waitHalts
   1CAE D1            [10]  871 	pop	de
   1CAF C1            [10]  872 	pop	bc
                            873 ;src/util/tools.c:212: result = YES;
   1CB0 2E 01         [ 7]  874 	ld	l, #0x01
   1CB2 18 26         [12]  875 	jr	00112$
   1CB4                     876 00105$:
                            877 ;src/util/tools.c:216: drawText("PRESS A KEY", 29, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
   1CB4 C5            [11]  878 	push	bc
   1CB5 D5            [11]  879 	push	de
   1CB6 21 01 01      [10]  880 	ld	hl, #0x0101
   1CB9 E5            [11]  881 	push	hl
   1CBA 2E 60         [ 7]  882 	ld	l, #0x60
   1CBC E5            [11]  883 	push	hl
   1CBD 3E 1D         [ 7]  884 	ld	a, #0x1d
   1CBF F5            [11]  885 	push	af
   1CC0 33            [ 6]  886 	inc	sp
   1CC1 21 EB 1C      [10]  887 	ld	hl, #___str_4
   1CC4 E5            [11]  888 	push	hl
   1CC5 CD AE 1E      [17]  889 	call	_drawText
   1CC8 21 07 00      [10]  890 	ld	hl, #7
   1CCB 39            [11]  891 	add	hl, sp
   1CCC F9            [ 6]  892 	ld	sp, hl
   1CCD D1            [10]  893 	pop	de
   1CCE C1            [10]  894 	pop	bc
                            895 ;src/util/tools.c:217: result = YES;
   1CCF 2E 01         [ 7]  896 	ld	l, #0x01
                            897 ;src/util/tools.c:218: wait4OneKey();
   1CD1 E5            [11]  898 	push	hl
   1CD2 C5            [11]  899 	push	bc
   1CD3 D5            [11]  900 	push	de
   1CD4 CD 5A 23      [17]  901 	call	_wait4OneKey
   1CD7 D1            [10]  902 	pop	de
   1CD8 C1            [10]  903 	pop	bc
   1CD9 E1            [10]  904 	pop	hl
   1CDA                     905 00112$:
                            906 ;src/util/tools.c:222: cpct_drawSprite((u8 *)0xb000, pvmem, w, h);
   1CDA E5            [11]  907 	push	hl
   1CDB 06 3C         [ 7]  908 	ld	b, #0x3c
   1CDD C5            [11]  909 	push	bc
   1CDE D5            [11]  910 	push	de
   1CDF 01 00 B0      [10]  911 	ld	bc, #0xb000
   1CE2 C5            [11]  912 	push	bc
   1CE3 CD 56 24      [17]  913 	call	_cpct_drawSprite
   1CE6 E1            [10]  914 	pop	hl
                            915 ;src/util/tools.c:224: return result;
   1CE7 33            [ 6]  916 	inc	sp
   1CE8 DD E1         [14]  917 	pop	ix
   1CEA C9            [10]  918 	ret
   1CEB                     919 ___str_4:
   1CEB 50 52 45 53 53 20   920 	.ascii "PRESS A KEY"
        41 20 4B 45 59
   1CF6 00                  921 	.db 0x00
                            922 ;src/util/tools.c:226: void drawCompressToScreen(u8 x, u8 y, u8 w, u8 h, u16 size, u8* comp_end, u8 trans){
                            923 ;	---------------------------------
                            924 ; Function drawCompressToScreen
                            925 ; ---------------------------------
   1CF7                     926 _drawCompressToScreen::
   1CF7 DD E5         [15]  927 	push	ix
   1CF9 DD 21 00 00   [14]  928 	ld	ix,#0
   1CFD DD 39         [15]  929 	add	ix,sp
   1CFF F5            [11]  930 	push	af
                            931 ;src/util/tools.c:229: pvmem = cpct_getScreenPtr(SCR_VMEM, x, y);
   1D00 DD 66 05      [19]  932 	ld	h, 5 (ix)
   1D03 DD 6E 04      [19]  933 	ld	l, 4 (ix)
   1D06 E5            [11]  934 	push	hl
   1D07 21 00 C0      [10]  935 	ld	hl, #0xc000
   1D0A E5            [11]  936 	push	hl
   1D0B CD 19 28      [17]  937 	call	_cpct_getScreenPtr
   1D0E 33            [ 6]  938 	inc	sp
   1D0F 33            [ 6]  939 	inc	sp
   1D10 E5            [11]  940 	push	hl
                            941 ;src/util/tools.c:230: cpct_zx7b_decrunch_s((u8*) &screenBuffer0 + size - 1, comp_end);
   1D11 DD 4E 0A      [19]  942 	ld	c,10 (ix)
   1D14 DD 46 0B      [19]  943 	ld	b,11 (ix)
   1D17 11 00 B0      [10]  944 	ld	de, #_screenBuffer0
   1D1A DD 6E 08      [19]  945 	ld	l,8 (ix)
   1D1D DD 66 09      [19]  946 	ld	h,9 (ix)
   1D20 19            [11]  947 	add	hl, de
   1D21 2B            [ 6]  948 	dec	hl
   1D22 C5            [11]  949 	push	bc
   1D23 E5            [11]  950 	push	hl
   1D24 CD 74 26      [17]  951 	call	_cpct_zx7b_decrunch_s
                            952 ;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
   1D27 C1            [10]  953 	pop	bc
   1D28 C5            [11]  954 	push	bc
                            955 ;src/util/tools.c:231: if (trans)
   1D29 DD 7E 0C      [19]  956 	ld	a, 12 (ix)
   1D2C B7            [ 4]  957 	or	a, a
   1D2D 28 15         [12]  958 	jr	Z,00102$
                            959 ;src/util/tools.c:232: cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
   1D2F 21 00 02      [10]  960 	ld	hl, #_g_tablatrans
   1D32 E5            [11]  961 	push	hl
   1D33 DD 66 07      [19]  962 	ld	h, 7 (ix)
   1D36 DD 6E 06      [19]  963 	ld	l, 6 (ix)
   1D39 E5            [11]  964 	push	hl
   1D3A C5            [11]  965 	push	bc
   1D3B 21 00 B0      [10]  966 	ld	hl, #_screenBuffer0
   1D3E E5            [11]  967 	push	hl
   1D3F CD DE 27      [17]  968 	call	_cpct_drawSpriteMaskedAlignedTable
   1D42 18 0F         [12]  969 	jr	00104$
   1D44                     970 00102$:
                            971 ;src/util/tools.c:234: cpct_drawSprite(&screenBuffer0, pvmem, w, h);
   1D44 DD 66 07      [19]  972 	ld	h, 7 (ix)
   1D47 DD 6E 06      [19]  973 	ld	l, 6 (ix)
   1D4A E5            [11]  974 	push	hl
   1D4B C5            [11]  975 	push	bc
   1D4C 21 00 B0      [10]  976 	ld	hl, #_screenBuffer0
   1D4F E5            [11]  977 	push	hl
   1D50 CD 56 24      [17]  978 	call	_cpct_drawSprite
   1D53                     979 00104$:
   1D53 DD F9         [10]  980 	ld	sp, ix
   1D55 DD E1         [14]  981 	pop	ix
   1D57 C9            [10]  982 	ret
                            983 ;src/util/tools.c:238: void winape_breakpoint(u16 error_code) __z88dk_callee __naked {
                            984 ;	---------------------------------
                            985 ; Function winape_breakpoint
                            986 ; ---------------------------------
   1D58                     987 _winape_breakpoint::
                            988 ;src/util/tools.c:241: __asm__("pop iy");  // ret address first because __z88dk_callee convention
   1D58 FD E1         [14]  989 	pop	iy
                            990 ;src/util/tools.c:242: __asm__("pop hl");
   1D5A E1            [10]  991 	pop	hl
                            992 ;src/util/tools.c:243: __asm__("push iy"); // ret address last  because __z88dk_callee convention
   1D5B FD E5         [15]  993 	push	iy
                            994 ;src/util/tools.c:244: __asm__(".db 0xed, 0xff");
   1D5D ED FF               995 	.db	0xed, 0xff
                            996 ;src/util/tools.c:246: __asm__("ret");
   1D5F C9            [10]  997 	ret
                            998 	.area _CODE
                            999 	.area _INITIALIZER
                           1000 	.area _CABS (ABS)
