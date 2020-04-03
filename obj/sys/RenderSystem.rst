                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module RenderSystem
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _draw_player
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSpriteBlended
                             14 	.globl _render
                             15 	.globl _sys_render_init
                             16 	.globl _sys_render_update
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
   34D6                      24 _render::
   34D6                      25 	.ds 4
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _INITIALIZED
                             30 ;--------------------------------------------------------
                             31 ; absolute external ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DABS (ABS)
                             34 ;--------------------------------------------------------
                             35 ; global & static initialisations
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _GSINIT
                             39 	.area _GSFINAL
                             40 	.area _GSINIT
                             41 ;--------------------------------------------------------
                             42 ; Home
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _HOME
                             46 ;--------------------------------------------------------
                             47 ; code
                             48 ;--------------------------------------------------------
                             49 	.area _CODE
                             50 ;src/sys/RenderSystem.c:26: void sys_render_init(u8 x, u8 y, TPlayers_List *pl) {
                             51 ;	---------------------------------
                             52 ; Function sys_render_init
                             53 ; ---------------------------------
   1DB6                      54 _sys_render_init::
                             55 ;src/sys/RenderSystem.c:27: render.o_x = x;
   1DB6 21 D6 34      [10]   56 	ld	hl, #_render
   1DB9 FD 21 02 00   [14]   57 	ld	iy, #2
   1DBD FD 39         [15]   58 	add	iy, sp
   1DBF FD 7E 00      [19]   59 	ld	a, 0 (iy)
   1DC2 77            [ 7]   60 	ld	(hl), a
                             61 ;src/sys/RenderSystem.c:28: render.o_y = y;
   1DC3 21 D7 34      [10]   62 	ld	hl, #(_render + 0x0001)
   1DC6 FD 21 03 00   [14]   63 	ld	iy, #3
   1DCA FD 39         [15]   64 	add	iy, sp
   1DCC FD 7E 00      [19]   65 	ld	a, 0 (iy)
   1DCF 77            [ 7]   66 	ld	(hl), a
                             67 ;src/sys/RenderSystem.c:29: render.players = pl;
   1DD0 21 D8 34      [10]   68 	ld	hl, #(_render + 0x0002)
   1DD3 FD 21 04 00   [14]   69 	ld	iy, #4
   1DD7 FD 39         [15]   70 	add	iy, sp
   1DD9 FD 7E 00      [19]   71 	ld	a, 0 (iy)
   1DDC 77            [ 7]   72 	ld	(hl), a
   1DDD 23            [ 6]   73 	inc	hl
   1DDE FD 7E 01      [19]   74 	ld	a, 1 (iy)
   1DE1 77            [ 7]   75 	ld	(hl), a
   1DE2 C9            [10]   76 	ret
                             77 ;src/sys/RenderSystem.c:40: void draw_player(TPlayer *player){
                             78 ;	---------------------------------
                             79 ; Function draw_player
                             80 ; ---------------------------------
   1DE3                      81 _draw_player::
   1DE3 DD E5         [15]   82 	push	ix
   1DE5 DD 21 00 00   [14]   83 	ld	ix,#0
   1DE9 DD 39         [15]   84 	add	ix,sp
                             85 ;src/sys/RenderSystem.c:43: pvmem = cpct_getScreenPtr (CPCT_VMEM_START,  render.o_x - 1 + (player->x * 5), render.o_y - 2 + (player->y*13));
   1DEB 3A D7 34      [13]   86 	ld	a, (#_render + 1)
   1DEE 57            [ 4]   87 	ld	d, a
   1DEF 15            [ 4]   88 	dec	d
   1DF0 15            [ 4]   89 	dec	d
   1DF1 DD 4E 04      [19]   90 	ld	c,4 (ix)
   1DF4 DD 46 05      [19]   91 	ld	b,5 (ix)
   1DF7 C5            [11]   92 	push	bc
   1DF8 FD E1         [14]   93 	pop	iy
   1DFA FD 5E 18      [19]   94 	ld	e, 24 (iy)
   1DFD 6B            [ 4]   95 	ld	l, e
   1DFE 29            [11]   96 	add	hl, hl
   1DFF 19            [11]   97 	add	hl, de
   1E00 29            [11]   98 	add	hl, hl
   1E01 29            [11]   99 	add	hl, hl
   1E02 19            [11]  100 	add	hl, de
   1E03 7A            [ 4]  101 	ld	a, d
   1E04 85            [ 4]  102 	add	a, l
   1E05 57            [ 4]  103 	ld	d, a
   1E06 21 D6 34      [10]  104 	ld	hl, #_render + 0
   1E09 5E            [ 7]  105 	ld	e, (hl)
   1E0A 1D            [ 4]  106 	dec	e
   1E0B 69            [ 4]  107 	ld	l, c
   1E0C 60            [ 4]  108 	ld	h, b
   1E0D 01 17 00      [10]  109 	ld	bc, #0x0017
   1E10 09            [11]  110 	add	hl, bc
   1E11 4E            [ 7]  111 	ld	c, (hl)
   1E12 69            [ 4]  112 	ld	l, c
   1E13 29            [11]  113 	add	hl, hl
   1E14 29            [11]  114 	add	hl, hl
   1E15 09            [11]  115 	add	hl, bc
   1E16 7B            [ 4]  116 	ld	a, e
   1E17 85            [ 4]  117 	add	a, l
   1E18 5F            [ 4]  118 	ld	e,a
   1E19 D5            [11]  119 	push	de
   1E1A 21 00 C0      [10]  120 	ld	hl, #0xc000
   1E1D E5            [11]  121 	push	hl
   1E1E CD 19 28      [17]  122 	call	_cpct_getScreenPtr
                            123 ;src/sys/RenderSystem.c:44: cpct_drawSpriteBlended(pvmem, G_MARKERS_0_H, G_MARKERS_0_W, g_markers_0); // Faster Sprites with XOR
   1E21 01 F4 12      [10]  124 	ld	bc, #_g_markers_0+0
   1E24 C5            [11]  125 	push	bc
   1E25 01 10 06      [10]  126 	ld	bc, #0x0610
   1E28 C5            [11]  127 	push	bc
   1E29 E5            [11]  128 	push	hl
   1E2A CD B2 27      [17]  129 	call	_cpct_drawSpriteBlended
   1E2D DD E1         [14]  130 	pop	ix
   1E2F C9            [10]  131 	ret
                            132 ;src/sys/RenderSystem.c:54: void sys_render_update() {
                            133 ;	---------------------------------
                            134 ; Function sys_render_update
                            135 ; ---------------------------------
   1E30                     136 _sys_render_update::
                            137 ;src/sys/RenderSystem.c:57: for (i=0; i<render.players->num_players; i++){
   1E30 0E 00         [ 7]  138 	ld	c, #0x00
   1E32                     139 00105$:
   1E32 ED 5B D8 34   [20]  140 	ld	de, (#(_render + 0x0002) + 0)
   1E36 D5            [11]  141 	push	de
   1E37 FD E1         [14]  142 	pop	iy
   1E39 FD 46 40      [19]  143 	ld	b, 64 (iy)
                            144 ;src/sys/RenderSystem.c:58: if (render.players->list[i].active){
   1E3C 79            [ 4]  145 	ld	a,c
   1E3D B8            [ 4]  146 	cp	a,b
   1E3E D0            [11]  147 	ret	NC
   1E3F 0F            [ 4]  148 	rrca
   1E40 0F            [ 4]  149 	rrca
   1E41 0F            [ 4]  150 	rrca
   1E42 E6 E0         [ 7]  151 	and	a, #0xe0
   1E44 47            [ 4]  152 	ld	b, a
   1E45 68            [ 4]  153 	ld	l,b
   1E46 26 00         [ 7]  154 	ld	h,#0x00
   1E48 19            [11]  155 	add	hl, de
   1E49 7E            [ 7]  156 	ld	a, (hl)
   1E4A B7            [ 4]  157 	or	a, a
   1E4B 28 07         [12]  158 	jr	Z,00106$
                            159 ;src/sys/RenderSystem.c:59: draw_player(&render.players->list[i]);
   1E4D C5            [11]  160 	push	bc
   1E4E E5            [11]  161 	push	hl
   1E4F CD E3 1D      [17]  162 	call	_draw_player
   1E52 F1            [10]  163 	pop	af
   1E53 C1            [10]  164 	pop	bc
   1E54                     165 00106$:
                            166 ;src/sys/RenderSystem.c:57: for (i=0; i<render.players->num_players; i++){
   1E54 0C            [ 4]  167 	inc	c
   1E55 18 DB         [12]  168 	jr	00105$
                            169 	.area _CODE
                            170 	.area _INITIALIZER
                            171 	.area _CABS (ABS)
