AGSScriptModule    SSH Lets you set some walkable areas as downhills, and assign Z values to walkable areas and walkbehinds, to let characters walk away from camera while actually increasing their Y value Downhill 1.03 #  // Main script for module 'Downhill'

bool enabled;
//int wa=-1;
int waon[AGS_MAX_CHARACTERS];


int zorderwa[DOWNHILL_MAX_AREAS];
int zorderwb[DOWNHILL_MAX_AREAS];
int zordertop[DOWNHILL_MAX_AREAS];

bool wa[DOWNHILL_MAX_AREAS];
int maxyy[DOWNHILL_MAX_AREAS];
int diffy[DOWNHILL_MAX_AREAS];
int minsc[DOWNHILL_MAX_AREAS];
int diffsc[DOWNHILL_MAX_AREAS];
int maxwb;

struct flipsprites {
	int ups[AGS_MAX_FRAMES_PER_LOOP];
	int downs[AGS_MAX_FRAMES_PER_LOOP];
};

flipsprites flipsprite[AGS_MAX_CHARACTERS];

function IsDownhill(int walkable, int miny, int maxy, int mins, int maxs) {
   enabled=true;
   wa[walkable]=true;
   // precalculate ratios here, and ensure min/max correct
   if (miny<maxy) {
     maxyy[walkable]=maxy;
     diffy[walkable]=maxy-miny;
   } else {
     maxyy[walkable]=miny;
     diffy[walkable]=miny-maxy;
   }
   if (mins<maxs) {
     minsc[walkable]=mins;
     diffsc[walkable]=maxs-mins;
   } else {
     minsc[walkable]=maxs;
     diffsc[walkable]=mins-maxs;
   }

}
export IsDownhill;



function SetWalkBehindZ(int walkbehind, int z, int top) {
  enabled=true;
  if (walkbehind>maxwb) maxwb=walkbehind;
  zorderwb[walkbehind]=z;
  zordertop[walkbehind]=top;
  SetWalkBehindBase(walkbehind, top);
}

function SetWalkableZ(int walkable, int z) {
  enabled=true;
  zorderwa[walkable]=z;
}

export SetWalkBehindZ,  SetWalkableZ;

function get_updown (Character *who) {
  if (Game.GetLoopCountForView(who.View)<4) return;
  int i=0;
  int frames=Game.GetFrameCountForLoop(who.View, 0);
  int uframes=Game.GetFrameCountForLoop(who.View, 3);
  while (i<frames) {
    // loop 0 down, loop 3 up
		ViewFrame *down=Game.GetViewFrame(who.View, 0, i);
		flipsprite[who.ID].downs[i]=down.Graphic;
		if (i<uframes) {
			ViewFrame *up=Game.GetViewFrame(who.View, 3, i);
			flipsprite[who.ID].ups[i]=up.Graphic;
		}
		i++;
  }
}

function on_event(EventType event, int data) {
  // Reset on leave room
  if (event==eEventEnterRoomBeforeFadein) {
    int i=0;
	  while (i<Game.CharacterCount) {
	    get_updown(character[i]);
	    i++;
	  }
	} else if (event==eEventLeaveRoom) {
	  enabled=false;
	  maxwb=0;
	  // restore scaling for all characters
	  int i=0;
	  while (i<Game.CharacterCount) {
	    if (character[i].Room==player.Room) {
				character[i].ManualScaling=false;
				character[i].Baseline=0;
			}
	    i++;
	  }
	}
}


function flip_me(Character *who, bool normal) {
  // only works if up and down have same number of frames
  if (Game.GetLoopCountForView(who.View)<4) return;
  int i=0;
  int frames=Game.GetFrameCountForLoop(who.View, 0);
  while (i<frames) {
    // loop 0 down, loop 3 up
		ViewFrame *down=Game.GetViewFrame(who.View, 0, i);
		ViewFrame *up=Game.GetViewFrame(who.View, 3, i);
		
		if (normal) {
		  down.Graphic=flipsprite[who.ID].downs[i];
		  up.Graphic=flipsprite[who.ID].ups[i];
		} else {
		  down.Graphic=flipsprite[who.ID].ups[i];
		  up.Graphic=flipsprite[who.ID].downs[i];
		}
    i++;
	}
}

