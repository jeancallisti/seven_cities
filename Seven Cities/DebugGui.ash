struct DebugGui {
  //shows or hides the button completely (not the same as ShowHide)
  import static void ShowDebugButton();
  import static void HideDebugButton();
  
  //import static void Expand();
  //import static void Reduce();
  import static void ShowHide(); //expands or reduces
  
  import static bool IsExpanded();
  import static bool IsReduced();
  
  import static void CheckTestersName(); //it checks if the tester's name has been entered. If not, asks for it
  
};


struct DebugToolTip {
  import static void SetControls(Button* b);
  
};

#define BUG int

enum BugType {
  eBugType_GameBlockingBug, 
  eBugType_MissingInteraction, 
  eBugType_BadTranslation, 
  eBugType_GraphicalGlitch
 
};

enum BugSort {
  eBugSort_byUid, 
  eBugSort_byType
};

struct Bug {
  
  import static BUG NewBug(BugType type);
  import static BUG Find(int ID); //finds the bug's index in the bugs list, based on its unique ID
  import static int GetID(BUG bug); //gets the bug's unique ID
  import static void DeleteBug(BUG bug);
  import static void Sort(BugSort sort);
  import static void SetText(BUG bug,  String txt);
  import static void SaveAsXML();
  import static void LoadFromXML();
};

