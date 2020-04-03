                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module PlayerManager
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _strCopy
                             12 	.globl _players_num
                             13 	.globl _players_list
                             14 	.globl _man_player_init
                             15 	.globl _man_player_createPlayer
                             16 	.globl _man_player_get_player
                             17 	.globl _man_player_update
                             18 	.globl _man_player_render
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   3366                      26 _players_list::
   3366                      27 	.ds 64
   33A6                      28 _players_num::
   33A6                      29 	.ds 1
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
                             54 ;src/man/PlayerManager.c:33: void man_player_init(){
                             55 ;	---------------------------------
                             56 ; Function man_player_init
                             57 ; ---------------------------------
   1C17                      58 _man_player_init::
                             59 ;src/man/PlayerManager.c:34: players_num = 0;
   1C17 21 A6 33      [10]   60 	ld	hl,#_players_num + 0
   1C1A 36 00         [10]   61 	ld	(hl), #0x00
   1C1C C9            [10]   62 	ret
                             63 ;src/man/PlayerManager.c:43: void man_player_createPlayer(u8 x, u8 y, u8 *name, u8 life){
                             64 ;	---------------------------------
                             65 ; Function man_player_createPlayer
                             66 ; ---------------------------------
   1C1D                      67 _man_player_createPlayer::
   1C1D DD E5         [15]   68 	push	ix
   1C1F DD 21 00 00   [14]   69 	ld	ix,#0
   1C23 DD 39         [15]   70 	add	ix,sp
                             71 ;src/man/PlayerManager.c:44: players_list[players_num].active = NO;
   1C25 01 66 33      [10]   72 	ld	bc, #_players_list+0
   1C28 FD 21 A6 33   [14]   73 	ld	iy, #_players_num
   1C2C FD 6E 00      [19]   74 	ld	l, 0 (iy)
   1C2F 26 00         [ 7]   75 	ld	h, #0x00
   1C31 29            [11]   76 	add	hl, hl
   1C32 29            [11]   77 	add	hl, hl
   1C33 29            [11]   78 	add	hl, hl
   1C34 29            [11]   79 	add	hl, hl
   1C35 29            [11]   80 	add	hl, hl
   1C36 09            [11]   81 	add	hl, bc
   1C37 36 00         [10]   82 	ld	(hl), #0x00
                             83 ;src/man/PlayerManager.c:45: strCopy(name, &players_list[players_num].name[0]);
   1C39 FD 6E 00      [19]   84 	ld	l, 0 (iy)
   1C3C 26 00         [ 7]   85 	ld	h, #0x00
   1C3E 29            [11]   86 	add	hl, hl
   1C3F 29            [11]   87 	add	hl, hl
   1C40 29            [11]   88 	add	hl, hl
   1C41 29            [11]   89 	add	hl, hl
   1C42 29            [11]   90 	add	hl, hl
   1C43 09            [11]   91 	add	hl, bc
   1C44 23            [ 6]   92 	inc	hl
   1C45 C5            [11]   93 	push	bc
   1C46 E5            [11]   94 	push	hl
   1C47 DD 6E 06      [19]   95 	ld	l,6 (ix)
   1C4A DD 66 07      [19]   96 	ld	h,7 (ix)
   1C4D E5            [11]   97 	push	hl
   1C4E CD D2 14      [17]   98 	call	_strCopy
   1C51 F1            [10]   99 	pop	af
   1C52 F1            [10]  100 	pop	af
   1C53 C1            [10]  101 	pop	bc
                            102 ;src/man/PlayerManager.c:46: players_list[players_num].x = x;
   1C54 FD 21 A6 33   [14]  103 	ld	iy, #_players_num
   1C58 FD 6E 00      [19]  104 	ld	l, 0 (iy)
   1C5B 26 00         [ 7]  105 	ld	h, #0x00
   1C5D 29            [11]  106 	add	hl, hl
   1C5E 29            [11]  107 	add	hl, hl
   1C5F 29            [11]  108 	add	hl, hl
   1C60 29            [11]  109 	add	hl, hl
   1C61 29            [11]  110 	add	hl, hl
   1C62 09            [11]  111 	add	hl, bc
   1C63 11 17 00      [10]  112 	ld	de, #0x0017
   1C66 19            [11]  113 	add	hl, de
   1C67 DD 7E 04      [19]  114 	ld	a, 4 (ix)
   1C6A 77            [ 7]  115 	ld	(hl), a
                            116 ;src/man/PlayerManager.c:47: players_list[players_num].y = y;
   1C6B FD 6E 00      [19]  117 	ld	l, 0 (iy)
   1C6E 26 00         [ 7]  118 	ld	h, #0x00
   1C70 29            [11]  119 	add	hl, hl
   1C71 29            [11]  120 	add	hl, hl
   1C72 29            [11]  121 	add	hl, hl
   1C73 29            [11]  122 	add	hl, hl
   1C74 29            [11]  123 	add	hl, hl
   1C75 09            [11]  124 	add	hl, bc
   1C76 11 18 00      [10]  125 	ld	de, #0x0018
   1C79 19            [11]  126 	add	hl, de
   1C7A DD 7E 05      [19]  127 	ld	a, 5 (ix)
   1C7D 77            [ 7]  128 	ld	(hl), a
                            129 ;src/man/PlayerManager.c:48: players_list[players_num].px = x;
   1C7E FD 6E 00      [19]  130 	ld	l, 0 (iy)
   1C81 26 00         [ 7]  131 	ld	h, #0x00
   1C83 29            [11]  132 	add	hl, hl
   1C84 29            [11]  133 	add	hl, hl
   1C85 29            [11]  134 	add	hl, hl
   1C86 29            [11]  135 	add	hl, hl
   1C87 29            [11]  136 	add	hl, hl
   1C88 09            [11]  137 	add	hl, bc
   1C89 11 19 00      [10]  138 	ld	de, #0x0019
   1C8C 19            [11]  139 	add	hl, de
   1C8D DD 7E 04      [19]  140 	ld	a, 4 (ix)
   1C90 77            [ 7]  141 	ld	(hl), a
                            142 ;src/man/PlayerManager.c:49: players_list[players_num].py = y;
   1C91 FD 6E 00      [19]  143 	ld	l, 0 (iy)
   1C94 26 00         [ 7]  144 	ld	h, #0x00
   1C96 29            [11]  145 	add	hl, hl
   1C97 29            [11]  146 	add	hl, hl
   1C98 29            [11]  147 	add	hl, hl
   1C99 29            [11]  148 	add	hl, hl
   1C9A 29            [11]  149 	add	hl, hl
   1C9B 09            [11]  150 	add	hl, bc
   1C9C 11 1A 00      [10]  151 	ld	de, #0x001a
   1C9F 19            [11]  152 	add	hl, de
   1CA0 DD 7E 05      [19]  153 	ld	a, 5 (ix)
   1CA3 77            [ 7]  154 	ld	(hl), a
                            155 ;src/man/PlayerManager.c:50: players_list[players_num].life = life;
   1CA4 FD 6E 00      [19]  156 	ld	l, 0 (iy)
   1CA7 26 00         [ 7]  157 	ld	h, #0x00
   1CA9 29            [11]  158 	add	hl, hl
   1CAA 29            [11]  159 	add	hl, hl
   1CAB 29            [11]  160 	add	hl, hl
   1CAC 29            [11]  161 	add	hl, hl
   1CAD 29            [11]  162 	add	hl, hl
   1CAE 09            [11]  163 	add	hl, bc
   1CAF 11 1B 00      [10]  164 	ld	de, #0x001b
   1CB2 19            [11]  165 	add	hl, de
   1CB3 DD 7E 08      [19]  166 	ld	a, 8 (ix)
   1CB6 77            [ 7]  167 	ld	(hl), a
                            168 ;src/man/PlayerManager.c:51: players_list[players_num].score = 0;
   1CB7 FD 6E 00      [19]  169 	ld	l, 0 (iy)
   1CBA 26 00         [ 7]  170 	ld	h, #0x00
   1CBC 29            [11]  171 	add	hl, hl
   1CBD 29            [11]  172 	add	hl, hl
   1CBE 29            [11]  173 	add	hl, hl
   1CBF 29            [11]  174 	add	hl, hl
   1CC0 29            [11]  175 	add	hl, hl
   1CC1 09            [11]  176 	add	hl, bc
   1CC2 01 1C 00      [10]  177 	ld	bc, #0x001c
   1CC5 09            [11]  178 	add	hl, bc
   1CC6 AF            [ 4]  179 	xor	a, a
   1CC7 77            [ 7]  180 	ld	(hl), a
   1CC8 23            [ 6]  181 	inc	hl
   1CC9 77            [ 7]  182 	ld	(hl), a
   1CCA 23            [ 6]  183 	inc	hl
   1CCB AF            [ 4]  184 	xor	a, a
   1CCC 77            [ 7]  185 	ld	(hl), a
   1CCD 23            [ 6]  186 	inc	hl
   1CCE 77            [ 7]  187 	ld	(hl), a
   1CCF DD E1         [14]  188 	pop	ix
   1CD1 C9            [10]  189 	ret
                            190 ;src/man/PlayerManager.c:60: TPlayer* man_player_get_player(u8 player){
                            191 ;	---------------------------------
                            192 ; Function man_player_get_player
                            193 ; ---------------------------------
   1CD2                     194 _man_player_get_player::
   1CD2 DD E5         [15]  195 	push	ix
   1CD4 DD 21 00 00   [14]  196 	ld	ix,#0
   1CD8 DD 39         [15]  197 	add	ix,sp
                            198 ;src/man/PlayerManager.c:61: return &players_list[player]; 
   1CDA 01 66 33      [10]  199 	ld	bc, #_players_list+0
   1CDD DD 6E 04      [19]  200 	ld	l, 4 (ix)
   1CE0 26 00         [ 7]  201 	ld	h, #0x00
   1CE2 29            [11]  202 	add	hl, hl
   1CE3 29            [11]  203 	add	hl, hl
   1CE4 29            [11]  204 	add	hl, hl
   1CE5 29            [11]  205 	add	hl, hl
   1CE6 29            [11]  206 	add	hl, hl
   1CE7 09            [11]  207 	add	hl, bc
   1CE8 DD E1         [14]  208 	pop	ix
   1CEA C9            [10]  209 	ret
                            210 ;src/man/PlayerManager.c:70: void man_player_update(){
                            211 ;	---------------------------------
                            212 ; Function man_player_update
                            213 ; ---------------------------------
   1CEB                     214 _man_player_update::
                            215 ;src/man/PlayerManager.c:72: }
   1CEB C9            [10]  216 	ret
                            217 ;src/man/PlayerManager.c:80: void man_player_render(){
                            218 ;	---------------------------------
                            219 ; Function man_player_render
                            220 ; ---------------------------------
   1CEC                     221 _man_player_render::
                            222 ;src/man/PlayerManager.c:82: }
   1CEC C9            [10]  223 	ret
                            224 	.area _CODE
                            225 	.area _INITIALIZER
                            226 	.area _CABS (ABS)
