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
#include "../man/BoardManager.h"
#include "../defines.h"

TPlayer *physicsPlayer;

//////////////////////////////////////////////////////////////////
// sys_input_init
//
//
// Returns: void.
//
void sys_physics_init(TPlayer *player) {
    physicsPlayer = player;
}

//////////////////////////////////////////////////////////////////
// sys_input_update
//
//
// Returns: void.
//
void sys_physics_update() {
    if (physicsPlayer->vx<0){ 
        if (physicsPlayer->x > 0){
            physicsPlayer->x = physicsPlayer->x - 1;
            physicsPlayer->updated = YES;
        }
        physicsPlayer->vx = 0;
   } else if (physicsPlayer->vx>0){
       if ((physicsPlayer->x+1) < man_board_get_width()){
            physicsPlayer->x = physicsPlayer->x + 1;
            physicsPlayer->updated = YES;
        }
        physicsPlayer->vx = 0;

   }
    if (physicsPlayer->vy<0){ 
        if (physicsPlayer->y > 0){
            physicsPlayer->y = physicsPlayer->y - 1;
            physicsPlayer->updated = YES;
        }
        physicsPlayer->vy = 0;
   } else if (physicsPlayer->vy>0){
       if ((physicsPlayer->y+1) < man_board_get_height()){
            physicsPlayer->y = physicsPlayer->y + 1;
            physicsPlayer->updated = YES;
        }
        physicsPlayer->vy = 0;
   }
}