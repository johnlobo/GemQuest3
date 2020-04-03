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
#include "PlayerManager.h"
#include "../cmp/TPlayer.h"
#include "../util/util.h"
#include "../text/text.h"

//Global variables
TPlayers_List players_list;

//////////////////////////////////////////////////////////////////
// man_player_init
//
//
// Returns: void.
//
void man_player_init(){
    players_list.num_players = 0;
}

//////////////////////////////////////////////////////////////////
// man_player_create
//
//
// Returns: void.
//
void man_player_createPlayer(u8 x, u8 y, u8 *name, u8 life){
    players_list.list[players_list.num_players].active = NO;
    strCopy(name, &players_list.list[players_list.num_players].name[0]);
    players_list.list[players_list.num_players].x = x;
    players_list.list[players_list.num_players].y = y;
    players_list.list[players_list.num_players].px = x;
    players_list.list[players_list.num_players].py = y;
    players_list.list[players_list.num_players].life = life;
    players_list.list[players_list.num_players].score = 0;
}

//////////////////////////////////////////////////////////////////
// man_game_getPlayer
//
//
// Returns: void.
//
TPlayer* man_player_get_player(u8 player){
   return &players_list.list[player]; 
}

//////////////////////////////////////////////////////////////////
// man_game_update
//
//
// Returns: void.
//
void man_player_update(){

}



//////////////////////////////////////////////////////////////////
// man_game_render
//
//
// Returns: void.
//
void man_player_render(){

}