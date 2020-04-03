#include <cpctelera.h>
#include "BoardManager.h"
#include "PlayerManager.h"
#include "../sys/InputSystem.h"
#include "../util/util.h"

//////////////////////////////////////////////////////////////////
// man_game_init
//
//
// Returns: void.
//
void man_game_init(){
    man_board_create();
    man_board_init(0, 0, 8, 8);
    
    // Clean up Screen filling them up with 0's
    clearScreen(BG_COLOR);
    
    man_player_init();
    man_player_createPlayer(0,0,"David\0",100);
    man_player_createPlayer(8,8,"Malo1\0",100);
    sys_input_init();
}

//////////////////////////////////////////////////////////////////
// man_game_update
//
//
// Returns: void.
//
void man_game_update(){
    sys_input_update();
}

//////////////////////////////////////////////////////////////////
// man_game_render
//
//
// Returns: void.
//
void man_game_render(){
    man_board_render();
    man_player_render();
}