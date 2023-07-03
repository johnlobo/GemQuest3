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
#include "../cmp/TBoard.h"

typedef struct{
    TPlayers_List *players;
    TBoard *board;
} TRenderSystem;

void sys_render_init(TPlayers_List *pl, TBoard *b);
void sys_render_update(u8 initial_render);

#endif