function rep_ex_char (Character *who) {
  if (who.Room!=player.Room || !who.on) return;
  int now=GetWalkableAreaAt(who.x-GetViewportX(), who.y-GetViewportY());
  // Being on no walkable messes things up, and can happen briefly...
  if (now==0) return;
  
  // Walkbehinds
  int nowz=zorderwa[now];
  if (nowz>0) {
    int miny=who.y;
    int i=1;
    while (i<=maxwb) {
      if (nowz<zorderwb[i] && miny>zordertop[i]) {
        miny=zordertop[i];
			}
			i++;
		}
    who.Baseline=miny-1;
  } else {
    who.Baseline=0;
  }


  // Scaling
	if (wa[now] && diffy[now]>0) {
    who.ManualScaling=true;
    who.Scaling=minsc[now]+(((maxyy[now]-who.y)*diffsc[now])/diffy[now]);
	  
	} else {
    who.ManualScaling=true;
    who.Scaling=GetScalingAt(who.x, who.y);
	}

  // Flipping
  if (wa[now]) {
    
    if (waon[who.ID]!=now && !wa[waon[who.ID]]) {
      flip_me(who, false);
    }
  } else {
    if (wa[waon[who.ID]] && waon[who.ID]!=now) {
      flip_me(who, true);
		}
	}
	
	// Update record of last walkable area
  waon[who.ID]=now;
}  

function repeatedly_execute_always() {
  if (enabled) {
    int i=0;
    while (i<Game.CharacterCount) {
      rep_ex_char(character[i]);
      i++;
		}
  }
}

function game_start() {
  System.VSync=1;
}
 u  // Script header for module 'Downhill'
//
// Author: Andrew MacCormack (SSH)
//   Please use the messaging function on the AGS forums to contact
//   me about problems with this module
// 
// Abstract: Lets you set some walkable areas as downhills,
//           and assign Z values to walkable areas and 
//           walkbehinds, to let characters walk away from 
//           camera while actually increasing their Y.
//
// Dependencies:
//
//   AGS 2.72 or later
//
// Functions:
//
//  function IsDownhill(int walkable, optional int miny, optional int maxy, 
//                      optional int mins, optional int maxs)
//		
//		Marks the specified walkable area as being downhill, which means that the 
//    up/down frames of characters will be flipped when they are on it. If the
//    optional parameters are given, then continuous scaling will be used on that
//    walkable area, too, except the normal scaling direction is reversed. The
//    top and bottom y co-ordinates of the walkable area must be specified if
//    scaling is to be used. If the scaling arguments are not given, characters
//    will use the walkable area's own scaling.
//
//  function SetWalkBehindZ(int walkbehind, int z, int top);
//  function SetWalkableZ(int walkable, int z);
//
//		All walkbehinds and walkable areas involved in the "hills" must be given a 
//    Z-order. Any that are not given a Z-order will be in front of all of them.
//    The higher the z, the fruther to the front it is, and the top argument for
//    walkbehinds specifies the y-coordinate of the top of the walkbehind.
//
// Configuration:
//
//  The above functions must be called in the "Player Enters Room (Before Fadein)"
//  interaction script for any room with downhill areas.
//
//  DOWNHILL_MAX_AREAS is set to the maximum number of walkable or walkbehind 
//  areas that the module can handle
//
// Example:
//
//  function room_a() {
//    //script for Room: Player enters room (before fadein)
//    IsDownhill(2, 126, 154, 80, 100);
//    IsDownhill(4,  88,  117, 60, 70);
//    SetWalkableZ(2, 8);
//    SetWalkableZ(3, 8);
//    SetWalkableZ(4, 6);
//    SetWalkableZ(5, 6);
//    SetWalkBehindZ(1, 9, 126);
//    SetWalkBehindZ(2, 7, 88);
//  }
//
// Caveats:
//
//
// Revision History:
//
// 28 Nov 06: v1.0  First release of Downhill module
// 28 Nov 06: v1.01 Fixed a couple of bugs
// 29 Nov 06: v1.02 reset character baselines when leaving room
// 16 Feb 07: v1.03 Fixed problems when some characters have fewer loops
//
// Licence:
//
//   Downhill AGS script module
//   Copyright (C) 2006 Andrew MacCormack
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

#define DOWNHILL_MAX_AREAS 40

import function IsDownhill(int walkable, int miny=-1, int maxy=-1, int mins=-1, int maxs=-1);
import function SetWalkBehindZ(int walkbehind, int z, int top);
import function SetWalkableZ(int walkable, int z);
 N;1        ej��