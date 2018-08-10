// Script header for module 'Downhill'
//
// Author: Andrew MacCormack (SSH)
//   Please use the messaging function on the AGS forums to contact
//   me about problems with this module
//
//  Update to 1.04 (AGS 3.3.x) : monsieur ouxx. All code modifications are labelled "[added by monsieur ouxx]"
// 
// Abstract: Lets you set some walkable areas as downhills,
//           and assign Z values to walkable areas and 
//           walkbehinds, to let characters walk away from 
//           camera while actually increasing their Y.
//
// Dependencies:
//
//   AGS 2.72 or later. Tested in 3.3.0 RC1.
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

struct DownHill {//[added by monsieur ouxx for version 1.04]
  import static function MakeDownhill(int walkable, int miny=-1, int maxy=-1, int mins=-1, int maxs=-1);
  import static function SetWalkBehindZ(int walkbehind, int z, int top);
  import static function SetWalkableZ(int walkable, int z);
};
