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
#include <stdio.h>
#include "defines.h"
#include "keyboard/keyboard.h"
#include "text/text.h"
#include "util/util.h"
#include "man/GameManager.h"
#include "sprites/frameset_m1.h"
#include "sprites/tiles.h"

const u8 sp_palette0[16] = {
    0x54, // 0 - 00 - black
    0x4b, // 1 - 26 - white
    0x4c, // 2 - 06 - bright red
    0x55, // 3 - 02 - bright blue
    0x4d, // 4 - 08 - bright magenta
    0x40, // 5 - 13 - white(gray)
    0x5c, // 6 - 03 - red
    0x4e, // 7 - 15 - orange
    0x4A, // 8 - 24 - bright yellow
    0x52, // 9 - 18 - bright green
    0x56, // 10 - 09 - green
    0x5e, // 11 - 12 - yellow (pale green)
    0x53, // 12 - 20 - bright cyan
    0x5f, // 13 - 14 - pastel blue
    0x58, // 14 - 04 - magenta
    0x44, // 15 - 01 - blue
};        // Regular palette

const u8 sp_palette1[4] = {
    0x54,   // 0 - 00 - black
    0x4b,   // 15 - 26 - white
    0x4c,   // 4 - 06 - bright red
    0x55,   // 12 - 02 - bright blue
};          // Mode 1 palette

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
    g_nInterrupt++;
    if (g_nInterrupt == 1){
            cpct_scanKeyboard();
    }else if (g_nInterrupt == 4){
        //cpct_setVideoMode(1);
        //cpct_setPalette(sp_palette1, 4);
    }else if (g_nInterrupt == 6){
        //cpct_setVideoMode(0);
        //cpct_setPalette(sp_palette0, 16);
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
    showMessage("GEMQUEST3 IS LOADED!!", MESSAGE);

    seed = i_time;
    // Random seed may never be 0, so check first and add 1 if it was 0
    if (!seed)
        seed++;
    cpct_srand(seed);

    // Initilize Keys
    initKeys(SINGLE); 
}

void mode1Scren(){
    u8 i;
    u8* pvideo;
        //cpct_drawSolidBox((u8*) 0xc000,3,10,199);
    for (i=0;i<20;i++){
        pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 4*i, 141);
        cpct_drawSprite (g_frameset_m1_00, pvideo, 1, 5);
        cpct_drawSprite (g_frameset_m1_01, pvideo+1, 1, 5);
        cpct_drawSprite (g_frameset_m1_02, pvideo+2, 1, 5);
        cpct_drawSprite (g_frameset_m1_03, pvideo+3, 1, 5);
    }
    for (i=0;i<10;i++){
        pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 0, 146+(i*5));
        cpct_drawSprite (g_frameset_m1_04, pvideo, 1, 5);
                                   
        pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 79, 146+(i*5));
        cpct_drawSprite (g_frameset_m1_05, pvideo, 1, 5);
    }
    for (i=0;i<20;i++){
        pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 4*i, 194);
        cpct_drawSprite (g_frameset_m1_06, pvideo, 1, 5);
        cpct_drawSprite (g_frameset_m1_07, pvideo+1, 1, 5);
        cpct_drawSprite (g_frameset_m1_08, pvideo+2, 1, 5);
        cpct_drawSprite (g_frameset_m1_09, pvideo+3, 1, 5);
    }
    drawTextM1("PLAYER 1", 1, 161, COLORTXTM1_WHITE, DOUBLEHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 10, 147, COLORTXTM1_WHITE, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 10, 156, COLORTXTM1_RED, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 10, 165, COLORTXTM1_BLUE, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 10, 174, COLORTXTM1_WHITE, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 10, 183, COLORTXTM1_WHITE, NORMALHEIGHT, OPAQUE);
    drawTextM1("PLAYER 2", 70, 161, COLORTXTM1_RED, DOUBLEHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 41, 147, COLORTXTM1_WHITE, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 41, 156, COLORTXTM1_RED, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 41, 165, COLORTXTM1_BLUE, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 41, 174, COLORTXTM1_WHITE, NORMALHEIGHT, OPAQUE);
    drawTextM1("0123456789 - ABCDEFGHI", 41, 183, COLORTXTM1_WHITE, NORMALHEIGHT, OPAQUE);
}

