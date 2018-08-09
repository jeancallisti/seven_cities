//#define MIRROR int


//note that those can be combined, binary-style
enum Mirrors_Symmetries{
  eSymmetryHoriz = 1, //the mirror is a plane facing the gamer
  eSymmetryVertic = 2,  //the mirror is turned 90° from the gamer's viewpoint
  eSymmetryUpDown = 4, 
  eSymmetryNone = 8 //this leaves the sprite as-is but uses the "substitute character" (useful for upside-down mirrors)
};


//hard-coded utility values, to map the views' standard loops
enum Mirrors_LoopsIndices {
  eLoopDown = 0, 
  eLoopLeft = 1, 
  eLoopRight = 2, 
  eLoopUp = 3
};


struct Mirrors2
{
 
  //tells the module that character "c" can be used as a mirror reflection.
  //Call this function at least once (i.e. give the module at least one character)
  //otherwise it can't work!
  //You should call this function as many times as there are mirrors in the room
  // that has the most mirrors.
  //For example if there are two mirrors in a room, and if that is the room
  //of your game that has the most mirrors, then call this function twice.
  //(with two different characters!).
  import static void AddMirrorChar(Character* c); 
  
  //Declares a new mirror in the current room. The player MUST be in that room when NewMirror is called!
  // This must be done only ONCE in the entire game (in "first time enters room")
  // The mirror starts disabled. It has to be enabled (using script) afterwards to be visible.
  //
  // 'mirror' is the object containing the sprite used as the mask.
  // 'center' is a marker. The center of its sprite (width/2, height/2) should be where the player would stand (his feet coordinates) if he was glued to the mirror ;)
  // 'symetry' is one of the symetries in the enum above
  // 'x_offset' and 'y_offset' allow to shit the reflection by a constant number of pixels
  // 'opacity' must be in 0.0, 1.0. Note: if the mirror's opcaity is 1.0 then it's fully opaque, therefore there's NO reflection!
  // 'distance_attenuation' (recommended value '60.0'): if the player stands 0 pixels away from the mirror, his reflection will appear fully opaque. If he's standing 'distance_attenuation' pixels away from the mirror (or more), his reflection will be fully transparent
  import static void NewMirror( Object* mask,  //set to null if no mask
                                Object* center, 
                                Region* reg,   //set to null if mirror always on
                                Mirrors_Symmetries symmetry,  
                                float opacity,  
                                float distance_attenuation,  
                                int x_offset=0,  
                                int y_offset=0);

  //Tells the module that this mirror should use an entirely
  //different character altogether as the reflection, instead of computing 
  //the reflection.
  //That character should use Views that have the same number of loops and frames
  //as the player character.
  import static void SetSubstituteCharacter(Object* mask,  Character* c);
  
  //To modify the offset you've set in NewMirror
  import static void SetOffset(Object* mask, int x_offset,  int y_offset);
  
  //To modify the opacity you've set in NewMirror
  import static void SetOpacity(Object* mask, float opacity);
  
  //That doesn't delete the mirrors in memory (which is done automaticaly). It just disables them so that they're not rendered
  import static void DisableAllMirrors();
  
  //Enables all mirrors in THIS room if they've been previously declared with 'NewMirror'
  import static void EnableAllMirrorsInRoom();
  
  //Enables one mirror selectively
  import static void EnableMirror (Object* mirror);
  
  
  
};