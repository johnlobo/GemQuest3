                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module GameManager
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _man_game_render
                             12 	.globl _man_game_update
                             13 	.globl _man_game_init
                             14 	.globl _clearScreen
                             15 	.globl _man_board_render
                             16 	.globl _man_board_init
                             17 	.globl _man_board_create
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
                             49 ;src/man/GameManager.c:11: void man_game_init(){
                             50 ;	---------------------------------
                             51 ; Function man_game_init
                             52 ; ---------------------------------
   1607                      53 _man_game_init::
                             54 ;src/man/GameManager.c:12: man_board_create();
   1607 CD A4 14      [17]   55 	call	_man_board_create
                             56 ;src/man/GameManager.c:13: man_board_init(0, 0, 8, 8);
   160A 21 08 08      [10]   57 	ld	hl, #0x0808
   160D E5            [11]   58 	push	hl
   160E 21 00 00      [10]   59 	ld	hl, #0x0000
   1611 E5            [11]   60 	push	hl
   1612 CD DB 14      [17]   61 	call	_man_board_init
   1615 F1            [10]   62 	pop	af
   1616 F1            [10]   63 	pop	af
                             64 ;src/man/GameManager.c:16: clearScreen(BG_COLOR);
   1617 AF            [ 4]   65 	xor	a, a
   1618 F5            [11]   66 	push	af
   1619 33            [ 6]   67 	inc	sp
   161A CD 23 16      [17]   68 	call	_clearScreen
   161D 33            [ 6]   69 	inc	sp
   161E C9            [10]   70 	ret
                             71 ;src/man/GameManager.c:25: void man_game_update(){
                             72 ;	---------------------------------
                             73 ; Function man_game_update
                             74 ; ---------------------------------
   161F                      75 _man_game_update::
                             76 ;src/man/GameManager.c:27: }
   161F C9            [10]   77 	ret
                             78 ;src/man/GameManager.c:35: void man_game_render(){
                             79 ;	---------------------------------
                             80 ; Function man_game_render
                             81 ; ---------------------------------
   1620                      82 _man_game_render::
                             83 ;src/man/GameManager.c:36: man_board_render();
   1620 C3 5C 15      [10]   84 	jp  _man_board_render
                             85 	.area _CODE
                             86 	.area _INITIALIZER
                             87 	.area _CABS (ABS)
