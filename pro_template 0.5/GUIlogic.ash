/*
enum PauseType {
  ePause_Player, //the player has hit the key to pause (space bar, whatnot)
  ePause_Menu, //the player has called the game menu (load, save, etc.)
  ePause_Debug //the game is paused to display the debug interface.
};
*/

struct GUIlogic {

    import static void InitializeGUI();  
    import static void HighlightActionButton(CursorMode cursor );
    
    import static void UpdateStatusBar();
    
    import static void TitleMenu_Show(); //shows the "title menu" screen (with Indy's closeup), whatever room we're in.
    import static void TitleMenu_Hide(); //hides the "title menu" screen 
    

    import static void Pause(bool silent=false); //shows the pause bar (is silent is false) and real-pauses the game
    import static void UnPause();
    
    //This is a stronger pause that only the debug interface should unpause
    import static void DebugPause(); 
    import static void DebugUnPause();
    import static bool IsDebugPaused();
    
    
    /*
    import static void ControlMenu_Show(); //(see also: 'EnterMenu') shows our little "menu" popup. Doesn't manage the game state, the controls or anything
    import static void ControlMenu_Hide(); 
    
    import static void EnterControlMenu(); //calls the  menu (load, save, etc.). Does more than 'ControlMenu_Show'. Not the same as  "TitleMenu_Show" !
    import static void ExitControlMenu();
    */
    
    import static void HandleSpaceBar();  // Custom function - Must be called in 'repeatedly execute always'
                                          // to make sure that a 'spacebar' hit is not understood as 
                                          //'skip dialog', but instead as 'pause/unpause'.
                                          
    import static bool IsInSpecialRoom(); //returns true if the game is currently showing the splash screen or the main menu screen or any room where we don't want access to "load", "save", etc.
};

struct PlayerUI { //all the in-game ui: icon bar, inventory, etc.
  
    import static void DisableAndHide();
    import static void EnableAndShow();
    import static void Hide();
    import static void Show();
    import static void Disable();
    import static void Enable();
    
    import static void SaveState();  //saves the state of the player's ui : is it currently visible? enabled? etc.
    import static void RestoreState(); //restores the player's ui as it was when PlayerUI_SaveState got called
      
};

struct TitleMenu {
   import static void Quit_OnClick(); 
   import static void Load_OnClick(); 
   import static void NewGame_OnClick(); 
};

struct CheckpointsGui {
   import static void Show();
   import static void Hide();
   import static void OnButtonClick();
   import static void OnNoMusicClick();
};

struct CustomInventory {
   import static void Init(); 
   import static void ScrollUp(); 
   import static void ScrollDown();
   import static void OnMouseClick(MouseButton button); //to be called in global script's on_mouse_click 
   
};

struct ControlPanel {
   import static void Enter();
   import static void Exit();
   import static void Save_OnClick(); 
   import static void Load_OnClick(); 
   import static void Resume_OnClick();
   import static void Menu_OnClick();
   import static void Exit_OnClick();
   
};


struct CustomLoad {

    import static void ManageTimer();
    
    import static void Show();
    import static void OnSelectionChange(GUIControl *control);
    import static void Load_OnClick();
    import static void Done_OnClick();
   
};


struct CustomSave {
    import static void Show();
    import static void OnSelectionChange(GUIControl *control);
    import static void Save_OnClick();
    import static void Done_OnClick();
};

struct Disclaimer {
  import static void Tickbox_OnClick();
  import static void Proceed_OnClick();
  import static bool readIni(); //reads in the ini file if we should show the disclaimer, and returns true if yes
  import static void saveIni();
  import static bool shouldShowDisclamer(); //returns true if we should show the disclaimer. You must call readIni at least once before

  
};


