#include <cpctelera.h>
#include "../defines.h"
#include "../sprites/tiles.h"
#include "../cmp/TBoard.h"

//Manager Variables
u8* const tiles[9] = { sp_tiles_0, sp_tiles_1, sp_tiles_2, sp_tiles_3, sp_tiles_4, sp_tiles_5, sp_tiles_6, sp_tiles_7, sp_tiles_8 };
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
// man_board_update
//
//
// Returns: void.
//
void man_board_update(){

}

//////////////////////////////////////////////////////////////////
// man_board_render
//
//
// Returns: void.
//
void man_board_render(){
    u8 i,j;
    u8* vmem;
    if (board.updated = YES){
    	for (j=0; j<board.height; j++){
    	    for (i=0; i<board.width; i++){
    	        vmem = cpct_getScreenPtr (CPCT_VMEM_START, board.x + (i*5), board.y + (j*13));
    	        //cpct_drawSpriteMaskedAlignedTable(tiles[board.cells[i][j]], vmem, SP_TILES_0_W, SP_TILES_0_H, g_tablatrans);
    	        if (board.cells[j][i]!=255){
					cpct_drawSpriteBlended(vmem, SP_TILES_0_H, SP_TILES_0_W, tiles[board.cells[j][i]]); // Faster Sprites with XOR
				} else {
					cpct_drawSolidBox (vmem, 0, SP_TILES_0_W, SP_TILES_0_H);	
				}
    	    }
    	}
		board.updated = NO;
	}
}