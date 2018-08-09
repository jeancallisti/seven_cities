struct CharactersLogic {
  
  import static void setIndyView_suit();
  
  /////////////////////
  //
  //    INTERACTIONS LOGIC
  //
  /////////////////////
  import static void Mulbray(Action usedAction);
  import static void Irene(Action usedAction);
  import static void Biff(Action usedAction);  
  import static void Bruno(Action usedAction);  
  import static void Student1(Action usedAction);  
  import static void Student2(Action usedAction);    
  import static void Student5(Action usedAction);  
  import static void Student6(Action usedAction); 
  import static void Student7(Action usedAction); 
  import static void Students_SpeakFast(String s1,  String s2,  String s3,  String s4);
  import static void Students_SpeakFast2(String s1,  String s2,  String s3,  String s4);
  import static void StudentBiff(Action usedAction);  
  import static void StudentFat(Action usedAction);    
  import static void StudentRedhead(Action usedAction);  
  import static void StudentTie(Action usedAction); 
  import static void StudentPink(Action usedAction); 
  
  
  /////////////////////
  //
  //    STUDENTS PUZZLE
  //
  /////////////////////
  import static bool AllStudentsGaveTheirPreferences(); //Returns true if they all gave their favorite topic
  import static void Students_AllGaveTheirPreferences_Reaction1(); //Indy says aloud "you've asked enough questions..." 
  import static void Students_AllGaveTheirPreferences_Reaction2(); //indy says aloud "i can't just make up topics"
  import static void Students_SetSubjectPart(int part,  int answerChosen); //the essay's subject is made of 4 parts (location, era, etc.) For each part there are 4 possible answers
  import static void Students_ResetSubject(); //resets all parts of the essay's subject
  import static bool Students_ComputeSubject();   //tells if Indy picked all correct 4 parts for the essay's subject
  import static void RepeatSolution(); //Indy recaps the proper solution.
};


enum DialogVars {
  
