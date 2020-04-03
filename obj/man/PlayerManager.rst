                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module PlayerManager
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _strCopy
                             12 	.globl _players_list
                             13 	.globl _man_player_init
                             14 	.globl _man_player_createPlayer
                             15 	.globl _man_player_get_player
                             16 	.globl _man_player_update
                             17 	.globl _man_player_render
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
   3495                      25 _players_list::
   3495                      26 	.ds 65
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 ;src/man/PlayerManager.c:32: void man_player_init(){
                             52 ;	---------------------------------
                             53 ; Function man_player_init
                             54 ; ---------------------------------
   173F                      55 _man_player_init::
                             56 ;src/man/PlayerManager.c:33: players_list.num_players = 0;
   173F 21 D5 34      [10]   57 	ld	hl, #(_players_list + 0x0040)
   1742 36 00         [10]   58 	ld	(hl), #0x00
   1744 C9            [10]   59 	ret
                             60 ;src/man/PlayerManager.c:42: void man_player_createPlayer(u8 x, u8 y, u8 *name, u8 life){
                             61 ;	---------------------------------
                             62 ; Function man_player_createPlayer
                             63 ; ---------------------------------
   1745                      64 _man_player_createPlayer::
   1745 DD E5         [15]   65 	push	ix
   1747 DD 21 00 00   [14]   66 	ld	ix,#0
   174B DD 39         [15]   67 	add	ix,sp
                             68 ;src/man/PlayerManager.c:43: players_list.list[players_list.num_players].active = NO;
   174D 11 95 34      [10]   69 	ld	de, #_players_list+0
   1750 01 95 34      [10]   70 	ld	bc, #_players_list+0
   1753 3A D5 34      [13]   71 	ld	a, (#(_players_list + 0x0040) + 0)
   1756 0F            [ 4]   72 	rrca
   1757 0F            [ 4]   73 	rrca
   1758 0F            [ 4]   74 	rrca
   1759 E6 E0         [ 7]   75 	and	a, #0xe0
   175B 6F            [ 4]   76 	ld	l, a
   175C 26 00         [ 7]   77 	ld	h,#0x00
   175E 19            [11]   78 	add	hl, de
   175F 36 00         [10]   79 	ld	(hl), #0x00
                             80 ;src/man/PlayerManager.c:44: strCopy(name, &players_list.list[players_list.num_players].name[0]);
   1761 3A D5 34      [13]   81 	ld	a, (#(_players_list + 0x0040) + 0)
   1764 0F            [ 4]   82 	rrca
   1765 0F            [ 4]   83 	rrca
   1766 0F            [ 4]   84 	rrca
   1767 E6 E0         [ 7]   85 	and	a, #0xe0
   1769 6F            [ 4]   86 	ld	l, a
   176A 26 00         [ 7]   87 	ld	h,#0x00
   176C 09            [11]   88 	add	hl, bc
   176D 23            [ 6]   89 	inc	hl
   176E C5            [11]   90 	push	bc
   176F E5            [11]   91 	push	hl
   1770 DD 6E 06      [19]   92 	ld	l,6 (ix)
   1773 DD 66 07      [19]   93 	ld	h,7 (ix)
   1776 E5            [11]   94 	push	hl
   1777 CD 85 1E      [17]   95 	call	_strCopy
   177A F1            [10]   96 	pop	af
   177B F1            [10]   97 	pop	af
   177C C1            [10]   98 	pop	bc
                             99 ;src/man/PlayerManager.c:45: players_list.list[players_list.num_players].x = x;
   177D 3A D5 34      [13]  100 	ld	a, (#(_players_list + 0x0040) + 0)
   1780 0F            [ 4]  101 	rrca
   1781 0F            [ 4]  102 	rrca
   1782 0F            [ 4]  103 	rrca
   1783 E6 E0         [ 7]  104 	and	a, #0xe0
   1785 6F            [ 4]  105 	ld	l, a
   1786 26 00         [ 7]  106 	ld	h,#0x00
   1788 09            [11]  107 	add	hl, bc
   1789 11 17 00      [10]  108 	ld	de, #0x0017
   178C 19            [11]  109 	add	hl, de
   178D DD 7E 04      [19]  110 	ld	a, 4 (ix)
   1790 77            [ 7]  111 	ld	(hl), a
                            112 ;src/man/PlayerManager.c:46: players_list.list[players_list.num_players].y = y;
   1791 3A D5 34      [13]  113 	ld	a, (#(_players_list + 0x0040) + 0)
   1794 0F            [ 4]  114 	rrca
   1795 0F            [ 4]  115 	rrca
   1796 0F            [ 4]  116 	rrca
   1797 E6 E0         [ 7]  117 	and	a, #0xe0
   1799 6F            [ 4]  118 	ld	l, a
   179A 26 00         [ 7]  119 	ld	h,#0x00
   179C 09            [11]  120 	add	hl, bc
   179D 11 18 00      [10]  121 	ld	de, #0x0018
   17A0 19            [11]  122 	add	hl, de
   17A1 DD 7E 05      [19]  123 	ld	a, 5 (ix)
   17A4 77            [ 7]  124 	ld	(hl), a
                            125 ;src/man/PlayerManager.c:47: players_list.list[players_list.num_players].px = x;
   17A5 3A D5 34      [13]  126 	ld	a, (#(_players_list + 0x0040) + 0)
   17A8 0F            [ 4]  127 	rrca
   17A9 0F            [ 4]  128 	rrca
   17AA 0F            [ 4]  129 	rrca
   17AB E6 E0         [ 7]  130 	and	a, #0xe0
   17AD 6F            [ 4]  131 	ld	l, a
   17AE 26 00         [ 7]  132 	ld	h,#0x00
   17B0 09            [11]  133 	add	hl, bc
   17B1 11 19 00      [10]  134 	ld	de, #0x0019
   17B4 19            [11]  135 	add	hl, de
   17B5 DD 7E 04      [19]  136 	ld	a, 4 (ix)
   17B8 77            [ 7]  137 	ld	(hl), a
                            138 ;src/man/PlayerManager.c:48: players_list.list[players_list.num_players].py = y;
   17B9 3A D5 34      [13]  139 	ld	a, (#(_players_list + 0x0040) + 0)
   17BC 0F            [ 4]  140 	rrca
   17BD 0F            [ 4]  141 	rrca
   17BE 0F            [ 4]  142 	rrca
   17BF E6 E0         [ 7]  143 	and	a, #0xe0
   17C1 6F            [ 4]  144 	ld	l, a
   17C2 26 00         [ 7]  145 	ld	h,#0x00
   17C4 09            [11]  146 	add	hl, bc
   17C5 11 1A 00      [10]  147 	ld	de, #0x001a
   17C8 19            [11]  148 	add	hl, de
   17C9 DD 7E 05      [19]  149 	ld	a, 5 (ix)
   17CC 77            [ 7]  150 	ld	(hl), a
                            151 ;src/man/PlayerManager.c:49: players_list.list[players_list.num_players].life = life;
   17CD 3A D5 34      [13]  152 	ld	a, (#(_players_list + 0x0040) + 0)
   17D0 0F            [ 4]  153 	rrca
   17D1 0F            [ 4]  154 	rrca
   17D2 0F            [ 4]  155 	rrca
   17D3 E6 E0         [ 7]  156 	and	a, #0xe0
   17D5 6F            [ 4]  157 	ld	l, a
   17D6 26 00         [ 7]  158 	ld	h,#0x00
   17D8 09            [11]  159 	add	hl, bc
   17D9 11 1B 00      [10]  160 	ld	de, #0x001b
   17DC 19            [11]  161 	add	hl, de
   17DD DD 7E 08      [19]  162 	ld	a, 8 (ix)
   17E0 77            [ 7]  163 	ld	(hl), a
                            164 ;src/man/PlayerManager.c:50: players_list.list[players_list.num_players].score = 0;
   17E1 3A D5 34      [13]  165 	ld	a, (#(_players_list + 0x0040) + 0)
   17E4 0F            [ 4]  166 	rrca
   17E5 0F            [ 4]  167 	rrca
   17E6 0F            [ 4]  168 	rrca
   17E7 E6 E0         [ 7]  169 	and	a, #0xe0
   17E9 6F            [ 4]  170 	ld	l, a
   17EA 26 00         [ 7]  171 	ld	h,#0x00
   17EC 09            [11]  172 	add	hl, bc
   17ED 01 1C 00      [10]  173 	ld	bc, #0x001c
   17F0 09            [11]  174 	add	hl, bc
   17F1 AF            [ 4]  175 	xor	a, a
   17F2 77            [ 7]  176 	ld	(hl), a
   17F3 23            [ 6]  177 	inc	hl
   17F4 77            [ 7]  178 	ld	(hl), a
   17F5 23            [ 6]  179 	inc	hl
   17F6 AF            [ 4]  180 	xor	a, a
   17F7 77            [ 7]  181 	ld	(hl), a
   17F8 23            [ 6]  182 	inc	hl
   17F9 77            [ 7]  183 	ld	(hl), a
   17FA DD E1         [14]  184 	pop	ix
   17FC C9            [10]  185 	ret
                            186 ;src/man/PlayerManager.c:59: TPlayer* man_player_get_player(u8 player){
                            187 ;	---------------------------------
                            188 ; Function man_player_get_player
                            189 ; ---------------------------------
   17FD                     190 _man_player_get_player::
                            191 ;src/man/PlayerManager.c:60: return &players_list.list[player]; 
   17FD 01 95 34      [10]  192 	ld	bc, #_players_list+0
   1800 21 02 00      [10]  193 	ld	hl, #2+0
   1803 39            [11]  194 	add	hl, sp
   1804 7E            [ 7]  195 	ld	a, (hl)
   1805 0F            [ 4]  196 	rrca
   1806 0F            [ 4]  197 	rrca
   1807 0F            [ 4]  198 	rrca
   1808 E6 E0         [ 7]  199 	and	a, #0xe0
   180A 6F            [ 4]  200 	ld	l, a
   180B 26 00         [ 7]  201 	ld	h,#0x00
   180D 09            [11]  202 	add	hl, bc
   180E C9            [10]  203 	ret
                            204 ;src/man/PlayerManager.c:69: void man_player_update(){
                            205 ;	---------------------------------
                            206 ; Function man_player_update
                            207 ; ---------------------------------
   180F                     208 _man_player_update::
                            209 ;src/man/PlayerManager.c:71: }
   180F C9            [10]  210 	ret
                            211 ;src/man/PlayerManager.c:81: void man_player_render(){
                            212 ;	---------------------------------
                            213 ; Function man_player_render
                            214 ; ---------------------------------
   1810                     215 _man_player_render::
                            216 ;src/man/PlayerManager.c:83: }
   1810 C9            [10]  217 	ret
                            218 	.area _CODE
                            219 	.area _INITIALIZER
                            220 	.area _CABS (ABS)
