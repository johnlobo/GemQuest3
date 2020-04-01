#ifndef _BOARD_H_
#define _BOARD_H_

#include <cpctelera.h>

void man_board_create();
void man_board_init(u8 x, u8 y, u8 width, u8 height);
void man_board_update();
void man_board_render();

#endif