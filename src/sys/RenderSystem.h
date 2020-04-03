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

#ifndef _RENDER_SYSTEM_H_
#define _RENDER_SYSTEM_H_

#include "../cmp/TPlayer.h"

typedef struct{
    u8 o_x;
    u8 o_y;
    TPlayers_List *players;
} TRenderSystem;

void sys_render_init(u8 x, u8 y, TPlayers_List *pl);
void sys_render_update();

#endif