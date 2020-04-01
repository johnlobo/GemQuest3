//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include "defines.h"
#include "keyboard/keyboard.h"
#include "text/text.h"
#include "util/util.h"
#include "man/GameManager.h"

const u8 sp_palette0[16] = {
    0x54, // 0 - black
    0x4d, // 1 - bright magenta
    0x40, // 2 - white(gray)
    0x5c, // 3 - red
    0x4c, // 4 - bright red
    0x4e, // 5 - orange
    0x4A, // 6 - bright yellow
    0x52, // 7 - bright green
    0x56, // 8 - green
    0x5e, // 9 - yellow (pale green)
    0x53, // 10 - bright cyan
    0x5f, // 11 - pastel blue
    0x55, // 12 - bright blue
    0x58, // 13 - magenta
    0x44, // 14 - blue
    0x4b  // 15 - white
};        // Regular palette

//Global Variables
u8 g_nInterrupt; // Manage Interrupt
u32 i_time;

// Máscara de transparencia
cpctm_createTransparentMaskTable(g_tablatrans, 0x200, M0, 0);

// Relocated variables
__at(0xa8DC) TKeys keys1; //size: 0x1f
__at(0xa92b) TKeys keys2; //size: 0x1f
__at(0xb000) u8 *screenBuffer0; //size: 0xe10

// ********************************************************************************
// <summary>
// myInterruptHandler
// Interruphandler that subsitutes the default one. Includes calls for reading the keyboard and playing music, if activated
// Returns:
// void
// </summary>
// <created>johnlobo,21/08/2019</created>
// <changed>johnlobo,21/08/2019</changed>
// ********************************************************************************
void myInterruptHandler()
{
    i_time++;

    if (++g_nInterrupt == 6)
    {
        cpct_scanKeyboard();
        g_nInterrupt = 0;
    }
}

void initMain()
{
    u32 seed; // Value to initialize the random seed

    // Sets Video mode 0
    cpct_setBlendMode(CPCT_BLEND_XOR);
    cpct_setVideoMode(0);
    cpct_setPalette(sp_palette0, 16);
    cpct_setBorder(HW_BLACK);
    // Clean up Screen filling them up with 0's
    clearScreen(BG_COLOR);

    // Shows Press any key message to initializate the random seed
    //drawWindow(10, 60, 60, 60, 15, 14); // 15 = white; 0 blue
    //drawText("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 20, 77, COLORTXT_WHITE, DOUBLEHEIGHT, TRANSPARENT);
    //drawText("PRESS ANY KEY TO CONTINUE", 15, 102, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
    showMessage("GEMQUEST3 IS LOADED!!", MESSAGE);

    seed = i_time;
    // Random seed may never be 0, so check first and add 1 if it was 0
    if (!seed)
        seed++;
    cpct_srand(seed);

    // Initilize Keys
    initKeys(SINGLE); 
}

void main(void) {
    // Relocate the stack right before the Video Memory
    cpct_setStackLocation(NEW_STACK_LOCATION);
    // Disable Firmware
    cpct_disableFirmware();
    // Change the interruptions table
    cpct_setInterruptHandler((void*) myInterruptHandler);

    //Initialization
    initMain();
    man_game_init();

    // Loop forever
    man_game_update();
    man_game_render();
    while (1){

    }
}
