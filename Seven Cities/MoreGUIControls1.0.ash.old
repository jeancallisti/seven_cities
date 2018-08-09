


////////////////////////////////////////////////////////
//
//    RADIO BUTTONS
//
///////////////////////////////////////////////////////


struct RadioButton {
  import static void Reset();
  import static void BindChoice(int i,  Button* c);
  import static void SetChoice(int i);
  import static int  GetChoice();
  import static void SetGraphics(int spriteOff,  int spriteHovered,  int spriteOn);
};




////////////////////////////////////////////////////////
//
//    SAFE OVERLAYS
//
///////////////////////////////////////////////////////


// Provides ways of managing overlays safely (no crash when calling 'Remove' twice, etc.)
// This manages only one overlay at a time.
// This is mostly useful for cutscenes with overlays like "meanwhile...", etc. if you
// want to avoid a human mistakes when managing the "EndCutscene" and the "Remove"
struct Overlay_Safe {
  //creates the overlay from a sprite 
  import static void CreateGraphical(int x,  int y,  int slot,  bool transparent);
  
  //removes the overlay
  import static void Remove();
};




////////////////////////////////////////////////////////
//
//    ADVANCED LISTBOXES
//
///////////////////////////////////////////////////////


//adds some features to listboxes : 
// - handles properly adding items if the max number of entries is exceeded
// - truncates entries to fit in the listbox's width
// - a "cool tip" follows the mouse to show more info about the entry

#define MAXADVLISTBOX 5 //how many advanced listboxes at most

import void SetCoolTip(this ListBox*,  Label* coolTip); //do this only once. The label used must be on the same gui
import void SetCoolTipText(this ListBox*,  String text);

import void ClearEntries_All(this ListBox*);
import void AddEntry(this ListBox*,  String shortVersion,  String longVersion);

//appends 'str' to the last item (entry) of the ListBox
import void AppendToLastItem(this ListBox*,  String str);
//returns true if 'txt', when rendered in the listbox's font, fits in it (in width)
import bool FitsInListBox(this ListBox*,  String txt);

import int GetRowHeight_risky(this ListBox* );
import int GetRowHeight_safe(this ListBox* );

