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

#include "man/MatchManager.h"
#include "../cmp/TMatch.h"


TMatchList match_list;


//////////////////////////////////////////////////////////////////
// man_board_reset_match_list
//
//
// Returns: void.
//
void man_match_reset_match_list(){
    match_list.count = 0;
}

//////////////////////////////////////////////////////////////////
// man_board_matchlist_push
//
//
// Returns: void.
//
void man_match_matchlist_push(TMatch *match){
    if (match_list.count<5){
        cpct_memcpy(&match_list.matches[match_list.count],&match,sizeof(TMatch));
        match_list.count++;
    }
}

//////////////////////////////////////////////////////////////////
// man_board_matchlist_pop
//
//
// Returns: void.
//
void man_match_matchlist_pop(TMatch *match){
    if (match_list.count>0){
        cpct_memcpy(&match, &match_list.matches[match_list.count],sizeof(TMatch));
        match_list.count--;
    }
}