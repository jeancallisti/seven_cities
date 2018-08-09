// Script header for module 'UltraVariables'
//
// Author: Andrew MacCormack (SSH)
//   Please use the messaging function on the AGS forums to contact
//   me about problems with this module
// Modifications: Monsieur Ouxx
//
// Abstract: Provides named global integers, timers, strings and a
//					 debug GUI for them
//
// Dependencies:
//
//   AGS 3.00 or later
//   The UltraVariables.GUF file that should be distributed with this module
//
// Functions:
//
//  Log(String str)
//    Appends a line of text at the end of the current log file.
//    IMPORANT: this function is slow, because it forces the writing to be immediately flushed in the file.
//    The only way to di this in AGS is to open and close the file each time
//
//  Timer.Set(String timer, int n, optional bool always);
//		This function sets the timer to the specified value,
//		given in game ticks. If always is set true, this counts
//		down in the repeatedly_execute_always, otherwise (default)
//		it counts down in repeatedly_execute. Note that even "always"
//		does not count during dialogs, and the default behaviour
//		is just liek normal AGS timers.
//
//  Timer.Sets(String timer, float n, optional bool always);
//		This function sets the timer to the specified value,
//		given in seconds.
//
//  Timer.Get(String timer);
//		This returns the current countdown value of the timer,
//		in game ticks. If no such timer exists, will return 0.
//
//  Timer.Done(String timer);
//		This returns true if the timer is finished, and will keep
//		returning true on future runs, until the timer is restarted.
//
//  Timer.Started(String timer);
//		This returns true if the timer has been started and has not
//		yet finished.
//
//  Timer.Expired(String timer);
//		This returns true if the timer is finished, and will 
//		only do so once, until the timer is restarted and counts
//		back down again.
//
//  Global.Set(String name, int n);
//		This sets the value of the named global.
//
//  Global.Get(String name);
//		This returns the current value of the named global. If 
//		no such global exists, will return 0.
//
//  Global.Inc(String name, optional int max);
//		This increments the named global and returns the new value.
//		If no such global existed before, it sets it to 1.
//    If the optional argument max is specified, and the variable reaches 
//    that number it will not increment any further
//
//  Global.Dec(String name);
//		This decrements the named global and returns the new value.
//		If no such global existed before, it sets it to -1.
//
//  Global.Add(String name, int n);
//		This adds the given number to the named global, and returns
//		the new value. If no such global existed before, it returns n.
//
//  Global.Sub(String name, int n);
//		This subtracts the given number from the named global, and returns
//		the new value. If no such global existed before, it returns -n.
//
//  Global.Alias(String name, int globalint);
//		This marks the named global as tracking the specified AGS Global 
//		Int number.
//
//  Global.Sets(String name, String s);
//		This sets a named global string, to the value given.
//
//  Global.Gets(String name);
//		This returns the value of the named global string, or
//		returns "" if no such string existed.
//
//  Global.Appends(String name, String s);
//		This appends the given string to the named global
//		string.
//
//  Global.Dump();
//    Dumps the current values of all UltraVariable variables and timers
//    into the current log file
// 
// Debug GUI:
//  The debug GUI is only enabled when AGS is in Debug mode.
//
//	Pressing Alt-D during a game brings up the Debug GUI.
//
//  Clicking the tabs let you browse the timers, globals, or AGS
//  globalints. 
// 
//	Dragging the "UltraVariables" logo lets you move the debug window.
//
//	Clicking the "x" lets you close the debug window. 
//
//  Pressing Alt-C toggles the clickability of the window
//
//  Pressing Alt-F creates a file with the current values of all variables
//   and timers called UltraVariables.dmp
//
//
// Configuration:
//
//  The ULTRAVARIABLES_MAX_GLOBALS #define below sets the number of Globals allowed
//  and the number of timers. Timers and Globals live in different name spaces.
//
// Example:
//
//  Timer.Set("OldManDistracted", 300);
//  ...
//  function oldman_interact() {
//    if (!Timer.Done("OldManDistracted")) { 
//			player.AddInventory(iWatch); 
//			Display("You managed to steal the old man's watch");
//			Global.Set("Criminal", 1);
//		}
//  }
//
// Caveats:
//
//	I want to add more debugging info to the GUI
//
// Revision History:
//
// 22 Dec 06: v1.0  First release of DeNGVaT module
// 10 Mar 08: v1.01 Fixed String insertion bug found by tolworthy
//  2 Jul 08: v1.10 Renamed to UltraVariables, moved to .GUF and improved 
//                   the Global.Inc to have an optional maximum + Dump
//
// Licence:
//
//   UltraVariables AGS script module
//   Copyright (C) 2006, 2008 Andrew MacCormack
//
// This module is licenced under the Creative Commons Attribution Share-alike
// licence, (see http://creativecommons.org/licenses/by-sa/2.5/scotland/ )
// which basically means do what you like as long as you credit me and don't
// start selling modified copies of this module.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.


#define ULTRAVARIABLES_MAX_GLOBALS  200


// Common underlying data structure
struct Globals {
  String last;
  int lasti;
  
  int count;
  String name[ULTRAVARIABLES_MAX_GLOBALS];
  int val[ULTRAVARIABLES_MAX_GLOBALS];
  int alias[ULTRAVARIABLES_MAX_GLOBALS];
  String str[ULTRAVARIABLES_MAX_GLOBALS];
  bool anyalias;
  
  import function find(String ss);
};

struct TimerUltra {
  import static function Set(String timer, int n, bool always=0);
  import static function Sets(String timer, float n, bool always=0);
  import static function Get(String timer);
  import static function Done(String timer);
  import static function Started(String timer);
  import static function Expired(String timer);
};

struct Global {
  import static function Set(String name, int n);
  import static function Get(String name);
  import static function Inc(String name, int max=32000);
  import static function Dec(String name);
  import static function Add(String name, int n);
  import static function Sub(String name, int n);
  import static function Alias(String name, int globalint);
  import static function Sets(String name, String s);
  import static String Gets(String name);
  import static String Appends(String name, String s);
  import static function Dump();
  import static function Log(String str); 
};

#ifdef DEBUG
#ifdef ULTRAVARIABLES
enum UltraVariablesTab { eUltraVariablesTabTimers=0, eUltraVariablesTabNamed, eUltraVariablesTabGlobals, eUltraVariablesTabStrings, eUltraVariablesTabOptions, eUltraVariablesTabAGSTimers };

struct UltraVariablesDbg {
  UltraVariablesTab Tab;
  //import function UltraVariables();
  import function Update();
  import function SwitchToTab(UltraVariablesTab Tab);
  import function ShowHideVariables();
  import function ScrollUp();
  import function ScrollDown();
};

import UltraVariablesDbg Dbg;
#endif
#endif

import Object *RoomObject(String name);


