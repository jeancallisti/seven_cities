
enum ObjectTypes {
  eGizmo, //use this type for all objects that could be picked up but Indy just doesn't need them
  eHeavy,  //use this type for objects that are too heavy to pickup/push/pull
  eCharacter
};

//the three functions below do almost the same thing:
//they make Indy say the DEFAULT unsuccessful result for every kind of
//interaction, depending on the object type (gizmo, heavy object, etc.)
//he was trying to interact with.
//The only difference is whether or not he faces a direction, an object, etc.
import function DoStandard(this Character*,  ObjectTypes objectType);
import function DoStandard2(this Character*,  EnumDirections direction,  ObjectTypes objectType);
import function DoStandard3(this Character*,  Object* obj,  ObjectTypes objectType);
import function DoStandard4(this Character*,  int x,  int y,  ObjectTypes objectType);



import function WontWork(); //This will generate a random "that won't work" sentence and make Indy say it.
import function WontGive(); //This will generate a random "I won't give it" sentence and make Indy say it.