//-----------------------------LICENSE NOTICE------------------------------------
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

#ifndef _TEXT_H_
#define _TEXT_H_

#include <cpctelera.h>

u8 strLength(u8 str[]);
void strCopy(u8 *source, u8 *destination);
void drawText(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent);
void drawTextM1(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent);

#endif