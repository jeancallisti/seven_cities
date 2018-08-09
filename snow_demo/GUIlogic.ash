struct GUIlogic {
    import static void InitializeGUI();  
    import static void HighlightActionButton(CursorMode cursor );
    
    import static void UpdateStatusBar();
    
    import static void MainMenu_Show(); //shows the "main menu" screen (with Indy's closeup), whatever room we're in.
    import static void MainMenu_Hide(); //hides the "main menu" screen 
    
    import static void PlayerUI_DisableAndHide();
    import static void PlayerUI_EnableAndShow();
    import static void PlayerUI_Disable();
    import static void PlayerUI_Enable();    
    
    import static void EnterPause(); //calls the pause bar and pauses the game
    import static void ExitPause();
    /*
    import static void ControlMenu_Show(); //(see also: 'EnterMenu') shows our little "menu" popup. Doesn't manage the game state, the controls or anything
    import static void ControlMenu_Hide(); 
    
    import static void EnterControlMenu(); //calls the  menu (load, save, etc.). Does more than 'ControlMenu_Show'. Not the same as  "MainMenu_Show" !
    import static void ExitControlMenu();
    */
    
    import static void HandleSpaceBar();  // Custom function - Must be called in 'repeatedly execute always'
                                          // to make sure that a 'spacebar' hit is not understood as 
                                          //'skip dialog', but instead as 'pause/unpause'.
                                          
    import static bool IsMainMenuOrSplashscreen(); //returns true if the game is currently showing the splash screen or the main menu screen
};


struct DebugGUI {
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



