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

TPlayer *inputPlayer;

//////////////////////////////////////////////////////////////////
// sys_input_init
//
//
// Returns: void.
//
void sys_input_init(TPlayer *player) {
    inputPlayer = player;
}

//////////////////////////////////////////////////////////////////
// sys_input_update
//
//
// Returns: void.
//
void sys_input_update() {
   if (cpct_isKeyPressed(keys1.left)) {
      inputPlayer->vx = -1;
   }
   if (cpct_isKeyPressed(keys1.right)) {
      inputPlayer->vx =  1;
   }
   if (cpct_isKeyPressed(keys1.up)) {
      inputPlayer->vy = -1;
   }
   if (cpct_isKeyPressed(keys1.down)) {
      inputPlayer->vy = 1;
   }
}