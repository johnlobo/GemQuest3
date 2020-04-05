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
#ifndef _TPLAYER_H_
#define _TPLAYER_H_

#include <cpctelera.h>

typedef struct {
    u8 active;
    u8 name[20];
    u8 *portrait;
    u8 x,y;
    u8 px,py;
    u8 life;
    u32 score;
    u8 updated;
} TPlayer;

typedef struct {
    TPlayer list[2];
    u8 num_players;  
} TPlayers_List;

#endif
