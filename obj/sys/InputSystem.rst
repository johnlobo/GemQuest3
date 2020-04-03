                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
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
   19E3                      50 _sys_input_init::
                             51 ;src/sys/InputSystem.c:24: }
   19E3 C9            [10]   52 	ret
                             53 ;src/sys/InputSystem.c:26: void sys_input_update() {
                             54 ;	---------------------------------
                             55 ; Function sys_input_update
                             56 ; ---------------------------------
   19E4                      57 _sys_input_update::
                             58 ;src/sys/InputSystem.c:27: TPlayer *player = man_player_get_player(0);
   19E4 AF            [ 4]   59 	xor	a, a
   19E5 F5            [11]   60 	push	af
   19E6 33            [ 6]   61 	inc	sp
   19E7 CD D2 1C      [17]   62 	call	_man_player_get_player
   19EA 33            [ 6]   63 	inc	sp
   19EB 4D            [ 4]   64 	ld	c, l
   19EC 44            [ 4]   65 	ld	b, h
                             66 ;src/sys/InputSystem.c:29: if (cpct_isKeyPressed(keys1.left)) {
   19ED 2A E0 A8      [16]   67 	ld	hl, (#(_keys1 + 0x0004) + 0)
   19F0 C5            [11]   68 	push	bc
   19F1 CD 81 22      [17]   69 	call	_cpct_isKeyPressed
   19F4 C1            [10]   70 	pop	bc
   19F5 7D            [ 4]   71 	ld	a, l
   19F6 B7            [ 4]   72 	or	a, a
   19F7 28 07         [12]   73 	jr	Z,00102$
                             74 ;src/sys/InputSystem.c:30: player->x = player->x - 1;
   19F9 21 17 00      [10]   75 	ld	hl, #0x0017
   19FC 09            [11]   76 	add	hl, bc
   19FD 5E            [ 7]   77 	ld	e, (hl)
   19FE 1D            [ 4]   78 	dec	e
   19FF 73            [ 7]   79 	ld	(hl), e
   1A00                      80 00102$:
                             81 ;src/sys/InputSystem.c:32: if (cpct_isKeyPressed(keys1.right)) {
   1A00 2A E2 A8      [16]   82 	ld	hl, (#(_keys1 + 0x0006) + 0)
   1A03 C5            [11]   83 	push	bc
   1A04 CD 81 22      [17]   84 	call	_cpct_isKeyPressed
   1A07 C1            [10]   85 	pop	bc
   1A08 7D            [ 4]   86 	ld	a, l
   1A09 B7            [ 4]   87 	or	a, a
   1A0A 28 07         [12]   88 	jr	Z,00104$
                             89 ;src/sys/InputSystem.c:33: player->x = player->x + 1;
   1A0C 21 17 00      [10]   90 	ld	hl, #0x0017
   1A0F 09            [11]   91 	add	hl, bc
   1A10 5E            [ 7]   92 	ld	e, (hl)
   1A11 1C            [ 4]   93 	inc	e
   1A12 73            [ 7]   94 	ld	(hl), e
   1A13                      95 00104$:
                             96 ;src/sys/InputSystem.c:35: if (cpct_isKeyPressed(keys1.up)) {
   1A13 2A DC A8      [16]   97 	ld	hl, (#_keys1 + 0)
   1A16 C5            [11]   98 	push	bc
   1A17 CD 81 22      [17]   99 	call	_cpct_isKeyPressed
   1A1A C1            [10]  100 	pop	bc
   1A1B 7D            [ 4]  101 	ld	a, l
   1A1C B7            [ 4]  102 	or	a, a
   1A1D 28 07         [12]  103 	jr	Z,00106$
                            104 ;src/sys/InputSystem.c:36: player->y = player->y - 1;
   1A1F 21 18 00      [10]  105 	ld	hl, #0x0018
   1A22 09            [11]  106 	add	hl, bc
   1A23 5E            [ 7]  107 	ld	e, (hl)
   1A24 1D            [ 4]  108 	dec	e
   1A25 73            [ 7]  109 	ld	(hl), e
   1A26                     110 00106$:
                            111 ;src/sys/InputSystem.c:38: if (cpct_isKeyPressed(keys1.down)) {
   1A26 2A DE A8      [16]  112 	ld	hl, (#(_keys1 + 0x0002) + 0)
   1A29 C5            [11]  113 	push	bc
   1A2A CD 81 22      [17]  114 	call	_cpct_isKeyPressed
   1A2D C1            [10]  115 	pop	bc
   1A2E 7D            [ 4]  116 	ld	a, l
   1A2F B7            [ 4]  117 	or	a, a
   1A30 C8            [11]  118 	ret	Z
                            119 ;src/sys/InputSystem.c:39: player->y = player->y + 1;
   1A31 21 18 00      [10]  120 	ld	hl, #0x0018
   1A34 09            [11]  121 	add	hl, bc
   1A35 4E            [ 7]  122 	ld	c, (hl)
   1A36 0C            [ 4]  123 	inc	c
   1A37 71            [ 7]  124 	ld	(hl), c
   1A38 C9            [10]  125 	ret
                            126 	.area _CODE
                            127 	.area _INITIALIZER
                            128 	.area _CABS (ABS)
