#include <cpctelera.h>
#include "../defines.h"
#include "../cmp/TBoard.h"
#include "../cmp/TMatch.h"
#include "../man/MatchManager.h"

TBoard board;

//////////////////////////////////////////////////////////////////
// man_board_init
//
// Initializes the board to 255
//
// Returns: void.
//
//
void man_board_create(){
    u8 i,j;
    
    for (j=0; j<12; j++){
        for (i=0; i<12; i++){
            board.cells[j][i] = 255;
        }
    }
}

//////////////////////////////////////////////////////////////////
// man_board_init
//
//
// Returns: void.
//
void man_board_init(u8 x, u8 y, u8 width, u8 height){
    u8 i,j;
	
	board.width = width;
    board.height = height;
	board.x = x;
	board.y = y;
	board.activeCell.active = 0;
	
    for (j=0; j<board.width; j++){
        for (i=0; i<board.height; i++){
            board.cells[j][i] = (cpct_rand8() % NUM_COLORS);
        }
	board.updated = YES;
    }
    //destroyMatches(cpct_rand8() % 3); //Destroys the matches found except a random number between 0 and 2
	//printBoard();
	//cleanBoard();
}

//////////////////////////////////////////////////////////////////
// man_board_get_board
//
//
// Returns: void.
//
TBoard* man_board_get_board(){
	return &board;
}

//////////////////////////////////////////////////////////////////
// man_board_get_board
//
//
// Returns: void.
//
u8 man_board_get_width(){
    return board.width;
}

//////////////////////////////////////////////////////////////////
// man_board_get_board
//
//
// Returns: void.
//
u8 man_board_get_height(){
    return board.height;
}

//////////////////////////////////////////////////////////////////
// man_board_update
//
//
// Returns: void.
//
void man_board_update(){

}

//////////////////////////////////////////////////////////////////
// man_board_get_matches
//
//
// Returns: void.
//
void man_board_get_matches(){
    u8 i, j;
    u8 acum;
    TMatch aux_match;

    for (j=0;j<board.height;j++){
        acum = 1;
        aux_match.direction = HORIZONTAL;
        aux_match.x = i;
        aux_match.y = j;
        for (i=0;i<(board.width-1);i++){
            if ((i==board.width-2) && acum<2) break;
            if (board.cells[j][i] == board.cells[j][i+1]){
                acum++;
            }else{
                if (acum > 2){
                    // there is a match
                    aux_match.count = acum;

                }   
                acum = 1;
            }
        }
    }

}