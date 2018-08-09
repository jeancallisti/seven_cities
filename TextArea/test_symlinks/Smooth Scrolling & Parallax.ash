/*
//////////////////////////////////////
//Smooth Scrolling + Parallax Module//
//////////////////////////////////////
//
// Abstract: A module designed to make the screen scroll 
// smoothly as the player character moves around. It can
// also move room objects to create a parallax effect.
// The module is intended to be platform and resolution 
// independent.
//
// Module version 1.7
// by Alasdair Beckett, based on code by Steve McCrea.
//
//
////////////////////////
//Required Properties://
////////////////////////
//
// Before starting, you must create the following properties 
// in AGS. 
//
// NOTE: You must do this even if you do not plan to use
//  the parallax effect. It doesn't take long, but I'm sorry 
//  all the same.
//
// PxPos:
//
//  Name: PxPos
//  Description: Stores an object's parallax position
//  Type: Number
//  Default Value: 0
//
// PxView:
//
//  Name: PxView
//  Description: Stores the pixel-adjustment view number
//  Type: Number
//  Default Value: 0
//
// PxLoop:
//
//  Name: PxLoop
//  Description: Stores the pixel-adjustment loop number
//  Type: Number
//  Default Value: 0
//
//
/////////////////////////////////
//Creating the Parallax Effect://
/////////////////////////////////
//
// To create a simple parallax effect, alter an object's 
// PxPos property. Positive values will place it in the 
// foreground, while negative values will place it in the
// background. See below for more detail:
//
// 7   = Foreground (300% Scrolling Speed)
// 6   = Foreground (250% Scrolling Speed)
// 5   = Foreground (200% Scrolling Speed)
// 4   = Foreground (150% Scrolling Speed)
// 3   = Foreground (Scrolling Speed)
// 2   = Foreground (50% Scrolling Speed)
// 1   = Foreground (25% Scrolling Speed)
//
// 0   = No Parallax Effect (default)
//
// -1  = Background (25% Scrolling Speed)
// -2  = Background (50% Scrolling Speed)
// -3  = Background (Scrolling Speed) - Moon & sun etc.
// -4  = Background (150% Scrolling Speed) Lens flares etc.
// -5 = Background (200% Scrolling Speed) Lens flare etc.
// -6- = Background (250% Scrolling Speed) Lens flare etc.
// -7- = Background (300% Scrolling Speed) Lens flare etc.
//
// If you want to make subtle adjustments to the speeds
// you can alter the values in the module script, but 
// objects with PxPos 0 must remain uneffected by parallax.
//
//
/////////////////////
//About Functions: //
/////////////////////
//
// function SmoothScroll_PxOn()
//  Makes all parallax objects invisible. 
//  NOTE: Call this to allow users to switch the effect
//   off on slow computers.
//
// function SmoothScroll_PxOff()
//  Makes the parallax objects visible again.
//
// function SmoothScroll_StopScroll()
//  Waits until the screen has stopped moving before 
//  allowing the game to continue.
//  NOTE: Call before running dialogue sequences. Also, 
//   if you are using Sierra Style speech, Dualnames 
//   reports that it is necessary to call this function 
//   in a hotspot script if the player walks to the hotspot 
//   before speaking.
//
// function SmoothScroll_ScrollingOff()
//  Turns the scrolling effect off.
//  NOTE: The parallax effect looks much nicer with smooth 
//   scrolling, but this might be useful if your game uses 
//   keyboard control.
//
// function SmoothScroll_ScrollingOn()
//  Turns the scrolling effect back on.
//
//
/////////////////////
//About Variables: //
/////////////////////
//
// NOTE: Treat these as read-only. To switch effect on 
//  and off use the functions above.
//
// bool SmoothScroll_ScrollStatus;
//  True if scrolling is on, false if scrolling is off.
//
// bool SmoothScroll_PxStatus;
//  True if parallax is on, false if parallax is off.
// 
//
////////////////////////////
//For old versions of AGS://
////////////////////////////
// I haven't tested the module in versions earlier than 3.2.
// Old versions of AGS didn't allow pixel perfect scrolling
// above 320x240. So you can use the following hack (or just 
// use an up-to-date version of AGS).
//
// It is possible to smooth the motion of objects with
// a PxPos of 2, 1, -1 and -2 (objects that move slower 
// than the scrolling speed). For this to work you must 
// create four versions of the object graphic.
//
// Version 1: the original image.
// Version 2: The image moved 1 pixel to the right.
// Version 3: The image moved 1 pixel down.
// Version 4: The image moved 1 pixel down and 1 pixel right.
//
// Arrange the four sprites as frames 0-3 of one loop of
// a view. Then alter the PxView and PxLoop values of the 
// object to the view & loop number containing the object's 
// images.
//
// NOTE: This smoothing technique will prevent you from
//  animating the object in question. Objects that must
//  be animated cannot currently be smoothed.
//
//
/////////////////////////////////
//Conflicts With Verbcoin GUIs://
//////////////////////////////////
//
// This module can cause problems with verb coin GUIs, 
// including Electroshokker's module which comes with AGS.
//
// This is because it is possible for the screen to scroll 
// between the time in which a player clicks on a hotspot
// and the time that the verbcoin appears.
//
// To get round the problem you need to alter the verbcoin
// script so that it monitors the difference between the 
// Viewport's X and Y positions when the player clicks and
// when the verbcoin appears, and then use that information
// in relation to the current mouse position to work out
// where the player clicked originally in terms of the room.
//
// I can't keep be more specific about how to alter the script, 
// because Electroshokker's module is regularly updated and my 
// advice would end up being out of date. If you PM me on the 
// AGS forums I'll send you the modified version which I am 
// currently working with.
//
//
//////////////////
//Module History//
//////////////////
//
// v1.7 - Added targetCharacter pointer to make camera animation 
//        possible without switching player characters.
//
// v1.6 - Added LucasArts style scrolling triggered by proximity 
//        to the edge of the screen.
//
// v1.5 - Fixed a major problem with objects not returning to the
//        correct position when leaving and re-entering a room.
//
// v1.4 - Cleaned up script and improved suspension of scrolling 
//        effect.
//        Added this module history!
//
// v1.3 - Added option to switch smooth scrolling off and on.
//
// v1.2 - A wider range of parrallax speeds.
//        Less jerky stopping.
//        Pixel perfect object movement at slow speeds (not for 
//        animated objects, requires a bit of work).
//        Up to 25 parrallax objects.
//        Smooth sun/moon parrallax.
//        LENS FLARE EFFECT!
//
// v1.1 - Formatted module according to AGS programming conventions.
//
//
////////////
//License://
////////////
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation 
// files (the "Software"), to deal in the Software without 
// restriction, including without limitation the rights to use, 
// copy, modify, merge, publish, distribute, sublicense, and/or 
// sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following 
// conditions:
//
// The above copyright notice and this permission notice shall be 
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
// OTHER DEALINGS IN THE SOFTWARE.

import function SmoothScroll_StopScroll();
import function SmoothScroll_PxOn();
import function SmoothScroll_PxOff();
import function SmoothScroll_ScrollingOn();
import function SmoothScroll_ScrollingOff();
import function SmoothScroll_Centre();
import bool SmoothScroll_PxStatus;
import bool SmoothScroll_ScrollStatus;

//Function below added by Monsieur OUXX
import void SmoothScroll_SetTargetCharacter(Character* targetChar);

//Line below removed by Monsieur OUXX
//import Character *targetCharacter;

import float customScrollSpeedX;
import float customScrollSpeedY;
import float slowDownRangeX;
import float slowDownRangeY;
*/
