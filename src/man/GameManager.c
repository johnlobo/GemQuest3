#include <cpctelera.h>
#include "BoardManager.h"
#include "PlayerManager.h"
#include "../sys/InputSystem.h"
#include "../sys/RenderSystem.h"
#include "../util/util.h"

//////////////////////////////////////////////////////////////////
// man_game_init
//
//
// Returns: void.
//
void man_game_init(u8 x, u8 y, u8 w, u8 h){
    man_board_create();
    man_board_init(x, y, w, h);
    
    // Clean up Screen filling them up with 0's
    clearScreen(BG_COLOR);
    
    man_player_init();
    man_player_createPlayer(0,0,"David\0",100);
    man_player_createPlayer(7,7,"Malo1\0",100);
    man_player_set_active(0,YES);
    man_player_set_update(0,YES);
    sys_input_init();
    //winape_breakpoint(33);
    sys_render_init(man_player_get_player_list(), man_board_get_board());
}


//////////////////////////////////////////////////////////////////
// man_game_render
//
//
// Returns: void.
//
void man_game_render(){
    sys_render_update(YES);
    while (1){
        sys_input_update();
        sys_render_update(NO);
    }
}