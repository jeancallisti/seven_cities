AGSScriptModule        ~  
struct ControlStruct {
  GUIControl* c;
  String desc; //description (useful for the hovering feature)
};

ControlStruct controls[MAX_STANDALONE_BUTTONS];
int nbStandaloneControls;

/*
enum MouseButton {
  eMouseLeft,         1
  eMouseRight,        2
  eMouseMiddle,       3
  eMouseLeftInv,      value not allowed in mouse.IsMouseDown
  eMouseMiddleInv,    value not allowed in mouse.IsMouseDown
  eMouseRightInv,     value not allowed in mouse.IsMouseDown
  eMouseWheelNorth,   value not allowed in mouse.IsMouseDown
  eMouseWheelSouth    value not allowed in mouse.IsMouseDown
};
*/
#define BUILTIN_MOUSE_BUTTONS 3 
GUIControl* controlHeldDuringLastGameCycle[BUILTIN_MOUSE_BUTTONS]; //the name is self-explanatory enough ;)
GUIControl* clicks[BUILTIN_MOUSE_BUTTONS]; //this contains all the controls that just got clicked (one for each mouse button)
GUIControl* hovered; //this contains the control currently being hovered



static void StandaloneClick::RegisterControl(GUIControl* c,  String description)
{
  if (description == null)
    description = "";
    
  controls[nbStandaloneControls].c = c;
  controls[nbStandaloneControls].desc = description;
  
  nbStandaloneControls++;
}
  
function Clear_HeldControl() {
    int m=eMouseLeft; //1
    while (m<=eMouseMiddle) {
      controlHeldDuringLastGameCycle[m-1]=null;
      m++;
    }
}

// iterates on all the standalone controls and finds the index in the 'controls' array 
// of the one given in parameterr
int FindControlID(GUIControl* c)
{
    int i=0;
    while (i<nbStandaloneControls) {
      if (c==controls[i].c)
        return i;
      i++;
    } 
    return -1;
}

 //call this to know what button just got clicked
 //WARNING: it consumes the click by default!
static GUIControl* StandaloneClick::GetClick(MouseButton m,  bool consumeClick)
{
  GUIControl* c = clicks[m-1];
  if (consumeClick)
    clicks[m-1]=null;
  return c;
}

static GUIControl* StandaloneClick::GetHovered()
{
  return hovered;
}

static String StandaloneClick::GetHoveredText()
{
  int id = FindControlID(hovered);
  if (id>=0)
    return controls[id].desc;
  return ""; //safety
}

void repeatedly_execute_always() 
{
  GUIControl* at_xy= GUIControl.GetAtScreenXY(mouse.x,  mouse.y);
  if (at_xy!=null) //the mouse is over something
  {
    int i=0;
    GUIControl* c = null;
    while (i<nbStandaloneControls) //find above which of our controls is the mouse
    {
      if (at_xy==controls[i].c) {
        c = at_xy;
        i=nbStandaloneControls; //exit loop
      }
      i++;
    }
    
    if (c==null) //the mouse is not over one of our registered buttons
    {
      Clear_HeldControl();
      hovered=null;
    }
    else //the mouse is over one of our registered controls
    {
      hovered = c;
      
      //// NOW WE PROCESS THE CLICKING ////
      
      int m=eMouseLeft; //1
      while (m<=eMouseMiddle) {//3
        if (mouse.IsButtonDown(m)) {
            if (controlHeldDuringLastGameCycle[m-1]!=null)  //A button was being held over a control
              if (controlHeldDuringLastGameCycle[m-1]!=c) { //...but it was a different one
                controlHeldDuringLastGameCycle[m-1]=null; //we cancel the click and will wait for a "real" one (starts and ends in the same control)
              }
              else //we keep holding the same button over the same control.
              {
                //do nothing
              }
            else
              controlHeldDuringLastGameCycle[m-1]=c;
        } else { //the mouse button is not being pressed
          if (controlHeldDuringLastGameCycle[m-1]!=null) { //We just released that button from that control!
            //Display(String.Format("click on %s", controls[FindControlID(c)].desc));
            controlHeldDuringLastGameCycle[m-1]=null;
            clicks[m-1] = c; //this contains all the controls that just got clicked (one for each mouse button)

          }
        }
        m++;
      }
    }
  } //if (c!=null)
  else //the mouse is not over a control (any control)
  {
      Clear_HeldControl();
      hovered=null;
  }
  
}
 4	  // Standalone Click
//
//  Author: the "Indiana Jones and the Seven Cities of Gold" dev team.
//
//  Contact: "monsieur ouxx" on the AGS forums
//
//  License: use it the way you like, in any game (even commercial), and you don't
//           need to credit us.
//
// This module is made to facilitate the processing of GUI clicks WITHOUT adding anything
// in the global script. Everything is handled in the module(s)'s repeatedly_execute_always,
// never using the action scripts attached to a GUI control via the global script.
//
// It makes easier and safer the export of standalone modules that rely on GUIs.
//
// HOW TO USE
// ----------
// 1) Create your very own module
// 2) Create your very own Gui, with any kind of control. For example: 
//      - a label called "MyLabel". You want to track the clicks on that one
//      - another label called "StatusLine" where you want displayed the control being hovered
// 3) In your module's initialization, add this :
//      StandaloneClick.RegisterControl(MyLabel,  "this is my label");    
// 4) In your module's repeatedly_execute_always(), add this: 
//        GUIControl* c = StandaloneClick.GetClick(eMouseLeft);
//        if (c==MyLabel)
//          Display("you clicked on MyLabel with the left mouse button");
//        StatusLine.Text = StandaloneClick.GetHoveredText();
//
// 5) Run the game. Click on your label, and move your mouse over it.
    
#define MAX_STANDALONE_BUTTONS 40 //how many buttons at most can be managed this way

struct StandaloneClick {
  //call this (once) when you'd like that button clicks to be managed
  //in the 'repeatedly_execute_always' of your module
  import static void RegisterControl(GUIControl* c,  String description = 0);
  
  //call this in the 'repeatedly_execute_always' of your module to 
  //know what button just got clicked
 //WARNING: it consumes the click by default!
  import static GUIControl* GetClick(MouseButton m,  bool consumeClick=true);
  
  //call this in the 'repeatedly_execute_always' of your module to 
  //know what control is currently being hovered
  import static GUIControl* GetHovered();

  //call this in the 'repeatedly_execute_always' of your module to 
  //know the Description of the control currently being hovered
  import static String GetHoveredText();
  
};
 &�N        ej��