//#define DEBUG //THIS IS DEFINED AUTOMATICALLY BY AGS. If defined, then the logging will be etra verbose (and other things)
#define SAFEMODE //if defined, then the memory management module removes memory garbage even where not needed in theory (slower)
#define TESTING //if this is defined, you can choose the checkpoint where you want to teleport
#define BETATEST //if this is defined, the big "Debug" button is visible and CtrlC shows the console
//#define SOCKETS //if this is defined, the "upload" console command is available.
                //the ags sockets plugin must be present though. If not, result is unpredictable.
                
//#define DEMO //if present, this makes the game behave as the demo. Other wise it's the normal game

#define GAMESPEED 60 //60 FPS


struct MacroFlags
{
    import static String GetFlags();
    
};

enum RoomsEnum
{
    //DEBUG
    eRoom_DEBUG_ScrollLockTests = 127,
    eRoom_DEBUG_GUIinteractionsTests = 129,
    
    //GUI
    eRoom_GUI_00_TitleMenu = 1,
    eRoom_GUI_01_EndCredits = 10,
    eRoom_GUI_02_Disclaimer = 20,
    eRoom_GUI_03_CheckPointSelection = 12,
    eRoom_GUI_03_Settings = 97,
    
    //00 (unused)
    eRoom_00_00_ = 666,
    eRoom_00_01_ = 666, 
    
    //TIBET
    eRoom_01_00_MapCloseUp            = 42,
    eRoom_01_01_TibetTop              = 14, 
    eRoom_01_015_AnotherIceCave       = 123, 
    eRoom_01_02_IceCave               = 43, 
    eRoom_01_03_MountainBottom        = 44,
    eRoom_01_04_EscapeSlopAndCredits  = 95,
    eRoom_01_05_ = 666,
    eRoom_01_06_ = 666,

    //BARNETT
    eRoom_02_00_ChalkboardHand = 18,
    eRoom_02_01_ChalkBoardFace = 17, 
    eRoom_02_02_IndyClassRoom_New = 16, 
    eRoom_02_03_BarnettCorridor = 23, 
    eRoom_02_03OBSOLETE_BarnettCorridor = 3, 
    eRoom_02_04_Mulbray = 4,
    eRoom_02_05_Irene = 5,
    eRoom_02_06_IndyOffice = 6,
    eRoom_02_07_BarnettOutside = 8,
    eRoom_02_08_BarnettTravelMap = 9, 
    eRoom_02_09_BarnettTelegram = 7, 
    eRoom_02_11_ = 666,
    eRoom_02_12_ = 666,
    eRoom_02_13_ = 666,
    eRoom_02_14_ = 666,
    eRoom_02_15_ = 666,
    
    //ARIZONA
    eRoom_03_00_HotelOutside = 45,
    eRoom_03_01_MarcusRoom = 46, 
    eRoom_03_02_IndianCave = 25, 
    eRoom_03_03_GENERICCanyons = 47,
    eRoom_03_04_ = 666,
    eRoom_03_05_ = 666,
    eRoom_03_06_ = 666,
    eRoom_03_07_ = 666,
    eRoom_03_08_ = 666, 
    
    //NEW YORK : TODO
    eRoom_04_00_NewsPaper = 48,
    eRoom_04_01_InsideTaxi = 49, 
    eRoom_04_02_InsideHotel = 50, 
    eRoom_04_03_ = 666,
    eRoom_04_04_ = 666,
    eRoom_04_05_ = 666,
    eRoom_04_06_ = 666,
    eRoom_04_07_ = 666,
    eRoom_04_08_SubCutscene = 125, 
    eRoom_04_09_ = 666, 
    eRoom_04_10_ = 666, 
    eRoom_04_11_ = 666,
    eRoom_04_12_ = 666,
    eRoom_04_13_ = 666,
    eRoom_04_14_ = 666,
    eRoom_04_15_ = 666,
    
    //SPAIN
    eRoom_05_00_ = 666,
    eRoom_05_01_CountrySide = 26, 
    eRoom_05_02_DigSite = 13, 
    eRoom_05_03_GeorgeTent = 93,
    eRoom_05_04_OfficerTent = 94,
    eRoom_05_05_ = 666,
    eRoom_05_06_Excavation = 126,
    eRoom_05_07_ = 666,
    
    //ENGLAND:TODO
    eRoom_06_00_ = 666,
    eRoom_06_01_ = 666, 
    eRoom_06_02_ = 666, 
    eRoom_06_03_ = 666,
    eRoom_06_04_ = 666,
    eRoom_06_05_ = 666,
    eRoom_06_06_ = 666,
    eRoom_06_07_ = 666,
    eRoom_06_08_ = 666, 

    //PARIS
    eRoom_07_00_ = 666,
    eRoom_07_01_ParisMap = 30, 
    eRoom_07_02_ConventYard = 31, 
    eRoom_07_03_GENERIC_Catacombs = 32,
    eRoom_07_04_ManuscriptRoom = 33,
    eRoom_07_05_ParisCafe = 34,
    eRoom_07_06_ConventInside = 35,
    eRoom_07_06b_BookCloseUp = 128, 
    eRoom_07_07_ChurchRuins = 36,
    eRoom_07_08_CatacombsEntrance = 37,
    //TODO: Other rooms
    eRoom_07_10_ = 666, 
    eRoom_07_11_ = 666,
    eRoom_07_12_ = 666,
    eRoom_07_13_ = 666,
    eRoom_07_14_ = 666,
    eRoom_07_15_ = 666,
    
