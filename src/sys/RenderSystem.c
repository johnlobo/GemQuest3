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
#include "../man/PlayerManager.h"
#include "../defines.h"
#include "../sprites/markers.h"

TRenderSystem render;

void sys_render_init(u8 x, u8 y, TPlayers_List *pl) {
   render.o_x = x;
   render.o_y = y;
   render.players = pl;
}


//////////////////////////////////////////////////////////////////
// draw_player
//
//
// Returns: void.
//
//
void draw_player(TPlayer *player){
    u8 *pvmem;
    
    pvmem = cpct_getScreenPtr (CPCT_VMEM_START,  render.o_x - 1 + (player->x * 5), render.o_y - 2 + (player->y*13));
    cpct_drawSpriteBlended(pvmem, G_MARKERS_0_H, G_MARKERS_0_W, g_markers_0); // Faster Sprites with XOR
}

//////////////////////////////////////////////////////////////////
// sys_render_update
//
//
// Returns: void.
//
//
void sys_render_update() {
    u8 i;

    for (i=0; i<render.players->num_players; i++){
        if (render.players->list[i].active){
            draw_player(&render.players->list[i]);
        }
    }

}