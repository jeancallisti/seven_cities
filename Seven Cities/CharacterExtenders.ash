
//the functions below do almost the same thing:
//they make Indy say the DEFAULT unsuccessful result for every kind of
//interaction, depending on the object type (gizmo, heavy object, etc.)
//he was trying to interact with.
//The only difference is whether or not he faces a direction, an object, etc.

//Formerly player.DoStandard2
import void Unhandled_FaceDirection(EnumDirections direction,  eObjectType objectType);
//Formerly player.DoStandard3
import void Unhandled_FaceObject(Object* obj,  eObjectType objectType);
//Formerly player.DoStandard4
import void Unhandled_FaceLocation(int x,  int y,  eObjectType objectType);