//-----------------------------LICENSE NOTICE------------------------------------
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
#include "../defines.h"
#include "util.h"
#include "../keyboard/keyboard.h"
#include "../text/text.h"

//////////////////////////////////////////////////////////////////
// clearScreen
//
//
//
// Returns:
//    void
//

void clearScreen(u8 bgColor)
{
	// Clear Screen
	cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(bgColor, bgColor), 0x4000);
}

/////////////////////////////////////////////////////////////////
// drawWindow
//
//
//
// Returns:
//    void
//
void drawWindow(u8 x, u8 y, u8 width, u8 height, u8 fgColor, u8 bgColor)
{
	u8 *pvideo;

	// top and bottom fgColor horizontal lines
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, fgColor), width - 4, 2);
	// top and bottom BG_COLOR horizontal lines
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 2);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + height - 2);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, BG_COLOR), width - 4, 2);
	// Internal box
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + 1, y + 4);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(bgColor, bgColor), width - 4, height - 6);

	// top left corner
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 2);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);

	// left vertical line
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + 4);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, height - 6);

	//bottom left corner
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y + height - 2);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, 2);
	// top right corner
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 2);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
	// right vertical line
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + 4);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(BG_COLOR, fgColor), 1, height - 6);
	// bottom right corner
	pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x + width - 3, y + height - 2);
	cpct_drawSolidBox(pvideo, cpct_px2byteM0(fgColor, BG_COLOR), 1, 2);
}



/////////////////////////////////////////////////////////////////
// updateNumber
//
//
// Returns:
//    void
void updateNumber(u8 number)
{
	u8 *pvmem;
	u8 text[3];

	pvmem = cpct_getScreenPtr(SCR_VMEM, 58, 80);
	cpct_drawSolidBox(pvmem, cpct_px2byteM0(14, 14), 8, 14);
	sprintf(text, "%02d", number);
	drawText(text, 58, 80, COLORTXT_YELLOW, DOUBLEHEIGHT, TRANSPARENT);
}

/////////////////////////////////////////////////////////////////
// resultNumber
//
//
// Returns:
//    void

u8 resultNumber()
{
	u8 selection;

	selection = 1;
	drawText("UP/DOWN:CHANGE LEVEL", 16, 92, COLORTXT_MAUVE, NORMALHEIGHT, TRANSPARENT);
	drawText("FIRE: CONFIRM", 16, 104, COLORTXT_MAUVE, NORMALHEIGHT, TRANSPARENT);
	updateNumber(selection);
	while (1)
	{
		//delay(20);
		cpct_waitHalts(20);
		if ((cpct_isKeyPressed(keys1.up)) || (cpct_isKeyPressed(keys1.j_up)))
		{
			selection++;
			if (selection > 17)
				selection = 1;
			updateNumber(selection);
		}
		else if ((cpct_isKeyPressed(keys1.down)) || (cpct_isKeyPressed(keys1.j_down)))
		{
			selection--;
			if (selection < 1)
				selection = 17;
			updateNumber(selection);
		}
		if ((cpct_isKeyPressed(keys1.fire1)) || (cpct_isKeyPressed(keys1.j_fire1)) || (cpct_isKeyPressed(keys1.j_fire2)))
		{
			return selection;
		}
	}
}

/////////////////////////////////////////////////////////////////
// resultYesNo
//
//
// Returns:
//    void
u8 resultYesNo()
{
	drawText("(YES/NO)", 32, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);

	while (1)
	{
		if ((cpct_isKeyPressed(Key_Y)) || (cpct_isKeyPressed(Key_N)))
		{
			return (cpct_isKeyPressed(Key_Y));
			break;
		}
	}
}

/////////////////////////////////////////////////////////////////
// showMessage
//
//
// Returns:
//    void
u8 showMessage(u8 *message, u8 type)
{
	u8 messageLength;
	u8 defaultMax;
	u8 x, y, w, h;
	u8 *pvmem;
	u8 result;

	if (type == NUMBER)
		defaultMax = 56;
	else 
		defaultMax = 26;

	messageLength = strLength(message);
	w = max(((messageLength * 2) + 7), defaultMax);
	h = 60;
	x = ((80 - w) / 2+1);
	y = 58;

	//Capture the portion of screen that will overwrite the message
	pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	//cpc_GetSp((u8 *)0xb000, h, w, pvmem); 
	
	// Memory assignment to change to make it work in wincpctelera
	
	cpct_getScreenToSprite(pvmem, (u8*) &screenBuffer0, w, h);
	//cpct_getScreenToSprite(pvmem, wincpct_getMemory((void*)0xb000), w, h);

	drawWindow(x, y, w, h - 2, 1, 15);
	drawText(message, x + 3, y + 12, COLORTXT_WHITE, DOUBLEHEIGHT, TRANSPARENT);

	// If it's a question I'll wait Y/N... otherwise any key
	if (type == YESNO)
	{
		result = resultYesNo();
	}
	else if (type == NUMBER)
	{
		result = resultNumber();
	} else if (type == TEMPORAL){
		cpct_waitHalts(100);
		result = YES;
	}
	else
	{
		drawText("PRESS A KEY", 29, 96, COLORTXT_YELLOW, NORMALHEIGHT, TRANSPARENT);
		result = YES;
		wait4OneKey();
	}

	//Restore the portion of screen overwrited the message
	cpct_drawSprite((u8 *)0xb000, pvmem, w, h);

	return result;
}
void drawCompressToScreen(u8 x, u8 y, u8 w, u8 h, u16 size, u8* comp_end, u8 trans){
	u8 *pvmem;

    pvmem = cpct_getScreenPtr(SCR_VMEM, x, y);
    cpct_zx7b_decrunch_s((u8*) &screenBuffer0 + size - 1, comp_end);
    if (trans)
    	cpct_drawSpriteMaskedAlignedTable(&screenBuffer0, pvmem, w, h, g_tablatrans);
	else 
		cpct_drawSprite(&screenBuffer0, pvmem, w, h);
}

// put error code in HL and make breakpoint for winape
void winape_breakpoint(u16 error_code) __z88dk_callee __naked {

    // get params from stack
    __asm__("pop iy");  // ret address first because __z88dk_callee convention
    __asm__("pop hl");
    __asm__("push iy"); // ret address last  because __z88dk_callee convention
    __asm__(".db 0xed, 0xff");

    __asm__("ret");
}