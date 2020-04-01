#ifndef _TMATCH_H_
#define _TMATCH_H_

#include <cpctelera.h>

typedef enum { HORIZONTAL, VERTICAL } EDirection;
typedef enum { NORTH, SOUTH, EAST, WEST } ECardinal;

typedef struct {
    u8 x,y;
    EDirection direction;
    u8 count;
    u8 tile;
} TMatch;

typedef TMatch TMatchList[10];

#endif