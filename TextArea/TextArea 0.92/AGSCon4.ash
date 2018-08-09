// Script header for module 'AGSConsole2'


//#define CONSOLE_MAX 100
enum MoreEvents {
  eEventSaveGame = 10, 
  eEventStartDialog = 11
};
enum ConState {
  eConsoleDebug = 0, 
  eConsoleOn, 
  eConsoleOff
};
struct ConDets{
  String ToParse;
  import function LogInput(String Input);
  import function LogKeypress(int Keycode);
  import function LogEvent(EventType event, int data);
  import function LogMouse(MouseButton button);
  import function RunCommand(String text);
  import function RunScript(String fileName);
  import void EnableSockets(); //call this to notify that the sockets plugin is allowed
  import void EnableShortcut(bool enable); //call this with 'true' if you want CtrlC to show/hide the console
  
  //functions to be bound with the GUI
  import function ShowHide();
  import function SetState(ConState OnOff);
  import function ScrollUp();
  import function ScrollDown();
  import function LogConsole(String text);
  import function Help_OnClick();
  import function Variables_OnClick();
  import function Scripts_OnClick();
  import function HiddenActivation(int step); //call this function if step 1 or 2 for the hidden activation of the console have been met.
                                              //When step 2 is met (and if the game is not in a cutscene), then the console is shown.

  
};
import ConDets AGSConsole;
import function StartDialog(this Dialog*);
import function SaveConsole(int Slot, String Description);
import function GetTextBox(TextBox*txtbox);

import void AddItem_Safe(ListBox* lst,  String item);

#define MAX_LISTBOX_ITEMS 200 //this is an AGS built-in limit in 3.2.1. Might be removed from AGS 3.0 onwoards


