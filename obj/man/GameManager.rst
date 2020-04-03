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
                             15 	.globl _sys_input_update
                             16 	.globl _sys_input_init
                             17 	.globl _man_player_render
                             18 	.globl _man_player_createPlayer
                             19 	.globl _man_player_init
                             20 	.globl _man_board_render
                             21 	.globl _man_board_init
                             22 	.globl _man_board_create
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
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
                             54 ;src/man/GameManager.c:13: void man_game_init(){
                             55 ;	---------------------------------
                             56 ; Function man_game_init
                             57 ; ---------------------------------
   16E7                      58 _man_game_init::
                             59 ;src/man/GameManager.c:14: man_board_create();
   16E7 CD 64 15      [17]   60 	call	_man_board_create
                             61 ;src/man/GameManager.c:15: man_board_init(0, 0, 8, 8);
   16EA 21 08 08      [10]   62 	ld	hl, #0x0808
   16ED E5            [11]   63 	push	hl
   16EE 21 00 00      [10]   64 	ld	hl, #0x0000
   16F1 E5            [11]   65 	push	hl
   16F2 CD 9B 15      [17]   66 	call	_man_board_init
   16F5 F1            [10]   67 	pop	af
   16F6 F1            [10]   68 	pop	af
                             69 ;src/man/GameManager.c:18: clearScreen(BG_COLOR);
   16F7 AF            [ 4]   70 	xor	a, a
   16F8 F5            [11]   71 	push	af
   16F9 33            [ 6]   72 	inc	sp
   16FA CD 11 18      [17]   73 	call	_clearScreen
   16FD 33            [ 6]   74 	inc	sp
                             75 ;src/man/GameManager.c:20: man_player_init();
   16FE CD 3F 17      [17]   76 	call	_man_player_init
                             77 ;src/man/GameManager.c:21: man_player_createPlayer(0,0,"David\0",100);
   1701 3E 64         [ 7]   78 	ld	a, #0x64
   1703 F5            [11]   79 	push	af
   1704 33            [ 6]   80 	inc	sp
   1705 21 28 17      [10]   81 	ld	hl, #___str_0
   1708 E5            [11]   82 	push	hl
   1709 21 00 00      [10]   83 	ld	hl, #0x0000
   170C E5            [11]   84 	push	hl
   170D CD 45 17      [17]   85 	call	_man_player_createPlayer
   1710 F1            [10]   86 	pop	af
   1711 F1            [10]   87 	pop	af
   1712 33            [ 6]   88 	inc	sp
                             89 ;src/man/GameManager.c:22: man_player_createPlayer(8,8,"Malo1\0",100);
   1713 3E 64         [ 7]   90 	ld	a, #0x64
   1715 F5            [11]   91 	push	af
   1716 33            [ 6]   92 	inc	sp
   1717 21 2F 17      [10]   93 	ld	hl, #___str_1
   171A E5            [11]   94 	push	hl
   171B 21 08 08      [10]   95 	ld	hl, #0x0808
   171E E5            [11]   96 	push	hl
   171F CD 45 17      [17]   97 	call	_man_player_createPlayer
   1722 F1            [10]   98 	pop	af
   1723 F1            [10]   99 	pop	af
   1724 33            [ 6]  100 	inc	sp
                            101 ;src/man/GameManager.c:23: sys_input_init();
   1725 C3 60 1D      [10]  102 	jp  _sys_input_init
   1728                     103 ___str_0:
   1728 44 61 76 69 64      104 	.ascii "David"
   172D 00                  105 	.db 0x00
   172E 00                  106 	.db 0x00
   172F                     107 ___str_1:
   172F 4D 61 6C 6F 31      108 	.ascii "Malo1"
   1734 00                  109 	.db 0x00
   1735 00                  110 	.db 0x00
                            111 ;src/man/GameManager.c:32: void man_game_update(){
                            112 ;	---------------------------------
                            113 ; Function man_game_update
                            114 ; ---------------------------------
   1736                     115 _man_game_update::
                            116 ;src/man/GameManager.c:33: sys_input_update();
   1736 C3 61 1D      [10]  117 	jp  _sys_input_update
                            118 ;src/man/GameManager.c:42: void man_game_render(){
                            119 ;	---------------------------------
                            120 ; Function man_game_render
                            121 ; ---------------------------------
   1739                     122 _man_game_render::
                            123 ;src/man/GameManager.c:43: man_board_render();
   1739 CD 21 16      [17]  124 	call	_man_board_render
                            125 ;src/man/GameManager.c:44: man_player_render();
   173C C3 10 18      [10]  126 	jp  _man_player_render
                            127 	.area _CODE
                            128 	.area _INITIALIZER
                            129 	.area _CABS (ABS)
