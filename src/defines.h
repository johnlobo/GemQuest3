#ifndef _DEFINES_H_
#define _DEFINES_H_

#include <cpctelera.h>
#include "keyboard/keyboard.h"

// Program Stack locations
#define NEW_STACK_LOCATION (void*)0x100
#define NUM_COLORS 6

// Pointers to the hardware backbuffer, placed in bank 1
// of the memory (0x8000-0xBFFF)
#define SCR_VMEM (u8 *)0xC000
#define SCR_BUFF (u8 *)0x8000

//Boolean
#define YES 1
#define NO 0

//Font Size
#define FONT_H 5
#define FONT_W 2
//Text
#define COLORTXT_WHITE 0
#define COLORTXT_YELLOW 1
#define COLORTXT_ORANGE 2
#define COLORTXT_BLUE 3
#define COLORTXT_RED 4
#define COLORTXT_MAUVE 5

#define TRANSPARENT 1
#define OPAQUE 0

#define NORMALHEIGHT 1
#define DOUBLEHEIGHT 2

// ShowMessage types
#define MESSAGE 0
#define YESNO 1
#define NUMBER 2
#define TEMPORAL 3

// Colors
#define BG_COLOR 0

//Players
#define PLAYER1 0
#define PLAYER2 1
#define PLAYER1_VS 2
#define PLAYER2_VS 3

#define SINGLE 0
#define VS 1

//Math
#define min(X, Y) ((X) < (Y) ? (X) : (Y))
#define max(X, Y) (X > Y ? X : Y)

// Relocatable variables
extern __at(0xa8DC) TKeys keys1; //size: 0x1f
extern __at(0xa92b) TKeys keys2; //size: 0x1f
extern __at(0xb000) u8 *screenBuffer0; //size: 0xe10

// Declare am_tablatrans, which is defined in game.c, and used in more places
cpctm_declareMaskTable(g_tablatrans);

#endif