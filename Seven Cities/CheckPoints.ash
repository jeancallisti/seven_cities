
#define MAX_CATEGORIES 20
#define MAX_CHECKPOINT_PER_CATEGORY 20

enum CheckPointsEnum {
  eChckpnt_00_Default, 
  eChckpnt_03_IndysClassroom_chalkboardCutscene,
  eChckpnt_04_IndysClassroom_studentsPuzzle, 
  eChckpnt_05_IndysClassroom_studentsPuzzle2, 
  eChckpnt_07_BarnettReadTelegram
};

enum CheckPointCategoryEnum {
  eCheckPointCat_Gui = 0, 
  eCheckPointCat_Tibet = 1, 
  eCheckPointCat_Barnett = 2, 
  eCheckPointCat_Arizona = 3, 
  eCheckPointCat_NewYork = 4, 
  eCheckPointCat_Spain = 5, 
  eCheckPointCat_England = 6, 
  eCheckPointCat_Paris = 7, 
  eCheckPointCat_Jerusalem = 9, 
  eCheckPointCat_GermanyNazyBase = 10, 
  eCheckPointCat_GermanyOutside = 11, 
  eCheckPointCat_Mexico = 12, 
  eCheckPointCat_Venezuela_a = 13, 
  eCheckPointCat_Venezuela_b = 14, 
  eCheckPointCat_Venezuela_c = 15, 
  eCheckPointCat_Ending = 16, 
  eCheckPointCat_DebugTest = 17
};

struct CheckpointCategory {
  String title;
  int nextCheckpointIndex;
  String titles[MAX_CHECKPOINT_PER_CATEGORY];
  RoomsEnum rooms[MAX_CHECKPOINT_PER_CATEGORY];
  CheckPointsEnum checkpoints[MAX_CHECKPOINT_PER_CATEGORY];
  import function AddCheckpoint(String title, RoomsEnum room, CheckPointsEnum checkpoint = eChckpnt_00_Default);
};

struct CheckPoints {
  
  //////////////////////////////////////////////////////////
  //
  //    CHECKPOINTS
  //      They define important points of the adventure 
  //      where you can jump directly, for debug purposes
  //
  //////////////////////////////////////////////////////////
  
  import static void JumpTo(int categoryIndex, int checkpointIndex); //goes to that checkpoint
  import static void JumpDone(); //to be called after all variables are set when the jump is finished
  import static bool IsJumping(); //returns true after 'JumpTo' has been called and before 'JumpDone' has been called
  
  //gives the checkpoint previously passed to "JumpTo". This is used to know what checkpoint was requested when it's time to initialize it in the room script
  import static bool RequestedCheckpoint(RoomsEnum room, CheckPointsEnum checkpoint = eChckpnt_00_Default);
  
  //registers a new checkpoint: you give it a name and an id (from the enum) and it sets all the variables and adds it to the list
  import static void RegisterNew(int id, String name); 
  
  import static void RegisterAll();
  import static void PopulateControls(ListBox* LbCategories,  ListBox* LbCheckpoints);
  import static void PopulateCheckpoints(ListBox* LbCheckpoints, int categoryIndex);
  
  //import static bool ShouldSkipCutscene_Consume(); //returns true if that checkpoints expects to skip the
                                                   //one-time opening cutscene of the target room    .
                                                   //WATCH OUT: after reading this, the value is reset to 'false'!
};