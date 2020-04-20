//-----------------------------LICENSE NOTICE------------------------------------
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include "RenderSystem.h"
#include "../cmp/TPlayer.h"
#include "../cmp/TBoard.h"
#include "../man/PlayerManager.h"
#include "../defines.h"
#include "../sprites/markers.h"
#include "../sprites/tiles.h"
#include <stdio.h>
#include "../text/text.h"

TRenderSystem render;
//Manager Variables
u8* const tiles[9] = { sp_tiles_0, sp_tiles_1, sp_tiles_2, sp_tiles_3, sp_tiles_4, sp_tiles_5, sp_tiles_6, sp_tiles_7, sp_tiles_8 };

//////////////////////////////////////////////////////////////////
// sys_render_init
//
//
// Returns: void.
//
void sys_render_init(TPlayers_List *pl, TBoard *b) {
   render.players = pl;
   render.board = b;
}


//////////////////////////////////////////////////////////////////
// man_board_render
//
//
// Returns: void.
//
void board_render(TBoard *board){
    u8 i,j;
    u8* vmem;

    if (board->updated == YES){
    	for (j=0; j<board->height; j++){
    	    for (i=0; i<board->width; i++){
    	        vmem = cpct_getScreenPtr (CPCT_VMEM_START, board->x + (i*5), board->y + (j*13));
    	        if (board->cells[j][i]!=255){
					cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board->cells[j][i]]); // Faster Sprites with XOR
				} else {
					cpct_drawSolidBox (vmem, 0, SP_TILES_0_W, SP_TILES_0_H);	
				}
    	    }
    	}
		board->updated = NO;
	}
}

//////////////////////////////////////////////////////////////////
// draw_player
//
//
// Returns: void.
//
//
void draw_player(TBoard *board, TPlayer *player, u8 coords){
    u8 *pvmem;
    u8 x,y;
    
    if (coords == PREVIOUS){
        x = player->px;
        y = player->py;
    }else{
        x = player->x;
        y = player->y;
    }
    pvmem = cpct_getScreenPtr (CPCT_VMEM_START,  board->x - 1 + (x * 5), board->y - 2 + (y*13));
    cpct_drawSpriteBlended(pvmem, G_MARKERS_0_H, G_MARKERS_0_W, g_markers_0); // Faster Sprites with XOR
}

//////////////////////////////////////////////////////////////////
// man_board_render
//
//
// Returns: void.
//
void players_render(TBoard *board, TPlayers_List *players, u8 initial_render){
    u8 i;
	u8 aux_txt[2];
    //Render Players
    for (i=0; i<players->num_players; i++){
        if (players->list[i].updated == YES){
            if (initial_render == NO){
                draw_player(board, &players->list[i], PREVIOUS);
            }
            draw_player(board, &players->list[i], CURRENT);
        	players->list[i].updated = NO;
			
			players->list[i].px = players->list[i].x;
			players->list[i].py = players->list[i].y;
			
			sprintf(aux_txt,"X:%d",players->list[i].x);
			drawText(aux_txt, 0, 0, COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
			sprintf(aux_txt,"Y:%d",players->list[i].y);
			drawText(aux_txt, 0, 10, COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
        }
    }
}


//////////////////////////////////////////////////////////////////
// sys_render_update
//
//
// Returns: void.
//
//
void sys_render_update(u8 initial_render) {
    //Render Board
    board_render(render.board);
    //Render Players
    players_render(render.board, render.players, initial_render);
   
}