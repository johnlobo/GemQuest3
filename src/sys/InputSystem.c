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
#include "../cmp/TPlayer.h"
#include "../man/PlayerManager.h"
#include "../defines.h"

void sys_input_init() {
   
}

void sys_input_update() {
   TPlayer *player = man_player_get_player(0);
   
   if (cpct_isKeyPressed(keys1.left)) {
      player->x = player->x - 1;
   }
   if (cpct_isKeyPressed(keys1.right)) {
      player->x = player->x + 1;
   }
   if (cpct_isKeyPressed(keys1.up)) {
      player->y = player->y - 1;
   }
   if (cpct_isKeyPressed(keys1.down)) {
      player->y = player->y + 1;
   }
}