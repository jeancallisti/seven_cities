//
//   TextArea module 0.91
//
//   Author: The "Indiana Jones and the Seven Cities of Gold" development team.
//   Please use the messaging function on the AGS forums to contact
//   "Monsieur Ouxx" about problems with this module.
//
//   Credits: This was originally based on the "TextArea 0.0.1.1" module 
//            by monkey_05_06
// 
//
// Abstract: Provides a multi-line textbox, that we call "Text Area". 
//           It provides the typing comfort expected from modern text areas:
//           - type text. Long lines get wrapped automatically.
//           - Create new lines with the "Return" key
//           - move cursor up, down, left, right using arrow keys.
//           - use "backspace" and "del" to delete text before or after cursor
//           - click in the text area to move the cursor with the mouse
//           - click inside the text area or outside of it to give or remove focus
//
//  Extra feature:
//           - deals with Western-European characters, not only 128-char ascii.
//             (see function "Init" for full details)
//
// Note: Copy and Paste are planned but not implemented yet.
//
// Dependencies:
//
//   AGS 3.2.1 or later
//   MODULES:
//    String Utility
//    Standalone Click
//    More GUI Controls
//
//  HOW TO USE
//
//
//
//
//  KNOWN BUGS:
//  - Calling SetFocus before the Listbox got rendered at least once causes a violent 
//    engine crash (that's easily worked around. See the description of SetFocus for 
//    more details).
//  - Moving cursor up or down with the arrow keys in a line that got wrapped causes
//    the blinking cursor to be rendred in the wrong place. The text is still typed
//    in the right place. Lousy work around 1: press return at the end of each line ;)
//    Work around 2: reposition cursor with the mouse.
//  - Moving cursor up and down with the arrow keys is not very accurate. I used a
//    simple heuristic to calculate its position, but it can be off. Not really a problem.
//
//  TODO:
//  - Implement Copy and Paste. All the placeholders are here.
//  - Fix the inaccuracy of "up" and "down" cursor moves (see above)




#define TEXTAREA int //a fake type for text areas



//#define MAX_TEXTAREA_ROWS 200 //no more than 200 lines of text in a textarea

enum TextArea_Settings {
  eTextArea_MaxAreas = 10, //maximum number fo text areas you may use in your entire game
  eTextArea_MaxRows = 200 //the maximum number fo rows you can have in a text area
};

enum TextArea_CharSet {
  eTextArea_AngloSaxonOnly = 0, 
  eTextArea_WesternEurope = 1
};

struct TextAreas {
  
  // You must call Init to create a text area.
  // You need two things : 1) a Listbox (that's the actual text area), and 2) a Label
  // belonging to the SAME gui.
  // The label must be reserved for your text area. It uses the Label to render the 
  // blinking cursor.
  //
  // charset:
  //  - If 'charset' is set to 'eTextArea_WesternEurope', then all special characters 
  //    are rendered "as is", provided the font has them.
  // - If 'charset' is set to 'eTextArea_AngloSaxonOnly', then all special characters 
  //   are forbidden. If the user types one of them, it gets converted to the strict
  //   Ascii version (e.g. 'ù' or 'ü' get converted to just 'u')
  //
  // Returns the ID of the text area, that you can then use: TextAreas[myID].Function();
  //
  import static TEXTAREA Init(ListBox* lstBox,  Label* cursor,  TextArea_CharSet charset);

  // (optional) set additional buttons : cut, copy, paste.
  // you can also set a label where help and additional info will be displayed and
  // an "About" button. (if null, the Label and the Button will be ignored)
  import static void SetAdditionalControls(TEXTAREA ta,  Button* bCut,  Button* bCopy,  Button* bPaste,  Label* lStatus=0,  Button* bAbout=0);
  
  // Sets the focus on the text area -- so that the user can type in it (otherwise 
  // he can't). Note: The "cut, copy, paste" and "about" buttons are shown  only 
  // if the TA has the focus. The rest of the time they're hidden.
  //
  // WARNING: because of a bug in AGS (see details in function "GetRowHeight" in 
  // this module), calling this function could cause a game crash.
  // The best place to call it is in any function that allows blocking functions 
  // (i.e. NOT in 'game_start' or similar restrictive functions). There, do this :
  //
  // gMyGuiThatContainTheTextArea.Visible= true; //make the gui visible FIRST
  // Wait(1); //Then, WAIT ONE CYCLE to be sure the ListBox got rendered
  // TextAreas[myTextArea].SetFocus(); //Only then, use SetFocus
  //
  import static void SetFocus(TEXTAREA ta);

  //key strokes don't go into the text area anymore
  import static void RemoveFocus(TEXTAREA ta);

  //focus is removed, border is grayed, and user cannot ype text into the text area
  import static void Disable(TEXTAREA ta);

  //focus is not given (has to be done manually), but user may type into the text area
  import static void Enable(TEXTAREA ta);
  
  import static bool IsEnabled(TEXTAREA ta);

  //returns the cursor's current column in the text area. WARNING: first column is numbered "1"  
  import static int GetColumn(TEXTAREA ta); 
  
  //return's the cursor's current row in the text area. WARNING: first row is numbered "1"
  import static int GetRow(TEXTAREA ta); 
    
  //gets the position of the cursor int he entire text, including hidden characters
  import static int GetCursorPosition(TEXTAREA ta); 
  
  //sets the text in the text area, puts the cursor at the very beginning, and re-renders it
  import static void SetText(TEXTAREA ta, String txt); 
  
  import static String GetText(TEXTAREA ta); 
  


  
  ///////////// utility functions /////////
  
  //tells the height (in pixels) of a row in the text area.
  // if riskyMethod is true, this method is more universal but can
  //     violently crash the engine if the methid is called before
  //     the first rendering of the textarea's listbox
  // if riskymethod is false, then the function is more stable but
  //     relies on a hack of the AGS engine to calculate the height:
  //     it uses built-in string ""
  import static int GetRowHeight(TEXTAREA ta, bool riskyMethod = false);
  
 
};



