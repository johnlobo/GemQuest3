#ifndef _BOARD_H_
#define _BOARD_H_

#include <cpctelera.h>
#include "../cmp/TBoard.h"

void man_board_create();
void man_board_init(u8 x, u8 y, u8 width, u8 height);
TBoard* man_board_get_board();
void man_board_update();

#endif