    eRoom_08_00_ = 666,
    eRoom_08_01_ = 666, 
    eRoom_08_02_ = 666, 
    eRoom_08_03_ = 666,
    eRoom_08_04_ = 666,
    eRoom_08_05_ = 666,
    eRoom_08_06_ = 666,
    eRoom_08_07_ = 666,
    eRoom_08_08_ = 666, 
    eRoom_08_09_ = 666, 
    eRoom_08_10_ = 666, 
    eRoom_08_11_ = 666,
    eRoom_08_12_ = 666,
    eRoom_08_13_ = 666,
    eRoom_08_14_ = 666,
    eRoom_08_15_ = 666,
    
    eRoom_09_00_ = 666,
    eRoom_09_01_ = 666, 
    eRoom_09_02_ = 666, 
    eRoom_09_03_ = 666,
    eRoom_09_04_ = 666,
    eRoom_09_05_ = 666,
    eRoom_09_06_ = 666,
    eRoom_09_07_ = 666,
    eRoom_09_08_ = 666, 
    eRoom_09_09_ = 666, 
    eRoom_09_10_ = 666, 
    eRoom_09_11_ = 666,
    eRoom_09_12_ = 666,
    eRoom_09_13_ = 666,
    eRoom_09_14_ = 666,
    eRoom_09_15_ = 666,
    
    eRoom_10_00_ = 666,
    eRoom_10_01_ = 666, 
    eRoom_10_02_ = 666, 
    eRoom_10_03_ = 666,
    eRoom_10_04_ = 666,
    eRoom_10_05_ = 666,
    eRoom_10_06_ = 666,
    eRoom_10_07_ = 666,
    eRoom_10_08_ = 666, 
    eRoom_10_09_ = 666, 
    eRoom_10_10_ = 666, 
    eRoom_10_11_ = 666,
    eRoom_10_12_ = 666,
    eRoom_10_13_ = 666,
    eRoom_10_14_ = 666,
    eRoom_10_15_ = 666,
    
    eRoom_11_00_ = 666,
    eRoom_11_01_ = 666, 
    eRoom_11_02_ = 666, 
    eRoom_11_03_ = 666,
    eRoom_11_04_ = 666,
    eRoom_11_05_ = 666,
    eRoom_11_06_ = 666,
    eRoom_11_07_ = 666,
    eRoom_11_08_ = 666, 
    eRoom_11_09_ = 666, 
    eRoom_11_10_ = 666, 
    eRoom_11_11_ = 666,
    eRoom_11_12_ = 666,
    eRoom_11_13_ = 666,
    eRoom_11_14_ = 666,
    eRoom_11_15_ = 666,
    
    eRoom_12_00_ = 666,
    eRoom_12_01_ = 666, 
    eRoom_12_02_ = 666, 
    eRoom_12_03_ = 666,
    eRoom_12_04_ = 666,
    eRoom_12_05_ = 666,
    eRoom_12_06_ = 666,
    eRoom_12_07_ = 666,
    eRoom_12_08_ = 666, 
    eRoom_12_09_ = 666, 
    eRoom_12_10_ = 666, 
    eRoom_12_11_ = 666,
    eRoom_12_12_ = 666,
    eRoom_12_13_ = 666,
    eRoom_12_14_ = 666,
    eRoom_12_15_ = 666,
    
    //TODO:VENEZUELA
    eRoom_13_00_ = 666,
    eRoom_13_01_ = 666, 
    eRoom_13_02_ = 666, 
    eRoom_13_03_ = 666,
    eRoom_13_04_ = 666,
    eRoom_13_05_MerchandiseLobby = 98,
    eRoom_13_06_JaguarGuardian = 28,
    eRoom_13_07_CityGeneralView = 81,
    eRoom_13_08_BarracksOutside = 82, 
    eRoom_13_09_ = 666, 
    eRoom_13_10_ = 666, 
    eRoom_13_11_ = 666,
    eRoom_13_12_ = 666,
    eRoom_13_13_ = 666,
    eRoom_13_14_ = 666,
    eRoom_13_15_ = 666,
    
    eRoom_14_00_ = 666,
    eRoom_14_01_ = 666, 
    eRoom_14_02_ = 666, 
    eRoom_14_03_ = 666,
    eRoom_14_04_ = 666,
    eRoom_14_05_ = 666,
    eRoom_14_06_ = 666,
    eRoom_14_07_ = 666,
    eRoom_14_08_ = 666, 
    eRoom_14_09_ = 666, 
    eRoom_14_10_ = 666, 
    eRoom_14_11_ = 666,
    eRoom_14_12_ = 666,
    eRoom_14_13_ = 666,
    eRoom_14_14_ = 666,
    eRoom_14_15_ = 666,
    
    eRoom_15_00_ = 666,
    eRoom_15_01_ = 666, 
    eRoom_15_02_ = 666, 
    eRoom_15_03_ = 666,
    eRoom_15_04_ = 666,
    eRoom_15_05_ = 666,
    eRoom_15_06_ = 666,
    eRoom_15_07_ = 666,
    eRoom_15_08_ = 666, 
    eRoom_15_09_ = 666, 
    eRoom_15_10_ = 666, 
    eRoom_15_11_ = 666,
    eRoom_15_12_ = 666,
    eRoom_15_13_ = 666,
    eRoom_15_14_ = 666,
    eRoom_15_15_ = 666
  
};


enum eObjectType {
  eGizmo, //use this type for all objects that could be picked up but Indy just doesn't need them
  eHeavy,  //use this type for objects that are too heavy to pickup/push/pull
  eCharacter, 
  eDoor
};


