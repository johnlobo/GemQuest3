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
#ifndef _PLAYERMANAGER_H_
#define _PLAYERMANAGER_H_

#include <cpctelera.h>
#include "../cmp/TPlayer.h"

void man_player_init();
void man_player_createPlayer(u8 x, u8 y, u8 *name, u8 life);
TPlayer* man_player_get_player(u8 player);
TPlayers_List* man_player_get_player_list();
void man_player_activatePlayer(u8 player, u8 activation);
void man_player_update();
void man_player_render();

#endif

