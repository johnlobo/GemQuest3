                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module InputSystem
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sys_input_update
                             12 	.globl _sys_input_init
                             13 	.globl _man_player_get_player
                             14 	.globl _cpct_isKeyPressed
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 ;src/sys/InputSystem.c:22: void sys_input_init() {
                             47 ;	---------------------------------
                             48 ; Function sys_input_init
                             49 ; ---------------------------------
   1D60                      50 _sys_input_init::
                             51 ;src/sys/InputSystem.c:24: }
   1D60 C9            [10]   52 	ret
                             53 ;src/sys/InputSystem.c:26: void sys_input_update() {
                             54 ;	---------------------------------
                             55 ; Function sys_input_update
                             56 ; ---------------------------------
   1D61                      57 _sys_input_update::
                             58 ;src/sys/InputSystem.c:27: TPlayer *player = man_player_get_player(0);
   1D61 AF            [ 4]   59 	xor	a, a
   1D62 F5            [11]   60 	push	af
   1D63 33            [ 6]   61 	inc	sp
   1D64 CD FD 17      [17]   62 	call	_man_player_get_player
   1D67 33            [ 6]   63 	inc	sp
   1D68 4D            [ 4]   64 	ld	c, l
   1D69 44            [ 4]   65 	ld	b, h
                             66 ;src/sys/InputSystem.c:29: if (cpct_isKeyPressed(keys1.left)) {
   1D6A 2A E0 A8      [16]   67 	ld	hl, (#(_keys1 + 0x0004) + 0)
   1D6D C5            [11]   68 	push	bc
   1D6E CD 27 24      [17]   69 	call	_cpct_isKeyPressed
   1D71 C1            [10]   70 	pop	bc
   1D72 7D            [ 4]   71 	ld	a, l
   1D73 B7            [ 4]   72 	or	a, a
   1D74 28 07         [12]   73 	jr	Z,00102$
                             74 ;src/sys/InputSystem.c:30: player->x = player->x - 1;
   1D76 21 17 00      [10]   75 	ld	hl, #0x0017
   1D79 09            [11]   76 	add	hl, bc
   1D7A 5E            [ 7]   77 	ld	e, (hl)
   1D7B 1D            [ 4]   78 	dec	e
   1D7C 73            [ 7]   79 	ld	(hl), e
   1D7D                      80 00102$:
                             81 ;src/sys/InputSystem.c:32: if (cpct_isKeyPressed(keys1.right)) {
   1D7D 2A E2 A8      [16]   82 	ld	hl, (#(_keys1 + 0x0006) + 0)
   1D80 C5            [11]   83 	push	bc
   1D81 CD 27 24      [17]   84 	call	_cpct_isKeyPressed
   1D84 C1            [10]   85 	pop	bc
   1D85 7D            [ 4]   86 	ld	a, l
   1D86 B7            [ 4]   87 	or	a, a
   1D87 28 07         [12]   88 	jr	Z,00104$
                             89 ;src/sys/InputSystem.c:33: player->x = player->x + 1;
   1D89 21 17 00      [10]   90 	ld	hl, #0x0017
   1D8C 09            [11]   91 	add	hl, bc
   1D8D 5E            [ 7]   92 	ld	e, (hl)
   1D8E 1C            [ 4]   93 	inc	e
   1D8F 73            [ 7]   94 	ld	(hl), e
   1D90                      95 00104$:
                             96 ;src/sys/InputSystem.c:35: if (cpct_isKeyPressed(keys1.up)) {
   1D90 2A DC A8      [16]   97 	ld	hl, (#_keys1 + 0)
   1D93 C5            [11]   98 	push	bc
   1D94 CD 27 24      [17]   99 	call	_cpct_isKeyPressed
   1D97 C1            [10]  100 	pop	bc
   1D98 7D            [ 4]  101 	ld	a, l
   1D99 B7            [ 4]  102 	or	a, a
   1D9A 28 07         [12]  103 	jr	Z,00106$
                            104 ;src/sys/InputSystem.c:36: player->y = player->y - 1;
   1D9C 21 18 00      [10]  105 	ld	hl, #0x0018
   1D9F 09            [11]  106 	add	hl, bc
   1DA0 5E            [ 7]  107 	ld	e, (hl)
   1DA1 1D            [ 4]  108 	dec	e
   1DA2 73            [ 7]  109 	ld	(hl), e
   1DA3                     110 00106$:
                            111 ;src/sys/InputSystem.c:38: if (cpct_isKeyPressed(keys1.down)) {
   1DA3 2A DE A8      [16]  112 	ld	hl, (#(_keys1 + 0x0002) + 0)
   1DA6 C5            [11]  113 	push	bc
   1DA7 CD 27 24      [17]  114 	call	_cpct_isKeyPressed
   1DAA C1            [10]  115 	pop	bc
   1DAB 7D            [ 4]  116 	ld	a, l
   1DAC B7            [ 4]  117 	or	a, a
   1DAD C8            [11]  118 	ret	Z
                            119 ;src/sys/InputSystem.c:39: player->y = player->y + 1;
   1DAE 21 18 00      [10]  120 	ld	hl, #0x0018
   1DB1 09            [11]  121 	add	hl, bc
   1DB2 4E            [ 7]  122 	ld	c, (hl)
   1DB3 0C            [ 4]  123 	inc	c
   1DB4 71            [ 7]  124 	ld	(hl), c
   1DB5 C9            [10]  125 	ret
                            126 	.area _CODE
                            127 	.area _INITIALIZER
                            128 	.area _CABS (ABS)
