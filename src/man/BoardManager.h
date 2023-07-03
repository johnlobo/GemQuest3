#ifndef _BOARD_MANAGER_H_
#define _BOARD_MANAGER_H_

#include <cpctelera.h>
#include "../cmp/TBoard.h"

void man_board_create();
void man_board_init(u8 x, u8 y, u8 width, u8 height);
TBoard* man_board_get_board();
u8 man_board_get_width();
u8 man_board_get_height();
void man_board_update();

#endif