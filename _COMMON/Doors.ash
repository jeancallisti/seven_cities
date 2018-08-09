



enum DoorStates {
  eDoorOpen, 
  eDoorClosed
};

struct Doors {
  

  import static void OnEnterRoom(); //Call this in the 'Room_load' function of the room, if the player came in through a door
  
  import static void DefaultReaction_WalkFirst(Object* door,  CursorMode mode); //if the player uses mode 'mode' on door 'door', then the character walks there first, and afterwards triggers default behaviour and sentence on that door
  import static void DefaultReaction_DontWalk (Object* door,  CursorMode mode); //if the player uses mode 'mode' on door 'door', then the character immediately triggers default behaviour and sentence on that door, without walking there first
  
  import static void WalkAndFace(Object* door);//indy walks to the door and faces it
  //import static void CustomReaction_DontWalk(int doorId,  CursorMode mode,  String customStence);//if the player uses mode 'mode' on door 'doorId', then the character immediately says the custom sentence on that door, without walking there first
  
  import static bool IsOpen(Object* door); //tells you if the door is currently open or closed

  import static void Open_Mute(Object* door); //updates all the variables required when a door is open, but just doesn't play a sound or move the character
  import static void Close_Mute(Object* door); //updates all the variables required when a door is closed, but just doesn't play a sound or move the character

  import static bool IsModeOpen(Object* door,  CursorMode mode); //returns true if the current mouse cursor is equivalent to "open". That means: 1) The cursor mode IS actually eModeOpen, OR 2) If the mode is eModeUse AND the door is closed
};

//gives you the direction the character is supposed to face when he faces that door
import EnumDirections door_dirFacingDoor(this Object*);


//same as Character.ChageRoom, but computes automatically the coordinates of arrival and the direction the character must face
import function ChangeRoom_ThroughDoor(this Character*,  Object* door);
