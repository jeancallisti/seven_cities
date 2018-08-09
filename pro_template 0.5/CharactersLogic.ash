struct CharactersLogic {
  
  import static void setIndyView_suit();
  
  /////////////////////
  //
  //    INTERACTIONS LOGIC
  //
  /////////////////////
  import static void Irene(CursorMode mode);

  
  
};


enum DialogVars {
  
  /////////////////////////////////
  //
  //    BARNETT
  //
  /////////////////////////////////
  eDialog_SandyHasExplainedTheProblem,  //Indy talked to student Sandy to know what the students want
  eDialog_MulbrayTopic,                 //Indy talked to Mulbray about the telegram
  eDialog_Student2gaveHisPreference,    //Student02 number told Indy what's his favorite topic
  eDialog_Student5gaveHisPreference,    //Student05 number told Indy what's his favorite topic
  eDialog_Student6gaveHisPreference,    //Student06 number told Indy what's his favorite topic
  eDialog_Student7gaveHisPreference,    //Student07 number told Indy what's his favorite topic
  eDialog_LookedAtCompassTag,           //Indy has found the compass tag in his desk, and looked at it
  eDialog_ShowedCompassToStudents,      //Indy has shown the compass at least once to Sandy
  eDialog_FoundProperSubject,           //Indy has managed to suggest a subject that suits every students
  eDialog_StudentsPuzzleFullyResolved,  //Indy has fully managed to satisfy the students
  eDialog_IndyConfusedHammers,          //Indy has tried at least once to bang something with the hammers, and realized he doesn't know which one is which one
  eDialog_IndySortedHammers             //Indy has resolved the Barnett hammers puzzle
};


struct DialogsLogic {
 
  import static void SetVar(DialogVars var,  int value);
  import static bool GetVar(DialogVars var);
  
  
};
