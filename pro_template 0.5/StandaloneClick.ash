// Standalone Click
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
  
  //return true if there was a mouse click (down then up), on anything, even nothing,
  //with mouse button 'm'
  import static bool ClickDetected(MouseButton m);
  
  //call this in the 'repeatedly_execute_always' of your module to 
  //know what button just got clicked.
  // The value of this function makes sense ONLY if ClickDetected is true
 //WARNING: it consumes the click by default!
  import static GUIControl* GetClick(MouseButton m,  bool consumeClick=false);

 
  
  //call this in the 'repeatedly_execute_always' of your module to 
  //know what control is currently being hovered
  import static GUIControl* GetHovered();

  //call this in the 'repeatedly_execute_always' of your module to 
  //know the Description of the control currently being hovered
  import static String GetHoveredText();
  
};
