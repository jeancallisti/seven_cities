enum CheckPointsEnum {
  eChckpnt_01_Disclaimer, 
  eChckpnt_02_MainMenu, 
  eChckpnt_03_IndysClassroom_chalkboardCutscene,
  eChckpnt_04_IndysClassroom_studentsPuzzle, 
  eChckpnt_05_IndysClassroom_studentsPuzzle2, 
  eChckpnt_06_BarnettCorridor, 
  eChckpnt_07_BarnettReadTelegram, 
  eChckpnt_08_TibetTop, 
  eChckpnt_09_MirrorsTests, 
  eChckpnt_10_NewClassRoom, 
  eChckpnt_11_NewChalkboard, 
  eChckpnt_12_FontsTests, 
  eChckpnt_13_SpainDigSite, 
  eChckpnt_14_SpainTruckCutscene, 
  eChckpnt_15_TextArea, 
  eChckpnt_16_FoAcredits, 
  eChckpnt_17_RegularCredits
};





struct CheckPoints {
  
  import static void JumpTo(int checkpointIndex); //goes to that checkpoint
  import static void JumpDone(); //to be called after all variables are set when the jump is finished
  import static bool IsJumping(); //returns true after 'JumpTo' has been called and before 'JumpDone' has been called
  
  import static int RequestedCheckpoint(); //gives the checkpoint previously passed to "JumpTo". This is used to know what checkpoint was requested when it's time to initialize it in the room script
  //import static bool ShouldSkipCutscene_Consume(); //returns true if that checkpoints expects to skip the
                                                   //one-time opening cutscene of the target room    .
                                                   //WATCH OUT: after reading this, the value is reset to 'false'!
  
  import static void RegisterNew(int id,  String name); //registers a new checkpoint: you give it
                                                        //a name and an id (from the enum) and it
                                                        //sets all the variables and adds it to the list
  
  import static void RegisterAll(); 
  
  //////////////////////////////////////
  //
  //    CHECKPOINTS
  //    They define important points of 
  //    the adventure where you can jump
  //    directly, for debug purposes
  //
  //////////////////////////////////////

/*
  import static void Barnett_Read_Telegram_Cutscene(); //not a checkpoint. Just triggers the cutscene
  
  //the two most important checkpoints
  import static void MainMenu();            //eChckpnt_00_Logo
  import static void Barnett_NewGame();   //eChckpnt_02_IndysClassroom_BeforeCutscene
  
  
  
  
  import static void Spain_Test();      //eChckpnt_04_SpainTest
  import static void Barnett_Corridor(); //eChckpnt_05_BarnettCorridor, 
  import static void Barnett_Read_Telegram(); //eChckpnt_06_BarnettReadTelegram
  */
  

};