  /*
  
  /////////////////////////////////
  //
  //    TIBET
  //
  //    IMPORTANT:  The variables are listed here only for convenience but do NOT need to be declared. 
  //                They are ultimately stored in UltraVariables
  //
  /////////////////////////////////
  "eDialog_TibetPuzzleIsSet",                 //The values for eDialog_TibetPuzzleShape0,1,2 have been generated in room 43
  "eDialog_TibetPuzzleShape0",                //Value of the shape that will be used for mirror 0 in room 43 (shape 0, 1, 2 or 3)
  "eDialog_TibetPuzzleShape1",                //Value of the shape that will be used for mirror 1 in room 43 (shape 0, 1, 2 or 3)
  "eDialog_TibetPuzzleShape2",                //Value of the shape that will be used for mirror 2 in room 43 (shape 0, 1, 2 or 3)
  
  
  /////////////////////////////////
  //
  //    BARNETT
  //
  //    IMPORTANT:  The variables are listed here only for convenience but do NOT need to be declared. 
  //                They are ultimately stored in UltraVariables
  //
  /////////////////////////////////
  "eDialog_SandyHasExplainedTheProblem",  //Indy talked to student Sandy to know what the students want
  "eDialog_MulbrayTopic",                 //Indy talked to Mulbray about the telegram
  "eDialog_Student2gaveHisPreference",    //Student02 number told Indy what's his favorite topic
  "eDialog_Student5gaveHisPreference",    //Student05 number told Indy what's his favorite topic
  "eDialog_Student6gaveHisPreference",    //Student06 number told Indy what's his favorite topic
  "eDialog_Student7gaveHisPreference",    //Student07 number told Indy what's his favorite topic
  "eDialog_LookedAtCompassTag",           //Indy has found the compass tag in his desk, and looked at it
  "eDialog_ShowedCompassToStudents",      //Indy has shown the compass at least once to Sandy
  "eDialog_FoundProperSubject",           //Indy has managed to suggest a subject that suits every students
  "eDialog_StudentsPuzzleFullyResolved",  //Indy has fully managed to satisfy the students
  "eDialog_IndyConfusedHammers",          //Indy has tried at least once to bang something with the hammers, and realized he doesn't know which one is which one
  "eDialog_IndySortedHammers",            //Indy has resolved the Barnett hammers puzzle
  "eDialog_hasReadTelegram" ,              //Indy has read the telegram sent by MArcus
  "eDialog_BulliesHaveSlashedTire",       //The cutscene with the bullies slashing the tire has been shown
  "eDialog_IndyShouldAskKeyToIrene"//Indy has tried to open his cabinet and can now ask his key to IRene
  
  
  ///////////////////////////
  //
  //   SPAIN
  //
  //    IMPORTANT:  The variables are listed here only for convenience but do NOT need to be declared. 
  //                They are ultimately stored in UltraVariables
  //
  //////////////////////////
  "eDialog_IndyCanBypassNaziDriver",      //Indy has permission to bypass Nazi Driver and proceed to Dig Site
  "eDialog_NaziCarProgress",              //0 Indy has not yet permission to pass driver. 1 Indy has permission to pass driver. 2 Indy has met the guard.
                                          //3 Indy has to ask drivers name . 4 Indy Knows drivers name 5 Indy has order to tell Nazi Driver at Spanish Country to get away from car.
  "eDialog_IndyMetNaziGuard",             //Indy has just met Nazi Guard at DigSite
  "eDialog_IndyWantsToAskDriversName",    //Indy Talked with Guard and he asked Drivers name
  "eDialog_IndyKnowsNaziDriversName",     //Indy Knows Nazi Drivers Name and can mention it to Nazi Guard at Dig Site 
  "eDialog_IndyGetsRidNaziDriver",        //Indy has order to tell Nazi Driver at Spanish Country to get away from car
  "eDialog_IndyUsesRadio",                //Indy uses Radio and warns for a bomb in Dig Site (This helps me change room for cutscene)
  "eDialog_IndyTurnedGeneratorOn",        //Indy has opened the Generator in Dig site and now can use the Radio
  "eDialog_IndyWearsNaziSuit"             //TEMPORARY until use NaziUniform on Indy works 
  
  
    

/////////////////////////////////////////////////////
//
//    MEXICO
//
/////////////////////////////////////////////////////
"eDialog_IndyHasEnteredRoom74",   //Indy has entered room 74 and now Knows whats in it
"eDialog_IndyHasEnterdRoom75",    //Indy has entered room 75 and now Knows whats in it 



/////////////////////////////////////////////////////
//
//    PARIS
//
/////////////////////////////////////////////////////
"eDialog_BoatIsAtShore",                     // Boat is at Shore
"eDialog_IndyPickedUpCan",                   // Indy has picked up can
"eDialog_IndyHasCutGrass",                   // Indy has cut the grass 
"eDialog_IndyHasUsedTool",                   // Indy has used key/tool to irrigation system and now water is flowing in 
"eDialog_IndyTriedToEnterConvent",           // Indy tried to enter convent, alarmed the dog and the nun and now can knock Door2
"eDialog_IndyStandsOnBoat",                  // Indy Stands on boat
"eDialog_NunHeardTheDog",                    // Nun heard the dog barking and after talking to Indy (behind the door) she waits to open the door. 
"eDialog_GardenLever",                       // Checks if Garden lever indide yard is up (0) or down (1)
"eDialog_NunTalkedAboutStatue",              // Nun has talked with Indy inside convent about statue in yard and statues head with key is visible 
                                             // 0 if dialogs didnt take place, 1 if dialog did take place, 2 if Indy took key from statues head
"eDialog_CutSceneRuns",                      // CutScene runs                \___ those 2 variables should be one
"eDialog_NunShowsTheBook",                   // Nun leads Indy to the book   /    those 2 variables should be one 





////////////////////////////////////////////////////
//
//  VENEZUELA
//
////////////////////////////////////////////////////
"eDialog_ScaleIsFunctional",                  // Indy PickedUp Dismantled cart and now scale is functional
"eDialog_IndyHasVisitedBarracsOutside",       // Indy has visited room 13-08 Barracs Outside





*/  
};




struct DialogsLogic {
 /*
  import static void SetVar_(DialogVars var,  int value);
  import static bool GetVar_(DialogVars var);
  */

  import static void SetVarBool(String var,  bool value);
  import static bool GetVarBool(String var);
  
  import static void SetVarInt(String var,  int value);
  import static int  GetVarInt(String var);
};

