#ifndef _TBOARD_H_
#define _TBOARD_H_

#include <cpctelera.h>

typedef struct {
    u8 x,y;
    u8 animstep;
    u8 active;
} TCell;

typedef struct {
    u8 cells[12][12];
    u8 width, height;
    u8 x,y;
    TCell activeCell;
} TBoard;

#endif
