/*
//#define MIRROR int
enum MirrorsSymetries{
  MIRROR_HORIZ, //the mirror is a plane facing the gamer
  MIRROR_VERTIC //the mirror is turned 90° from the gamer's viewpoint
};

#define LOOP_DOWN  0
#define LOOP_LEFT  1
#define LOOP_RIGHT 2
#define LOOP_UP    3

struct Mirrors 
{
 
  //Declares a new mirror in the current room.
  //This must be done only once in the entire game (in "first time enters room")
  // It still has to be enabled afterwards to be visible.
  // 'mirror' is the object containing the sprite used as the mask
  // 'center' is a marker. The center of its sprite (width/2, height/2) should be where the player would stand (his feet coordinates) if he was glued to the mirror ;)
  // 'symetry' is one of the symetries in the enum above
  // 'x_offset' and 'y_offset' allow to shit the reflection by a constant number of pixels
  // 'opacity' must be in 0.0, 1.0. Note: if the mirror's opcaity is 1.0 then it's fully opaque, therefore there's NO reflection!
  import static void NewMirror2( Object* mirror, Object* center, Region* reg,  MirrorsSymetries symetry,  float opacity,  int x_offset=0,  int y_offset=0, int imperfections=0);

  //That doesn't delete the mirrors in memory (which is done automaticaly). It just disables them so that they're not rendered
  import static void DisableAllMirrors();
  
  //Enables all mirrors in THIS room if they've been previously declared with 'NewMirror'
  import static void EnableAllMirrorsInRoom();
  
  //Enables one mirror selectively
  import static void EnableMirror (Object* mirror);
};
*/
