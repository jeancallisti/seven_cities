enum CheckPointsEnum {
  eChckpnt_01_Disclaimer, 
  eChckpnt_02_MainMenu, 
  eChckpnt_03_IndysClassroom_chalkboardCutscene,
  eChckpnt_04_IndysClassroom_studentsPuzzle, 
  eChckpnt_05_IndysClassroom_studentsPuzzle2, 
  eChckpnt_06_BarnettCorridor, 
  eChckpnt_07_BarnettReadTelegram, 
  eChckpnt_07_BarnettOutside, 
  eChckpnt_08_TibetTop, 
  eChckpnt_09_MirrorsTests, 
  eChckpnt_10_NewClassRoom, 
  eChckpnt_11_NewChalkboard, 
  eChckpnt_12_FontsTests, 
  eChckpnt_13_SpainDigSite,
  eChckpnt_14_SpainTruckCutscene, 
  eChckpnt_15_TextArea, 
  eChckpnt_16_FoAcredits, 
  eChckpnt_17_RegularCredits, 
  eChckpnt_18_Mirrors2, 
  eChckpnt_19_Flagstaff_cave, 
  eChckpnt_20_SPAINcountryside, 
  eChckpnt_21_DEBUGiciclesTests, 
  eChckpnt_22_BarnettOutside, 
  eChckpnt_23_VENEZguardians, 
  eChckpnt_24_ParisCafeAndPhoneBooth, 
  eChckpnt_25_ConventIndise, 
  eChckpnt_26_ChurchRuins, 
  eChckpnt_27_ConventYard, 
  eChckpnt_28_SpainGeorgeTent, 
  eChckpnt_29_SpainOfficerTent,
  eChckpnt_30_FOACredits, //Same as eChckpnt_16_FoAcredits
  eChckpnt_31_Credits, 
  eChckpnt_32_NEWYORKSubmarineCutscene, 
  eChckpnt_33_GuiSettings, 
  eChckpnt_34_MexicoCrater, 
  eChckpnt_35_MexicoTest, 
  eChckpnt_36_BlackMarketDen, 
  eChckpnt_37_TibetIceCave, 
  eChckpnt_38_merchandise_lobby, 
  eChckpnt_39_13_07_CityOfGoldGeneralView, 
  eChckpnt_40_PARISCatacombWaterMazeShore, 
  eChckpnt_41_PARISGenericCatacombsBGWater, 
  eChckpnt_42_PARISGenericCatacombsBGLand, 
  eChckpnt_43_NewYorkOutsideWarehouse, 
  eChckpnt_44_DEBUGCharAnim, 
  eChckpnt_45_TIBETAnotherIceCave, 
  eChckpnt_46_SpainExcavation, 
  eChckpnt_47_DEBUGTestScrollLock, 
  eChckpnt_48_PARISBookCloseUp, 
  eChckpnt_49_DEBUGguiTests, 
  eChckpnt_50_VENEZ_BarracksOutside


};



struct CheckPointContext {
  int selectedCategory;
  int selectedCheckpoint;
};


struct CheckPoints {
  
  import static void JumpTo(int categoryIndex, int checkpointIndex); //goes to that checkpoint
  import static void JumpDone(); //to be called after all variables are set when the jump is finished
  import static bool IsJumping(); //returns true after 'JumpTo' has been called and before 'JumpDone' has been called
  
  import static int RequestedCheckpoint(); //gives the checkpoint previously passed to "JumpTo". This is used to know what checkpoint was requested when it's time to initialize it in the room script
  //import static bool ShouldSkipCutscene_Consume(); //returns true if that checkpoints expects to skip the
                                                   //one-time opening cutscene of the target room    .
                                                   //WATCH OUT: after reading this, the value is reset to 'false'!
  
  import static void RegisterNew(int id,  String name); //registers a new checkpoint: you give it
                                                        //a name and an id (from the enum) and it
                                                        //sets all the variables and adds it to the list
  import static int RequestedCheckpoint2();
  import static void RegisterAll(); 
  
  import static void PopulateControls(ListBox* LbCategories,  ListBox* LbCheckpoints) ;
  import static void PopulateCheckpoints(ListBox* LbCheckpoints, int categoryIndex);
  
  
  //////////////////////////////////////
  //
  //    CHECKPOINTS
  //    They define important points of 
  //    the adventure where you can jump
  //    directly, for debug purposes
  //
  //////////////////////////////////////

/*
  import static void ÈBarnett_Read_Telegram_Cutscene(); //not a checkpoint. Just triggers the cutscene
  
  //the two most important checkpoints
  import static void MainMenu();            //eChckpnt_00_Logo
  import static void Barnett_NewGame();   //eChckpnt_02_IndysClassroom_BeforeCutscene
  
  
  
  
  import static void Spain_Test();      //eChckpnt_04_SpainTest
  import static void Barnett_Corridor(); //eChckpnt_05_BarnettCorridor, 
  import static void Barnett_Read_Telegram(); //eChckpnt_06_BarnettReadTelegram
  */
  

};


