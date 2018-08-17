// Script header for module 'WeatherModule'
// Author: Dirk Kreyenberg (Abstauber)
//   Please use the PM function on the AGS forums to contact
//   me about problems with this module
// 
// Abstract: A weather module for lot's of environmental effects
//           based on Akumayo's Weathermodule
//
// Dependencies:
//
//   AGS 3.0 or Later
//
// Functions:
// 	 
// function RandomBoundries(int min, int max)
//  Interal, generates random numbers in given boundries 
//  (originally from the advanced randoms module)
//
// function Init(int spritecount, int x_offset = 50, int y_offset = 50)
//  Call this one first
//    spritecount: number of sprites you want to have, maximum value is 20, thou something
//    lower is suggested.
//    x_offset,y_offset: displacement between the single sprites
//
// function SetSprite(int slot, int sprite)
//  Use this to set the different sprites, eg. raindrops.
//
// function SetOffset(int x_offset, int y_offset);
//  Modifiy the offset during runtime (the offset you've defined at Init)
//
// function SetBorders(int x_min, int x_max, int y_top, int y_bottom)
//  Modify the area, in which the effect should happen)
//
// function Start(int envfallingspeed = 1, int envwindspeed = 0, bool pixel_only = false,  
//                int x_jitter = false, int y_jitter = false, 
//                int x_min = 0,  int x_max = 320, int y_top = -100, int y_bottom = 200)
//
//  Start the weather effect. Don't worry, it looks more complicated as it is:
//  e.g WeatherModule.Start() works too, all parameters are optional.
//
//  envfallingspeed: The falling speed of the sprites, negative and positive values are fine
//  envwindspeed: windspeed. Negative and positves are ok.
//  pixel_only: if this is set to TRUE, the engine draws single pixels with the given color in
//              SetSprite
//  x_jitter: some variations on the x-axis
//  y_jitter: some variations on the y-axis
//  x_min,x_max,y_top,y_bottom: Define the area in which the effect should appear
//
// function Stop();
// Ends the weathereffect  
//
// function SetPause()
//   Sets the effect on hold but waits, until all sprites have disappeared
//
// function SetWindspeed(int envwindspeed); 
//   Modify the windspeed at runtime
//
// function SetFallingspeed(int envfallingspeed); 
//   Modify the falling speed at runtime
//
// function IsWeatherGoing();
//  Returns true, if the effect is running
//
// function GetSpriteCount();
//   returns the number of used sprites
//
// Configuration;
//
// Just add the following in your room script:
//
// WeatherModule.Init(16); // Setup 16 sprites
// WeatherModule.Start(4, 1); Starts with falling speed 4 and windspeed 1
//
// This results in rain composed of single blue pixels, 16 raindrops at a time
// Look at the demo for more examples :-)
//
// SSHs random wind function:
//
// add a global var called wind.
//
//   function room_b() {
//     // Room script: repeatedly execute
//     if (IsTimerExpired(1)) {
//       if (Random(1)) { if (wind<6) wind++; else wind=1; }
//       else { if (wind>-6) wind--; else wind=-1; }
//		   WeatherModule.SetWindspeed(wind);
//       SetTimer(1, 40);
//     }
//   }
//
// To start the random wind, call: SetTimer(1, 1);
//
// Revision history:
//
// v2.00  Initial version
//
// Licence:
//
//   SimpleSnow AGS script module
//   Copyright (C) 2006 Akumayo, 2008 Abstauber
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to 
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
struct WeatherModule {
  import int RandomBoundries(int min, int max);   
  import static function Init(int spritecount, int x_offset = 50, int y_offset = 50);
  import static function SetSprite(int slot, int sprite);
  import static function SetOffset(int x_offset, int y_offset);
  import static function SetBorders(int x_min, int x_max, int y_top, int y_bottom);
  import static function Start(int envfallingspeed = 1, int envwindspeed = 0, bool pixel_only = false,  int x_jitter = false, int y_jitter = false, 
                        int x_min = 0,  int x_max = 320, int y_top = -100, int y_bottom = 200);
  import static function Stop();
  import static function SetPause();
  import static function SetWindspeed(int envwindspeed); 
  import static function SetFallingspeed(int envfallingspeed); 
  import static bool IsWeatherGoing();
  import static int GetSpriteCount();
  
  bool weathergoing;
  bool pixel_only;
  bool pause;
  int fallingspeed;
  int windspeed;
  int x_jitter;
  int y_jitter;
  
  int y_top;
  int y_bottom;
  int x_min;
  int x_max;
  
  int x_offset;
  int y_offset;
  int spritecount;
 
};

  DynamicSprite* Weather_sprites[];
  Overlay* Weather_enveffect[];
  int Weather_slots[];