void drawSpell(u8* name, u8 x, u8 y, u8 r, u8 g, u8 l, u8 b){
    u8* pvideo;
    u8 aux_txt[3];
    
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
    cpct_drawSolidBox(pvideo,cpct_px2byteM0(5,5),11,10);
    drawText(name, x, y+1, COLORTXT_WHITE, NORMALHEIGHT, TRANSPARENT);
    //Red
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+11, y);
    cpct_drawSolidBox(pvideo,cpct_px2byteM0(2,2),2,10);
    if (r){
        sprintf(aux_txt,"%d",r);
        drawText(aux_txt, x+11, y+1, COLORTXT_WHITE, NORMALHEIGHT, TRANSPARENT);
    }
    //Green
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+13, y);
    cpct_drawSolidBox(pvideo,cpct_px2byteM0(9,9),2,10);
    if (g){
        sprintf(aux_txt,"%d",g);
        drawText(aux_txt, x+13, y+1, COLORTXT_WHITE, NORMALHEIGHT, TRANSPARENT);
    }
    //Yellow
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+15, y);
    cpct_drawSolidBox(pvideo,cpct_px2byteM0(8,8),2,10);
    if (l){
        sprintf(aux_txt,"%d",l);
        drawText(aux_txt, x+15, y+1, COLORTXT_WHITE, NORMALHEIGHT, TRANSPARENT);
    }
    //Blue
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+17, y);
    cpct_drawSolidBox(pvideo,cpct_px2byteM0(3,3),2,10);
    if (b){ 
        sprintf(aux_txt,"%d",b);
        drawText(aux_txt, x+17, y+1, COLORTXT_WHITE, NORMALHEIGHT, TRANSPARENT);
    }
}

void mode0Screen(u8* name, u8 x, u8 y){
    u8* pvideo;
    
    drawText(name, x, y, COLORTXTM1_WHITE, DOUBLEHEIGHT, OPAQUE);
    drawText("00", x+20, y, COLORTXT_YELLOW, DOUBLEHEIGHT, OPAQUE);
    
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y+20);
    cpct_drawSprite(sp_tiles_0, pvideo, SP_TILES_0_W, SP_TILES_0_H);
    drawText("00", x, y+34, COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+5, y+20);
    cpct_drawSprite(sp_tiles_1, pvideo, SP_TILES_0_W, SP_TILES_0_H);
    drawText("00", x+5, y+34, COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+10, y+20);
    cpct_drawSprite(sp_tiles_2, pvideo, SP_TILES_0_W, SP_TILES_0_H);
    drawText("00", x+10, y+34, COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+15, y+20);
    cpct_drawSprite(sp_tiles_3, pvideo, SP_TILES_0_W, SP_TILES_0_H);
    drawText("00", x+15, y+34, COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
    pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+20, y+20);
    cpct_drawSprite(sp_tiles_4, pvideo, SP_TILES_0_W, SP_TILES_0_H);
    drawText("00", x+20, y+34, COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
}

void main(void) {

    // Relocate the stack right before the Video Memory
    cpct_setStackLocation(NEW_STACK_LOCATION);
    // Disable Firmware
    cpct_disableFirmware();
    // Change the interruptions table
    cpct_waitVSYNC();
    cpct_waitHalts(1);
    cpct_setInterruptHandler((void*) myInterruptHandler);

    //Initialization
    initMain();
    man_game_init(20,20,8,8);
    
    mode0Screen("PLAYER",1,130);
    drawSpell("IGNIT\0",0,175,1,2,0,4);
    drawSpell("STAB\0",20,175,0,4,0,0);
    drawSpell("DRAIN\0",0,185,2,4,0,0);
    drawSpell("STUN\0",20,185,0,0,3,1);
    
    mode0Screen("ENEMY",40,130);
    drawSpell("IGNIT\0",40,175,1,2,0,4);
    drawSpell("STAB\0",60,175,0,4,0,0);
    drawSpell("DRAIN\0",40,185,2,4,0,0);
    drawSpell("STUN\0",60,185,0,0,3,1);
    
    // Loop forever
    while (1){
    // Update input
        man_game_render();
    }
}
